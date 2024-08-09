<%--
  Created by IntelliJ IDEA.
  User: Quang Huy
  Date: 04/12/2022
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%if(session.getAttribute("username") == null){
    response.sendRedirect("login.jsp");
}%>
<div class="popup_banner">
    <span class="popup_off_banner">×</span>
    <div class="banner_popup_area">
        <img src="img/banner/logo.png" alt="">
    </div>
</div>

<header>

    <!-- Header Middle Start Here -->
    <div class="header-middle ptb-15">
        <div class="container">
            <div class="row align-items-center no-gutters">
                <div class="col-lg-3 col-md-12">
                    <div class="logo mb-all-30">
                        <a href="index.jsp"><img src="img\logo\logo.png" alt="logo-image"></a>
                    </div>
                </div>
                <!-- Categorie Search Box Start Here -->
                <div class="col-lg-5 col-md-8 ml-auto mr-auto col-10">
                    <div class="categorie-search-box">
                        <form action="#">
                            <div class="form-group">
                                <select class="bootstrap-select" name="poscats">
                                    <option value="0">Sản phẩm</option>
                                    <option value="2">Gạch lát nền</option>
                                    <option value="3">Gạch ốp tường</option>
                                    <option value="4">Gạch trang trí</option>
                                    <option value="5">Gạch giả gỗ</option>
                                    <option value="6">Gạch Terrazzo</option>
                                    <option value="7">Gạch thẻ</option>
                                    <option value="8">Gạch bông</option>

                                </select>
                            </div>
                            <input type="text" name="search" placeholder="Bạn muốn mua gì...">
                            <button><i class="lnr lnr-magnifier"></i></button>
                        </form>
                    </div>
                </div>
                <!-- Cart Box Start Here -->
                <div class="col-lg-4 col-md-12">
                    <div class="cart-box mt-all-30">
                        <ul class="d-flex justify-content-lg-end justify-content-center align-items-center">
                            <li><a href="cart.jsp"><i class="lnr lnr-cart"></i><span class="my-cart"><span class="total-pro">0</span><span>Giỏ hàng</span></span></a>
                            </li>
                            <%if(session.getAttribute("username")!=null) {%>
                            <li><a href="cart.jsp"><i class="lnr lnr-user"></i><span class="my-cart"><span><strong><%=session.getAttribute("username")%></strong></span><span> Logout</span></span></a>
                            </li>
                            <%}%>
                            <%if(session.getAttribute("username")==null) {%>
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
                                <!-- Home Version Dropdown Start -->

                            </li>
                            <li><a id="product-list" href="ProductList">Sản phẩm</a>

                            </li>

                            <li><a id="about" href="about.jsp">Giới thiệu</a></li>
                            <li><a id="contact" href="contact.jsp">Liên hệ</a></li>
                        </ul>
                    </nav>
                    <div class="mobile-menu d-block d-lg-none">
                        <nav>
                            <ul>
                                <li><a href="index.jsp">Trang chủ</a>
                                    <!-- Home Version Dropdown Start -->

                                </li>
                                <li><a href="product-list.jsp">Sản phẩm</a>
                                    <!-- Mobile Menu Dropdown Start -->

                                </li>


                                <li><a href="about.jsp">Giới thiệu</a></li>
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
                <div id="cate-mobile-toggle" class="category-menu sidebar-menu sidbar-style mobile-categorei-menu-list menu-hidden ">
                    <ul>
                        <li class="has-sub"><a href="#">Gạch lát nền</a>

                            <!-- category submenu end-->
                        </li>
                        <li class="has-sub"><a href="#">Gạch ốp tường</a>

                            <!-- category submenu end-->
                        </li>
                        <li class="has-sub"><a href="#">Gạch trang trí</a>

                            <!-- category submenu end-->
                        </li>
                        <li class="has-sub"><a href="#">Gạch giả gỗ</a>

                            <!-- category submenu end-->
                        </li>
                        <li class="has-sub"><a href="#">Gạch Terrazzo</a>

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
                            <li ><a href="product-list.jsp">Gạch lát nền</a>
                            </li>
                            <li><a href="product-list.jsp">Gạch ốp tường</a>
                                <!-- Vertical Mega-Menu Start -->

                            </li>

                            <li><a href="product-list.jsp">Gạch trang trí</a>

                            </li>
                            <li><a href="product-list.jsp">Gạch giả gỗ</i>
                            </a>

                            </li>
                            <li><a href="product-list.jsp">Gạch Terrazzo</a>

                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- Slider Area Start Here -->
            <div class="col-xl-9 col-lg-8 slider_box">
                <div class="slider-wrapper theme-default">
                    <!-- Slider Background  Image Start-->
                    <div id="slider" class="nivoSlider">
                        <a href="ProductLists"><img src="img\slider\banner-the.png" data-thumb="img/slider/1.jpg" alt="" title="#htmlcaption"></a>
                        <a href="ProductLists"><img src="img\slider\image2.jpg" data-thumb="img/slider/2.jpg" alt="" title="#htmlcaption2"></a>
                    </div>
                    <!-- Slider Background  Image Start-->
                </div>
            </div>
        </div>
    </div>
</div>
