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
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->

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
                    <li class="active"><a href="about.jsp">Giới thiệu</a></li>
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
                <div class="col-lg-6">
                    <div class="sidebar-img mb-all-30">
                        <img src="img\blog\10.jpg" alt="single-blog-img">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-desc">
                        <h3 class="mb-10 about-title">GIỚI THIỆU VỀ CỬA HÀNG HÀNG</h3>
                        <p class="mb-20">
                            Được thành lập vào năm 2020, TrueMart là Nhà Nhập khẩu & Phân phối Gạch Sứ Mỹ chính tại Việt
                            Nam, có thể cung cấp tất cả các yêu cầu về gạch ốp lát cho các công trình gia dụng, kiến
                            trúc, thiết kế nội thất và xây dựng.</p>
                        <h5 class="mb-10 about-title">NHIỆM VỤ</h5>
                        <p>Trở thành ĐỐI TÁC THẬT SỰ CỦA BẠN trong việc tạo kiểu dáng cho không gian của bạn với chất
                            lượng vững chắc và gạch lát nền, gạch ốp tường và gạch trang trí hợp thời trang của chúng
                            tôi.
                        </p>
                        <a href="#" class="return-customer-btn read-more">đọc nhiều hơn --></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Container End -->
    </div>
    <!-- About Us End Here -->
    <!-- About Us Team Start Here -->
    <div class="about-team pt-100 pt-sm-60">
        <%--@elvariable id="listA" type="java.util.List"--%>
        <div class="container">
            <h3 class="mb-30 about-title">Đội ngũ độc quyền của chúng tôi</h3>
            <div class="row text-center">
                <c:forEach items="${listA}" var="a">
                    <!-- Single Team Start Here -->
                    <div class="col-xl-3 mb-5" id="team">
                        <div class="single-team mb-all-30">
                            <div class="team-img sidebar-img">
                                <img src="${a.image}" alt="team-image">
                                <div class="team-link">
                                    <ul>
                                        <li><a href="${a.facebook}"><i class="fa fa-facebook"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="team-info">
                                <h4>${a.fullname}</h4>
                                <p>${a.position}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <!-- Single Team End Here -->
                <!-- Single Team Start Here -->
            </div>
        </div>
        <!-- Container End -->
    </div>
    <!-- About Us Team End Here -->
    <!-- About Us Skills Start Here -->
    <div class="about-skill ptb-100 ptb-sm-60">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <h3 class="about-title mb-20">Đáp ứng sự hoàn hảo</h3>

                    <div class="skill-progress mb-all-40">
                        <div class="progress">
                            <div class="skill-title">Chất lượng 90%</div>
                            <div class="progress-bar wow fadeInLeft" data-wow-delay="0.2s" role="progressbar"
                                 style="width: 90%; visibility: visible; animation-delay: 0.2s; animation-name: fadeInLeft;">
                            </div>
                        </div>
                        <div class="progress">
                            <div class="skill-title">Độ bền và thẩm mĩ 96%</div>
                            <div class="progress-bar wow fadeInLeft" data-wow-delay="0.3s" role="progressbar"
                                 style="width: 96%; visibility: visible; animation-delay: 0.3s; animation-name: fadeInLeft;">
                            </div>
                        </div>
                        <div class="progress">
                            <div class="skill-title">Độ an toàn 95%</div>
                            <div class="progress-bar wow fadeInLeft" data-wow-delay="0.4s" role="progressbar"
                                 style="width: 95%; visibility: visible; animation-delay: 0.4s; animation-name: fadeInLeft;">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="ht-single-about">
                        <h3 class="about-title mb-20">công việc của chúng tôi</h3>
                        <div class="ht-about-work">
                            <span>1</span>
                            <div class="ht-work-text">
                                <h5><a href="#">lời cam kết</a></h5>
                                <p>Chất lượng tốt, hướng đến khách hàng, sự uy tín.</p>
                            </div>
                        </div>
                        <div class="ht-about-work">
                            <span>2</span>
                            <div class="ht-work-text">
                                <h5><a href="#">tuyển dụng</a></h5>
                                <p>Chúng tôi đang tìm kiếm ứng viên tài năng cho vị trí Giám đốc kinh doanh dự án với
                                    chế độ phúc lợi tốt và thưởng cao. Nếu bạn quan tâm, vui lòng gửi CV của bạn đến
                                    email của chúng tôi như sau: vphanhchinh@hcmuaf.edu.vn.</p>
                            </div>
                        </div>
                        <div class="ht-about-work">
                            <span>3</span>
                            <div class="ht-work-text">
                                <h5><a href="#">hợp tác</a></h5>
                                <p>Chúng tôi hoan nghênh mọi hợp tác kinh doanh / tiếp thị với các công ty thiết kế nội
                                    thất, kiến trúc và xây dựng ... Nếu bạn quan tâm, vui lòng liên hệ với chúng tôi
                                    theo địa chỉ email sau: vphanhchinh@hcmuaf.edu.vn.</p>
                            </div>
                        </div>
                    </div>
                </div>
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