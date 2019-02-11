package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
public interface OrderService {

    /**
     * 根据订单的不同状态获取订单
     * @param orderStatus
     * @return
     */
    List<Order> getOrderByOrderStatus(int orderStatus) throws Exception;

    /**
     * 修改订单信息
     * @param order
     * @return
     */
    int update_order(Order order) throws Exception;

    /**
     * 根据订单编号获取订单信息
     * @param orderNum
     * @return
     */
    Order getOrderByOrderNum(String orderNum) throws Exception;

    /**
     * 获取成交总额（获取交易成功的订单）
     * @param orderStatus
     * @return
     */
    String getSUMMoneyByOrderStatus(int orderStatus) throws Exception;

    /**
     * 获取当天成交额
     * @return
     */
    Object getTodaySUMMoney() throws Exception;

    /**
     * 获取所有订单
     * @return
     */
    List<Order> getOrderList() throws Exception;

    /**
     * 获取今日订单
     * @return
     */
    List<Order> getTodayOrder() throws Exception;

    /**
     * 获取当月订单
     * @return
     */
    List<Order> getMonthOrder() throws Exception;

    /**
     * 获取当月每天成交订单或者失败订单的数量
     * @param orderStatus
     * @param monthTime
     * @return
     */
    int getEchartsOrder(Integer orderStatus, String monthTime) throws Exception;

    /**
     * 获取当月每天成交订单金额
     * @param monthTime
     * @return
     */
    String getEchartsOrderMoney(String monthTime) throws Exception;

    /**
     * 获取订单数量
     * @return
     */
    int getOrderCount(Integer orderStatus) throws Exception;

    /**
     * 获取供货价
     * @return
     */
    String getGoodsSupplyPrice() throws Exception;

    /**
     * 获取零售价
     * @return
     */
    String getGoodsRetailPrice() throws Exception;

    /**
     * 获取产品销售提成总额
     * @return
     */
    String getSUMSalesCommission() throws Exception;

    /**
     * 获取每月各状态订单数量
     * @return
     */
    int getMonthOrderQuantity(Integer orderStatus, String month) throws Exception;

    /**
     * 获取所有订单列表
     * @return
     */
    List<Order> getAllOrderList() throws Exception;

    /**
     * 获取所有订单
     * @return
     */
    List<Order> getOrderGroupByOneClassifyId() throws Exception;

    /**
     * 获取对应日期订单销售总金额
     * @param lastData
     * @return
     */
    String getSUMGoodsPrice(String lastData) throws Exception;

    /**
     * 获取对应日期订单供货总价
     * @param lastData
     * @return
     */
    String getSUMGoodsSupplyPrice(String lastData) throws Exception;

    /**
     * 获取两日期之间成交订单销售总金额
     * @param weekRangeOne
     * @param weekRangeLast
     * @return
     */
    String getSUMGoodsPriceByDataRange(String weekRangeOne, String weekRangeLast);

    /**
     * 获取两日期之间成交订单供货总价
     * @param weekRangeOne
     * @param weekRangeLast
     * @return
     */
    String getSUMGoodsSupplyPriceByDataRange(String weekRangeOne, String weekRangeLast);

    /**
     * 获取订单总数量（不包含逻辑删除订单）
     * @param orderStatus
     * @return
     */
    int getOrderCountUnBeltDelete(Integer orderStatus);

    /**
     * 分红购买金额
     * @param orederPayType
     * @param orderStatus
     * @return
     */
    String getSUMOrderByShareProfit(int orederPayType, int orderStatus);

    /**
     * 根据支付类型获取总金额
     * @param patType
     * @return
     */
    String getSUMOrderByPayType(Integer patType);

    String getSUMsalesCommission(@Param("lastDataOne") String lastDataOne, @Param("lastDataLast") String lastDataLast);
}
