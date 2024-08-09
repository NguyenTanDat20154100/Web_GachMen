<%@ page import="javax.mail.Session" %>
<%@ page import="model.UserSession" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% UserSession u = UserSession.getUS(session);
    int role = u.getRole();
%>
<jsp:useBean id="cart" class="model.Cart" scope="session"></jsp:useBean>
<script scr="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<header>

    <!-- Header Middle Start Here -->
    <div class="header-middle ptb-15">
        <div class="container">
            <div class="row align-items-center no-gutters">
                <div class="col-lg-3 col-md-12">
                    <div class="logo mb-all-30">
                        <a href="Home"><img src="img\logo\logo.png" alt="logo-image"></a>
                    </div>
                </div>
                <!-- Categorie Search Box Start Here -->
                <div class="col-lg-5 col-md-8 ml-auto mr-auto col-10">
                    <div class="categorie-search-box">
                        <form action="search" method="post">

                            <input type="text" name="txt" placeholder="Bạn muốn mua gì...">
                            <button><i class="lnr lnr-magnifier"></i></button>
                        </form>
                    </div>
                </div>
                <!-- Cart Box Start Here -->
                <div class="col-lg-4 col-md-12">
                    <div class="cart-box mt-all-30">
                        <ul class="d-flex justify-content-lg-end justify-content-center align-items-center">
                            <li><a href="Cart"><i class="lnr lnr-cart"></i><span class="my-cart"><span
                                    class="total-pro">${cart.quantityCart==0?0:cart.quantityCart}</span><span>Giỏ hàng</span></span></a>
                            </li>
                            <%--                            <%if(session.getAttribute("account.status") == 1 ) {%>--%>
                            <%--                            <li><a href="login.jsp"><i class="lnr lnr-user"></i><span class="my-cart"><span> <strong>Đăng nhập</strong></span><span> đăng kí</span></span></a>--%>
                            <%--                            </li>--%>
                            <%--                            <%}%>--%>
                            <%if (session.getAttribute("userID") != null) {%>

                            <li><a href="logout"><i class="lnr lnr-user"></i><span
                                    class="my-cart"><span><strong><%=session.getAttribute("userN")%></strong></span><span>đăng xuất</span></span></a>

                            </li>
                            <%}%>
                            <% if (role != 0) {%>

                            <li><a href="ListProductAd"><i class="lnr lnr-pointer-right"></i><span
                                    class="my-cart"><span><strong><%=session.getAttribute("userN")%></strong></span><span>vào admin</span></span></a>

                            </li>
                            <%}%>
                            <%if (session.getAttribute("userID") == null) {%>
                            <li><a href="login.jsp"><i class="lnr lnr-user"></i><span class="my-cart"><span> <strong>Đăng nhập</strong></span><span> đăng kí</span></span></a>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header Bottom Start Here -->
    <div class="header-bottom  header-sticky">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-3 col-lg-4 col-md-6 vertical-menu d-none d-lg-block">
                    <span class="categorie-title">Danh mục sản phẩm</span>
                </div>
                <div class="col-xl-9 col-lg-8 col-md-12 ">
                    <nav class="d-none d-lg-block">
                        <ul class="header-bottom-list d-flex">
                            <li><a id="index" href="Home">Trang chủ</a>
                            </li>
                            <%if (session.getAttribute("userID") != null) {%>
                            <li><a id="personal" href="personalUser">Trang cá nhân</a>
                            </li>
                            <%}%>
                            <li><a id="product-list" href="ProductLists?page=1">Sản phẩm</a>

                            </li>

                            <li><a id="about" href="about">Giới thiệu</a></li>
                            <li><a id="contact" href="contact.jsp">Liên hệ</a></li>
                        </ul>
                    </nav>
                    <div class="mobile-menu d-block d-lg-none">
                        <nav>
                            <ul>
                                <li><a href="Home">Trang chủ</a>
                                    <!-- Home Version Dropdown Start -->

                                </li>
                                <li><a href="ProductLists?page=1">Sản phẩm</a>
                                    <!-- Mobile Menu Dropdown Start -->

                                </li>


                                <li><a href="about">Giới thiệu</a></li>
                                <li><a href="contact.jsp">Liên hệ</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Mobile Vertical Menu Start Here -->
    <div class="container d-block d-lg-none">
        <div class="vertical-menu mt-30">
            <span class="categorie-title mobile-categorei-menu">Danh mục sản phẩm</span>
            <nav>
                <div id="cate-mobile-toggle"
                     class="category-menu sidebar-menu sidbar-style mobile-categorei-menu-list menu-hidden ">
                    <ul>
                        <li class="has-sub"><a href="ListByType?type=Gạch lát nền&page=1">Gạch lát nền</a>

                            <!-- category submenu end-->
                        </li>
                        <li class="has-sub"><a href="ListByType?type=Gạch ốp tường&page=1">Gạch ốp tường</a>

                            <!-- category submenu end-->
                        </li>
                        <li class="has-sub"><a href="ListByType?type=Gạch trang trí&page=1">Gạch trang trí</a>

                            <!-- category submenu end-->
                        </li>
                        <li class="has-sub"><a href="ListByType?type=Gạch giả gỗ&page=1">Gạch giả gỗ</a>

                            <!-- category submenu end-->
                        </li>


                    </ul>
                </div>
                <!-- category-menu-end -->
            </nav>
        </div>
    </div>
</header>
<!-- Categorie Menu & Slider Area Start Here -->
<div class="main-page-banner pb-50 off-white-bg">
    <div class="container">
        <div class="row">
            <!-- Vertical Menu Start Here -->
            <div class="col-xl-3 col-lg-4 d-none d-lg-block">
                <div class="vertical-menu mb-all-30">
                    <nav>
                        <ul class="vertical-menu-list" style="display: none;">
                            <li><a href="ListByType?type=Gạch lát nền&page=1">Gạch lát nền</a>
                            </li>
                            <li><a href="ListByType?type=Gạch ốp tường&page=1">Gạch ốp tường</a>
                                <!-- Vertical Mega-Menu Start -->

                            </li>

                            <li><a href="ListByType?type=Gạch trang trí&page=1">Gạch trang trí</a>

                            </li>
                            <li><a href="ListByType?type=Gạch giả gỗ&page=1">Gạch giả gỗ</i>
                            </a>

                        </ul>
                    </nav>
                </div>
            </div>
            <!-- Slider Area Start Here -->
            <div class="col-xl-9 col-lg-8 slider_box">
                <div class="slider-wrapper theme-default">
                    <!-- Slider Background  Image Start-->
                    <div id="slider" class="nivoSlider">
                        <a href="ProductLists?page=1"><img src="img\slider\banner-the.png" data-thumb="img/slider/1.jpg"
                                                           alt="" title="#htmlcaption"></a>
                        <a href="ProductLists?page=1"><img src="img\slider\image2.jpg" data-thumb="img/slider/2.jpg"
                                                           alt="" title="#htmlcaption2"></a>
                    </div>
                    <!-- Slider Background  Image Start-->
                </div>
            </div>
        </div>
    </div>
</div>
