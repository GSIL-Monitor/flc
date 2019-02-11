package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.common.GoodsCommon;
import com.hrtxn.flchappinessmall.pojo.Article;
import com.hrtxn.flchappinessmall.pojo.Goods;
import com.hrtxn.flchappinessmall.pojo.Store;
import com.hrtxn.flchappinessmall.pojo.User;
import com.hrtxn.flchappinessmall.pojo.pojoVo.GoodsVo;
import com.hrtxn.flchappinessmall.pojo.pojoVo.UserCountVo;
import com.hrtxn.flchappinessmall.service.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Description: 首页控制类<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Controller
@RequestMapping("/admin")
public class IndexController {
    @Autowired
    private IndexService indexService;
    @Autowired//用户
    private UserService userService;
    @Autowired//店铺
    private StoreService storeService;
    @Autowired//订单
    private OrderService orderService;
    @Autowired//文章
    private ArticleService articleService;
    @Autowired//商品
    private GoodsService goodsService;

    private Logger logger = Logger.getLogger(IndexController.class);

    @RequestMapping("/index")
    public ModelAndView index() {
        return new ModelAndView("index/index.jsp");
    }

    /**
     * 获取首页显示内容
     *
     * @return
     */
    @RequestMapping("/index_home")
    public ModelAndView index_home() {
        ModelAndView modelAndView = new ModelAndView("index/home.jsp");
        try {
            //用户总数
            List<User> users = userService.getAllUserList();
            modelAndView.addObject("userCount", users.size());
            //获取用户各角色总人数
            Integer user1 = 0, user2 = 0, user3 = 0, user4 = 0;
            List<UserCountVo> list = userService.getUserCountByGroup();
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getUserRole() == 1) {
                    user1 = list.get(i).getUserCount();
                }
                if (list.get(i).getUserRole() == 2) {
                    user2 = list.get(i).getUserCount();
                }
                if (list.get(i).getUserRole() == 3) {
                    user3 = list.get(i).getUserCount();
                }
                if (list.get(i).getUserRole() == 4) {
                    user4 = list.get(i).getUserCount();
                }
            }
            modelAndView.addObject("user1", user1);
            modelAndView.addObject("user2", user2);
            modelAndView.addObject("user3", user3);
            modelAndView.addObject("user4", user4);

            //获取店铺总数
            List<Store> storeList = storeService.getStoreList();
            modelAndView.addObject("storeCount", storeList.size());

            //获取订单总数
            int orderCount = orderService.getOrderCount(0);
            modelAndView.addObject("orderCount", orderCount);
            //待计算订单
            int daijisuanOrderCount = orderService.getOrderCount(1);
            modelAndView.addObject("daijisuanOrderCount", daijisuanOrderCount);
            //待发货订单
            int daifahuoOrderCount = orderService.getOrderCount(2);
            modelAndView.addObject("daifahuoOrderCount", daifahuoOrderCount);
            //已成交订单
            int finishedOrderCount = orderService.getOrderCount(5);
            modelAndView.addObject("finishedOrderCount", finishedOrderCount);
            //交易失败
            //取消订单
            int cancelOrderCount = orderService.getOrderCount(6);
            int refundOrderCount = orderService.getOrderCount(7);
            modelAndView.addObject("failedOrderCount", (cancelOrderCount + refundOrderCount));

            //获取交易总额
            String sumMoneyByOrderStatus = orderService.getSUMMoneyByOrderStatus(5);
            if (sumMoneyByOrderStatus == null){
                sumMoneyByOrderStatus = "0.00";
            }
            modelAndView.addObject("sumMoneyByOrderStatus", sumMoneyByOrderStatus);
            //获取文章
            List<Article> allArticles = articleService.getAllArticles();
            modelAndView.addObject("allArticles", allArticles);

            //获取商品数量
            List<Goods> goodsList = goodsService.getGoodsAll();
            List<GoodsVo> goodsByStatusMarketing  = goodsService.getGoodsByStatus(GoodsCommon.GOODS_STATUS_MARKETING);//常量值2 营销中
            List<GoodsVo> goodsByStatusWeigui = goodsService.getGoodsByStatus(GoodsCommon.GOODS_STATUS_WEIGUI);//常量值3 正常下架状态
            Integer evaluteCount = goodsService.getEvaluteCount();//所有商品的所有评价 (不包含删除状态的商品评价)
            modelAndView.addObject("goodsListSize",goodsList.size());//商品总数量
            modelAndView.addObject("goodsByStatusMarketingSize",goodsByStatusMarketing.size());//营销商品数量
            modelAndView.addObject("goodsByStatusWeiguiSize",goodsByStatusWeigui.size());// 正在下架商品数量
            modelAndView.addObject("evaluteCount",evaluteCount);//评价数量

            return modelAndView;
        } catch (Exception e) {
            logger.error("获取首页显示内容出错", e);
        }
        return null;
    }
}
