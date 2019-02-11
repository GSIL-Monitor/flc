<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="${pageContext.request.contextPath}/static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/css/style.css"/>
    <link href="${pageContext.request.contextPath}/static/admin/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/ace-elements.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/ace.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/regular.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/tools.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/jsonHandler.js" type="text/javascript"></script>
    <title>系统管理--系统设置</title>
</head>

<body>
<div class="margin clearfix">
    <div class="stystems_style">
        <div class="tabbable">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a data-toggle="tab" href="#home"><i class="green fa fa-home bigger-110"></i>&nbsp;基本参数设置</a>
                </li>
                <li><a data-toggle="tab" href="#times"><i class="green fa fa-home bigger-110"></i>&nbsp;时间基本设置</a></li>
                <li class=""><a data-toggle="tab" href="#profile"><i class="green fa fa-home bigger-110"></i>&nbsp;底部版权信息设置</a>
                </li>
                <li class=""><a data-toggle="tab" href="#keyword"><i class="green fa fa-home bigger-110"></i>&nbsp;关键词设置</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="home" class="tab-pane active">
                    <form id="form">
                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right"><i>*</i>消费者购物折率：
                            </label>
                            <div class="col-sm-9"><span style="color: #8D8D8D;margin-left: 10px;">消费者角色购物打折率，默认85折，如打9折，则输入9,区间 0 ~ 100（包含0和100）</span>
                                <input type="text" placeholder="默认85折" value="${sysconfig.touristsShopDiscount}" class="col-xs-10 touristsShopDiscount">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right"><i>*</i>提现手续费比例：
                            </label>
                            <div class="col-sm-9"><span style="color: #8D8D8D;margin-left: 10px;">默认2%，百分比格式，区间 0 ~ 100（包含0和100）</span>
                                <input type="text" placeholder="默认2%" value="${sysconfig.withdrawalChargePer}" class="col-xs-10 withdrawalChargePer">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right"><i>*</i>考核积分兑换比例：
                            </label>
                            <div class="col-sm-4"><span style="color: #8D8D8D;margin-left: 10px;">精品区：默认1，1:1比例格式</span>
                                <input type="text" placeholder="默认100%" value="${sysconfig.boutiqueAreaPer}" class="col-xs-10 boutiqueAreaPer">
                            </div>
                            <div class="col-sm-4"><span style="color: #8D8D8D;margin-left: 10px;">消费区：默认0.5，1:0.5比例格式</span>
                                <input type="text" placeholder="默认50%" value="${sysconfig.consumeAreaPer}" class="col-xs-10 consumeAreaPer">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right"><i>*</i>合伙人考核标准： </label>
                            <div class="col-sm-3"><span style="color: #8D8D8D;margin-left: 10px;">事业合伙人</span>
                                <input type="text" placeholder="默认1500" value="${sysconfig.primaryCareerIntegralRules}" class="col-xs-10 primaryCareerIntegralRules">
                            </div>
                            <div class="col-sm-3"><span style="color: #8D8D8D;margin-left: 10px;">高级合伙人</span>
                                <input type="text" placeholder="默认60000" value="${sysconfig.advancedCareerIntegralRules}" class="col-xs-10 advancedCareerIntegralRules">
                            </div>
                            <div class="col-sm-3"><span style="color: #8D8D8D;margin-left: 10px;">创始合伙人</span>
                                <input type="text" placeholder="默认150000" value="${sysconfig.initiateCareerIntegralRules}" class="col-xs-10 initiateCareerIntegralRules">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right"><i>*</i>连续月份标准： </label>
                            <div class="col-sm-3">
                                <span style="color: #8D8D8D;margin-left: 10px;">消费者默认当月</span>
                                <input type="text" placeholder="" value="${sysconfig.primaryCareerContinuousMonth}" class="col-xs-10 primaryCareerContinuousMonth">
                            </div>
                            <div class="col-sm-3">
                                <span style="color: #8D8D8D;margin-left: 10px;">初级事业合伙人默认3个月</span>
                                <input type="text" placeholder="" value="${sysconfig.advancedCareerContinuousMonth}" class="col-xs-10 advancedCareerContinuousMonth">
                            </div>
                            <div class="col-sm-3">
                                <span style="color: #8D8D8D;margin-left: 10px;">高级事业合伙人默认6个月</span>
                                <input type="text" placeholder="" value="${sysconfig.initiateCareerContinuousMonth}" class="col-xs-10 initiateCareerContinuousMonth">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right"><i>*</i>当月个人消费标准： </label>
                            <div class="col-sm-3">
                                <span style="color: #8D8D8D;margin-left: 10px;">消费者默认300</span>
                                <input type="text" placeholder="" value="${sysconfig.primaryCareerPersonalIntegral}" class="col-xs-10 primaryCareerPersonalIntegral">
                            </div>
                            <div class="col-sm-3">
                                <span style="color: #8D8D8D;margin-left: 10px;">初级事业合伙人默认400</span>
                                <input type="text" placeholder="" value="${sysconfig.advancedCareerPersonalIntegral}" class="col-xs-10 advancedCareerPersonalIntegral">
                            </div>
                            <div class="col-sm-3">
                                <span style="color: #8D8D8D;margin-left: 10px;">高级事业合伙人默认500</span>
                                <input type="text" placeholder="" value="${sysconfig.initiateCareerPersonalIntegral}" class="col-xs-10 initiateCareerPersonalIntegral">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right"><i>*</i>营销比例： </label>
                            <div class="col-sm-9"><span style="color: #8D8D8D;margin-left: 10px;">运营成本，默认20%，百分比格式，区间 0 ~ 100（包含0和100）</span>
                                <input type="text" placeholder="默认20%" value="${sysconfig.operatingCostsPer}" class="col-xs-10 operatingCostsPer">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right"><i>*</i>杰出贡献奖比例：
                            </label>
                            <div class="col-sm-9"><span style="color: #8D8D8D;margin-left: 10px;">默认5%，百分比格式，区间 0 ~ 100（包含0和100）</span>
                                <input type="text" placeholder="默认5%" value="${sysconfig.specialContributeAward}" class="col-xs-10 specialContributeAward">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right"><i>*</i>推荐商家比例：
                            </label>
                            <div class="col-sm-9"><span style="color: #8D8D8D;margin-left: 10px;">默认2%，百分比格式，区间 0 ~ 100（包含0和100）</span>
                                <input type="text" placeholder="默认2%" value="${sysconfig.recommendShopColumn}" class="col-xs-10 recommendShopColumn">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right"><i>*</i>分红比例： </label>
                            <div class="col-sm-2"><span style="color: #8D8D8D;margin-left: 10px;">日分红比例</span>
                                <input type="text" placeholder="默认40%" value="${sysconfig.dayProfitPer}" class="col-xs-10 dayProfitPer">
                            </div>
                            <div class="col-sm-2"><span style="color: #8D8D8D;margin-left: 10px;">周分红比例</span>
                                <input type="text" placeholder="默认30%" value="${sysconfig.weekProfitPer}" class="col-xs-10 weekProfitPer">
                            </div>
                            <div class="col-sm-2"><span style="color: #8D8D8D;margin-left: 10px;">月分红</span>
                                <input type="text" placeholder="默认20%" value="${sysconfig.monthProfitPer}" class="col-xs-10 monthProfitPer">
                            </div>
                            <div class="col-sm-2"><span style="color: #8D8D8D;margin-left: 10px;">季分红</span>
                                <input type="text" placeholder="默认8%" value="${sysconfig.quarterProfitPer}" class="col-xs-10 quarterProfitPer">
                            </div>
                            <div class="col-sm-2"><span style="color: #8D8D8D;margin-left: 10px;">年分红</span>
                                <input type="text" placeholder="默认5%" value="${sysconfig.yearProfitPer}" class="col-xs-10 yearProfitPer">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right"><i>*</i>分销比例： </label>
                            <div class="col-sm-2"><span style="color: #8D8D8D;margin-left: 10px;">朋友</span>
                                <input type="text" placeholder="默认100%" value="${sysconfig.onePartnerPer}" class="col-xs-10 onePartnerPer">
                            </div>
                            <div class="col-sm-2"><span style="color: #8D8D8D;margin-left: 10px;">熟人</span>
                                <input type="text" placeholder="默认50%" value="${sysconfig.twoPartnerPer}" class="col-xs-10 twoPartnerPer">
                            </div>
                        </div>
                    </form>
                    <div class="Button_operation basicParameterSysConfig">
                        <button class="btn btn-primary radius" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
                    </div>
                </div>

                <div id="profile" class="tab-pane ">
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right"><i>*</i>底部版全信息：</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="输入底部版全信息" value="${sysconfig.copyright}" class="col-xs-10 copyright">
                        </div>
                    </div>
                    <div class="Button_operation copyrightSysConfig">
                        <button class="btn btn-primary radius" type="submit"><i class="fa fa-save "></i>&nbsp;保存</button>
                    </div>
                </div>
                <div id="dropdown" class="tab-pane"></div>
                <!--时间设置-->
                <div id="times" class="tab-pane">
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"><i>*</i>自动确认收货时长：</label>
                        <div class="col-sm-2">
                            <input type="number" value="${sysconfig.automaticReceivingTime}" class="col-xs-10 automaticReceivingTime" name="keyword">
                        </div>
                        <span style="color: #c1c0c0;">卖家发货后,达到该时间系统自动确认收货</span>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"><i>*</i>自动评价时长：</label>
                        <div class="col-sm-2">
                            <input type="number" value="${sysconfig.automaticEvaluateTime}" class="col-xs-10 automaticEvaluateTime" name="keyword">
                        </div>
                        <span style="color: #c1c0c0;">订单自确认收货后不自主评价系统自动评价时间</span>
                    </div>
                    <div class="Button_operation timeSysConfig">
                        <button class="btn btn-primary radius" type="submit"><i class="fa fa-save "></i>&nbsp;保存</button>
                    </div>
                </div>
                <!--关键词设置-->
                <div id="keyword" class="tab-pane">
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right"><i>*</i>关键词：</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="输入关键词" value="${sysconfig.keywords}" class="col-xs-10 keywords" name="keyword">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right"><i>*</i>描述：</label>
                        <div class="col-sm-9">
                            <textarea class="textarea description" placeholder="输入描述" name="description">${sysconfig.description}</textarea>
                        </div>
                    </div>
                    <div class="Button_operation keywordsSysConfig">
                        <button class="btn btn-primary radius" type="submit"><i class="fa fa-save "></i>&nbsp;保存</button>
                    </div>
                </div>
                <!--其他设置-->
                <div id="other" class="tab-pane">
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right"><i>*</i>敏感词：</label>
                        <div class="col-sm-9">
                            <textarea class="textarea" placeholder="输入敏感词">${sysconfig.sensitiveWord}</textarea>
                        </div>
                    </div>
                    <div class="Button_operation">
                        <button class="btn btn-primary radius" type="submit"><i class="fa fa-save "></i>&nbsp;保存</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        $(".basicParameterSysConfig").click(function () {
            var touristsShopDiscount = $(".touristsShopDiscount").val();//消费者购物折率
            var withdrawalChargePer = $(".withdrawalChargePer").val();//提现手续费比例
            var boutiqueAreaPer = $(".boutiqueAreaPer").val();//精品区积分兑换比列
            var consumeAreaPer = $(".consumeAreaPer").val();//消费区积分兑换比列
            var primaryCareerIntegralRules = $(".primaryCareerIntegralRules").val();//事业合伙人考核积分标准
            var advancedCareerIntegralRules = $(".advancedCareerIntegralRules").val();//高级合伙人考核积分标准
            var initiateCareerIntegralRules = $(".initiateCareerIntegralRules").val();//创始合伙人考核积分标准
            var primaryCareerContinuousMonth = $(".primaryCareerContinuousMonth").val();//消费者连续月份标准
            var advancedCareerContinuousMonth = $(".advancedCareerContinuousMonth").val();//初级事业合伙人连续月份标准
            var initiateCareerContinuousMonth = $(".initiateCareerContinuousMonth").val();//高级事业合伙人连续月份标准
            var primaryCareerPersonalIntegral = $(".primaryCareerPersonalIntegral").val();//消费者当月个人消费标准
            var advancedCareerPersonalIntegral = $(".advancedCareerPersonalIntegral").val();//初级事业合伙人当月个人消费标准
            var initiateCareerPersonalIntegral = $(".initiateCareerPersonalIntegral").val();//高级事业合伙人当月个人消费标准
            var operatingCostsPer = $(".operatingCostsPer").val();//营销比例
            var specialContributeAward = $(".specialContributeAward").val();//杰出贡献奖比例
            // var yearProfitContinuousMonth = $(".yearProfitContinuousMonth").val();
            var recommendShopColumn = $(".recommendShopColumn").val();//推荐商家比例
            var dayProfitPer = $(".dayProfitPer").val();//日分红比例
            var weekProfitPer = $(".weekProfitPer").val();//周分红比例
            var monthProfitPer = $(".monthProfitPer").val();//月分红比例
            var quarterProfitPer = $(".quarterProfitPer").val();//季分红比例
            var yearProfitPer = $(".yearProfitPer").val();//年分红比例
            var onePartnerPer = $(".onePartnerPer").val();//一级下线比例
            var twoPartnerPer = $(".twoPartnerPer").val();//二级下线比例

            if (!isEmpty(touristsShopDiscount) && touristsShopDiscount >= 0 && touristsShopDiscount <= 100){
                if (!isEmpty(withdrawalChargePer) && withdrawalChargePer >= 0 && withdrawalChargePer <= 100){
                    if (!isEmpty(boutiqueAreaPer) && boutiqueAreaPer >= 0){
                        if (!isEmpty(consumeAreaPer) && consumeAreaPer >= 0){
                            if (!isEmpty(primaryCareerIntegralRules) && primaryCareerIntegralRules >= 0 && isPositiveInteger(primaryCareerIntegralRules)){
                                if (!isEmpty(advancedCareerIntegralRules) && advancedCareerIntegralRules >= 0 && isPositiveInteger(advancedCareerIntegralRules)){
                                    if (!isEmpty(initiateCareerIntegralRules) && initiateCareerIntegralRules >= 0 && isPositiveInteger(initiateCareerIntegralRules)){
                                        if (!isEmpty(primaryCareerContinuousMonth) && primaryCareerContinuousMonth > 0 && isPositiveInteger(primaryCareerContinuousMonth)){
                                            if (!isEmpty(advancedCareerContinuousMonth) && advancedCareerContinuousMonth > 0 && isPositiveInteger(advancedCareerContinuousMonth)){
                                                if (!isEmpty(initiateCareerContinuousMonth) && initiateCareerContinuousMonth > 0 && isPositiveInteger(initiateCareerContinuousMonth)){
                                                    if (!isEmpty(primaryCareerPersonalIntegral) && primaryCareerPersonalIntegral >= 0 && isPositiveInteger(primaryCareerPersonalIntegral)){
                                                        if (!isEmpty(advancedCareerPersonalIntegral) && advancedCareerPersonalIntegral >= 0 && isPositiveInteger(advancedCareerPersonalIntegral)){
                                                            if (!isEmpty(initiateCareerPersonalIntegral) && initiateCareerPersonalIntegral >= 0 && isPositiveInteger(initiateCareerPersonalIntegral)){
                                                                if (!isEmpty(operatingCostsPer) && operatingCostsPer >= 0 && operatingCostsPer <= 100){
                                                                    if (!isEmpty(specialContributeAward) && specialContributeAward >= 0 && specialContributeAward <= 100){
                                                                        if (!isEmpty(recommendShopColumn) && recommendShopColumn >= 0 && recommendShopColumn <= 100){
                                                                            if (!isEmpty(dayProfitPer) && dayProfitPer >= 0 && dayProfitPer <= 100){
                                                                                if (!isEmpty(weekProfitPer) && weekProfitPer >= 0 && weekProfitPer <= 100){
                                                                                    if (!isEmpty(monthProfitPer) && monthProfitPer >= 0 && monthProfitPer <= 100){
                                                                                        if (!isEmpty(quarterProfitPer) && quarterProfitPer >= 0 && quarterProfitPer <= 100){
                                                                                            if (!isEmpty(yearProfitPer) && yearProfitPer >= 0 && yearProfitPer <= 100){
                                                                                                if (!isEmpty(onePartnerPer) && onePartnerPer >= 0 && onePartnerPer <= 100){
                                                                                                    if (!isEmpty(twoPartnerPer) && twoPartnerPer >= 0 && twoPartnerPer <= 100){
                                                                                                        layer.confirm('确认要修改吗？', function (index) {
                                                                                                            var json = $("#form").serializeObject();
                                                                                                            $.ajax({
                                                                                                                type : 'post',
                                                                                                                url : '${pageContext.request.contextPath}/admin/update_sysConfig',
                                                                                                                data : {
                                                                                                                    touristsShopDiscount:touristsShopDiscount,
                                                                                                                    withdrawalChargePer:withdrawalChargePer,
                                                                                                                    boutiqueAreaPer:boutiqueAreaPer,
                                                                                                                    consumeAreaPer:consumeAreaPer,
                                                                                                                    primaryCareerIntegralRules:primaryCareerIntegralRules,
                                                                                                                    advancedCareerIntegralRules:advancedCareerIntegralRules,
                                                                                                                    initiateCareerIntegralRules:initiateCareerIntegralRules,
                                                                                                                    primaryCareerContinuousMonth:primaryCareerContinuousMonth,
                                                                                                                    advancedCareerContinuousMonth:advancedCareerContinuousMonth,
                                                                                                                    initiateCareerContinuousMonth:initiateCareerContinuousMonth,
                                                                                                                    primaryCareerPersonalIntegral:primaryCareerPersonalIntegral,
                                                                                                                    advancedCareerPersonalIntegral:advancedCareerPersonalIntegral,
                                                                                                                    initiateCareerPersonalIntegral:initiateCareerPersonalIntegral,
                                                                                                                    operatingCostsPer:operatingCostsPer,
                                                                                                                    specialContributeAward:specialContributeAward,
                                                                                                                    recommendShopColumn:recommendShopColumn,
                                                                                                                    dayProfitPer:dayProfitPer,
                                                                                                                    weekProfitPer:weekProfitPer,
                                                                                                                    monthProfitPer:monthProfitPer,
                                                                                                                    quarterProfitPer:quarterProfitPer,
                                                                                                                    yearProfitPer:yearProfitPer,
                                                                                                                    onePartnerPer:onePartnerPer,
                                                                                                                    twoPartnerPer:twoPartnerPer,
                                                                                                                    id : ${sysconfig.id}
                                                                                                                },
                                                                                                                dataType : 'json',
                                                                                                                success : function (result) {
                                                                                                                    if (result) {
                                                                                                                        layer.msg('修改成功！', {icon: 1, offset: 't',time: 1000},function(){
                                                                                                                            window.location.reload();
                                                                                                                        });
                                                                                                                    }else{
                                                                                                                        layer.msg('修改失败，请稍后再试！', {icon: 7, offset: 't'});
                                                                                                                    }
                                                                                                                },
                                                                                                                error : function () {
                                                                                                                    layer.msg('修改出错，请稍后再试！', {icon: 2, offset: 't'});
                                                                                                                }
                                                                                                            });
                                                                                                        });
                                                                                                    }else{
                                                                                                        layer.msg('二级下线比例不正确，请输入大于等于0且小于等于100的数！', {icon: 2, offset: 't'});
                                                                                                    }
                                                                                                }else{
                                                                                                    layer.msg('一级下线比例不正确，请输入大于等于0且小于等于100的数！', {icon: 2, offset: 't'});
                                                                                                }
                                                                                            }else{
                                                                                                layer.msg('年分红比例不正确，请输入大于等于0且小于等于100的数！', {icon: 2, offset: 't'});
                                                                                            }
                                                                                        }else{
                                                                                            layer.msg('季分红比例不正确，请输入大于等于0且小于等于100的数！', {icon: 2, offset: 't'});
                                                                                        }
                                                                                    }else{
                                                                                        layer.msg('月分红比例不正确，请输入大于等于0且小于等于100的数！', {icon: 2, offset: 't'});
                                                                                    }
                                                                                }else{
                                                                                    layer.msg('周分红比例不正确，请输入大于等于0且小于等于100的数！', {icon: 2, offset: 't'});
                                                                                }
                                                                            }else{
                                                                                layer.msg('日分红比例不正确，请输入大于等于0且小于等于100的数！', {icon: 2, offset: 't'});
                                                                            }
                                                                        }else{
                                                                            layer.msg('推荐商家比例不正确，请输入大于等于0且小于等于100的数！', {icon: 2, offset: 't'});
                                                                        }
                                                                    }else{
                                                                        layer.msg('杰出贡献奖比例不正确，请输入大于等于0且小于等于100的数！', {icon: 2, offset: 't'});
                                                                    }
                                                                }else{
                                                                    layer.msg('营销比例不正确，请输入大于等于0且小于等于100的数！', {icon: 2, offset: 't'});
                                                                }
                                                            }else{
                                                                layer.msg('高级事业合伙人当月个人消费标准不正确，请输入大于等于0的整数！', {icon: 2, offset: 't'});
                                                            }
                                                        }else{
                                                            layer.msg('初级事业合伙人当月个人消费标准不正确，请输入大于等于0的整数！', {icon: 2, offset: 't'});
                                                        }
                                                    }else{
                                                        layer.msg('消费者当月个人消费标准不正确，请输入大于等于0的整数！', {icon: 2, offset: 't'});
                                                    }
                                                }else{
                                                    layer.msg('高级事业合伙人连续月份标准不正确，请输入大于0的整数！', {icon: 2, offset: 't'});
                                                }
                                            }else{
                                                layer.msg('初级事业合伙人连续月份标准不正确，请输入大于0的整数！', {icon: 2, offset: 't'});
                                            }
                                        }else{
                                            layer.msg('消费者连续月份标准不正确，请输入大于0的整数！', {icon: 2, offset: 't'});
                                        }
                                    }else{
                                        layer.msg('创始合伙人考核积分标准不正确，请输入大于等于0的整数！', {icon: 2, offset: 't'});
                                    }
                                }else{
                                    layer.msg('高级合伙人考核积分标准不正确，请输入大于等于0的整数！', {icon: 2, offset: 't'});
                                }
                            }else{
                                layer.msg('事业合伙人考核积分标准不正确，请输入大于等于0的整数！', {icon: 2, offset: 't'});
                            }
                        }else{
                            layer.msg('消费区积分兑换比列不正确，请输入大于等于0的数！', {icon: 2, offset: 't'});
                        }
                    }else{
                        layer.msg('精品区积分兑换比列不正确，请输入大于等于0的数！', {icon: 2, offset: 't'});
                    }
                }else{
                    layer.msg('提现手续费比例不正确，请输入大于等于0且小于等于100的数！', {icon: 2, offset: 't'});
                }
            }else{
                layer.msg('消费者购物折率不正确，请输入大于等于0且小于等于100的数！', {icon: 2, offset: 't'});
            }
        });
        
        /*时间基本设置*/
        $(".timeSysConfig").click(function () {
            layer.confirm('确认要修改吗？', function (index) {
                var automaticReceivingTime = $(".automaticReceivingTime").val();
                var automaticEvaluateTime = $(".automaticEvaluateTime").val();
                if(automaticReceivingTime > 0 && isPositiveInteger(automaticReceivingTime)){
                    if(automaticEvaluateTime > 0 && isPositiveInteger(automaticEvaluateTime)){
                        $.ajax({
                            type : 'post',
                            url : '${pageContext.request.contextPath}/admin/update_sysConfig',
                            dataType : 'json',
                            data : {
                                automaticReceivingTime : automaticReceivingTime,
                                automaticEvaluateTime : automaticEvaluateTime,
                                id : ${sysconfig.id}
                            },
                            success : function (result) {
                                if (result) {
                                    layer.msg('修改成功！', {icon: 1, offset: 't',time: 1000});
                                }else{
                                    layer.msg('修改失败，请稍后再试！', {icon: 2, offset: 't'});
                                }
                            },
                            error : function () {
                                layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                            }
                        });
                    }else {
                        layer.msg('自动评价时长式不正确，请输入大于0的整数！', {icon: 2, offset: 't'});
                    }
                }else {
                    layer.msg('自动确认收货时长式不正确，请输入大于0的整数！', {icon: 2, offset: 't'});
                }
            });
        });
        //底部版权信息设置
        $(".copyrightSysConfig").click(function () {
            layer.confirm('确认要修改吗？', function (index) {
                var copyright = $(".copyright").val();
                if(!!copyright){
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/admin/update_sysConfig',
                        dataType : 'json',
                        data : {
                            copyright : copyright,
                            id : ${sysconfig.id}
                        },
                        success : function (result) {
                            if (result) {
                                layer.msg('修改成功！', {icon: 1, offset: 't',time: 1000});
                            }else{
                                layer.msg('修改失败，请稍后再试！', {icon: 2, offset: 't'});
                            }
                        },
                        error : function () {
                            layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                }else{
                    layer.msg('底部版全信息不能为空！', {icon: 2, offset: 't'});
                }
            });
        });
        //关键词设置
        $(".keywordsSysConfig").click(function () {
            var keywords = $(".keywords").val();
            var description = $(".description").val();
            if(!!keywords){
                if(!!description){
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/admin/update_sysConfig',
                        dataType : 'json',
                        data : {
                            keywords : keywords,
                            description : description,
                            id : ${sysconfig.id}
                        },
                        success : function (result) {
                            if (result) {
                                layer.msg('修改成功！', {icon: 1, offset: 't',time: 1000});
                            }else{
                                layer.msg('修改失败，请稍后再试！', {icon: 2, offset: 't'});
                            }
                        },
                        error : function () {
                            layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                }else{
                    layer.msg('描述不能为空！', {icon: 2, offset: 't'});
                }
            }else{
                layer.msg('关键词不能为空！', {icon: 2, offset: 't'});
            }
        });
    });
</script>
</html>