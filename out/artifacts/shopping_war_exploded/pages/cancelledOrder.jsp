<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>已取消订单</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- basic styles -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/css/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="/static/css/font-awesome-ie7.min.css"/><![endif]-->
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="/static/css/jquery-ui-1.10.3.full.min.css"/>
    <link rel="stylesheet" href="/static/css/datepicker.css"/>
    <link rel="stylesheet" href="/static/css/ui.jqgrid.css"/>
    <link rel="stylesheet" href="/static/css/ace.min.css"/>
    <link rel="stylesheet" href="/static/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="/static/css/ace-skins.min.css"/>

    <link rel="stylesheet" href="/static/css/jquery.datetimepicker.css"/>

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
                        <a href="/index">主页</a>
                    </li>

                    <li>
                        <a href="#">订单管理</a>
                    </li>
                    <li class="active">已取消</li>
                </ul><!-- .breadcrumb -->
            </div>

            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <table id="grid-table"></table>
                        <div id="grid-pager"></div>
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
<script src="/static/js/date-time/jquery.datetimepicker.js"/>
<script src="/static/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="/static/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="/static/js/jqGrid/i18n/grid.locale-en.js"></script>
<!-- ace scripts -->
<script src="/static/js/ace-elements.min.js"></script>
<script src="/static/js/ace.min.js"></script>

<script type="text/javascript">
    jQuery(function ($) {
        var grid_selector = "#grid-table";
        var pager_selector = "#grid-pager";
        $.getJSON("/order/list?orderstatus=0", function (data) {
            jQuery(grid_selector).jqGrid({
                data: data,
                datatype: "local",
                height: "100%",
                colNames: ['操作', '商品','订单号','单价','数量','付款金额','预定人','电话', '地址','下单时间'],
                colModel: [
                    {name: 'myac', index: 'myac', width: 60,align:'center', fixed: true, search:false,sortable: false, resize: false,formatter:'view'},
                    {name: 'goodName', index: 'goodName',align:'center',search:false},
                    {name: 'ordersn', index: 'ordersn',align:'center'},
                    {name: 'price', index: 'price',align:'center',search:false},
                    {name: 'goodnum', index: 'goodnum',align:'center',search:false},
                    {name: 'amount', index: 'amount',align:'center',search:false},
                    {name: 'username', index: 'username',align:'center'},
                    {name: 'phone', index: 'phone',align:'center'},
                    {name: 'address', index: 'address',align:'center',search:false},
                    {name: 'createtime', index: 'createtime',align:'center',search:false,formatter:'date', formatoptions:{srcformat:'u', newformat: 'Y-m-d H:i'}},
                ],
                viewrecords: true,
                rowNum: 10,
                rowList: [10, 20, 30],
                pager: pager_selector,
                altRows: true,
                multiselect: true,
                multiboxonly: true,

                loadComplete: function () {
                    var table = this;
                    setTimeout(function () {
                        updatePagerIcons(table);
                        enableTooltips(table);
                    }, 0);
                },
                editurl:"/order/operation",//nothing is saved
                caption: "已取消<i class='icon-double-angle-right'></i>",
                autowidth: true
            });

            //enable search/filter toolbar
            //jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})

            //switch element when editing inline
            function aceSwitch(cellvalue, options, cell) {
                setTimeout(function () {
                    $(cell).find('input[type=checkbox]').wrap('<label class="inline" />').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
                }, 0);
            }

            function telFmatter (cellvalue, options, rowObject) {
                return "***"+cellvalue.substr(7);
            }

            //navButtons
            jQuery(grid_selector).jqGrid('navGrid', pager_selector,
                    { 	//navbar options
                        edit: false,
                        editicon: 'icon-pencil blue',
                        add: false,
                        addicon: 'icon-plus-sign purple',
                        del: false,
                        delicon: 'icon-trash red',
                        search: true,
                        searchicon: 'icon-search orange',
                        refresh: true,
                        refreshicon: 'icon-refresh green',
                        view: false,
                        viewicon: 'icon-zoom-in grey',
                        cloneToTop:true,
                    },
                    {
                        //edit record form
                        closeAfterEdit: true,
                        recreateForm: true,
                        beforeShowForm: function (e) {
                            var form = $(e[0]);
                            form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                            style_edit_form(form);
                        }
                    },
                    {
                        //new record form
                        closeAfterAdd: true,
                        recreateForm: true,
                        viewPagerButtons: false,
                        beforeShowForm: function (e) {
                            var form = $(e[0]);
                            form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                            style_edit_form(form);
                        }
                    },
                    {
                        //delete record form
                        recreateForm: true,
                        beforeShowForm: function (e) {
                            var form = $(e[0]);
                            if (form.data('styled')) return false;
                            form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                            style_delete_form(form);
                            form.data('styled', true);
                        },
                        onClick: function (e) {
                            alert(1);
                        }
                    },
                    {
                        //search form
                        recreateForm: true,
                        afterShowSearch: function (e) {
                            var form = $(e[0]);
                            form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
                            style_search_form(form);
                        },
                        afterRedraw: function () {
                            style_search_filters($(this));
                        },
                        multipleSearch: true,
                        /**
                         multipleGroup:true,
                         showQuery: true
                         */
                    },
                    {
                        //view record form
                        recreateForm: true,
                        beforeShowForm: function (e) {
                            var form = $(e[0]);
                            form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
                        }
                    }
            )

            function style_edit_form(form) {
                //enable datepicker on "sdate" field and switches for "stock" field
                form.find('input[name=servicetime]').datetimepicker({lang:'ch',step:5});

                //update buttons classes
                var buttons = form.next().find('.EditButton .fm-button');
                buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
                buttons.eq(0).addClass('btn-primary').prepend('<i class="icon-ok"></i>');
                buttons.eq(1).prepend('<i class="icon-remove"></i>')
                buttons = form.next().find('.navButton a');
                buttons.find('.ui-icon').remove();
                buttons.eq(0).append('<i class="icon-chevron-left"></i>');
                buttons.eq(1).append('<i class="icon-chevron-right"></i>');
            }

            function style_delete_form(form) {
                var buttons = form.next().find('.EditButton .fm-button');
                buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
                buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
                buttons.eq(1).prepend('<i class="icon-remove"></i>')
            }

            function style_search_filters(form) {
                form.find('.delete-rule').val('X');
                form.find('.add-rule').addClass('btn btn-xs btn-primary');
                form.find('.add-group').addClass('btn btn-xs btn-success');
                form.find('.delete-group').addClass('btn btn-xs btn-danger');
            }

            function style_search_form(form) {
                var dialog = form.closest('.ui-jqdialog');
                var buttons = dialog.find('.EditTable')
                buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'icon-retweet');
                buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'icon-comment-alt');
                buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'icon-search');
            }

            function beforeDeleteCallback(e) {
                var form = $(e[0]);
                if (form.data('styled')) return false;
                form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                style_delete_form(form);
                form.data('styled', true);
            }

            function beforeEditCallback(e) {
                var form = $(e[0]);
                form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                style_edit_form(form);
            }

            //replace icons with FontAwesome icons like above
            function updatePagerIcons(table) {
                var replacement =
                {
                    'ui-icon-seek-first': 'icon-double-angle-left bigger-140',
                    'ui-icon-seek-prev': 'icon-angle-left bigger-140',
                    'ui-icon-seek-next': 'icon-angle-right bigger-140',
                    'ui-icon-seek-end': 'icon-double-angle-right bigger-140'
                };
                $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function () {
                    var icon = $(this);
                    var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
                    if ($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
                })
            }

            function enableTooltips(table) {
                $('.navtable .ui-pg-button').tooltip({container: 'body'});
                $(table).find('.ui-pg-div').tooltip({container: 'body'});
            }
        });
        //var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
    });
    $(document).ready(function () {
        $(".active").removeClass();
        $("#order").addClass("active");
        $("#cancel_oreder").addClass("active");
    });
</script>
</body>
</html>
