<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Trang chủ || Truemart Gạch men cao cấp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicons -->
    <link rel="shortcut icon" href="img\favicon.ico">
    <!-- Fontawesome css -->
    <link rel="stylesheet" href="css\font-awesome.min.css">
    <!-- Ionicons css -->
    <link rel="stylesheet" href="css\ionicons.min.css">
    <!-- linearicons css -->
    <link rel="stylesheet" href="css\linearicons.css">
    <!-- Nice select css -->
    <link rel="stylesheet" href="css\nice-select.css">
    <!-- Jquery fancybox css -->
    <link rel="stylesheet" href="css\jquery.fancybox.css">
    <!-- Jquery ui price slider css -->
    <link rel="stylesheet" href="css\jquery-ui.min.css">
    <!-- Meanmenu css -->
    <link rel="stylesheet" href="css\meanmenu.min.css">
    <!-- Nivo slider css -->
    <link rel="stylesheet" href="css\nivo-slider.css">
    <!-- Owl carousel css -->
    <link rel="stylesheet" href="css\owl.carousel.min.css">
    <!-- Bootstrap css -->
    <link rel="stylesheet" href="css\bootstrap.min.css">
    <!-- Custom css -->
    <link rel="stylesheet" href="css\default.css">
    <!-- Main css -->
    <link rel="stylesheet" href="css\style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="css\responsive.css">

    <!-- Modernizer js -->
    <script src="js\vendor\modernizr-3.5.0.min.js"></script>
    <script>
        document.getElementById("index").classList.add('active');
    </script>
</head>

<body>

<%--<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade--%>
<%--    your browser</a> to improve your experience and security.</p>--%>


<!-- Main Wrapper Start Here -->
<div class="wrapper">
    <!-- Banner Popup Start -->
    <!-- Brand Banner Area Start Here -->
    <jsp:include page="header.jsp"/>
    <!-- Big Banner Start Here -->
    <div class="big-banner mt-100 pb-85 mt-sm-60 pb-sm-45">
        <div class="container banner-2">
            <div class="banner-box">
                <div class="col-img">
                    <a href="#"><img src="img\banner\banner3-1.jpg" alt="banner 3"></a>
                </div>
                <div class="col-img">
                    <a href="#"><img src="img\banner\banner3-2.jpg" alt="banner 3"></a>
                </div>
            </div>
            <div class="banner-box">
                <div class="col-img">
                    <a href="#"><img src="img\banner\banner3-3.jpg" alt="banner 3"></a>
                </div>
            </div>
            <div class="banner-box">
                <div class="col-img">
                    <a href="#"><img src="img\banner\banner3-4.jpg" alt="banner 3"></a>
                </div>
                <div class="col-img">
                    <a href="#"><img src="img\banner\banner3-5.jpg" alt="banner 3"></a>
                </div>
            </div>
            <div class="banner-box">
                <div class="col-img">
                    <a href="#"><img src="img\banner\banner3-6.jpg" alt="banner 3"></a>
                </div>
            </div>
            <div class="banner-box">
                <div class="col-img">
                    <a href="#"><img src="img\banner\banner3-7.jpg" alt="banner 3"></a>
                </div>
                <div class="col-img">
                    <a href="#"><img src="img\banner\banner3-8.jpg" alt="banner 3"></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Arrivals Products Area Start Here -->
    <div class="arrivals-product pb-85 pb-sm-45">
        <div class="container">
            <div class="main-product-tab-area">
                <div class="tab-menu mb-25">
                    <div class="section-ttitle">
                        <h2>Hàng mới</h2>
                    </div>
                </div>
                <!-- Tab Content Start -->
                <div class="tab-content">
                    <!-- Arrivals Product Activation Start Here -->
                    <div class="electronics-pro-active owl-carousel">
                                <jsp:useBean id="homeProduct" scope="request" type="java.util.List"/>
                                <c:forEach items="${homeProduct}" var="p">
                                    <div class="col-lg-12 col-md-12 col-sm-10 col-10">
                                        <div class="single-product">
                                            <!-- Product Image Start -->
                                            <div class="pro-img">
                                                <a href="ProductDetail?productID=${p.productID}">
                                                    <img class="primary-img"
                                                         src="${p.image1}"
                                                         alt="single-product">
                                                    <img class="secondary-img"
                                                         src="${p.image2}"
                                                         alt="single-product">
                                                </a>

                                            </div>
                                            <!-- Product Image End -->
                                            <!-- Product Content Start -->
                                            <div class="pro-content">
                                                <div class="pro-info">
                                                    <h4>
                                                        <a href="ProductDetail?productID=${p.productID}">${p.productName}</a>
                                                    </h4>
                                                    <p><span class="price"><fmt:formatNumber type="currency"
                                                                                             currencySymbol=""
                                                                                             minFractionDigits="0"
                                                                                             value="${p.price-Math.round(p.price*(p.salePrice/100))}"/> VNĐ </span>
                                                        <c:if test="${p.salePrice>0}">
                                                            <del class="prev-price"><fmt:formatNumber type="currency"
                                                                                                      currencySymbol=""
                                                                                                      minFractionDigits="0"
                                                                                                      value="${p.price}"/>
                                                                VNĐ
                                                            </del>
                                                        </c:if>
                                                    </p>
                                                    <c:if test="${p.salePrice>0}">
                                                        <div class="label-product l_sale">${p.salePrice}<span
                                                                class="symbol-percent">%</span></div>
                                                    </c:if>
                                                </div>
                                                <div class="pro-actions">
                                                    <div class="actions-primary">
                                                        <c:url value="/addCart?productID=${p.productID}"
                                                               var="addCart"/>
                                                        <a href="${addCart}" title="Thêm vào giỏ"> + Thêm vào giỏ</a>
                                                    </div>
                                                    <div class="actions-primary">
                                                        <c:url value="/buyNow?productID=${p.productID}"
                                                               var="buyNow"/>
                                                        <a href="${buyNow}" title="Mua ngay"> Mua ngay</a>
                                                    </div>

                                                </div>
                                            </div>
                                            <!-- Product Content End -->
                                            <!-- <span class="sticker-new">Mới</span> -->
                                        </div>
                                    </div>
                                </c:forEach>
                                <!-- Single Product End -->
                                <!-- Single Product Start -->


                                <!-- Single Product End -->
                            </div>
                        </div>
                    </div>
                    <!-- main-product-tab-area-->
                </div>
            </div>
            <!-- Arrivals Products Area Start Here -->
            <div class="second-arrivals-product pb-45 pb-sm-5">
                <div class="container">
                    <div class="main-product-tab-area">
                        <div class="tab-menu mb-25">
                            <div class="section-ttitle">
                                <h2>Bán chạy</h2>
                            </div>
                        </div>
                        <!-- Tab Contetn Start -->
                        <div class="tab-content">
                            <!-- Arrivals Product Activation Start Here -->
                            <div class="electronics-pro-active owl-carousel">
                                <jsp:useBean id="homeProduct1" scope="request" type="java.util.List"/>
                                <c:forEach items="${homeProduct1}" var="p1">
                                    <div class="col-lg-12 col-md-12 col-sm-10 col-10">
                                        <div class="single-product">
                                            <!-- Product Image Start -->
                                            <div class="pro-img">
                                                <a href="ProductDetail?productID=${p1.productID}">
                                                    <img class="primary-img"
                                                         src="${p1.image1}"
                                                         alt="single-product">
                                                    <img class="secondary-img"
                                                         src="${p1.image2}"
                                                         alt="single-product">
                                                </a>

                                            </div>
                                            <!-- Product Image End -->
                                            <!-- Product Content Start -->
                                            <div class="pro-content">
                                                <div class="pro-info">
                                                    <h4>
                                                        <a href="ProductDetail?productID=${p1.productID}">${p1.productName}</a>
                                                    </h4>
                                                    <p><span class="price"><fmt:formatNumber type="currency"
                                                                                             currencySymbol=""
                                                                                             minFractionDigits="0"
                                                                                             value="${p1.price-Math.round(p1.price*(p1.salePrice/100))}"/> VNĐ </span>
                                                        <c:if test="${p1.salePrice>0}">
                                                            <del class="prev-price"><fmt:formatNumber type="currency"
                                                                                                      currencySymbol=""
                                                                                                      minFractionDigits="0"
                                                                                                      value="${p1.price}"/>
                                                                VNĐ
                                                            </del>
                                                        </c:if>
                                                    </p>
                                                    <c:if test="${p1.salePrice>0}">
                                                        <div class="label-product l_sale">${p1.salePrice}<span
                                                                class="symbol-percent">%</span></div>
                                                    </c:if>
                                                </div>
                                                <div class="pro-actions">
                                                    <div class="actions-primary">
                                                        <c:url value="/addCart?productID=${p1.productID}"
                                                               var="addCart"/>
                                                        <a href="${addCart}" title="Thêm vào giỏ"> + Thêm vào giỏ</a>
                                                    </div>
                                                    <div class="actions-primary">
                                                        <c:url value="/buyNow?productID=${p1.productID}"
                                                               var="buyNow"/>
                                                        <a href="${buyNow}" title="Mua ngay"> Mua ngay</a>
                                                    </div>

                                                </div>
                                            </div>
                                            <!-- Product Content End -->
                                            <!-- <span class="sticker-new">Mới</span> -->
                                        </div>
                                    </div>
                                </c:forEach>
                                <!-- Single Product End -->
                                <!-- Single Product Start -->


                                <!-- Single Product End -->
                            </div>
                        </div>
                        <!-- main-product-tab-area-->
                    </div>
                </div>
                <!-- Like Products Area Start Here -->
                <div class="like-product ptb-95 off-white-bg pt-sm-50 pb-sm-55 ">
                    <div class="container">
                        <div class="like-product-area">
                            <h2 class="section-ttitle2 mb-30">Gợi ý cho bạn</h2>
                            <!-- Arrivals Product Activation Start Here -->
                                <div class="like-pro-active owl-carousel">
                                <jsp:useBean id="homeProduct2" scope="request" type="java.util.List"/>
                                <c:forEach items="${homeProduct2}" var="p2">
                                    <div class="col-lg-12 col-md-12 col-sm-10 col-10">
                                        <div class="single-product">
                                            <!-- Product Image Start -->
                                            <div class="pro-img">
                                                <a href="ProductDetail?productID=${p2.productID}">
                                                    <img class="primary-img"
                                                         src="${p2.image1}"
                                                         alt="single-product">
                                                    <img class="secondary-img"
                                                         src="${p2.image2}"
                                                         alt="single-product">
                                                </a>

                                            </div>
                                            <!-- Product Image End -->
                                            <!-- Product Content Start -->
                                            <div class="pro-content">
                                                <div class="pro-info">
                                                    <h4>
                                                        <a href="ProductDetail?productID=${p2.productID}">${p2.productName}</a>
                                                    </h4>
                                                    <p><span class="price"><fmt:formatNumber type="currency"
                                                                                             currencySymbol=""
                                                                                             minFractionDigits="0"
                                                                                             value="${p2.price-Math.round(p2.price*(p2.salePrice/100))}"/> VNĐ </span>
                                                        <c:if test="${p2.salePrice>0}">
                                                            <del class="prev-price"><fmt:formatNumber type="currency"
                                                                                                      currencySymbol=""
                                                                                                      minFractionDigits="0"
                                                                                                      value="${p2.price}"/>
                                                                VNĐ
                                                            </del>
                                                        </c:if>
                                                    </p>
                                                    <c:if test="${p2.salePrice>0}">
                                                        <div class="label-product l_sale">${p2.salePrice}<span
                                                                class="symbol-percent">%</span></div>
                                                    </c:if>
                                                </div>
                                                <div class="pro-actions">
                                                    <div class="actions-primary">
                                                        <c:url value="/addCart?productID=${p2.productID}"
                                                               var="addCart"/>
                                                        <a href="${addCart}" title="Thêm vào giỏ"> + Thêm vào giỏ</a>
                                                    </div>
                                                    <div class="actions-primary">
                                                        <c:url value="/buyNow?productID=${p2.productID}"
                                                               var="buyNow"/>
                                                        <a href="${buyNow}" title="Mua ngay"> Mua ngay</a>
                                                    </div>

                                                </div>
                                            </div>
                                            <!-- Product Content End -->
                                            <!-- <span class="sticker-new">Mới</span> -->
                                        </div>
                                    </div>
                                </c:forEach>
                                <!-- Single Product End -->
                                <!-- Single Product Start -->


                                <!-- Single Product End -->
                            </div>
                        </div>
                        </div>
                        <!-- main-product-tab-area-->
                    </div>
                </div>
                <!-- Support Area Start Here -->
                <jsp:include page="footer.jsp"/>
                <!-- Quick View Content Start -->

            </div>

            <!-- jquery 3.2.1 -->
            <script src="js\vendor\jquery-3.2.1.min.js"></script>
            <!-- Countdown js -->
            <script src="js\jquery.countdown.min.js"></script>
            <!-- Mobile menu js -->
            <script src="js\jquery.meanmenu.min.js"></script>
            <!-- ScrollUp js -->
            <script src="js\jquery.scrollUp.js"></script>
            <!-- Nivo slider js -->
            <script src="js\jquery.nivo.slider.js"></script>
            <!-- Fancybox js -->
            <script src="js\jquery.fancybox.min.js"></script>
            <!-- Jquery nice select js -->
            <script src="js\jquery.nice-select.min.js"></script>
            <!-- Jquery ui price slider js -->
            <script src="js\jquery-ui.min.js"></script>
            <!-- Owl carousel -->
            <script src="js\owl.carousel.min.js"></script>
            <!-- Bootstrap popper js -->
            <script src="js\popper.min.js"></script>
            <!-- Bootstrap js -->
            <script src="js\bootstrap.min.js"></script>
            <!-- Plugin js -->
            <script src="js\plugins.js"></script>
            <!-- Main activaion js -->
            <script src="js\main.js"></script>

        </div>
</body>

</html>