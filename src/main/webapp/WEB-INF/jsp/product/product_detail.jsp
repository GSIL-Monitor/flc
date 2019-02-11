<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="${pageContext.request.contextPath }/static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/css/style.css"/>
    <link href="${pageContext.request.contextPath }/static/admin/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/font/css/font-awesome.min.css"/>
    <script src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>产品管理--产品详情</title>
</head>

<body>
<div class="margin clearfix">
    <div class="detailed_style clearfix">
        <ul class="shop_content clearfix" style="padding-left: 0;">
            <li class="shop_name"><label class="label_name">产品名称：</label><span class="info">猫王</span>
            </li>
            <li><label class="label_name">产品价格：</label><span class="info">150元</span></li>
            <li><label class="label_name">产品分类：</label><span class="info">生活用品</span></li>
            <li><label class="label_name">库存量：</label><span class="info">1000件</span></li>
            <li><label class="label_name">品牌：</label><span class="info">猫王戏鼠</span></li>
            <li><label class="label_name">所属店铺：</label><span class="info">杂货铺</span></li>
            <li><label class="label_name">运费：</label><span class="info">10元</span></li>
            <li><label class="label_name">发货地：</label><span class="info">徐州</span></li>
            <li><label class="label_name">申请时间：</label><span class="info">2018-08-03</span></li>
            <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="info">待审核</span></li>
        </ul>
    </div>
    <div class="Store_Introduction">
        <div class="title_name">下架理由</div>
        <div class="info">
            淘宝店铺介绍怎么写，只写上一句话或一段话，再加上淘宝平台默认名片式的基本信息，和联系方式。简单明了。例如：
            1、欢迎光临本店，本店新开张，诚信经营，只赚信誉不赚钱，谢谢。
            2、本店商品均属正品，假一罚十信誉保证。欢迎广大顾客前来放心选购，我们将竭诚为您服务!
            3、本店专门营销什么什么商品，假一罚十信誉保证。本店的服务宗旨是用心服务，以诚待人!
            二、消息型的淘宝店铺介绍书写方式：
            淘宝店铺介绍怎么写，就是将店铺最新的优惠活动发布在淘宝店铺介绍里，这种类型不但能吸引喜欢优惠活动的新买家，如果是时间段优惠更能促使买家下定决心，尽快购买。
            <br/>
            四、详细型的淘宝店铺介绍书写方式：
            淘宝店铺介绍怎么写，你不可能知道每个买家到你的淘宝店铺介绍页面里想了解什么，可以考虑把所有的都写进去。另外，还有购物流程、联系方式、物流方式、售后服务、温馨提示等等都统统写上去。但是一定要花时间好好排版。内容多，字体不能太大，正常就可以了，然后一段内容的标题要加粗或者加上颜色，比如给售后服务加粗，然后售后服务的内容则用正常字体，这样每段内容配上一个加粗标题，买家一点进淘宝店铺介绍，第一眼明显看到的都是几个加粗标题，能很快找到自己想了解的就有耐心看下去。就像本篇文章一样，没有一些加粗的字体，读者不从头读起，就找不到各段内容的主要针对点。
        </div>
    </div>
    <div class="Store_Introduction">
        <div class="title_name">产品详情</div>
        <div class="info">
            淘宝店铺介绍怎么写，只写上一句话或一段话，再加上淘宝平台默认名片式的基本信息，和联系方式。简单明了。例如：
            1、欢迎光临本店，本店新开张，诚信经营，只赚信誉不赚钱，谢谢。
            2、本店商品均属正品，假一罚十信誉保证。欢迎广大顾客前来放心选购，我们将竭诚为您服务!
            3、本店专门营销什么什么商品，假一罚十信誉保证。本店的服务宗旨是用心服务，以诚待人!
            二、消息型的淘宝店铺介绍书写方式：
            淘宝店铺介绍怎么写，就是将店铺最新的优惠活动发布在淘宝店铺介绍里，这种类型不但能吸引喜欢优惠活动的新买家，如果是时间段优惠更能促使买家下定决心，尽快购买。
            <br/>
            四、详细型的淘宝店铺介绍书写方式：
            淘宝店铺介绍怎么写，你不可能知道每个买家到你的淘宝店铺介绍页面里想了解什么，可以考虑把所有的都写进去。另外，还有购物流程、联系方式、物流方式、售后服务、温馨提示等等都统统写上去。但是一定要花时间好好排版。内容多，字体不能太大，正常就可以了，然后一段内容的标题要加粗或者加上颜色，比如给售后服务加粗，然后售后服务的内容则用正常字体，这样每段内容配上一个加粗标题，买家一点进淘宝店铺介绍，第一眼明显看到的都是几个加粗标题，能很快找到自己想了解的就有耐心看下去。就像本篇文章一样，没有一些加粗的字体，读者不从头读起，就找不到各段内容的主要针对点。
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">

</script>
