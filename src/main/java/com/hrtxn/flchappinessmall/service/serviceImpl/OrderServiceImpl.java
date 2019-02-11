package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.OrderMapper;
import com.hrtxn.flchappinessmall.pojo.Order;
import com.hrtxn.flchappinessmall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    /**
     * 根据订单的不同状态获取订单
     * @param orderStatus
     * @return
     */
    @Override
    public List<Order> getOrderByOrderStatus(int orderStatus) throws Exception {
        return orderMapper.getOrderByOrderStatus(orderStatus);
    }


    /**
     * 修改订单信息
     * @param order
     * @return
     */
    @Override
    public int update_order(Order order) throws Exception {
        return orderMapper.update_order(order);
    }

    /**
     * 根据订单编号获取订单信息
     * @param orderNum
     * @return
     */
    @Override
    public Order getOrderByOrderNum(String orderNum) throws Exception {
        return orderMapper.getOrderByOrderNum(orderNum);
    }

    /**
     * 获取成交总额（获取交易成功的订单）
     * @param orderStatus
     * @return
     */
    @Override
    public String getSUMMoneyByOrderStatus(int orderStatus) throws Exception {
        return orderMapper.getSUMMoneyByOrderStatus(orderStatus);
    }

    /**
     * 获取当天成交额
     * @return
     */
    @Override
    public Object getTodaySUMMoney() throws Exception {
        return orderMapper.getTodaySUMMoney();
    }

    /**
     * 获取所有订单
     * @return
     */
    @Override
    public List<Order> getOrderList() throws Exception {
        return orderMapper.getOrderList();
    }

    /**
     * 获取今日订单
     * @return
     */
    @Override
    public List<Order> getTodayOrder() throws Exception {
        return orderMapper.getTodayOrder();
    }

    /**
     * 获取当月订单
     * @return
     */
    @Override
    public List<Order> getMonthOrder() throws Exception {
        return orderMapper.getMonthOrder();
    }

    /**
     * 获取当月每天成交订单或者失败订单的数量
     * @param orderStatus
     * @param monthTime
     * @return
     */
    @Override
    public int getEchartsOrder(Integer orderStatus,String monthTime) throws Exception {
        return orderMapper.getEchartsOrder(orderStatus,monthTime);
    }

    /**
     * 获取当月每天成交订单金额
     * @param monthTime
     * @return
     */
    @Override
    public String getEchartsOrderMoney(String monthTime) throws Exception {
        return orderMapper.getEchartsOrderMoney(monthTime);
    }

    /**
     * 获取订单数量
     * @return
     */
    @Override
    public int getOrderCount(Integer orderStatus) throws Exception {
        return orderMapper.getOrderCount(orderStatus);
    }

    /**
     * 获取供货价
     * @return
     */
    @Override
    public String getGoodsSupplyPrice() throws Exception {
        return orderMapper.getGoodsSupplyPrice();
    }

    /**
     * 获取零售价
     * @return
     */
    @Override
    public String getGoodsRetailPrice() throws Exception {
        return orderMapper.getGoodsRetailPrice();
    }

    /**
     * 获取产品销售提成总额
     * @return
     */
    @Override
    public String getSUMSalesCommission() throws Exception {
        return orderMapper.getSUMSalesCommission();
    }

    /**
     * 获取每月各状态订单数量
     * @return
     */
    @Override
    public int getMonthOrderQuantity(Integer orderStatus,String month) throws Exception {
        return orderMapper.getMonthOrderQuantity(orderStatus,month);
    }

    /**
     * 获取所有订单列表
     * @return
     */
    @Override
    public List<Order> getAllOrderList() throws Exception {
        return orderMapper.getAllOrderList();
    }

    /**
     * 获取所有订单
     * @return
     */
    @Override
    public List<Order> getOrderGroupByOneClassifyId() throws Exception {
        return orderMapper.getOrderGroupByOneClassifyId();
    }

    /**
     * 获取对应日期订单销售总金额
     * @param lastData
     * @return
     */
    @Override
    public String getSUMGoodsPrice(String lastData) throws Exception {
        return orderMapper.getSUMGoodsPrice(lastData);
    }

    /**
     * 获取对应日期订单供货总价
     * @param lastData
     * @return
     */
    @Override
    public String getSUMGoodsSupplyPrice(String lastData) throws Exception {
        return orderMapper.getSUMGoodsSupplyPrice(lastData);
    }

    /**
     * 获取两日期之间成交订单销售总金额
     * @param weekRangeOne
     * @param weekRangeLast
     * @return
     */
    @Override
    public String getSUMGoodsPriceByDataRange(String weekRangeOne, String weekRangeLast) {
        return orderMapper.getSUMGoodsPriceByDataRange(weekRangeOne,weekRangeLast);
    }

    /**
     * 获取两日期之间成交订单供货总价
     * @param weekRangeOne
     * @param weekRangeLast
     * @return
     */
    @Override
    public String getSUMGoodsSupplyPriceByDataRange(String weekRangeOne, String weekRangeLast) {
        return orderMapper.getSUMGoodsSupplyPriceByDataRange(weekRangeOne,weekRangeLast);
    }

    /**
     * 获取订单总数量（不包含逻辑删除订单）
     * @param orderStatus
     * @return
     */
    @Override
    public int getOrderCountUnBeltDelete(Integer orderStatus) {
        return orderMapper.getOrderCountUnBeltDelete(orderStatus);
    }

    /**
     * 分红购买金额
     * @param orederPayType
     * @param orderStatus
     * @return
     */
    @Override
    public String getSUMOrderByShareProfit(int orederPayType, int orderStatus) {
        return orderMapper.getSUMOrderByShareProfit(orederPayType,orderStatus);
    }

    /**
     * 根据支付类型获取总金额
     * @param patType
     * @return
     */
    @Override
    public String getSUMOrderByPayType(Integer patType) {
        return orderMapper.getSUMOrderByPayType(patType);
    }

    @Override
    public String getSUMsalesCommission(String lastDataOne, String lastDataLast) {
        return orderMapper.getSUMsalesCommission(lastDataOne,lastDataLast);
    }
}
