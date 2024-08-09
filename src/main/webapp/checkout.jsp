<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="cart" type="model.Cart"--%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Thanh toán || Truemart Gạch men cao cấp</title>
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

</head>

<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Main Wrapper Start Here -->
<div class="wrapper">
    <jsp:include page="header.jsp"/>
    <!-- Categorie Menu & Slider Area End Here -->
    <!-- Breadcrumb Start -->
    <div class="breadcrumb-area mt-30">
        <div class="container">
            <div class="breadcrumb">
                <ul class="d-flex align-items-center">
                    <li><a href="Home">Trang chủ</a></li>
                    <li class="active"><a href="Payment">Thanh toán</a></li>
                </ul>
            </div>
        </div>
        <!-- Container End -->
    </div>
    <!-- Breadcrumb End -->
    <!-- coupon-area start -->
    <!-- coupon-area end -->
    <!-- checkout-area start -->
    <div class="checkout-area pb-100 pt-15 pb-sm-60">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="checkbox-form mb-sm-40">
                        <h3>Chi tiết thanh toán</h3>
                        <form action="CreateOrder" method="get">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="checkout-form-list mb-30">
                                        <label>Họ và Tên<span class="required">*</span></label>
                                        <input type="text" name="fullname"
                                               placeholder="Vui lòng nhập đầy đủ họ và tên..">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <label>Địa chỉ <span class="required">*</span>(Địa chỉ bao gồm số nhà, khu vực,
                                            Xã/thị trấn, Quận/Huyện,Tỉnh/TP)</label>
                                        <input type="text" name="address" placeholder="Địa chỉ">
                                    </div>
                                </div>
                                <div class="col-md-6" style="margin-top: 20px">
                                    <div class="checkout-form-list mb-30">
                                        <label>Địa chỉ Email <span class="required">*</span></label>
                                        <input type="email" name="email" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6" style="margin-top: 20px">
                                    <div class="checkout-form-list mb-30">
                                        <label> Số điện thoại <span class="required">*</span></label>
                                        <input type="text" name="phone" placeholder="">
                                    </div>
                                </div>


                            </div>
                            <div class="different-address">
                                <div class="order-notes">
                                    <div class="checkout-form-list">
                                        <h5 style="color: red"><%=request.getAttribute("err")==null?"":request.getAttribute("err")%></h5>
                                    </div>
                                    <div class="checkout-form-list">
                                        <h5 style="color: #00FF00"><%=request.getAttribute("msg")==null?"":request.getAttribute("msg")%></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6" style="margin-top: 20px">
                                <div class="checkout-form-list mb-30">
                                    <input type="submit" style="font-size: 20px;
    height: 40px;
    width: 103px;
    background: orange;
    border-radius: 5px;
    border: none;
    color: whitesmoke;" value="Đặt hàng">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="your-order">
                        <h3>Đơn đặt hàng của bạn</h3>
                        <%--@elvariable id="listCart" type="com.sun.java.accessibility.util.Translator"--%>
                        <c:if test="${listCart.size()==0}">
                            <h5>Bạn chưa có sản phẩm nào trong giỏ hàng</h5>
                        </c:if>
                        <c:if test="${listCart.size()!=0}">
                            <div class="your-order-table table-responsive">
                                <table>
                                    <thead>
                                    <tr>
                                        <th class="product-name">Sản phẩm</th>
                                        <th class="product-total">Tổng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <%--@elvariable id="product" type="bean.Product"--%>
                                    <c:forEach items="${listCart}" var="product">
                                    <tr class="cart_item">
                                        <td class="product-name">
                                                ${product.productName}<span
                                                class="product-quantity">   SL: ${product.quantityCart}</span>
                                        </td>
                                        <td class="product-total">
                                        <span class="amount"><fmt:formatNumber type="currency" currencySymbol=""
                                                                               minFractionDigits="0"
                                                                               value="${product.priceAfterSale*product.quantityCart}"></fmt:formatNumber></span>
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
                                                                                   value="${cart.total()}"/></span></td>
                                    </tr>
                                    <tr class="order-total">
                                        <th>Tổng đơn đặt hàng</th>
                                        <td><span class=" total amount"><fmt:formatNumber type="currency"
                                                                                          currencySymbol=""
                                                                                          minFractionDigits="0"
                                                                                          value="${cart.total()}"/></span>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>

                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- checkout-area end -->
    <!-- Support Area Start Here -->
    <%--      footer--%>
    <jsp:include page="footer.jsp"/>
    <!-- Footer Area End Here -->
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