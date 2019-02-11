<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8" content=""/>
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="${pageContext.request.contextPath}/static/admin/images/log.png" />
    <link href="<%=basePath%>static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/css/style.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="<%=basePath%>static/admin/assets/js/ace-extra.min.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="<%=basePath%>static/admin/assets/js/html5shiv.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/assets/js/respond.min.js" type="text/javascript"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="<%=basePath%>static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <!-- <![endif]-->
    <!--[if IE]>
    <script type="text/javascript">window.jQuery || document.write("<script src='<%=basePath%>static/assets/js/jquery-1.10.2.min.js'>" + "<" + "script>");</script>
    <![endif]-->
    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='<%=basePath%>static/admin/assets/js/jquery.mobile.custom.min.js'>" + "<" + "script>");
    </script>
    <script src="<%=basePath%>static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <!--[if lte IE 8]>
    <script src="<%=basePath%>static/admin/assets/js/excanvas.min.js" type="text/javascript"></script>
    <![endif]-->
    <script src="<%=basePath%>static/admin/assets/js/ace-elements.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/assets/js/ace.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var cid = $('#nav_list> li>.submenu');
            cid.each(function (i) {
                $(this).attr('id', "Sort_link_" + i);
            })
        })
        $(document).ready(function () {
            $.each($(".submenu"), function () {
                var $aobjs = $(this).children("li");
                var rowCount = $aobjs.size();
                var divHeigth = $(this).height();
                $aobjs.height(divHeigth / rowCount);
            });
            //初始化宽度、高度
            $("#main-container").height($(window).height() - 76);
            $("#iframe").height($(window).height() - 140);
            $(".sidebar").height($(window).height() - 99);
            var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
            $(".submenu").height();
            $("#nav_list").children(".submenu").css("height", thisHeight);
            //当文档窗口发生改变时 触发
            $(window).resize(function () {
                $("#main-container").height($(window).height() - 76);
                $("#iframe").height($(window).height() - 140);
                $(".sidebar").height($(window).height() - 99);
                var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
                $(".submenu").height();
                $("#nav_list").children(".submenu").css("height", thisHeight);
            });
            $(document).on('click', '.iframeurl', function () {
                var cid = $(this).attr("name");
                var cname = $(this).attr("title");
                $("#iframe").attr("src", cid).ready();
                $("#Bcrumbs").attr("href", cid).ready();
                $(".Current_page a").attr('href', cid).ready();
                $(".Current_page").attr('name', cid);
                $(".Current_page").html(cname).css({"color": "#333333", "cursor": "default"}).ready();
                $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
                $("#parentIfour").html('').css("display", "none").ready();
                // layer.load(2);
            });
        });
        /******/
        $(document).on('click', '.link_cz > li', function () {
            $('.link_cz > li').removeClass('active');
            $(this).addClass('active');

        });
        /*********************点击事件*********************/
        $(document).ready(function () {
            $('#nav_list,.link_cz').find('li.home').on('click', function () {
                $('#nav_list,.link_cz').find('li.home').removeClass('active');
                $(this).addClass('active');
            });
        });

    </script>
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>
    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'fixed')
                } catch (e) {
                }
            </script>
            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>
                    <span class="btn btn-info"></span>
                    <span class="btn btn-warning"></span>
                    <span class="btn btn-danger"></span>
                </div>
            </div>
            <div id="menu_style" class="menu_style">
                <ul class="nav nav-list" id="nav_list">
                    <li class="home">
                        <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/index_home" class="iframeurl" title="">
                            <em class="icon-home"></em><span class="menu-text"> 系统首页 </span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle">
                            <em class="icon-user"></em>
                            <span class="menu-text"> 合伙人管理 </span>
                            <strong class="arrow icon-angle-down"></strong>
                        </a>
                        <ul class="submenu">
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/getAllUserList" title="合伙人列表" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>合伙人列表
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_member_grading" title="合伙人角色管理" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>合伙人角色管理
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_integration" title="分销商管理" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>分销商管理
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle"><em class="icon-laptop"></em>
                            <span class="menu-text"> 商铺管理 </span><strong class="arrow icon-angle-down"></strong>
                        </a>
                        <ul class="submenu">
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath }/store/getstore" title="店铺列表" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>商铺列表
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath }/store/getstoreauditlist" title="店铺审核" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>商铺审核
                                    <!--<span class="badge badge-danger">5</span>-->
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/store/getstorerejectlist" title="驳回列表" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>驳回列表
                                    <!--<span class="badge badge-danger">5</span>-->
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle">
                            <i class="icon-desktop"></i><span class="menu-text"> 产品管理 </span>
                            <strong class="arrow icon-angle-down"></strong>
                        </a>
                        <ul class="submenu">
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath }/goods/getgoodsall" title="产品列表" class="iframeurl">
                                    <i class="icon-double-angle-right"></i>产品列表
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath }/goods/goodsapplyforlist" title="产品申请" class="iframeurl">
                                    <i class="icon-double-angle-right"></i>产品申请
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath }/goods/getgoodsreject" title="驳回产品" class="iframeurl">
                                    <i class="icon-double-angle-right"></i>驳回产品
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath }/brand/getbrandall" title="品牌管理" class="iframeurl">
                                    <i class="icon-double-angle-right"></i>品牌管理
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath }/classify/getClassifyListByLevelOne" title="分类管理" class="iframeurl">
                                    <i class="icon-double-angle-right"></i>分类管理
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle">
                            <em class="icon-list"></em><span class="menu-text"> 交易管理 </span>
                            <strong class="arrow icon-angle-down"></strong>
                        </a>
                        <ul class="submenu">
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_transaction" title="交易信息" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>交易信息
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_orderform" title="订单管理" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>订单管理
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_amounts" title="交易金额" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>交易金额
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_refund" title="退款管理" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>退款管理
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle">
                            <em class="icon-picture "></em>
                            <span class="menu-text"> 广告管理 </span><strong class="arrow icon-angle-down"></strong>
                        </a>
                        <ul class="submenu">
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath }/admin/getAllAdvertise" title="广告管理" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>广告管理
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle">
                            <em class="icon-credit-card"></em><span class="menu-text"> 支付管理 </span>
                            <strong class="arrow icon-angle-down"></strong>
                        </a>
                        <ul class="submenu">
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_payment_method" title="支付方式" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>支付方式
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle">
                            <em class="icon-user"></em>
                            <span class="menu-text"> 财务管理 </span>
                            <b class="arrow icon-angle-down"></b>
                        </a>
                        <ul class="submenu">
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_withdrawal_application" title="提现申请" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>分红提现申请
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_profits_withdrawal" title="提现申请" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>分润提现申请
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_account_details" title="提现/消费/转账记录" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>分红/分润提现/转账记录
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_integral_log" title="积分记录" class="iframeurl">
                                    <i class="icon-double-angle-right"></i>积分记录
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_participation_in_profit" title="分红" class="iframeurl">
                                    <i class="icon-double-angle-right"></i>分红发放
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_participation_in_profit_logs" title="分红记录" class="iframeurl">
                                    <i class="icon-double-angle-right"></i>分红记录
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle">
                            <em class="icon-comments-alt"></em><span class="menu-text"> 消息管理 </span>
                            <b class="arrow icon-angle-down"></b>
                        </a>
                        <ul class="submenu">
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath }/admin/go_reports" title="举报管理" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>举报管理
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle">
                            <em class="icon-bookmark"></em> <span class="menu-text"> 文章管理 </span>
                            <b class="arrow icon-angle-down"></b>
                        </a>
                        <ul class="submenu">
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/getAllArticles" title="文章列表" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>文章列表
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle">
                            <em class="icon-cogs"></em><span class="menu-text"> 系统管理 </span>
                            <strong class="arrow icon-angle-down"></strong>
                        </a>
                        <ul class="submenu">
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_systems" title="系统设置" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>系统设置
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle"><em class="icon-group"></em>
                            <span class="menu-text"> 管理员管理 </span>
                            <strong class="arrow icon-angle-down"></strong>
                        </a>
                        <ul class="submenu">
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/role/getroleallreturnmenu" title="权限管理" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>权限配置
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/getadminall" title="管理员列表" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>管理员列表
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/role/getroleall" title="角色管理" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>角色管理
                                </a>
                            </li>
                            <li class="home">
                                <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_admin_info" title="个人信息" class="iframeurl">
                                    <em class="icon-double-angle-right"></em>个人信息
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <script type="text/javascript">
                $("#menu_style").niceScroll({
                    cursorcolor: "#888888",
                    cursoropacitymax: 1,
                    touchbehavior: false,
                    cursorwidth: "5px",
                    cursorborder: "0",
                    cursorborderradius: "5px"
                });
            </script>
            <div class="sidebar-collapse" id="sidebar-collapse">
                <em class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                    data-icon2="icon-double-angle-right"></em>
            </div>
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'collapsed')
                } catch (e) {
                }
            </script>
        </div>
        <div class="main-content">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <em class="icon-home home-icon"></em>
                        <a href="${pageContext.request.contextPath}/admin/index">首页</a>
                    </li>
                    <li class="active"><span class="Current_page iframeurl"></span></li>
                    <li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span></li>
                    <li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
                </ul>
            </div>
            <iframe id="iframe" style="border:0; width:100%; background-color:#FFF;" name="iframe" frameborder="0" src="${pageContext.request.contextPath}/admin/index_home"></iframe>
        </div>
        <jsp:include page="../common/setting.jsp"></jsp:include>
    </div>
</div>
</body>
</html>

