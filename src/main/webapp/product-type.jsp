<%@ page import="bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="service.ProductService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Sản phẩm || Truemart gạch men cao cấp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicons -->
    <link rel="shortcut icon" href="404.html">
    <!-- Fontawesome css -->
    <link rel="stylesheet" href="css\font-awesome.min.css">
    <!-- Ionicons css -->
    <link rel="stylesheet" href="css\ionicons.min.css">
    <!-- linearicons css -->
    <link rel="stylesheet" href="css\linearicons.css">
    <link rel="stylesheet" href="css/styles.css">
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
</head>

<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Main Wrapper Start Here -->
<div class="wrapper">
    <jsp:include page="header.jsp"/>
    <!-- Breadcrumb Start -->
    <div class="breadcrumb-area mt-30">
        <div class="container">
            <div class="breadcrumb">
                <ul class="d-flex align-items-center">
                    <li><a href="Home">Trang chủ</a></li>
                    <li class="active"><a href="ProductLists?page=1">Sản phẩm</a></li>
                </ul>
            </div>
        </div>
        <!-- Container End -->
    </div>
    <!-- Breadcrumb End -->
    <!-- Shop Page Start -->
    <div class="main-shop-page pt-100 pb-100 ptb-sm-60">
        <div class="container">
            <!-- Row End -->
            <div class="row">
                <!-- Sidebar Shopping Option Start -->
                <div class="col-lg-3 order-2 order-lg-1">
                    <div class="sidebar">
                        <!-- Price Filter Options End -->

                        <!-- Sidebar Categorie Start -->
                        <div class="sidebar-categorie mb-40">
                            <h3 class="sidebar-title">Loại gạch</h3>
                            <ul class="sidbar-style" style="margin-left: 30px">
                                <li class="form-check">
                                    <a href="ProductLists?page=1">+ Tất cả</a>
                                </li>
                                <li class="form-check" style="color: black">
                                    <a href="ListByType?type=Gạch lát nền&page=1">+ Gạch lát nền</a>
                                </li>

                                <li class="form-check">
                                    <a href="ListByType?type=Gạch ốp tường&page=1">+ Gạch ốp tường</a>
                                </li>
                                <li class="form-check">
                                    <a href="ListByType?type=Gạch trang trí&page=1">+ Gạch trang trí</a>
                                </li>
                                <li class="form-check">
                                    <a href="ListByType?type=Gạch giả gỗ&page=1">+ Gạch giả gỗ</a>
                                </li>

                            </ul>
                        </div>


                        <!-- Sidebar Categorie Start -->
                        <!-- Product Size Start -->

                        <!-- Product Size End -->
                        <!-- Product Color Start -->

                        <!-- Product Color End -->
                        <!-- Product Top Start -->

                        <!-- Product Top End -->
                        <!-- Single Banner Start -->
                        <div class="col-img">
                            <a href="ProductLists?page=1"><img src="img/banner/khuyenmaigachnhap-01.webp"
                                                            alt="slider-banner"></a>
                        </div>
                        <!-- Single Banner End -->
                    </div>
                </div>
                <!-- Sidebar Shopping Option End -->
                <!-- Product Categorie List Start -->
                <div class="col-lg-9 order-1 order-lg-2">
                    <!-- Grid & List View Start -->
                    <div class="grid-list-top border-default universal-padding d-md-flex justify-content-md-between align-items-center mb-30">

                        <!-- Toolbar Short Area Start -->
                        <div class="main-toolbar-sorter clearfix">

                            <!-- Toolbar Short Area End -->
                            <!-- Toolbar Short Area Start -->

                            <!-- Toolbar Short Area End -->

                            <!-- Grid & List View End -->
                            <div class="main-categorie mb-all-40">
                                <!-- Grid & List Main Area End -->
                                <div class="tab-content fix">
                                    <div id="grid-view" class="tab-pane fade show active">
                                        <div class="row">
                                            <!-- Single Product Start -->
                                            <%--@elvariable id="listP" type="java.util.List"--%>
                                            <c:forEach items="${listP}" var="p">
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-6">
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
                                                                        <del class="prev-price"><fmt:formatNumber
                                                                                type="currency" currencySymbol=""
                                                                                minFractionDigits="0"
                                                                                value="${p.price}"/> VNĐ
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
                                                                    <a href="${addCart}" title="Thêm vào giỏ"> + Thêm
                                                                        vào
                                                                        giỏ</a>
                                                                </div>
                                                                <div class="actions-primary">
                                                                    <c:url value="/buyNow?productID=${p.productID}"
                                                                           var="buyNow"/>
                                                                    <a href="${buyNow}" title="Mua ngay"> Mua
                                                                        ngay</a>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <!-- Product Content End -->
                                                        <!-- <span class="sticker-new">Mới</span> -->
                                                    </div>

                                                </div>
                                                <c:set var="type" value="${p.category}"/>
                                            </c:forEach>
                                            <!-- Single Product End -->
                                            <!-- Single Product Start -->


                                            <!-- Single Product End -->
                                        </div>
                                        <!-- Row End -->
                                    </div>
                                </div>
                                <!-- #grid view End -->

                                <div class="pro-pagination">
                                    <ul class="blog-pagination">

                                        <c:if test="${requestScope.page >4}">
                                            <li><a href="page=${requestScope.page - 1}">«</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${requestScope.numberPage}" var="i">
                                            <c:choose>
                                                <c:when test="${requestScope.page eq i}">
                                                    <li class="active"><a href="ListByType?type=${type}&page=${i}">${i}</a></li>
                                                </c:when>
                                                <c:when test="${requestScope.page eq i}">
                                                    <li class="active"><a href="ListByType?type=${type}&page=${i}">${i}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li><a href="ListByType?type=${type}&page=${i}">${i}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${requestScope.page < requestScope.numberPage}">
                                            <li><a href="ListByType?type=${type}&page=${requestScope.page + 1}">»</a></li>
                                        </c:if>

                                    </ul>

                                </div>
                                <!-- #list view End -->
                                <!-- Grid & List Main Area End -->
                            </div>
                        </div>
                        <!-- product Categorie List End -->
                    </div>
                    <!-- Row End -->
                </div>
                <!-- Container End -->
            </div>
            <!-- Shop Page End -->
            <!-- Support Area Start Here -->
            <jsp:include page="footer.jsp"/>
            <!-- Xem nhanh Content Start -->
            <!-- Xem nhanh Content End -->
        </div>
        <!-- Main Wrapper End Here -->
        <script>
            function submit() {
                document.getElementById("sort").submit();
            }
        </script>
        <script
                src="https://code.jquery.com/jquery-3.5.1.min.js"
                integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
                crossorigin="anonymous">
        </script>
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

</body>

</html>