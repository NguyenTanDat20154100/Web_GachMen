<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đăng ký || Truemart Gạch men cao cấp</title>
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
    <jsp:include page="header.jsp"/>
    <!-- Breadcrumb Start -->
    <div class="breadcrumb-area mt-30">
        <div class="container">
            <div class="breadcrumb">
                <ul class="d-flex align-items-center">
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li class="active"><a href="register.jsp">Đăng kí</a></li>
                </ul>
            </div>
        </div>
        <!-- Container End -->
    </div>
    <!-- Breadcrumb End -->
    <!-- Register Account Start -->
    <div class="register-account ptb-100 ptb-sm-60">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="register-title">
                        <h3 class="mb-10">ĐĂNG KÍ TÀI KHOẢN</h3>
                        <p class="mb-10">Nếu bạn chưa có tài khoản, vui lòng đăng kí tại đây.</p>
                    </div>
                </div>
            </div>
            <!-- Row End -->
            <div class="row">
                <div class="col-sm-12">
                    <form class="form-register" method="post" action="register">
                        <fieldset>
                            <legend>Thông tin cá nhân</legend>
                            <div class="form-group d-md-flex align-items-md-center">
                                <label class="control-label col-md-2" for="f-name"><span class="require">*</span>Họ và Tên</label>
                                <div class="col-md-10">
                                    <input type="text" class="form-control" value="<%=request.getParameter("name")==null ? "":request.getParameter("name")%>" name="name" id="f-name" placeholder="Vui lòng nhập họ và tên..">
                                </div>
                            </div>
                            <div class="form-group d-md-flex align-items-md-center">
                                <label class="control-label col-md-2" for="l-name"><span class="require">*</span>Tên đăng nhập </label>
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="l-name"value="<%=request.getParameter("username")==null ? "":request.getParameter("username")%>" name="username" placeholder="vui lòng nhập tên">
                                </div>
                            </div>
                            <div class="form-group d-md-flex align-items-md-center">
                                <label class="control-label col-md-2" for="email"><span class="require">*</span>Email</label>
                                <div class="col-md-10">
                                    <input type="email" class="form-control"value="<%=request.getParameter("email")==null ? "":request.getParameter("email")%>" name="email" id="email" placeholder="Nhập địa chỉ email...">
                                </div>
                            </div>
                            <div class="form-group d-md-flex align-items-md-center">
                                <label class="control-label col-md-2" for="number"><span class="require">*</span>Số điện thoại</label>
                                <div class="col-md-10">
                                    <input type="text" class="form-control" value="<%=request.getParameter("phone")==null ? "":request.getParameter("phone")%>" name="phone" id="number" placeholder="Số điện thoại">
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>Cài đặt mật khẩu</legend>
                            <div class="form-group d-md-flex align-items-md-center">
                                <label class="control-label col-md-2" for="pwd"><span class="require">*</span>Mật khẩu:</label>
                                <div class="col-md-10">
                                    <input type="password" class="form-control" value="<%=request.getParameter("password")==null ? "":request.getParameter("password")%>" name="password" id="pwd" placeholder="Mật khẩu">
                                </div>
                            </div>
                            <div class="form-group d-md-flex align-items-md-center">
                                <label class="control-label col-md-2" for="pwd-confirm"><span class="require">*</span>Xác nhận mật khẩu</label>
                                <div class="col-md-10">
                                    <input type="password" class="form-control" id="pwd-confirm" placeholder="Nhập lại mật khẩu...">
                                </div>
                            </div>
                            <p style="color:#62ab00; display:block; margin: auto"><%=request.getAttribute("success") == null ? " " : request.getAttribute("success")%>
                            </p>
                            <p style="color:red; display:block; margin: auto"><%=request.getAttribute("msg") == null ? " " : request.getAttribute("msg")%>
                            </p>

                        </fieldset>

                        <div class="terms">
                            <div class="float-md-right">
                                <span>Tôi đã đọc và đồng ý <a href="#" class="agree"><b>chính sách bảo mật của cửa hàng</b></a></span>
                                <input type="checkbox" name="agree" value="1"> &nbsp;
                                <input type="submit" value="Tiếp tục" class="return-customer-btn">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- Row End -->
        </div>
        <!-- Container End -->
    </div>
    <!-- Register Account End -->
    <!-- Support Area Start Here -->
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