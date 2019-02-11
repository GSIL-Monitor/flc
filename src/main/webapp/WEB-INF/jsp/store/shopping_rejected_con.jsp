<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>交易金额</title>
    <style>
        .company ul li{width:33%;float:left;}
        .companys ul li{width:20%;float:left;margin:10px 0;}
        .shop_reason{ padding:15px;}
        .shop_reason .content{ border:1px solid #dddddd; margin-bottom:15px; padding:10px; display:block}
        .shop_reason .form-control{ width:568px; height:200px; resize:none; margin-left:0px}
        .companys li img{width: 120px;height: 100px;}
    </style>
</head>

<body>
<c:if test="${msg!=null}">
    <h3 style="color:red">${msg}</h3>
</c:if>
<div class="margin clearfix">
    <div class="detailed_style clearfix">
        <em class="type"></em>
        <div class="shop_logo">
            <img src="${store.storeLogo}" width="165px" height="100px"/>
        </div>
        <ul class="shop_content clearfix">
            <li class="shop_name"><label class="label_name">商铺名称：</label><span class="info">${store.storeName}</span>
                <%--<div class="Authenticate"><i class="icon-yxrz"></i><i class="icon-yhk"></i><i class="icon-sjrz"></i><i--%>
                        <%--class="icon-grxx"></i></div>--%>
            </li>
            <li><label class="label_name">商铺分类：</label><span class="info">${store.storeClassify}</span></li>
            <li><label class="label_name">商铺联系人：</label><span class="info">${store.storeContactPeople}</span></li>
            <li><label class="label_name">联系人电话：</label><span class="info">${store.storeContactPeopleTel}</span></li>
            <li><label class="label_name">客服QQ：</label><span class="info">${store.serverQq}</span></li>
            <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;态：</label>
                <c:if test="${store.storeStatus==4}">
                    <span class="info">被驳回</span>
                </c:if>
            </li>
        </ul>
    </div>
    <div class="Store_Introduction">
        <div class="title_name">驳回原因</div>
        <div class="info">
            ${store.rejectReason}
        </div>
    </div>

    <div class="Store_Introduction">
        <div class="title_name">店铺介绍</div>
        <div class="info">
            ${store.storeIntroduce}
        </div>
    </div>
    <div class="Store_Introduction">
        <div class="title_name ">公司信息认证</div>
        <div class="info company">
            <ul class="shop_content clearfix">
                <li><label class="label_name">公司名称：</label><span class="info">${store.company}</span></li>
                <li><label class="label_name">注册资本：</label><span class="info">${store.registeredCapital}</span></li>
                <li><label class="label_name">注册号：</label><span class="info">${store.registeredNumber}</span></li>
                <li><label class="label_name">统一社会信用代码：</label><span class="info">${store.socialCreditCode}</span></li>
                <li><label class="label_name">成立日期：</label><span class="info">${store.companyEstablishmentDate}</span></li>
                <li><label class="label_name">注册地址：</label><span class="info">${store.companyRegisteredAddress}</span></li>
                <li><label class="label_name">经营范围：</label><span class="info">${store.businessScope}</span></li>
                <li><label class="label_name">法人代表姓名：</label><span class="info">${store.legalPersonName}</span></li>
                <li><label class="label_name">银行账号：</label><span class="info">${store.cardCount}</span></li>
                <li><label class="label_name">银行开户行：</label><span class="info">${store.cardName}</span></li>
                <li><label class="label_name">开户行地址：</label><span class="info">${store.cardOpenAccountAddress}</span></li>
                <li><label class="label_name">公司常住地址：</label><span class="info">${store.companyPermanentAddress}</span></li>
                <li><label class="label_name">商标注册名称：</label><span class="info">${store.tradeMarkName}</span></li>
                <li><label class="label_name">商标注册人：</label><span class="info">${store.tradeMarkRegistPeople}</span></li>
                <li><label class="label_name">生产许可证标号：</label><span class="info">${store.productionLicenseNumber}</span></li>
                <li><label class="label_name">生产许可证有效期：</label><span class="info">${store.productionLicenseValidDate}</span></li>
                <li><label class="label_name">经营许可证编号：</label><span class="info">${store.businessLicenseNumber}</span></li>
                <li><label class="label_name">经营许可证有效期：</label><span class="info">${store.businessLicenseValidDate}</span></li>
                <li><label class="label_name">实际运营人：</label><span class="info">${store.actualOperatorName}</span></li>
                <li><label class="label_name">QQ号码：</label><span class="info">${store.actualOperatorQq}</span></li>
                <li><label class="label_name">微信：</label><span class="info">${store.actualOperatorWeixin}</span></li>
                <li><label class="label_name">联系电话：</label><span class="info">${store.actualOperatorTel}</span></li>
                <li><label class="label_name">邮箱：</label><span class="info">${store.actualOperatorEmail}</span></li>
                <li><label class="label_name">总负责人姓名：</label><span class="info">${store.generalLeaderName}</span></li>
                <li><label class="label_name">手机号：</label><span class="info">${store.generalLeaderTel}</span></li>
                <li><label class="label_name">微信号：</label><span class="info">${store.generalLeaderWeixin}</span></li>
                <li><label class="label_name">推荐人姓名：</label><span class="info">${store.referrerName}</span></li>
                <li><label class="label_name">推荐人级别：</label><span class="info">${store.referrerLevel}</span></li>
                <li><label class="label_name">推荐人ID：</label><span class="info">${store.referrerId}</span></li>
                <li><label class="label_name">推荐人电话：</label><span class="info">${store.referrerTel}</span></li>
                <li><label class="label_name">客服人数：</label><span class="info">${store.serviceAmount}</span></li>
                <li><label class="label_name">工作时间：</label><span class="info">${store.workTime}</span></li>
            </ul>
        </div>
    </div>
    <div class="Store_Introduction">
        <div class="title_name ">公司图片认证</div>
        <div class="info companys">
            <ul class="shop_content clearfix">
                <li>
                    <p class="label_name">营业执照：</p>
                    <img src="${store.businessLicensePhotograph}" class="pimg"/>
                </li>
                <li>
                    <p class="label_name">开户许可证：</p>
                    <img src="${store.cardOpenAccountPhoto}" class="pimg"/>
                </li>
                <li>
                    <p class="label_name">法人身份证正面照：</p>
                    <img src="${store.legalPersonCodeFrontPhoto}" class="pimg"/>
                </li>
                <li>
                    <p class="label_name">法人身份证反面照：</p>
                    <img src="${store.legalPersonCodeReversePhoto}" class="pimg"/>
                </li>
                <li>
                    <p class="label_name">一般纳税人资格证：</p>
                    <img src="${store.generalTaxpayerPhoto}" class="pimg"/>
                </li>
                <li>
                    <p class="label_name">商标注册证：</p>
                    <img src="${store.tradeMarkRegistPhoto}" class="pimg"/>
                </li>
                <li>
                    <p class="label_name">商标授权书：</p>
                    <img src="${store.tradeMarkAuthorizationPhoto}" class="pimg"/>
                </li>
                <li>
                    <p class="label_name">生产许可证：</p>
                    <img src="${store.productionLicensePhoto}" class="pimg"/>
                </li>
                <li>
                    <p class="label_name">经营许可证：</p>
                    <img src="${store.businessLicensePhoto}" class="pimg"/>
                </li>
                <li>
                    <p class="label_name">产品检测报告：</p>
                    <img src="${store.productTestReportPhoto}" class="pimg"/>
                </li>
            </ul>
        </div>
    </div>
    <%--放大图片弹层--%>
    <div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
        <div id="innerdiv" style="position: absolute;top: 30% !important;left: 30% !important;">
            <img src="" alt="" id="bigimg" style="border:5px solid #fff;">
        </div>
    </div>
    <div class="At_button">
        <button onclick="return_close();" class="btn btn-default radius" type="button">返回上一步</button>
    </div>
</div>
</body>
</html>
<script type="text/javascript">



    //返回操作
    function return_close() {
        window.history.back(-1);
        parent.$('#parentIframe').css("display", "none");
        parent.$('.Current_page').css({"color": "#333333"});
    }


    /*字数限制*/
    function checkLength(which) {
        var maxChars = 500; //
        if (which.value.length > maxChars) {
            layer.open({
                icon: 2,
                title: '提示框',
                content: '您输入的字数超过限制!',
            });
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0, maxChars);
            return false;
        } else {
            var curr = maxChars - which.value.length; //减去当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    }
</script>

<%--点击放大图片--%>
<script>
    $(function(){
        $(".pimg").click(function(){
            var _this = $(this);//将当前的pimg元素作为_this传入函数
            imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
        });
    });
    function imgShow(outerdiv, innerdiv, bigimg, _this){
        var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
        $(bigimg).attr("src", src);//设置#bigimg元素的src属性
        /*获取当前点击图片的真实大小，并显示弹出层及大图*/
        $("<img/>").attr("src", src).load(function(){
            var windowW = $(window).width();//获取当前窗口宽度
            var windowH = $(window).height();//获取当前窗口高度
            var realWidth = this.width;//获取图片真实宽度
            var realHeight = this.height;//获取图片真实高度
            var imgWidth, imgHeight;
            var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放
            if(realHeight>windowH*scale) {//判断图片高度
                imgHeight = windowH*scale;//如大于窗口高度，图片高度进行缩放
                imgWidth = imgHeight/realHeight*realWidth;//等比例缩放宽度
                if(imgWidth>windowW*scale) {//如宽度扔大于窗口宽度
                    imgWidth = windowW*scale;//再对宽度进行缩放
                }
            } else if(realWidth>windowW*scale) {//如图片高度合适，判断图片宽度
                imgWidth = windowW*scale;//如大于窗口宽度，图片宽度进行缩放
                imgHeight = imgWidth/realWidth*realHeight;//等比例缩放高度
            } else {//如果图片真实高度和宽度都符合要求，高宽不变
                imgWidth = realWidth;
                imgHeight = realHeight;
            }
            $(bigimg).css("width",imgWidth);//以最终的宽度对图片缩放
            var w = (windowW-imgWidth)/2;//计算图片与窗口左边距
            var h = (windowH-imgHeight)/2;//计算图片与窗口上边距
            //图片居于屏幕中间
            var lf =  (windowW - realWidth)/2;
            var rh =  (windowH - realHeight)/2;
            $(innerdiv).css("position","absolute").css("top",rh).css("left",lf);//设置#innerdiv的top和left属性
            $(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg
        });
        $(outerdiv).click(function(){//再次点击淡出消失弹出层
            $(this).fadeOut("fast");
        });
    }
</script>
