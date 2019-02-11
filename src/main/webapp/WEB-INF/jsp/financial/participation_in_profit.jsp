<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/lrtk.js" type="text/javascript"></script>
    <title>财务管理--分红发放</title>
</head>

<body>
<div class="margin clearfix">
    <div class="Account_style">
        <!--记录-->
        <div class="recording_style">
            <div id="recording">
                <div class="hd">
                    <ul>
                        <li onclick="dayProfit();">日分红发放</li>
                        <li onclick="weekProfit();">周分红发放</li>
                        <li onclick="getMonthProfit();">月分红发放</li>
                        <li onclick="getQuarterProfit();">季分红发放</li>
                        <li onclick="getYearProfit();">年分红发放</li>
                        <li onclick="getOutstandingContributionProfit();">杰出贡献奖发放</li>
                    </ul>
                </div>
                <div class="bd">
                    <ul class="">
                        <%--存放符合发放日分红条件的所有用户ID--%>
                        <input type="hidden" class="dayUserId">
                        <%--存放日分红总额--%>
                        <input type="hidden" class="sumProfit">
                        <%--存放每个用户应得日分红金额--%>
                        <input type="hidden" class="userDayProfit">
                        <%--存放对应的上个月日期--%>
                        <input type="hidden" class="lastData">

                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th width="150">用户名</th>
                                    <th width="150">用户角色</th>
                                    <th width="150">手机</th>
                                    <th width="150">分红金额</th>
                                    <th width="150">对应日期</th>
                                    <th width="150">状态</th>
                                </tr>
                            </thead>
                            <tbody class="dayProfit">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>事业合伙人</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>10</td>--%>
                                    <%--<td>未分红</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                        <button type="button" class="pull-right btn btn-sm btn-primary dayConfirm" style="width:15%;margin-right: 46%;">
                            <em class="icon-key"></em>确认发放
                        </button>
                    </ul>
                    <ul class="">
                        <%--存放符合发放周分红条件的所有用户ID--%>
                        <input type="hidden" class="weekUserId">
                        <%--存放周分红总额--%>
                        <input type="hidden" class="sumWeekProfit">
                        <%--存放每个用户应得周分红金额--%>
                        <input type="hidden" class="userWeekProfit">
                        <%--存放对应的上个月开始日期--%>
                        <input type="hidden" class="weekRangeOne">
                        <%--存放对应的上个月结束日期--%>
                        <input type="hidden" class="weekRangeLast">

                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th width="150">用户名</th>
                                    <th width="150">用户角色</th>
                                    <th width="150">手机</th>
                                    <th width="150">分红金额</th>
                                    <th width="150">发放时间范围</th>
                                    <th width="150">状态</th>
                                </tr>
                            </thead>
                            <tbody class="weekProfit">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>事业合伙人</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>10</td>--%>
                                    <%--<td>未分红</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                        <button type="button" class="pull-right btn btn-sm btn-primary weekConfirm" style="width:15%;margin-right: 46%;">
                            <em class="icon-key"></em>确认发放
                        </button>
                    </ul>
                    <ul class="">
                        <%--存放符合发放月分红条件的所有用户ID--%>
                        <input type="hidden" class="monthUserId">
                        <%--存放月分红总额--%>
                        <input type="hidden" class="sumMonthProfit">
                        <%--存放每个用户应得月分红金额--%>
                        <input type="hidden" class="userMonthProfit">
                        <%--存放对应的上个月开始日期--%>
                        <input type="hidden" class="monthRangeOne">
                        <%--存放对应的上个月结束日期--%>
                        <input type="hidden" class="monthRangeLast">

                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th width="150">用户名</th>
                                    <th width="150">用户角色</th>
                                    <th width="150">手机</th>
                                    <th width="150">分红金额</th>
                                    <th width="150">发放时间范围</th>
                                    <th width="150">状态</th>
                                </tr>
                            </thead>
                            <tbody class="monthProfit">
                                <%--<tr>
                                    <td>李五</td>
                                    <td>事业合伙人</td>
                                    <td>16000000000</td>
                                    <td>10</td>
                                    <td>未分红</td>
                                </tr>--%>
                            </tbody>
                        </table>
                        <button type="button" class="pull-right btn btn-sm btn-primary monthConfirm" style="width:15%;margin-right: 46%;">
                            <em class="icon-key"></em>确认发放
                        </button>
                    </ul>
                    <ul class="">
                        <%--存放符合发放季度分红条件的所有用户ID--%>
                        <input type="hidden" class="quarterUserId">
                        <%--存放季度分红总额--%>
                        <input type="hidden" class="sumQuarterProfit">
                        <%--存放每个用户应得季度分红金额--%>
                        <input type="hidden" class="userQuarterProfit">
                        <%--存放对应的上个月开始日期--%>
                        <input type="hidden" class="quarterRangeOne">
                        <%--存放对应的上个月结束日期--%>
                        <input type="hidden" class="quarterRangeLast">

                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th width="150">用户名</th>
                                    <th width="150">用户角色</th>
                                    <th width="150">手机</th>
                                    <th width="150">分红金额</th>
                                    <th width="150">发放时间范围</th>
                                    <th width="150">状态</th>
                                </tr>
                            </thead>
                            <tbody class="quarterProfit">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>事业合伙人</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>10</td>--%>
                                    <%--<td>2008-7-23</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                        <button type="button" class="pull-right btn btn-sm btn-primary quarterConfirm" style="width:15%;margin-right: 46%;">
                            <em class="icon-key"></em>确认发放
                        </button>
                    </ul>
                    <ul class="">
                        <%--存放符合发放年分红条件的所有用户ID--%>
                        <input type="hidden" class="yearUserId">
                        <%--存放年分红总额--%>
                        <input type="hidden" class="sumYearProfit">
                        <%--存放每个用户应得年分红金额--%>
                        <input type="hidden" class="userYearProfit">
                        <%--存放对应的上个月开始日期--%>
                        <input type="hidden" class="yearRangeOne">
                        <%--存放对应的上个月结束日期--%>
                        <input type="hidden" class="yearRangeLast">
                        <table class="table table-striped table-bordered table-hover" id="year_participation_in_profit_table">
                            <thead>
                                <tr>
                                    <th width="150">用户名</th>
                                    <th width="150">用户角色</th>
                                    <th width="150">手机</th>
                                    <th width="150">分红金额</th>
                                    <th width="150">发放时间范围</th>
                                    <th width="150">状态</th>
                                </tr>
                            </thead>
                            <tbody class="yearProfit">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>事业合伙人</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>10</td>--%>
                                    <%--<td>2008-7-23</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                        <button type="button" class="pull-right btn btn-sm btn-primary yearConfirm" style="width:15%;margin-right: 46%;">
                            <em class="icon-key"></em>确认发放
                        </button>
                    </ul>
                    <ul class="">
                        <%--存放符合发放特殊奖条件的所有用户ID--%>
                        <input type="hidden" class="outstandingContributionUserId">
                        <%--存放特殊奖总额--%>
                        <input type="hidden" class="sumOutstandingContributionProfit">
                        <%--存放每个用户应得特殊奖金额--%>
                        <input type="hidden" class="userOutstandingContributionProfit">
                        <%--存放对应的上个月开始日期--%>
                        <input type="hidden" class="outstandingContributionRangeOne">
                        <%--存放对应的上个月结束日期--%>
                        <input type="hidden" class="outstandingContributionRangeLast">
                        <table class="table table-striped table-bordered table-hover" id="transfer_accounts-table">
                            <thead>
                                <tr>
                                    <th width="150">用户名</th>
                                    <th width="150">用户角色</th>
                                    <th width="150">手机</th>
                                    <th width="150">分红金额</th>
                                    <th width="150">发放时间范围</th>
                                    <th width="150">状态</th>
                                </tr>
                            </thead>
                            <tbody class="outstandingContributionProfit">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>事业合伙人</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>10</td>--%>
                                    <%--<td>未分红</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                        <button type="button" class="pull-right btn btn-sm btn-primary outstandingContributionConfirm" style="width:15%;margin-right: 46%;">
                            <em class="icon-key"></em>确认发放
                        </button>
                    </ul>
                </div>
            </div>
        </div>
        <script type="text/javascript">jQuery("#recording").slide({trigger: "click"});</script>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //获取日分红dayProfit
    dayProfit();
    function dayProfit(){
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getDayProfit',
            dataType : 'json',
            success : function (result) {
                if (result!=null){
                    var str = "";
                    if (result.code == 2000){
                        var userList = result.userList;
                        for (var i = 0; i <userList.length; i++ ){
                            str += "<tr>";
                            str += "<td>"+userList[i].userNick+"</td>";
                            if (userList[i].userRole == 1){
                                str += "<td>消费者</td>";
                            }
                            if (userList[i].userRole == 2){
                                str += "<td>事业合伙人</td>";
                            }
                            if (userList[i].userRole == 3){
                                str += "<td>高级合伙人</td>";
                            }
                            if (userList[i].userRole == 4){
                                str += "<td>创始合伙人</td>";
                            }
                            str += "<td>"+userList[i].userTel+"</td>";
                            str += "<td>"+result.userDayProfit+"</td>";
                            str += "<td>"+result.lastData+"</td>";
                            str += "<td>未分红</td>";
                            str += "</tr>";
                        }
                        $(".dayUserId").val(result.userId);
                        $(".sumProfit").val(result.sumProfit);
                        $(".userDayProfit").val(result.userDayProfit);
                        $(".lastData").val(result.lastData);
                    }
                    if (result.code == 1003){
                        str +="<tr><td colspan='5'>没有满足条件的用户</td></tr>";
                        $(".dayConfirm").css("display","none");
                    }
                    if (result.code == 1002){
                        str +="<tr><td colspan='5'>上月日期不规范，请求停止</td></tr>";
                        $(".dayConfirm").css("display","none");
                    }
                    if (result.code == 1001){
                        str +="<tr><td colspan='5'>今日已发放，请明日继续</td></tr>";
                        $(".dayConfirm").css("display","none");
                    }
                    if (result.code == 5000){
                        str +="<tr><td colspan='5'>获取符合日分红发放用户出错</td></tr>";
                        $(".dayConfirm").css("display","none");
                    }
                    $(".dayProfit").html(str);
                }
            },
            error : function () {
                layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    }
    $(function () {
        //日分红发放操作
        $(".dayConfirm").click(function () {
            $(".dayConfirm").attr("disabled",true);
            // alert("用户ID："+$(".dayUserId").val());
            // alert("日分红总额："+$(".sumProfit").val());
            // alert("每个用户日分红金额："+$(".userDayProfit").val());
            // alert("对应的上个月日期："+$(".lastData").val());
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/executeDayProfit',
                dataType : 'json',
                data : {
                    dayUserId : $(".dayUserId").val(),
                    sumProfit : $(".sumProfit").val(),
                    userDayProfit : $(".userDayProfit").val(),
                    lastData : $(".lastData").val()
                },
                success : function (result) {
                    if (result){
                        layer.msg('操作成功！', {icon: 1, offset: 't',time: 1000},function(){
                            window.location.reload();
                        });
                    }else{
                        layer.msg('发放失败，请稍后再试！', {icon: 7, offset: 't'});
                    }
                },
                error : function () {
                    layer.msg('执行发放日分红操作出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    });

    //获取周分红weekProfit
    function weekProfit(){
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getWeekProfit',
            dataType : 'json',
            success : function (result) {
                if (result!=null){
                    var str = "";
                    if (result.code == 2000){
                        var userList = result.userList;
                        for (var i = 0; i <userList.length; i++ ){
                            str += "<tr>";
                            str += "<td>"+userList[i].userNick+"</td>";
                            if (userList[i].userRole == 1){
                                str += "<td>消费者</td>";
                            }
                            if (userList[i].userRole == 2){
                                str += "<td>事业合伙人</td>";
                            }
                            if (userList[i].userRole == 3){
                                str += "<td>高级合伙人</td>";
                            }
                            if (userList[i].userRole == 4){
                                str += "<td>创始合伙人</td>";
                            }
                            str += "<td>"+userList[i].userTel+"</td>";
                            str += "<td>"+result.userWeekProfit+"</td>";
                            str += "<td>"+result.weekRangeOne+"~"+result.weekRangeLast+"</td>";
                            str += "<td>未分红</td>";
                            str += "</tr>";
                        }
                        $(".weekUserId").val(result.userId);
                        $(".sumWeekProfit").val(result.sumWeekProfit);
                        $(".userWeekProfit").val(result.userWeekProfit);
                        $(".weekRangeOne").val(result.weekRangeOne);
                        $(".weekRangeLast").val(result.weekRangeLast);
                    }
                    if (result.code == 1003){
                        str +="<tr><td colspan='6'>没有满足条件的用户</td></tr>";
                        $(".weekConfirm").css("display","none");
                    }
                    if (result.code == 1002){
                        str +="<tr><td colspan='6'>不到发放日</td></tr>";
                        $(".weekConfirm").css("display","none");
                    }
                    if (result.code == 1001){
                        str +="<tr><td colspan='6'>周分红发放，请下一发放日继续</td></tr>";
                        $(".weekConfirm").css("display","none");
                    }
                    if (result.code == 5000){
                        str +="<tr><td colspan='6'>获取符合周分红发放用户出错</td></tr>";
                        $(".weekConfirm").css("display","none");
                    }
                    $(".weekProfit").html(str);
                }
            },
            error : function () {
                layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    }
    $(function () {
        //周分红发放操作
        $(".weekConfirm").click(function () {
            $(".weekConfirm").attr("disabled",true);
            // alert("用户ID："+$(".weekUserId").val());
            // alert("周分红总额："+$(".sumWeekProfit").val());
            // alert("每个用户周分红金额："+$(".userWeekProfit").val());
            // alert("对应的上个月开始日期："+$(".weekRangeOne").val());
            // alert("对应的上个月结束日期："+$(".weekRangeLast").val());
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/executeWeekProfit',
                dataType : 'json',
                data : {
                    weekUserId : $(".weekUserId").val(),
                    sumWeekProfit : $(".sumWeekProfit").val(),
                    userWeekProfit : $(".userWeekProfit").val(),
                    weekRangeOne : $(".weekRangeOne").val(),
                    weekRangeLast : $(".weekRangeLast").val()
                },
                success : function (result) {
                    if (result){
                        layer.msg('操作成功！', {icon: 1, offset: 't',time: 1000},function(){
                            window.location.reload();
                        });
                    }else{
                        layer.msg('发放失败，请稍后再试！', {icon: 7, offset: 't'});
                    }
                },
                error : function () {
                    layer.msg('执行发放周分红操作出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    });

    //获取月分红
    function getMonthProfit(){
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getMonthProfit',
            dataType : 'json',
            success : function (result) {
                if (result!=null){
                    var str = "";
                    if (result.code == 2000){
                        var userList = result.userList;
                        for (var i = 0; i <userList.length; i++ ){
                            str += "<tr>";
                            str += "<td>"+userList[i].userNick+"</td>";
                            if (userList[i].userRole == 1){
                                str += "<td>消费者</td>";
                            }
                            if (userList[i].userRole == 2){
                                str += "<td>事业合伙人</td>";
                            }
                            if (userList[i].userRole == 3){
                                str += "<td>高级合伙人</td>";
                            }
                            if (userList[i].userRole == 4){
                                str += "<td>创始合伙人</td>";
                            }
                            str += "<td>"+userList[i].userTel+"</td>";
                            str += "<td>"+result.userMonthProfit+"</td>";
                            str += "<td>"+result.monthRangeOne+"~"+result.monthRangeLast+"</td>";
                            str += "<td>未分红</td>";
                            str += "</tr>";
                        }
                        $(".monthUserId").val(result.userId);
                        $(".sumMonthProfit").val(result.sumMonthProfit);
                        $(".userMonthProfit").val(result.userMonthProfit);
                        $(".monthRangeOne").val(result.monthRangeOne);
                        $(".monthRangeLast").val(result.monthRangeLast);
                    }
                    if (result.code == 1003){
                        str +="<tr><td colspan='6'>没有满足条件的用户</td></tr>";
                        $(".monthConfirm").css("display","none");
                    }
                    if (result.code == 1002){
                        str +="<tr><td colspan='6'>不到发放日</td></tr>";
                        $(".monthConfirm").css("display","none");
                    }
                    if (result.code == 1001){
                        str +="<tr><td colspan='6'>月分红发放，请下一发放日继续</td></tr>";
                        $(".monthConfirm").css("display","none");
                    }
                    if (result.code == 5000){
                        str +="<tr><td colspan='6'>获取符合月分红发放用户出错</td></tr>";
                        $(".monthConfirm").css("display","none");
                    }
                    $(".monthProfit").html(str);
                }
            },
            error : function () {
                layer.msg('获取月分红出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    }
    $(function () {
        //月分红发放操作
        $(".monthConfirm").click(function () {
            $(".monthConfirm").attr("disabled",true);
            // alert("用户ID："+$(".monthUserId").val());
            // alert("周分红总额："+$(".sumMonthProfit").val());
            // alert("每个用户周分红金额："+$(".userMonthProfit").val());
            // alert("对应的上个月开始日期："+$(".monthRangeOne").val());
            // alert("对应的上个月结束日期："+$(".monthRangeLast").val());
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/executeMonthProfit',
                dataType : 'json',
                data : {
                    monthUserId : $(".monthUserId").val(),
                    sumMonthProfit : $(".sumMonthProfit").val(),
                    userMonthProfit : $(".userMonthProfit").val(),
                    monthRangeOne : $(".monthRangeOne").val(),
                    monthRangeLast : $(".monthRangeLast").val()
                },
                success : function (result) {
                    if (result){
                        layer.msg('操作成功！', {icon: 1, offset: 't',time: 1000},function(){
                            window.location.reload();
                        });
                    }else{
                        layer.msg('发放失败，请稍后再试！', {icon: 7, offset: 't'});
                    }
                },
                error : function () {
                    layer.msg('执行发放月分红操作出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    });

    //获取季度分红
    function getQuarterProfit(){
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getQuarterProfit',
            dataType : 'json',
            success : function (result) {
                if (result!=null){
                    var str = "";
                    if (result.code == 2000){
                        var userList = result.userList;
                        for (var i = 0; i <userList.length; i++ ){
                            str += "<tr>";
                            str += "<td>"+userList[i].userNick+"</td>";
                            if (userList[i].userRole == 1){
                                str += "<td>消费者</td>";
                            }
                            if (userList[i].userRole == 2){
                                str += "<td>事业合伙人</td>";
                            }
                            if (userList[i].userRole == 3){
                                str += "<td>高级合伙人</td>";
                            }
                            if (userList[i].userRole == 4){
                                str += "<td>创始合伙人</td>";
                            }
                            str += "<td>"+userList[i].userTel+"</td>";
                            str += "<td>"+result.userQuarterProfit+"</td>";
                            str += "<td>"+result.quarterRangeOne+"~"+result.quarterRangeLast+"</td>";
                            str += "<td>未分红</td>";
                            str += "</tr>";
                        }
                        $(".quarterUserId").val(result.userId);
                        $(".sumQuarterProfit").val(result.sumQuarterProfit);
                        $(".userQuarterProfit").val(result.userQuarterProfit);
                        $(".quarterRangeOne").val(result.quarterRangeOne);
                        $(".quarterRangeLast").val(result.quarterRangeLast);
                    }
                    if (result.code == 1003){
                        str +="<tr><td colspan='6'>没有满足条件的用户</td></tr>";
                        $(".quarterConfirm").css("display","none");
                    }
                    if (result.code == 1002){
                        str +="<tr><td colspan='6'>不到发放日</td></tr>";
                        $(".quarterConfirm").css("display","none");
                    }
                    if (result.code == 1001){
                        str +="<tr><td colspan='6'>季度分红发放，请下一发放日继续</td></tr>";
                        $(".quarterConfirm").css("display","none");
                    }
                    if (result.code == 5000){
                        str +="<tr><td colspan='6'>获取符合季度分红发放用户出错</td></tr>";
                        $(".quarterConfirm").css("display","none");
                    }
                    $(".quarterProfit").html(str);
                }
            },
            error : function () {
                layer.msg('获取季度分红出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    }
    $(function () {
        //季度分红发放操作
        $(".quarterConfirm").click(function () {
            $(".quarterConfirm").attr("disabled",true);
            // alert("用户ID："+$(".quarterUserId").val());
            // alert("季度分红总额："+$(".sumQuarterProfit").val());
            // alert("每个用户季度分红金额："+$(".userQuarterProfit").val());
            // alert("对应的上个月开始日期："+$(".quarterRangeOne").val());
            // alert("对应的上个月结束日期："+$(".quarterRangeLast").val());
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/executeQuarterProfit',
                dataType : 'json',
                data : {
                    quarterUserId : $(".quarterUserId").val(),
                    sumQuarterProfit : $(".sumQuarterProfit").val(),
                    userQuarterProfit : $(".userQuarterProfit").val(),
                    quarterRangeOne : $(".quarterRangeOne").val(),
                    quarterRangeLast : $(".quarterRangeLast").val()
                },
                success : function (result) {
                    if (result){
                        layer.msg('操作成功！', {icon: 1, offset: 't',time: 1000},function(){
                            window.location.reload();
                        });
                    }else{
                        layer.msg('发放失败，请稍后再试！', {icon: 7, offset: 't'});
                    }
                },
                error : function () {
                    layer.msg('执行发放季度分红操作出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    });

    //获取年分红
    function getYearProfit(){
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getYearProfit',
            dataType : 'json',
            success : function (result) {
                if (result!=null){
                    var str = "";
                    if (result.code == 2000){
                        var userList = result.userList;
                        for (var i = 0; i <userList.length; i++ ){
                            str += "<tr>";
                            str += "<td>"+userList[i].userNick+"/"+userList[i].id+"</td>";
                            if (userList[i].userRole == 1){
                                str += "<td>消费者</td>";
                            }
                            if (userList[i].userRole == 2){
                                str += "<td>事业合伙人</td>";
                            }
                            if (userList[i].userRole == 3){
                                str += "<td>高级合伙人</td>";
                            }
                            if (userList[i].userRole == 4){
                                str += "<td>创始合伙人</td>";
                            }
                            str += "<td>"+userList[i].userTel+"</td>";
                            str += "<td>"+result.userYearProfit+"</td>";
                            str += "<td>"+result.yearRangeOne+"~"+result.yearRangeLast+"</td>";
                            str += "<td>未分红</td>";
                            str += "</tr>";
                        }
                        $(".yearUserId").val(result.userId);
                        $(".sumYearProfit").val(result.sumYearProfit);
                        $(".userYearProfit").val(result.userYearProfit);
                        $(".yearRangeOne").val(result.yearRangeOne);
                        $(".yearRangeLast").val(result.yearRangeLast);
                    }
                    if (result.code == 1003){
                        str +="<tr><td colspan='6'>没有满足条件的用户</td></tr>";
                        $(".yearConfirm").css("display","none");
                    }
                    if (result.code == 1002){
                        str +="<tr><td colspan='6'>不到发放日</td></tr>";
                        $(".yearConfirm").css("display","none");
                    }
                    if (result.code == 1001){
                        str +="<tr><td colspan='6'>年分红发放，请下一发放日继续</td></tr>";
                        $(".yearConfirm").css("display","none");
                    }
                    if (result.code == 5000){
                        str +="<tr><td colspan='6'>获取符合年分红发放用户出错</td></tr>";
                        $(".yearConfirm").css("display","none");
                    }
                    $(".yearProfit").html(str);
                }
            },
            error : function () {
                layer.msg('获取年分红出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    }
    $(function () {
        //年分红发放操作
        $(".yearConfirm").click(function () {
            $(".yearConfirm").attr("disabled",true);
            // alert("用户ID："+$(".yearUserId").val());
            // alert("年分红总额："+$(".sumYearProfit").val());
            // alert("每个用户年分红金额："+$(".userYearProfit").val());
            // alert("对应的上个月开始日期："+$(".yearRangeOne").val());
            // alert("对应的上个月结束日期："+$(".yearRangeLast").val());
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/executeYearProfit',
                dataType : 'json',
                data : {
                    yearUserId : $(".yearUserId").val(),
                    sumYearProfit : $(".sumYearProfit").val(),
                    userYearProfit : $(".userYearProfit").val(),
                    yearRangeOne : $(".yearRangeOne").val(),
                    yearRangeLast : $(".yearRangeLast").val()
                },
                success : function (result) {
                    if (result){
                        layer.msg('操作成功！', {icon: 1, offset: 't',time: 1000},function(){
                            window.location.reload();
                        });
                    }else{
                        layer.msg('发放失败，请稍后再试！', {icon: 7, offset: 't'});
                    }
                },
                error : function () {
                    layer.msg('执行发放年分红操作出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    });

    //获取杰出贡献奖
    function getOutstandingContributionProfit(){
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getOutstandingContributionProfit',
            dataType : 'json',
            success : function (result) {
                if (result!=null){
                    var str = "";
                    if (result.code == 2000){
                        var userList = result.userList;
                        for (var i = 0; i <userList.length; i++ ){
                            str += "<tr>";
                            str += "<td>"+userList[i].userNick+"/"+userList[i].id+"</td>";
                            if (userList[i].userRole == 1){
                                str += "<td>消费者</td>";
                            }
                            if (userList[i].userRole == 2){
                                str += "<td>事业合伙人</td>";
                            }
                            if (userList[i].userRole == 3){
                                str += "<td>高级合伙人</td>";
                            }
                            if (userList[i].userRole == 4){
                                str += "<td>创始合伙人</td>";
                            }
                            str += "<td>"+userList[i].userTel+"</td>";
                            str += "<td>"+result.userOutstandingContributionProfit+"</td>";
                            str += "<td>"+result.outstandingContributionRangeOne+"~"+result.outstandingContributionRangeLast+"</td>";
                            str += "<td>未分红</td>";
                            str += "</tr>";
                        }
                        $(".outstandingContributionUserId").val(result.userId);
                        $(".sumOutstandingContributionProfit").val(result.sumOutstandingContributionProfit);
                        $(".userOutstandingContributionProfit").val(result.userOutstandingContributionProfit);
                        $(".outstandingContributionRangeOne").val(result.outstandingContributionRangeOne);
                        $(".outstandingContributionRangeLast").val(result.outstandingContributionRangeLast);
                    }
                    if (result.code == 1003){
                        str +="<tr><td colspan='6'>没有满足条件的用户</td></tr>";
                        $(".outstandingContributionConfirm").css("display","none");
                    }
                    if (result.code == 1002){
                        str +="<tr><td colspan='6'>不到发放日</td></tr>";
                        $(".outstandingContributionConfirm").css("display","none");
                    }
                    if (result.code == 1001){
                        str +="<tr><td colspan='6'>杰出贡献奖发放，请下一发放日继续</td></tr>";
                        $(".outstandingContributionConfirm").css("display","none");
                    }
                    if (result.code == 5000){
                        str +="<tr><td colspan='6'>获取符合杰出贡献奖发放用户出错</td></tr>";
                        $(".outstandingContributionConfirm").css("display","none");
                    }
                    $(".outstandingContributionProfit").html(str);
                }
            },
            error : function () {
                layer.msg('获取杰出贡献奖出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    }
    $(function () {
        <%--//杰出贡献奖发放操作--%>
        $(".outstandingContributionConfirm").click(function () {
            $(".outstandingContributionConfirm").attr("disabled",true);
            // alert("用户ID："+$(".outstandingContributionUserId").val());
            // alert("年分红总额："+$(".sumOutstandingContributionProfit").val());
            // alert("每个用户年分红金额："+$(".userOutstandingContributionProfit").val());
            // alert("对应的上个月开始日期："+$(".outstandingContributionRangeOne").val());
            // alert("对应的上个月结束日期："+$(".outstandingContributionRangeLast").val());
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/executeOutstandingContributionProfit',
                dataType : 'json',
                data : {
                    outstandingContributionUserId : $(".outstandingContributionUserId").val(),
                    sumOutstandingContributionProfit : $(".sumOutstandingContributionProfit").val(),
                    userOutstandingContributionProfit : $(".userOutstandingContributionProfit").val(),
                    outstandingContributionRangeOne : $(".outstandingContributionRangeOne").val(),
                    outstandingContributionRangeLast : $(".outstandingContributionRangeLast").val()
                },
                success : function (result) {
                    if (result){
                        layer.msg('操作成功！', {icon: 1, offset: 't',time: 1000},function(){
                            window.location.reload();
                        });
                    }else{
                        layer.msg('发放失败，请稍后再试！', {icon: 7, offset: 't'});
                    }
                },
                error : function () {
                    layer.msg('执行发放杰出贡献奖操作出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    });

    jQuery(function ($) {
        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox').each(function () {
                this.checked = that.checked;
                $(this).closest('tr').toggleClass('selected');
            });
        });
    });
</script>