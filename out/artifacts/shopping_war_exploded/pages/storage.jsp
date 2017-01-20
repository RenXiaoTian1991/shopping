<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <head>
        <meta charset="utf-8" />
        <title>购物车</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- basic styles -->

        <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="/static/css/font-awesome.min.css" />

        <!--[if IE 7]>
        <link rel="stylesheet" href="/static/css/font-awesome-ie7.min.css" />
        <![endif]-->

        <!-- page specific plugin styles -->

        <!-- fonts -->

        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

        <!-- ace styles -->

        <link rel="stylesheet" href="/static/css/ace.min.css" />
        <link rel="stylesheet" href="/static/css/ace-rtl.min.css" />
        <link rel="stylesheet" href="/static/css/ace-skins.min.css" />

        <!--[if lte IE 8]>
        <link rel="stylesheet" href="/static/css/ace-ie.min.css" />
        <![endif]-->

        <!-- inline styles related to this page -->

        <!-- ace settings handler -->

        <script src="/static/js/ace-extra.min.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

        <!--[if lt IE 9]>
        <script src="/static/js/html5shiv.js"></script>
        <script src="/static/js/respond.min.js"></script>
        <![endif]-->
    </head>

<body>

<jsp:include page="top.jsp"/>
<%--页面头部--%>

<a id="myalert" href="#modal-table" role="button" class="green" data-toggle="modal"></a>

<div id="modal-table" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header no-padding">
                <div class="table-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <span class="white">&times;</span>
                    </button>
                    订单信息>>
                </div>
            </div>

            <div id="alert-body" class="modal-body padding-2"></div>

            <div class="modal-footer no-margin-top">
                <button class="btn btn-sm btn-info" onclick="toPay()" data-dismiss="modal">
                    <i class="icon-ok"></i>
                    付款
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>


<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <jsp:include page="menu.jsp"/>
        <%--页面菜单--%>

        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="/index">首页</a>
                    </li>
                    <li class="active">控制台</li>
                </ul><!-- .breadcrumb -->
            </div>

            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <div class="space-6"></div>

                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1">
                                <div class="widget-box transparent invoice-box">

                                    <div class="widget-body">
                                        <div class="widget-main padding-24">

                                            <div>
                                                <table class="table table-striped table-bordered">
                                                    <thead>
                                                    <tr>
                                                        <th>名称</th>
                                                        <th>描述</th>
                                                        <th class="hidden-xs">图片</th>
                                                        <th class="hidden-480">数量</th>
                                                        <th>单价</th>
                                                        <th class="center">操作</th>
                                                    </tr>
                                                    </thead>

                                                    <tbody>

                                                    <c:forEach items="${storagegood}" var="sg">
                                                    <tr>
                                                        <td class="center">${sg.name}</td>
                                                        <td>${sg.detail}</td>
                                                        <td class="hidden-xs">
                                                            <img src="${sg.pic}" width="100" height="80">
                                                        </td>
                                                        <td class="hidden-480">${sg.goodnum}</td>
                                                        <td>${sg.price}</td>
                                                        <td class="center">
                                                            <a href="/storage/del?Id=${sg.id}"> <button type="button" class="width-5 pull-center btn btn-sm btn-danger">
                                                            删除
                                                            <i class="icon-remove"></i>
                                                            </button>
                                                            </a>
                                                            <a href="javascript:crateOrder('${sg.id}')">
                                                            <button type="button" class="width-5 pull-center btn btn-sm btn-success">
                                                                购买
                                                                <i class="icon-arrow-right icon-on-right"></i>
                                                            </button>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    </c:forEach>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div><!-- /.main-content -->
    </div><!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='/static/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='/static/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='/static/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<!-- ace scripts -->

<script src="/static/js/ace-elements.min.js"></script>
<script src="/static/js/ace.min.js"></script>
<script>
    function toPay() {
        var orderId=$("#orderId").val();
        $.get("/order/pay?orderId="+orderId,function (result) {
            if ("success" == result){
                alert("付款成功");
                window.location.href="/pages/noshipOrder.jsp";
            }else if("nomoney"==result){
                alert("账户余额不足！");
            }else{
                alert("支付失败，请稍后再试。。。");
            }
        });
    }

    function crateOrder(storageId){
        $("#alert-body").empty();
        $.get("/create/storage/order?storageId="+storageId,function (result) {
            if (result != null){
                var content="<input type='hidden' id='orderId' value='"+result.id+"'/>商品:"+result.goodName;
                content+="<br>订单号:"+result.ordersn;
                content+="<br>收件人:"+result.username;
                content+="<br>电话:"+result.phone;
                content+="<br>地址:"+result.address;
                content+="<br>数量:"+result.goodnum;
                content+="<br>支付金额:<i style='color: red;'>"+result.amount+"￥</i>";
                $("#myalert").click();
                $("#alert-body").append(content);
            }else {
                alert("订单创建失败!");
            }
        });
    }
</script>
</body>
</html>
