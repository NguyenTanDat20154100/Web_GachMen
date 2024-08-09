<jsp:useBean id="user" scope="request" class="bean.User"/>
<%@ page import="service.UserService" %>
<%@ page import="bean.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Giới thiệu || Truemart Gạch men cao cấp</title>
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
</head>

<body>

<!-- Main Wrapper Start Here -->
<div class="wrapper">
    <!-- Banner Popup Start -->
    <%--       menu--%>
    <jsp:include page="header.jsp"/>
    <!-- Categorie Menu & Slider Area End Here -->
    <!-- Breadcrumb Start -->
    <div class="breadcrumb-area mt-30">
        <div class="container">
            <div class="breadcrumb">
                <ul class="d-flex align-items-center">
                    <li><a href="Home">Trang chủ</a></li>
                    <li class="active"><a href="/personalUser">Giới thiệu</a></li>
                </ul>
            </div>
        </div>
        <!-- Container End -->
    </div>
    <!-- Breadcrumb End -->
    <!-- About Us Start Here -->
    <div class="about-us pt-100 pt-sm-60">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="checkbox-form mb-sm-40">
                        <h3>Thông tin khách hàng</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="checkout-form-list mb-30">
                                    <p><span class="title-s"><strong>Mã khác hàng:</strong> </span> <span>${user.idUser}</span></p>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="checkout-form-list mb-30">
                                    <p><span class="title-s"><strong>Tên khách hàng:</strong> </span> <span>${user.name}</span></p>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="checkout-form-list mb-30">
                                    <p><span class="title-s"><strong>SĐT:</strong> </span> <span>${user.phone}</span></p>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="checkout-form-list mb-30">
                                    <p><span class="title-s"><strong>Email:</strong> </span> <span>${user.email}</span></p>
                                </div>
                            </div>

                        </div>
                        <div class="different-address">
                            <div class="order-notes">
                                <div class="checkout-form-list">
                                    <p><span class="title-s"><strong>Ngày đăng ký:</strong> </span> <span>${user.day_register}</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="your-order">
                        <h3>Đơn hàng chưa được giao</h3>
                        <div class="your-order-table table-responsive">
                            <c:if test="${listNot.size()==0}">
                                <h5>Bạn chưa mua sản phẩm nào trong cửa hàng</h5>
                            </c:if>
                            <c:if test="${listNot.size()!=0}">
                                <table>
                                    <thead>
                                    <tr>
                                        <th class="product-name">Mã đơn hàng</th>
                                        <th class="product-total">Tên Gạch</th>
                                        <th class="product-name">Số lượng</th>
                                        <th class="product-name">Tổng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listNot}" var="d">
                                    <tr class="cart_item">
                                        <td class="product-id">
                                                ${d.orderID}
                                        </td>
                                        <td class="product-name">
                                                ${d.nameProduct}
                                        </td>
                                        <td class="product-name">
                                                ${d.productQuantity}
                                        </td>
                                        <td class="product-total">
                                        <span class="amount"><fmt:formatNumber type="currency" currencySymbol=""
                                                                               minFractionDigits="0"
                                                                               value="${d.totalPrice}"></fmt:formatNumber></span>
                                        </td>
                                    </tr>

                                    </tbody>
                                    </c:forEach>
                                    <tfoot>
                                    <tr class="cart-subtotal" style="">
                                        <th>Tổng tiền thanh toán</th>
                                        <td><span class="amount"><fmt:formatNumber type="currency"
                                                                                   currencySymbol=""
                                                                                   minFractionDigits="0"
                                                                                   value="${total}"/></span></td>
                                    </tr>
                                    <tr class="order-total">
                                        <th>Tổng đơn đặt hàng</th>
                                        <td><span class=" total amount"><fmt:formatNumber type="currency"
                                                                                          currencySymbol=""
                                                                                          minFractionDigits="0"
                                                                                          value="${total}"/></span>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Container End -->
    </div>
    <!-- About Us End Here -->
    <!-- About Us Team Start Here -->
    <div class="about-team pt-100 pt-sm-60">

        <!-- Container End -->
    </div>
    <!-- About Us Team End Here -->
    <!-- About Us Skills Start Here -->
    <div class="about-team pt-100 pt-sm-60">
        <div class="container">
            <h3 class="mb-30 about-title">Lịch sử mua hàng</h3>
            <div class="table-content table-responsive mb-45">
                <c:if test="${listHis.size()==0}">
                    <h5>Bạn chưa mua sản phẩm nào trong cửa hàng</h5>
                </c:if>
                <c:if test="${listHis.size()!=0}">
                <table>
                    <thead>
                    <tr>
                        <th class="product-name">Tên ản phẩm</th>
                        <th class="product-price">Đơn giá</th>
                        <th class="product-quantity">Số lượng</th>
                        <th class="product-subtotal">Tổng</th>
                        <th class="product-remove">Xóa</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${listHis}" var="o">

                        <tr>

                            <td class="product-name"><a target="_blank"
                                                        href="ProductDetail?productID=${o.productID}">${o.nameProduct}</a>
                            </td>
                            <td class="product-price"><span class="amount"><fmt:formatNumber type="currency"
                                                                                             currencySymbol=""
                                                                                             minFractionDigits="0"
                                                                                             value="${o.priceProduct}"/> VNĐ</span>
                            </td>
                            <td class="product-quantity"><input onblur="/UpdateCart" name="quantityCart"
                                                                type="number"
                                                                value="${o.productQuantity}"></td>
                            <td class="product-subtotal"><fmt:formatNumber type="currency" currencySymbol=""
                                                                           minFractionDigits="0"
                                                                           value="${o.totalPrice}"/>
                                VNĐ
                            </td>
                            <td class="product-remove">
                                <c:url value="/deleteHistory?productID=${o.productID}" var="deleteHistory"/>
                                <a href="${deleteHistory}"><i class="fa fa-times" aria-hidden="true"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    </c:if>
                </table>
            </div>
        </div>
        <!-- Container End -->
    </div>
    <!-- About Us Skills End Here -->
    <!-- Support Area Start Here -->


    <!-- Footer Area End Here -->
    <jsp:include page="footer.jsp"/>
    <!-- Quick View Content Start -->

    <!-- Quick View Content End -->
</div>
<!-- Main Wrapper End Here -->

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
