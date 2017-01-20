<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>修改密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- basic styles -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="/static/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!-- ace styles -->
    <link rel="stylesheet" href="/static/css/ace.min.css"/>
    <link rel="stylesheet" href="/static/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="/static/css/ace-skins.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="/static/css/ace-ie.min.css"/>
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

        <jsp:include page="menu.jsp"/>
        <%--页面菜单--%>

        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="/index">主页</a>
                    </li>

                    <li>
                        <a href="#">用户信息</a>
                    </li>
                    <li class="active">修改密码</li>
                </ul><!-- .breadcrumb -->
            </div>

            <div class="page-content">

                <div class="page-header">
                    <h1>
                        修改密码
                        <small>
                            <i class="icon-double-angle-right"></i>
                        </small>
                    </h1>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" id="validation-form" method="post">
                            <div class="form-group">
                                <label class="control-label col-xs-12 col-sm-3 no-padding-right">旧密码:</label>

                                <div class="col-xs-12 col-sm-9">
                                    <div class="clearfix">
                                        <input type="text" id="oldpwd" name="oldpwd" class="col-xs-12 col-sm-3"/>
                                    </div>
                                </div>
                            </div>

                            <div class="space-2"></div>
                            <div class="form-group">
                                <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password">新密码:</label>

                                <div class="col-xs-12 col-sm-9">
                                    <div class="clearfix">
                                        <input type="password" name="password" id="password" class="col-xs-12 col-sm-3"/>
                                    </div>
                                </div>
                            </div>

                            <div class="space-2"></div>
                            <div class="form-group">
                                <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password2">再输一次:</label>

                                <div class="col-xs-12 col-sm-9">
                                    <div class="clearfix">
                                        <input type="password" name="password2" id="password2" class="col-xs-12 col-sm-3"/>
                                    </div>
                                </div>
                            </div>

                            <hr/>
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info" type="submit">
                                    <i class="icon-ok bigger-110"></i>提交
                                </button>
                                &nbsp; &nbsp; &nbsp;
                                <button class="btn" type="reset">
                                    <i class="icon-undo bigger-110"></i>重置
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div><!-- /.main-content -->
    </div><!-- /.main-container-inner -->
</div><!-- /.main-container -->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='/static/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>
<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='/static/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<![endif]-->

<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='/static/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->
<script src="/static/js/fuelux/fuelux.wizard.min.js"></script>
<script src="/static/js/jquery.validate.min.js"></script>
<script src="/static/js/additional-methods.min.js"></script>
<script src="/static/js/bootbox.min.js"></script>
<script src="/static/js/jquery.maskedinput.min.js"></script>
<script src="/static/js/select2.min.js"></script>

<!-- ace scripts -->
<script src="/static/js/ace-elements.min.js"></script>
<script src="/static/js/ace.min.js"></script>

<script type="text/javascript">
    jQuery(function ($) {
        $(".select2").css('width', '200px').select2({allowClear: true})
                .on('change', function () {
                    $(this).closest('form').validate().element($(this));
                });

        $('#validation-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                password: {
                    required: true,
                    minlength: 6
                },
                password2: {
                    required: true,
                    minlength: 6,
                    equalTo: "#password"
                }
            },

            messages: {
                password: {
                    required: "  请输入密码",
                    minlength: "  密码长度不能小于6位."
                }
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                $('.alert-danger', $('.login-form')).show();
            },

            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },

            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
                $(e).remove();
            },

            errorPlacement: function (error, element) {
                if(element.is(':checkbox') || element.is(':radio')) {
                    var controls = element.closest('div[class*="col-"]');
                    if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
                    else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                }
                else if(element.is('.select2')) {
                    error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                }
                else if(element.is('.chosen-select')) {
                    error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                }
                else error.insertAfter(element.parent());
            },

            submitHandler: function (form) {
                var oldpwd=$("#oldpwd").val();
                var password=$("#password").val();
                $.post("/password/update",{oldpwd:oldpwd,password:password},function(data){
                    if("success"==data){
                        alert("修改成功,请重新登录！")
                        window.location.href="/pages/login.jsp";
                    }else if("wrong"==data){
                        alert("旧密码错误!");
                    }else{
                        alert("修改失败!")
                    }
                });
            },
        });
        $('#modal-wizard .modal-header').ace_wizard();
        $('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');
    })
</script>
</body>
</html>
