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

<%@include file="header.jsp" %>

<!--BANNER START-->
<div class="log-in ptb-100 ptb-sm-60">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-12 d-flex justify-content-center align-items-center text-center">
                <div class="login-content">
                    <div class="login-table">
                        <section class="vh-100">
                            <div class="container py-5 h-100">
                                <div class="row d-flex align-items-center justify-content-center h-100">
                                    <div class="col-md-8 col-lg-7 col-xl-6">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
                                             class="img-fluid" alt="Phone image">
                                    </div>
                                    <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                                        <form class="register-form form-outline mb-4" id="" method="get"
                                              action="updateReset">
                                            <!-- Email input -->
                                            <span class="fw-bold mb-2 text-uppercase custom-title">ĐỔI MẬT KHẨU</span>
                                            <p style="color:#62ab00; display:block; margin: auto"><%=request.getAttribute("changePassSuccess") == null ? " " : request.getAttribute("changePassSuccess")%>
                                            </p>
                                            <p style="color:red; display:block; margin: auto"><%=request.getAttribute("inputEmpty") == null ? " " : request.getAttribute("inputEmpty")%>
                                            </p>
                                            <p style="color:red; display:block; margin: auto"><%=request.getAttribute("errUsername") == null ? " " : request.getAttribute("errUsername")%>
                                            </p>
                                            <div class="form-outline mb-4">
                                                <input type="email" class="form-control" id="email"
                                                       name="email"
                                                       value="<%=request.getParameter("email")==null ? "":request.getParameter("email")%>"
                                                       placeholder="Nhập địa chỉ email">
                                            </div>
                                            <!-- Password input -->
                                            <div class="form-outline mb-4">
                                                <input type="password" class="form-control"
                                                       id="password"
                                                       name="password"
                                                       placeholder="Nhập mật khẩu mới">
                                            </div>
                                            <!-- Submit button -->
                                            <div class="btn">
                                                <button type="submit" class="btn-primary btn-lg btn-block">LƯU THAY
                                                    ĐỔI
                                                </button>
                                            </div>
                                            <div class="message2">
                                                <a href="login.jsp"> Trở Về</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
        <!--BANNER END-->

        <%@include file="footer.jsp" %>

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
