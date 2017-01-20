<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar" id="sidebar">
    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="sidebar-shortcuts" id="sidebar-shortcuts"></div><!-- #sidebar-shortcuts -->

    <ul class="nav nav-list">
        <li class="active">
            <a href="/index">
                <i class="icon-dashboard"></i>
                <span class="menu-text"> 控制台 </span>
            </a>
        </li>

        <li id="shop">
            <a href="#" class="dropdown-toggle">
                <i class="icon-list"></i>
                <span class="menu-text"> 商城 </span>

                <b class="arrow icon-angle-down"></b>
            </a>

            <ul class="submenu">
                <li id="buy_good">
                    <a href="/good/show">
                        <i class="icon-double-angle-right"></i>
                        购买商品
                    </a>
                </li>
                <c:if test="${sessionScope.shopping_login_user.role==1}">
                <li id="manage_good">
                    <a href="/good/list">
                        <i class="icon-double-angle-right"></i>
                        商品管理
                    </a>
                </li>
                </c:if>
            </ul>
        </li>

        <li id="order">
            <a href="#" class="dropdown-toggle">
                <i class="icon-shopping-cart"></i>
                <span class="menu-text"> 我的订单 </span>

                <b class="arrow icon-angle-down"></b>
            </a>

            <ul class="submenu">
                <li id="nopay_order">
                    <a href="/pages/nopayOrder.jsp">
                        <i class="icon-double-angle-right"></i>
                        未付款
                    </a>
                </li>

                <li id="payed_order">
                    <a href="/pages/payedOrder.jsp">
                        <i class="icon-double-angle-right"></i>
                        已付款
                    </a>
                </li>

                <li id="cancel_oreder">
                    <a href="/pages/cancelledOrder.jsp">
                        <i class="icon-double-angle-right"></i>
                        已失效
                    </a>
                </li>
            </ul>
        </li>
    </ul><!-- /.nav-list -->
    <div class="sidebar-collapse" id="sidebar-collapse">
        <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
    </div>

    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'collapsed')
        } catch (e) {
        }
    </script>
</div>