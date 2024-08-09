
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đăng nhập || Truemart Gạch men cao cấp</title>
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

<%@include file="header.jsp"%>

<!--BANNER START-->
<div class="log-in ptb-100 ptb-sm-60">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-12 d-flex justify-content-center align-items-center text-center">
                <div class="login-content">
                    <div class="login-table">
                        <%-- NEW PASSWORD  --%>
                        <form class="register-form" id="">
                            <span class="login-heading">
                                <p style="color:#1b1e21; display:block; margin: auto"><%=request.getAttribute("title")==null ?" ":request.getAttribute("title")%></p>
                            </span>
                            <p style="color:#62ab00; display:block; margin: auto"><%=request.getAttribute("message")==null ?" ":request.getAttribute("message")%></p>
                            <p style="color:red; display:block; margin: auto"><%=request.getAttribute("err")==null ?" ":request.getAttribute("err")%></p>
                            <p style="color:red; display:block; margin: auto"><%=request.getAttribute("expiredMessage")==null ?" ":request.getAttribute("expiredMessage")%></p>

                            <div class="btn">
                                <label>Thay đổi mật khẩu thành công!!!</label>
                                <button class="form-btn mb-10" ><a href="http://localhost:8080//GachMen_Store_war/login.jsp"> Trở Về</a></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--BANNER END-->

<%@include file="footer.jsp"%>

<script src="vendor\js\bundle.min.js"></script>
<!-- Plugin Js -->
<script src="vendor/js/jquery-3.5.1.min.js"></script>
<script src="vendor\js\jquery.fancybox.min.js"></script>
<script src="vendor\js\owl.carousel.min.js"></script>
<script src="vendor\js\swiper.min.js"></script>
<script src="vendor\js\jquery.cubeportfolio.min.js"></script>
<script src="vendor\js\wow.min.js"></script>
<script src="vendor\js\bootstrap-input-spinner.js"></script>
<script src="vendor\js\parallaxie.min.js"></script>
<!-- Custom Script -->
<script src="js/script.js"></script>
</body>
</html>
