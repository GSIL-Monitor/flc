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
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/laydate/laydate.js"
            type="text/javascript"></script>
    <title>产品管理--产品申请--产品详情</title>
</head>

<body>
<div class="margin clearfix">
    <div class="detailed_style clearfix">
        <ul class="shop_content clearfix" style="padding-left: 0;">
            <li class="shop_name">
                <label class="label_name">产品名称：</label>
                <span class="info">${goodsVo.goodsName}</span></li>
            <li>
                <label class="label_name">商品供货价：</label>
                <span class="info">${goodsVo.goodsSupplyPrice}</span></li>
            <li>
                <label class="label_name">商品零售价：</label>
                <span class="info">${goodsVo.goodsRetailPrice}</span></li>
            <li>
                <label class="label_name">商品分类：</label>
                <span class="info">${goodsVo.oneClassifyName} / ${goodsVo.twoClassifyName} / ${goodsVo.threeClassifyName}</span>
            </li>
            <li>
                <label class="label_name">商品重量：</label>
                <span class="info">${goodsVo.goodsWeight}KG</span></li>
            <li>
                <label class="label_name">库存量：</label>
                <span class="info">${goodsVo.goodsInventory}件</span></li>
            <li>
                <label class="label_name">品牌：</label>
                <span class="info">${goodsVo.brandName}</span></li>
            <li>
                <label class="label_name">所属店铺：</label>
                <span class="info">${goodsVo.storeName}</span></li>
            <li>
                <label class="label_name">分区：</label>
                <c:if test="${goodsVo.goodsZone == 1}">
                <span class="info">精品区</span></li>
            </c:if>
                <c:if test="${goodsVo.goodsZone == 2}">
                <span class="info">消费区</span></li>
            </c:if>
            <li>
                <label class="label_name">对应积分：</label>
                <span class="info">${goodsVo.goodsIntegral}</span></li>
            <li>
                <label class="label_name">销量：</label>
                <span class="info">${goodsVo.goodsSalesVolume}</span></li>
            <li>
                <label class="label_name">运费：</label>
                <span class="info">${goodsVo.goodsFreight}</span></li>
            <li>
                <label class="label_name">发货地：</label>
                <span class="info">${goodsVo.goodsDispatchPlace}</span></li>
            <li>
                <label class="label_name">申请时间：</label>
                <span class="info">${goodsVo.goodsAddtime}</span></li>
            <li>
                <label class="label_name">是否属于店铺新品：</label>
                <c:if test="${goodsVo.storeIsbelongNewFlag == 1}">
                <span class="info">是</span></li>
            </c:if>
                <c:if test="${goodsVo.storeIsbelongNewFlag == 2}">
                <span class="info">否</span></li>
            </c:if>
            <li>
                <label class="label_name">是否属于店铺热销：</label>
                <c:if test="${goodsVo.storeIsbelongHotFlag == 1}">
                <span class="info">是</span></li>
            </c:if>
                <c:if test="${goodsVo.storeIsbelongHotFlag == 2}">
                <span class="info">否</span></li>
            </c:if>
            <li>
            <li>
                <label class="label_name">是否属于商城新品：</label>
            <c:if test="${goodsVo.plateIsbelongNewFlag == 1}">
                <span class="info">是</span></li>
            </c:if>
            <c:if test="${goodsVo.plateIsbelongNewFlag == 2}">
                <span class="info">否</span></li>
            </c:if>
            <li>
                <label class="label_name">是否属于商城热销：</label>
                <c:if test="${goodsVo.plateIsbelongHotFlag==1}">
                <span class="info">是</span></li>
            </c:if>
                <c:if test="${goodsVo.plateIsbelongHotFlag==2}">
                <span class="info">否</span></li>
            </c:if>
            <li>
                <label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;态：</label>
                <c:if test="${goodsVo.goodsStatus ==1}">
                <span class="info">申请中</span></li>
            </c:if>
                <c:if test="${goodsVo.goodsStatus ==2}">
                <span class="info">营销中</span></li>
            </c:if>
                <c:if test="${goodsVo.goodsStatus ==3}">
                <span class="info">下架</span></li>
            </c:if>
                <c:if test="${goodsVo.goodsStatus ==4}">
                <span class="info">违规下架</span></li>
            </c:if>
        </ul>
    </div>
    <c:if test="${goodsVo.goodsStatus ==5}">
        <div class="Store_Introduction">
            <div class="title_name">驳回原因</div>
            <div class="info">${goodsVo.rejectReason}</div>
        </div>
    </c:if>
    <div class="Store_Introduction">
        <div class="title_name">产品属性</div>
        <div class="info goodsParameter">${goodsVo.goodsParameter}</div>
    </div>
    <div class="Store_Introduction">
        <div class="title_name">产品详情</div>
        <div class="info">${goodsVo.goodsDetails}</div>
    </div>
    <div class="Store_Introduction">
        <div class="title_name">产品图片</div>
        <c:forEach items="${goodsPhotoList}" var="goodsPhoto">
            <span class="info"><img src="${goodsPhoto}"/></span>
        </c:forEach>
    </div>

        <div class="At_button">
            <c:if test="${goodsVo.goodsStatus ==1}">
            <button onclick="through_save('this',${goodsVo.id});" class="btn btn-primary radius" type="submit">通 过</button>
            <button onclick="cancel_save('this',${goodsVo.id});" class="btn btn-danger  btn-warning" type="button">拒 绝</button>
            </c:if>
            <button onclick="return_close();" class="btn btn-default radius" type="button">返回上一步</button>
        </div>

</div>
<div style="display: none;margin-left: 5%;" class="tips">
    <label>请选择要放置的区域</label> <br>
    <input type="radio" name="radio" value="1" checked/> 精品区
    <input type="radio" name="radio"value="2"/> 消费区
</div>
</body>
</html>
<script type="text/javascript">


    //通过
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);

    function through_save(obj, id) {

        layer.confirm('确认要通过该产品吗？', function (index) {
            layer.open({
                type: 1,
                title: '提示',
                maxmin: true,
                shadeClose: false,
                area: ['500px', ''],
                content: $('.tips'),
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                    var radio = document.getElementsByName("radio");
                    var zone;
                    for (var i = 0; i < radio.length; i++){
                        if (radio[i].checked == true){
                            zone=radio[i].value;
                        }
                    }
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/goods/consentgoods",
                        data: {"id": id ,"zone": zone},
                        dataType: "json",
                        success: function (data) {
                            if (data.code == 2000) {
                                $(obj).parents("tr").remove();
                                layer.msg(data.msg, {icon: 1, time: 1000},function () {
                                    location.href="${pageContext.request.contextPath}/goods/goodsapplyforlist";
                                });

                            } else {
                                layer.msg(data.msg, {icon: 5, time: 1000});
                            }
                        }
                    });
                }
            });
        });
    }

    //返回操作
    function return_close() {
        window.history.back(-1);
        parent.$('#parentIframe').css("display", "none");
        parent.$('.Current_page').css({"color": "#333333"});
    }

    //拒绝
    function cancel_save(obj, id) {
        var index = layer.open({
            type: 1,
            title: '内容',
            maxmin: true,
            shadeClose: false,
            area: ['600px', ''],
            content: ('<div class="shop_reason"><span class="content">请说明拒绝该申请人申请店铺的理由，以便下次在申请时做好准备。</span><textarea name="请填写拒绝理由" class="form-control" id="form_textarea" placeholder="请填写拒绝理由" onkeyup="checkLength(this);"></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">500</span>字</span></div>'),
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                if ($('.form-control').val() == "") {
                    layer.alert('回复内容不能为空！', {
                        title: '提示框',
                        icon: 0,
                    })
                } else {

                    /*拒绝申请*/
                   $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/goods/regectgoods",
                        data: {"id": id ,"rejectMsg": $('.form-control').val()},
                        dataType: "json",
                        success: function (data) {
                            if (data.code == 2000) {
                                layer.msg(data.msg, {icon: 1, time: 1000});
                                layer.close(index);
                                location.href = "${pageContext.request.contextPath}/goods/goodsapplyforlist";
                            } else {
                                layer.msg(data.msg, {icon: 5, time: 1000});
                            }
                        }
                    });
                }
            }
        })
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
<script type="text/javascript">
    var goodsParameter=${goodsVo.goodsParameter};
    var str ="";
    for (var i = 0; i < goodsParameter.length; i++){
        str += "["+"<span>"+goodsParameter[i].name+":"+goodsParameter[i].value+"</span>"+"]";
    }
    $(".goodsParameter").html(str);
</script>