<%@ page import="bean.User" %>
<%@ page import="java.util.Collection" %>
<%@ page import="model.UserSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    UserSession u = UserSession.getUS(session);
    Collection<User> user = u.getUser();
    String username = u.getUserName();
    if(username.equalsIgnoreCase("")||!user.iterator().next().accept("admin.index")) response.sendRedirect("http://localhost:8080/GachMen_Store_war/Home");
%>
<c:set var="username" value="<%=username%>"/>
<!DOCTYPE html>
<html>

<head>
    <title>Chi tiết đơn hàng</title>
    <!-- Bootstrap -->
    <meta charset="utf-8">
    <link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/admin/assets/styles.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <style>

    </style>
</head>

<body>
<jsp:include page="headerAd.jsp"/>
<div class="container-fluid">
    <div class="row-fluid">
        <jsp:include page="menu.jsp"/>
        <!--/span-->
        <div class="span9" id="content">
            <div class="row-fluid">
                <!-- block -->
                <div class="block">
                    <div class="navbar navbar-inner block-header">
                        <div class="muted pull-left">Chi tiết đơn hàng</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <div class="info-user">
                                <h5><a style="color: blue">Họ và tên:</a> <%=request.getParameter("fullName")%></h5>
                                <h5><a style="color: blue">Địa chỉ:</a> <%=request.getParameter("address")%></h5>
                                <h5><a style="color: blue">Số điện thoại:</a> <%=request.getParameter("phone")%></h5>
                                <h5><a style="color: blue">Ngày đặt hàng:</a> <%=request.getParameter("createDate")%></h5>
                            </div>
                            <div class="table-toolbar">
                                <div class="btn-group" style="visibility: hidden">
                                    <a href="#"><button class="btn btn-success"><i class="icon-plus icon-white"></i></button></a>
                                </div>
                                <div class="btn-group pull-right">
                                    <button data-toggle="dropdown" class="btn dropdown-toggle">Công cụ <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">In</a></li>
                                        <li><a href="#">Lưu file PDF</a></li>
                                        <li><a href="#">Xuất ra Excel</a></li>
                                    </ul>
                                </div>
                            </div>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="example2">
                                <thead>
                                <tr>
                                    <th>Tên Gạch</th>
                                    <th>Số lượng</th>
                                    <th>Giá tiền</th>

                                </tr>
                                </thead>
                                <tbody>
                                <%--@elvariable id="listOrderDetails" type="java.util.List"--%>
                                <c:forEach items="${listOrderDetails}" var="orderDetail">
                                <tr>
                                    <td>${orderDetail.nameProduct}</td>
                                    <td>${orderDetail.productQuantity}</td>
                                    <td><fmt:formatNumber type="currency" currencySymbol="" minFractionDigits="0" value="${orderDetail.priceProduct}"/> VNĐ</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="info-price">
                                <div><h5><a style="color: blue">Tổng tiền:</a>  <fmt:formatNumber type="currency" currencySymbol="" minFractionDigits="0" value="${total}"/> VNĐ</h5></div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- /block -->
            </div>
        </div>
    </div>
    <hr>
    <jsp:include page="footerAd.jsp"/>
</div>
<!--/.fluid-container-->

<script src="${pageContext.request.contextPath}/admin/vendors/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/vendors/datatables/js/jquery.dataTables.min.js"></script>


<script src="${pageContext.request.contextPath}/admin/assets/scripts.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/DT_bootstrap.js"></script>
<script>
    // $(document).ready( function () {
    //     $('#example2').DataTable();
    // } );
</script>
<script>
    // Get the modal
    var modal = document.getElementById('id01');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    // Get the modal
    var modal2 = document.getElementById('id02');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal2) {
            modal2.style.display = "none";
        }
    }
</script>
<script>
    $(document).ready(function (){
        $(".text-danger").click(function (){
            document.getElementById('id01').style.display='block'
        });
        $(".text-lock").click(function (){
            document.getElementById('id02').style.display='block'
        });
    })
</script>
</body>

</html>
