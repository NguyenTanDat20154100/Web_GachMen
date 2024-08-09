<%--@elvariable id="product" type="bean.Product"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Chi tiết sản phẩm || Truemart gạch men cao cấp</title>
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
    <!--[if lte IE 9]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
	<![endif]-->

    <!-- Main Wrapper Start Here -->
    <div class="wrapper">
        <!-- Banner Popup Start -->
       <jsp:include page="header.jsp"/>
        <!-- Categorie Menu & Slider Area End Here -->
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-area mt-30">
            <div class="container">
                <div class="breadcrumb">
                    <ul class="d-flex align-items-center">
                        <li><a href="indexHome">Trang chủ</a></li>
                        <li><a href="ProductLists">Sản phẩm</a></li>
                        <li class="active"><a href="product-detail.jsp">Chi tiết sản phẩm</a></li>
                    </ul>
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Breadcrumb End -->
        <!-- Product Thumbnail Start -->
        <div class="main-product-thumbnail ptb-100 ptb-sm-60">
            <div class="container">
                <div class="thumb-bg">
                    <div class="row">
                        <!-- Main Thumbnail Image Start -->
                        <div class="col-lg-5 mb-all-40">
                            <!-- Thumbnail Large Image start -->
                            <div class="tab-content">
                                <div id="thumb1" class="tab-pane fade show active">
                                    <a data-fancybox="images" href="${product.image1}"><img src="${product.image1}" alt="product-view"></a>
                                </div>
                                <div id="thumb2" class="tab-pane fade">
                                    <a data-fancybox="images" href="${product.image2}"><img src="${product.image2}" alt="product-view"></a>
                                </div>

                            </div>
                            <!-- Thumbnail Large Image End -->
                            <!-- Thumbnail Image End -->
                            <div class="product-thumbnail mt-15">
                                <div class="thumb-menu owl-carousel nav tabs-area" role="tablist">
                                    <a class="active" data-toggle="tab" href="#thumb1"><img src="${product.image1}" alt="product-thumbnail"></a>
                                    <a data-toggle="tab" href="#thumb2"><img src="${product.image2}" alt="product-thumbnail"></a>

                                </div>
                            </div>
                            <!-- Thumbnail image end -->
                        </div>
                        <!-- Main Thumbnail Image End -->
                        <!-- Thumbnail Description Start -->
                        <div class="col-lg-7">
                            <div class="thubnail-desc fix">
                                <h3 class="product-header">${product.productName}</h3>
                                <div class="rating-summary fix mtb-10">
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <!-- <div class="rating-feedback">
                                        <a href="#">(1 review)</a>
                                        <a href="#">add to your review</a>
                                    </div> -->
                                </div>

                                <div class="pro-price mtb-30">
                                    <p class="d-flex align-items-center"><span class="price"><fmt:formatNumber type="currency" currencySymbol="" minFractionDigits="0" value="${product.price-Math.round(product.price*(product.salePrice/100))}"/> VNĐ</span></p>
                                </div>
                                <div class="color clearfix mb-20">
                                    <label>Ứng dụng</label>
                                    <p>${product.description}</p>
                                    <!-- <ul class="color-list">
                                        <li>
                                            <a class="orange active" href="#">Lát nền</a>
                                        </li>
                                        <li>
                                            <a class="paste" href="#">Ốp tường</a>
                                        </li>
                                    </ul> -->
                                </div>
                                <c:if test="${product.status!=0}">
                                <div class="box-quantity d-flex hot-product2">

                                    <div class="pro-actions">
                                        <div class="actions-primary">
                                            <c:url value="/addCart?productID=${product.productID}"
                                                   var="addCart"/>
                                            <a href="${addCart}" title="" data-original-title="Thêm vào giỏ"> + Thêm vào giỏ</a>
                                        </div>
                                        <div class="actions-primary">
                                            <c:url value="/buyNow?productID=${product.productID}"
                                                   var="buyNow"/>
                                            <a href="buyNow" title="" data-original-title="Mua ngay">Mua ngay</a>
                                        </div>
                                        <div class="actions-secondary">
                                            <!-- <a href="compare.html" title="" data-original-title="Compare"><i class="lnr lnr-sync"></i> <span>Thêm so sánh</span></a> -->
                                            <!-- <a href="wishlist.html" title="" data-original-title="WishList"><i class="lnr lnr-heart"></i> <span>Thêm vào danh sách yêu thích</span></a> -->
                                        </div>
                                    </div>
                                </div>
                                <div class="pro-ref mt-20">
                                    <p><span class="in-stock"><i class="ion-checkmark-round"></i>Còn ${product.quantity}</span></p>
                                </div>
                                </c:if>
                                <c:if test="${product.status==0}">
                                    <div class="pro-ref mt-20">
                                        <p><span class="in-stock"><i class="ion-close-round" style="color: red"></i>Hết hàng</span></p>
                                    </div>
                                </c:if>
<%--                                <div class="socila-sharing mt-25">--%>
<%--                                    <ul class="d-flex">--%>
<%--                                        <li>Chia sẻ</li>--%>
<%--                                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>--%>
<%--                                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>--%>
<%--                                        <li><a href="#"><i class="fa fa-google-plus-official" aria-hidden="true"></i></a></li>--%>
<%--                                        <li><a href="#"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                        <!-- Thumbnail Description End -->
                    </div>
                    <!-- Row End -->
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Product Thumbnail End -->
        <!-- Product Thumbnail Description Start -->
        <div class="thumnail-desc pb-100 pb-sm-60">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <ul class="main-thumb-desc nav tabs-area" role="tablist">
                            <li><a class="active" data-toggle="tab" href="#dtail">Thông tin sản phẩm</a></li>
                            <li><a data-toggle="tab" onclick="url('https://animevietsub.pro/')" href="#review">Đánh giá</a></li>
                        </ul>
                        <!-- Product Thumbnail Tab Content Start -->
                        <div class="tab-content thumb-content border-default">
                            <div id="dtail" class="tab-pane fade show active">
                                <table id="product-list">
                                    <tbody>
                                        <tr id="product-list-table1">
                                            <th id="product-item-label1">Bề mặt: </th>
                                            <td id="product-item-value1">
                                                <p>Mờ.</p>
                                            </td>
                                        </tr>
                                        <tr id="product-list-table2">
                                            <th id="product-item-label2">Kích thước: </th>
                                            <td id="product-item-value2">
                                                <p>600x600mm.</p>
                                            </td>
                                        </tr>
                                        <tr id="product-list-table3">
                                            <th id="product-item-label3">Kiểu vân: </th>
                                            <td id="product-item-value3">
                                                <p>Bê tông.</p>
                                            </td>
                                        </tr>
                                        <tr id="product-list-table4">
                                            <th id="product-item-label4">Không gian: </th>
                                            <td id="product-item-value4">
                                                <p>Phòng ngủ, Phòng bếp, Phòng khách, Phòng tắm</p>
                                            </td>
                                        </tr>
                                        <tr id="product-list-table5">
                                            <th id="product-item-label5">Phân loại: </th>
                                            <td id="product-item-value5">
                                                <p>Đá.</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="review" class="tab-pane fade">
                                <!-- Reviews Start -->
                                <div class="review border-default universal-padding">
                                    <div class="group-title">
                                        <h2>Đánh giá của khách hàng</h2>
                                    </div>
                                    <%--@elvariable id="listReview" type="java.util.List"--%>
                                    <c:forEach items="${listReview}" var="r">
                                        <h4>${r.userName}</h4>
                                        <h6>${r.postDate}</h6>
                                        <p>${r.content}</p>
                                    </c:forEach>
                                </div>
                                <!-- Reviews End -->
                                <!-- Reviews Start -->
                                <div class="review border-default universal-padding mt-30">
                                    <h2 class="review-title mb-30">Bạn đang đánh giá: <br><span>sản phẩm tốt, nhưng giá hơi đắt.</span></h2>
                                    <!-- Reviews Field Start -->
                                    <div class="riview-field mt-40">
                                        <form class="form-group" action="reviewProduct" method="get">
                                            <div class="form">
                                                <label class="req" for="username">Tên tài khoản</label>
                                                <input type="text" class="form-control" id="username" name="username" required="required">
                                                <input type="hidden" class="form-control" id="id" name="productID" value="${product.productID}">
                                            </div>
<%--                                            <div class="form-group">--%>
<%--                                                <label class="req" for="subject">Bảng tóm tắt</label>--%>
<%--                                                <input type="text" class="form-control" id="subject" required="required">--%>
<%--                                            </div>--%>
                                            <div class="form">
                                                <label class="req" for="comments">Đánh giá</label>
                                                <textarea class="form-control" rows="5" id="comments" name="comments" required="required"></textarea>
                                            </div>
                                            <button type="submit" class="customer-btn" onclick="reviews()">Gửi</button>
                                        </form>
                                    </div>
                                    <!-- Reviews Field Start -->
                                </div>
                                <!-- Reviews End -->
                            </div>
                        </div>
                        <!-- Product Thumbnail Tab Content End -->
                    </div>
                </div>
                <!-- Row End -->
            </div>
            <!-- Container End -->
        </div>
        <!-- Product Thumbnail Description End -->
        <!-- Realted Products Start Here -->

        <!-- Realated Products End Here -->
        <!-- Support Area Start Here -->
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
<script>   function reviews(){
    var me = $('#comments').val();
    if(me === ''){

    }
    else {
        alert("Đánh giá thành công");
    }
}
</script>
</body>

</html>