package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.pojo.Order;
import com.hrtxn.flchappinessmall.pojo.RefundLog;
import com.hrtxn.flchappinessmall.pojo.Sysconfig;
import com.hrtxn.flchappinessmall.pojo.pojoVo.GoodsVo;
import com.hrtxn.flchappinessmall.service.GoodsService;
import com.hrtxn.flchappinessmall.service.OrderService;
import com.hrtxn.flchappinessmall.service.RefundService;
import com.hrtxn.flchappinessmall.service.SysconfigService;
import com.hrtxn.flchappinessmall.tools.TransactionUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Description: 订单控制类<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Controller
@RequestMapping("/admin")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private RefundService refundService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private SysconfigService sysconfigService;

    private Logger logger = Logger.getLogger(OrderController.class);

    /**
     * 交易金额
     * @return
     */
    @RequestMapping("/go_amounts")
    public ModelAndView go_amounts(){
        try {
            ModelAndView modelAndView = new ModelAndView("order/amounts.jsp");
            //当天日期
            modelAndView.addObject("newTime",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            //获取成交总额（获取交易成功的订单）
            Object sum = orderService.getSUMMoneyByOrderStatus(5);
            if (sum == null){
                sum = 0;
            }
            modelAndView.addObject("sum",sum);
            //获取当天成交额
            Object todaySum = orderService.getTodaySUMMoney();
            if (todaySum == null){
                todaySum = 0;
            }
            modelAndView.addObject("todaySum",todaySum);
            //获取所有订单
            List<Order> orderList = orderService.getOrderList();
            modelAndView.addObject("orderList",orderList);

            Map<String,String> map = getEchartsOrder();

            modelAndView.addObject("finishedOrderArray",map.get("finishedOrderArray"));
            modelAndView.addObject("refundOrderArray",map.get("refundOrderArray"));
            modelAndView.addObject("finishedOrderSUMArray",map.get("finishedOrderSUMArray"));
            return modelAndView;
        } catch (Exception e) {
            logger.error("交易金额出错",e);
            return new ModelAndView("error/500.jsp");
        }
    }

    /**
     * 交易信息
     * @return
     */
    @RequestMapping("/go_transaction")
    public ModelAndView go_transaction(){
        try {

            java.text.DecimalFormat   df   =new   java.text.DecimalFormat("#.00");

            ModelAndView modelAndView = new ModelAndView("order/transaction.jsp");
            //获取所有订单交易金额
            String sumMoneyByOrderStatus = orderService.getSUMMoneyByOrderStatus(5);
            if(sumMoneyByOrderStatus == null){
                sumMoneyByOrderStatus = "0.00";
            }
            modelAndView.addObject("sumMoney",sumMoneyByOrderStatus);

            //获取订单数量
            int count = orderService.getOrderCount(0);
            modelAndView.addObject("count",count);

            //获取交易成功订单数量
            int successOrder = orderService.getOrderCount(5);
            modelAndView.addObject("successOrder",successOrder);

            //获取交易失败订单数量
            int failedOrder = orderService.getOrderCount(7);
            modelAndView.addObject("failedOrder",failedOrder);

            //获取退款金额
            String refundMoney = refundService.getAllRefundMoney();
            if (refundMoney == null){
                refundMoney = "0.00";
            }
            modelAndView.addObject("refundMoney",refundMoney);

            //获取供货价
            String supplyPrice = orderService.getGoodsSupplyPrice();
            if (supplyPrice == null){
                supplyPrice = "0.00";
            }
            modelAndView.addObject("supplyPrice",supplyPrice);

            //毛利润
            //获取零售价
            String retailPrice = orderService.getGoodsRetailPrice();
            if (retailPrice == null){
                retailPrice = "0.00";
            }

            Double grossProfit = (Double.valueOf(retailPrice.replaceAll(",","")) - (Double.valueOf(supplyPrice.replaceAll(",",""))));
            String _grossProfit = null;
            if(grossProfit <= 0){
                _grossProfit = "0.00";
            }else{
                _grossProfit = df.format(grossProfit);
            }
            modelAndView.addObject("grossProfit",_grossProfit);
            //获取净利润
            //获取产品销售提成总额
            String salesCommission = orderService.getSUMSalesCommission();
            if (salesCommission == null){
                salesCommission = "0.00";
            }
            //获取系统配置参数，获取运营比例
            Sysconfig sysConfig = sysconfigService.getSysConfig();

            sysConfig.setOperatingCostsPer(null==sysConfig.getOperatingCostsPer()?0:sysConfig.getOperatingCostsPer());


            //运行成本
            Double cost = grossProfit * (sysConfig.getOperatingCostsPer() / 100);
            String _cost = null;
            if (cost <= 0){
                _cost = "0.00";
            }else {
                _cost = df.format(cost);
            }
            modelAndView.addObject("cost",_cost);

            //计算净利润
            Double commission = grossProfit - cost - Double.parseDouble(salesCommission.replaceAll(",",""));
            String _commission = null;
            if (commission <= 0){
                _commission = "0.00";
            }else {
                _commission = df.format(commission);
            }
            modelAndView.addObject("commission",_commission);


            //分红购买金额
            String SUMShareProfit = orderService.getSUMOrderByShareProfit(4,5);
            if(SUMShareProfit == null){
                SUMShareProfit = "0.00";
            }
            modelAndView.addObject("SUMShareProfit",SUMShareProfit);

            //除分红购买金额
            Double chuSUMShareProfit =null;
            if(sumMoneyByOrderStatus!=null){
                chuSUMShareProfit = Double.valueOf(sumMoneyByOrderStatus.replaceAll(",","")) - Double.valueOf(SUMShareProfit.replaceAll(",",""));
            }
            modelAndView.addObject("chuSUMShareProfit",chuSUMShareProfit);

            //获取微信支付金额
            String SUMWeiXinPay = orderService.getSUMOrderByPayType(1);
            if(SUMWeiXinPay == null){
                SUMWeiXinPay = "0.00";
            }
            modelAndView.addObject("SUMWeiXinPay",SUMWeiXinPay);
            //获取支付宝支付金额
            String SUMZhiFuBaoPay = orderService.getSUMOrderByPayType(2);
            if(SUMZhiFuBaoPay == null){
                SUMZhiFuBaoPay = "0.00";
            }
            modelAndView.addObject("SUMZhiFuBaoPay",SUMZhiFuBaoPay);

            //获取图表内容
            int[] allCountArray = new int[12];
            int[] unPayCountArray = new int[12];
            int[] unDeliverCountArray = new int[12];
            int[] unReciveCountArray = new int[12];
            int[] unEvaluteCountArray = new int[12];
            List<String> initMonth = getInitMonth();
            for (int i = 0; i < initMonth.size(); i++){
                //获取所有订单
                int allCount = orderService.getMonthOrderQuantity(0,initMonth.get(i));
                allCountArray[i] = allCount;
                //获取待付款订单数量
                int unPayCount = orderService.getMonthOrderQuantity(1,initMonth.get(i));
                unPayCountArray[i] = unPayCount;
                //获取待发货订单数量
                int unDeliverCount = orderService.getMonthOrderQuantity(2,initMonth.get(i));
                unDeliverCountArray[i] = unDeliverCount;
                //获取待收货订单
                int unReciveCount = orderService.getMonthOrderQuantity(3,initMonth.get(i));
                unReciveCountArray[i] = unReciveCount;
                //获取待评价订单
                int unEvaluteCount = orderService.getMonthOrderQuantity(4,initMonth.get(i));
                unEvaluteCountArray[i] = unEvaluteCount;
            }
            modelAndView.addObject("allCountArray",Arrays.toString(allCountArray));
            modelAndView.addObject("unPayCountArray",Arrays.toString(unPayCountArray));
            modelAndView.addObject("unDeliverCountArray",Arrays.toString(unDeliverCountArray));
            modelAndView.addObject("unReciveCountArray",Arrays.toString(unReciveCountArray));
            modelAndView.addObject("unEvaluteCountArray",Arrays.toString(unEvaluteCountArray));

            return modelAndView;
        } catch (Exception e) {
            logger.error("交易信息出错",e);
            return new ModelAndView("error/500.jsp");
        }
    }

    /**
     * 退款管理
     * @return
     */
    @RequestMapping("/go_refund")
    public ModelAndView go_refund(){
        try {
            ModelAndView modelAndView = new ModelAndView("order/refund.jsp");
            List<Order> orderList = orderService.getOrderByOrderStatus(7);
            modelAndView.addObject("orderList",orderList);
            return modelAndView;
        } catch (Exception e) {
            logger.error("退款管理出错",e);
            return new ModelAndView("error/500.jsp");
        }
    }

    /**
     * 根据订单ID删除订单（逻辑删除）
     * @param id
     * @return
     */
    @RequestMapping("/delete_order")
    @ResponseBody
    public boolean delete_order(@RequestParam("id") Integer id){
        try {
            Order order = new Order();
            order.setId(id);
            order.setPlateIsdeleteFlag(2);
            return orderService.update_order(order) > 0 ? true : false;
        } catch (Exception e) {
            logger.error("根据订单ID删除订单（逻辑删除）出错",e);
        }
        return false;
    }

    /**
     * 跳转退货订单详情
     * @param orderNum
     * @return
     */
    @RequestMapping("/refundDetail")
    public ModelAndView refundDetail(@RequestParam("orderNum") String orderNum){
        try {
            ModelAndView modelAndView = new ModelAndView("order/refund_detailed.jsp");
            //根据订单编号获取订单信息
            Order order = orderService.getOrderByOrderNum(orderNum);
            //根据订单编号获取退款信息
            RefundLog refundLog = refundService.getRefundLogByOrderNum(orderNum);
            if (refundLog != null){
                //获取退货退款商品
                GoodsVo goodsVo = goodsService.getGoodsById(refundLog.getGoodsId());
                modelAndView.addObject("goods",goodsVo);
            }
            modelAndView.addObject("refundLog",refundLog);
            modelAndView.addObject("order",order);
            return modelAndView;
        } catch (Exception e) {
            logger.error("跳转退货订单详情出错",e);
            return new ModelAndView("error/500.jsp");
        }
    }

    /**
     * 获取全部订单
     * @return
     */
    @RequestMapping("/getAllOrder")
    public ModelAndView getAllOrder(){
        try {
            ModelAndView modelAndView = new ModelAndView("order/amounts.jsp");
            //当天日期
            modelAndView.addObject("newTime",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            //获取成交总额（获取交易成功的订单）
            Object sum = orderService.getSUMMoneyByOrderStatus(5);
            if (sum == null){
                sum = 0;
            }
            modelAndView.addObject("sum",sum);
            //获取当天成交额
            Object todaySum = orderService.getTodaySUMMoney();
            if (todaySum == null){
                todaySum = 0;
            }
            modelAndView.addObject("todaySum",todaySum);
            //获取所有订单
            List<Order> orderList = orderService.getOrderList();
            modelAndView.addObject("orderList",orderList);
            return modelAndView;
        } catch (Exception e) {
            logger.error("获取全部订单出错",e);
            return new ModelAndView("error/500.jsp");
        }
    }

    /**
     * 获取今日订单
     * @return
     */
    @RequestMapping("/getTodayOrder")
    public ModelAndView getTodayOrder(){
        try {
            ModelAndView modelAndView = new ModelAndView("order/amounts.jsp");
            //当天日期
            modelAndView.addObject("newTime",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            //获取成交总额（获取交易成功的订单）
            Object sum = orderService.getSUMMoneyByOrderStatus(5);
            if (sum == null){
                sum = 0;
            }
            modelAndView.addObject("sum",sum);
            //获取当天成交额
            Object todaySum = orderService.getTodaySUMMoney();
            if (todaySum == null){
                todaySum = 0;
            }
            modelAndView.addObject("todaySum",todaySum);
            //获取所有订单
            List<Order> orderList = orderService.getTodayOrder();
            modelAndView.addObject("orderList",orderList);

            Map<String,String> map = getEchartsOrder();

            modelAndView.addObject("finishedOrderArray",map.get("finishedOrderArray"));
            modelAndView.addObject("refundOrderArray",map.get("refundOrderArray"));
            modelAndView.addObject("finishedOrderSUMArray",map.get("finishedOrderSUMArray"));
            return modelAndView;
        } catch (Exception e) {
            logger.error("获取今日订单出错",e);
            return new ModelAndView("error/500.jsp");
        }
    }


    /**
     * 获取当月订单
     * @return
     */
    @RequestMapping("/getMonthOrder")
    public ModelAndView getMonthOrder(){
        try {
            ModelAndView modelAndView = new ModelAndView("order/amounts.jsp");
            //当天日期
            modelAndView.addObject("newTime",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            //获取成交总额（获取交易成功的订单）
            Object sum = orderService.getSUMMoneyByOrderStatus(5);
            if (sum == null){
                sum = 0;
            }
            modelAndView.addObject("sum",sum);
            //获取当天成交额
            Object todaySum = orderService.getTodaySUMMoney();
            if (todaySum == null){
                todaySum = 0;
            }
            modelAndView.addObject("todaySum",todaySum);
            //获取所有订单
            List<Order> orderList = orderService.getMonthOrder();
            modelAndView.addObject("orderList",orderList);

            //获取图表内容
            Map<String,String> map = getEchartsOrder();
            modelAndView.addObject("finishedOrderArray",map.get("finishedOrderArray"));
            modelAndView.addObject("refundOrderArray",map.get("refundOrderArray"));
            modelAndView.addObject("finishedOrderSUMArray",map.get("finishedOrderSUMArray"));
            return modelAndView;
        } catch (Exception e) {
            logger.error("获取当月订单出错",e);
            return new ModelAndView("error/500.jsp");
        }
    }

    /**
     * 获取交易金额--》当月统计图表内容
     * @return
     */
    public Map<String,String> getEchartsOrder(){
        try {
            Map<String,String> map = new HashMap<String,String>();
            //创建承载当月每天成交订单数量数组
            int[] finishedOrderArray = new int[31];
            //创建承载当月每天失败订单数量数组
            int[] refundOrderArray = new int[31];
            //创建承载当月每天成交订单金额数组
            double[] finishedOrderSUMArray = new double[31];

            //获取当月每天的日期
            List dayListOfMonth = getDayListOfMonth();
            for (int i = 0; i < dayListOfMonth.size(); i++){
                //获取当月每天成交订单数量
                Integer finishedOrder = orderService.getEchartsOrder(5,dayListOfMonth.get(i).toString());
                finishedOrderArray[i] = finishedOrder;
                //获取当月每天失败订单数量
                Integer refundOrder = orderService.getEchartsOrder(7,dayListOfMonth.get(i).toString());
                refundOrderArray[i] = refundOrder;
                //获取当月每天成交订单金额
                String sum = orderService.getEchartsOrderMoney(dayListOfMonth.get(i).toString());
                if (sum == null){
                    sum = "0";
                }
                finishedOrderSUMArray[i] = Double.valueOf(sum.replaceAll(",", ""));
            }
            map.put("finishedOrderArray",Arrays.toString(finishedOrderArray));
            map.put("refundOrderArray",Arrays.toString(refundOrderArray));
            map.put("finishedOrderSUMArray",Arrays.toString(finishedOrderSUMArray));
            return map;
        } catch (Exception e) {
            logger.error("获取交易金额--》当月统计图表内容出错",e);
            return null;
        }
    }

    /**
     * 获取当月每天的日期
     * @return
     */
    public static List getDayListOfMonth() {
        List list = new ArrayList();
        Calendar aCalendar = Calendar.getInstance(Locale.CHINA);
        int year = aCalendar.get(Calendar.YEAR);//年份
        int month = aCalendar.get(Calendar.MONTH) + 1;//月份
        int day = aCalendar.getActualMaximum(Calendar.DATE);
        for (int i = 1; i <= day; i++) {
            String aDate = String.valueOf(year)+"-"+month+"-"+i;
            list.add(aDate);
        }
        return list;
    }

    /**
     * 获取一年中的每个月 以“yyyy-MM”的格式
     * @return
     */
    private static List<String> getInitMonth(){
        List list = new ArrayList();
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        String date = "";
        for (Integer i = 1; i <= 12; i++){
            if (i < 10){
                date = year + "-" + "0" + i;
            }else {
                date = year + "-" + i.toString();
            }
            list.add(date);
        }
        return list;
    }


    /**************************************************订单管理start**************************************************/

    /**
     * 订单管理
     * @return
     */
    @RequestMapping(value = "/go_orderform",method = RequestMethod.GET)
    public ModelAndView go_orderform(){
        try {
            ModelAndView modelAndView = new ModelAndView("order/orderform.jsp");
            //获取所有订单列表
            List<Order> orderList = orderService.getAllOrderList();
            modelAndView.addObject("orderList",orderList);
            return modelAndView;
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("跳转到订单管理出错",e);
        }
        return null;
    }

    /**
     * 获取订单分组
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getOrderGroupByOneClassifyId",method = RequestMethod.POST)
    public Map<String,Object> getOrderGroupByOneClassifyId(){
        try {
            Map<String,Object> map = new HashMap<String, Object>();
            //获取订单总数量（不包含逻辑删除订单）
            int count = orderService.getOrderCountUnBeltDelete(0);
            map.put("count",count);
            //获取所有订单
            List<Order> orderList = orderService.getOrderGroupByOneClassifyId();
            map.put("orderList",orderList);
            return map;
        } catch (Exception e) {
            logger.error("获取订单分组出错",e);
        }
        return null;
    }

    /**
     * 跳转到订单详情页
     * @param orderNum
     * @return
     */
    @RequestMapping(value = "/go_order_detail",method = RequestMethod.GET)
    public ModelAndView go_order_detail(@RequestParam("orderNum") String orderNum){
        try {
            ModelAndView modelAndView = new ModelAndView("order/order_detailed.jsp");
            Order order = orderService.getOrderByOrderNum(orderNum);
            modelAndView.addObject("order",order);
            //根据该订单的goodsId获取商品信息
            GoodsVo goods = goodsService.getGoodsById(order.getGoodsId());
            modelAndView.addObject("goods",goods);
            return modelAndView;
        } catch (Exception e) {
            logger.error("跳转到订单详情页出错",e);
        }
        return null;
    }

    /**
     * 获取物流信息
     * @param logisticsNum
     * @param logisticsCompany
     * @return
     */
    @RequestMapping("/getLogistics")
    @ResponseBody
    public Object getLogistics(@RequestParam("logisticsNum") String logisticsNum,@RequestParam("logisticsCompany") String logisticsCompany){
        try {
            return TransactionUtil.getRequest1(logisticsNum, logisticsCompany);
        } catch (Exception e) {
            logger.error("获取物流信息出错",e);
        }
        return null;
    }
    /**************************************************订单管理end****************************************************/
}
