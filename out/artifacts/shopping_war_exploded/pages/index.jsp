<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html lang="en">
<head>
    <meta charset="text/html;charset=utf-8"/>
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="/static/css/font-awesome-ie7.min.css"/><![endif]-->

    <!-- ace styles -->
    <link rel="stylesheet" href="/static/css/ace.min.css"/>
    <link rel="stylesheet" href="/static/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="/static/css/ace-skins.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="/static/css/ace-ie.min.css"/><![endif]-->

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
                        <a href="#">首页</a>
                    </li>
                    <li class="active">控制台</li>
                </ul><!-- .breadcrumb -->

            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        控制台
                        <small>
                            <i class="icon-double-angle-right"></i>
                            查看
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <div class="clearfix">
                            <div class="pull-left alert alert-success no-margin">
                                <button type="button" class="close" data-dismiss="alert">
                                    <i class="icon-remove"></i>
                                </button>

                                <i class="icon-umbrella bigger-120 blue"></i>
                                欢迎 ${user.name} &nbsp;
                            </div>

                            <div class="pull-right">
                                <div class="btn-toolbar inline middle no-margin">
                                    <div data-toggle="buttons" class="btn-group no-margin">
                                        <label class="btn btn-sm btn-yellow active">
                                            <span class="bigger-110">查看</span>

                                            <input type="radio" value="1"/>
                                        </label>

                                        <label class="btn btn-sm btn-yellow">
                                            <span class="bigger-110">编辑</span>

                                            <input type="radio" value="3"/>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="hr dotted"></div>

                        <div>
                            <div id="user-profile-1" class="user-profile row">
                                <div class="col-xs-12 col-sm-3 center">
                                    <div>
                                        <span class="profile-picture">
                                            <img id="avatar"
                                                 class="editable img-responsive"
                                                 alt="头像"
                                                 src="${user.logo}"/>
                                        </span>

                                        <div class="space-4"></div>

                                        <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                            <div class="inline position-relative">
                                                <a href="#" class="user-title-label dropdown-toggle"
                                                   data-toggle="dropdown">
                                                    <i class="icon-circle light-green middle"></i>
                                                    &nbsp;
                                                    <span class="white">${user.name}</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="space-6"></div>

                                    <div class="hr hr12 dotted"></div>

                                    <div class="infobox infobox-green  ">
                                        <div class="infobox-icon">
                                            <i class="icon-yen"></i>
                                        </div>

                                        <div class="infobox-data">
                                                <span class="infobox-data-number">
                                                    <c:if test="${user.money==null}">0</c:if><c:if
                                                        test="${user.money!=null}">${user.money}</c:if>元
                                                </span>
                                            <div class="infobox-content">余额</div>
                                        </div>
                                    </div>

                                    <a href="/storage/list">
                                        <div class="infobox infobox-red  ">
                                            <div class="infobox-icon">
                                                <i class="icon-shopping-cart"></i>
                                            </div>

                                            <div class="infobox-data">
                                                <span class="infobox-data-number">${storageNum}</span>
                                                <div class="infobox-content">购物车</div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="hr hr16 dotted"></div>
                                </div>

                                <div class="col-xs-12 col-sm-9">
                                    <div class="space-12"></div>

                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name"> 姓名</div>

                                            <div class="profile-info-value">
                                                <span class="editable" id="username">${user.name} &nbsp;</span>
                                            </div>
                                        </div>

                                        <div class="profile-info-row">
                                            <div class="profile-info-name"> 年龄</div>

                                            <div class="profile-info-value">
                                                <span class="editable">${user.age} &nbsp;</span>
                                            </div>
                                        </div>

                                        <div class="profile-info-row">
                                            <div class="profile-info-name"> 手机</div>

                                            <div class="profile-info-value">
                                                <span class="editable">${user.phone} &nbsp;</span>
                                            </div>
                                        </div>

                                        <div class="profile-info-row">
                                            <div class="profile-info-name"> 账户余额</div>

                                            <div class="profile-info-value">
                                                <span class="editable"><c:if test="${user.money==null}">0</c:if><c:if
                                                        test="${user.money!=null}">${user.money}</c:if>元 &nbsp;</span>
                                            </div>
                                        </div>

                                        <div class="profile-info-row">
                                            <div class="profile-info-name"> 地址</div>

                                            <div class="profile-info-value">
                                                <i class="icon-map-marker light-orange"></i>
                                                <span class="editable">${user.address} &nbsp;</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="hide">
                            <div id="user-profile-3" class="user-profile row">
                                <div class="col-sm-offset-1 col-sm-10">
                                    <div class="space"></div>

                                    <form class="form-horizontal" method="post" action="/updateUser"
                                          enctype="multipart/form-data">
                                        <input type="hidden" name="id" value="${user.id}"/>
                                        <input type="hidden" name="logo" value="${user.logo}"/>
                                        <div class="tabbable">
                                            <ul class="nav nav-tabs padding-16">
                                                <li class="active">
                                                    <a data-toggle="tab" href="#edit-basic">
                                                        <i class="green icon-edit bigger-125"></i>
                                                        编辑用户信息
                                                    </a>
                                                </li>
                                            </ul>

                                            <div class="tab-content profile-edit-tab-content">
                                                <div id="edit-basic" class="tab-pane in active">
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label no-padding-right"
                                                               for="form-field-username">姓名</label>

                                                        <div class="col-sm-9">
                                                            <input class="input-large" type="text" required name="name"
                                                                   id="form-field-username" value="${user.name}"/>
                                                        </div>
                                                    </div>

                                                    <div class="space-4"></div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label no-padding-right"
                                                               for="form-field-mobile">手机</label>

                                                        <div class="col-sm-9">
                                                            <span class="input-icon input-icon-right">
                                                                <input class="input-medium" type="text" name="phone"
                                                                       required value="${user.phone}"
                                                                       id="form-field-mobile"/>
                                                                <i class="icon-mobile-phone icon-flip-horizontal"></i>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <div class="space-4"></div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label no-padding-right">头像</label>

                                                        <div class="col-sm-9">
                                                            <input class="input-large" type="file" name="logofile"/>
                                                        </div>
                                                    </div>

                                                    <div class="space-4"></div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label no-padding-right"
                                                               for="age">年龄</label>

                                                        <div class="col-sm-9">
                                                            <input class="input-large" type="number" name="age" required
                                                                   value="${user.age}" id="age"/>
                                                        </div>
                                                    </div>

                                                    <div class="space-4"></div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label no-padding-right"
                                                               for="address">地址</label>

                                                        <div class="col-sm-9">
                                                            <input class="input-large" type="text" name="address"
                                                                   required value="${user.address}" id="address"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="clearfix form-actions">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button class="btn btn-info" type="submit">
                                                    <i class="icon-ok bigger-110"></i>
                                                    保存
                                                </button>
                                                &nbsp; &nbsp;
                                                <button class="btn" type="reset">
                                                    <i class="icon-undo bigger-110"></i>
                                                    重置
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div><!-- /span -->
                            </div><!-- /user-profile -->
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
<!--[if lte IE 8]>
<script src="/static/js/excanvas.min.js"></script><![endif]-->

<script src="/static/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/static/js/jquery.ui.touch-punch.min.js"></script>
<script src="/static/js/jquery.gritter.min.js"></script>
<script src="/static/js/bootbox.min.js"></script>
<script src="/static/js/jquery.slimscroll.min.js"></script>
<script src="/static/js/jquery.easy-pie-chart.min.js"></script>
<script src="/static/js/jquery.hotkeys.min.js"></script>
<script src="/static/js/bootstrap-wysiwyg.min.js"></script>
<script src="/static/js/select2.min.js"></script>
<script src="/static/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="/static/js/fuelux/fuelux.spinner.min.js"></script>
<script src="/static/js/x-editable/bootstrap-editable.min.js"></script>
<script src="/static/js/x-editable/ace-editable.min.js"></script>
<script src="/static/js/jquery.maskedinput.min.js"></script>

<!-- ace scripts -->
<script src="/static/js/ace-elements.min.js"></script>
<script src="/static/js/ace.min.js"></script>

<script type="text/javascript">
    $('#profile-feed-1').slimScroll({
        height: '250px',
        alwaysVisible: true
    });

    $('.profile-social-links > a').tooltip();

    $('.easy-pie-chart.percentage').each(function () {
        var barColor = $(this).data('color') || '#555';
        var trackColor = '#E2E2E2';
        var size = parseInt($(this).data('size')) || 72;
        $(this).easyPieChart({
            barColor: barColor,
            trackColor: trackColor,
            scaleColor: false,
            lineCap: 'butt',
            lineWidth: parseInt(size / 10),
            animate: false,
            size: size
        }).css('color', barColor);
    });


    $('#user-profile-3').find('button[type=reset]').on(ace.click_event, function () {
        $('#user-profile-3 input[type=file]').ace_file_input('reset_input');
    }).end().find('.date-picker').datepicker().next().on(ace.click_event, function () {
        $(this).prev().focus();
    })

    //change profile
    $('[data-toggle="buttons"] .btn').on('click', function (e) {
        var target = $(this).find('input[type=radio]');
        var which = parseInt(target.val());
        $('.user-profile').parent().addClass('hide');
        $('#user-profile-' + which).parent().removeClass('hide');
    });
</script>
</body>
</html>

