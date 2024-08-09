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
<!DOCTYPE html>
<html>

<head>
    <title>Quản lý thành viên</title>
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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
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
                        <div class="muted pull-left">Quản lý thành viên</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <div class="table-toolbar">
                                <div class="btn-group">
                                    <a href="UpdateAbout?action=getadd"><button class="btn btn-success">Thêm thành viên <i class="icon-plus icon-white"></i></button></a>
                                </div>
                                <div class="btn-group pull-right">
                                    <button data-toggle="dropdown" class="btn dropdown-toggle">Công cụ <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">In</a></li>
                                        <li><a id="exportPDF">Lưu file PDF</a></li>
                                        <li><a onclick="exportTableToExcel('example2','products')">Xuất ra Excel</a></li>
                                    </ul>
                                </div>
                            </div>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="example2">
                                <thead>
                                <tr >
                                    <th class="align-middle">Họ tên</th>
                                    <th>Ngày sinh</th>
                                    <th>Vị trí</th>
                                    <th>Số điện thoại</th>
                                    <th width="12%">Email</th>
                                    <th width="12%">Hình ảnh</th>
                                    <th width="12%"></th>
                                    <th width="8%"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listA}" var="a">
                                <tr id="${a.id}">
                                    <td class="align-middle">${a.fullname}</td>
                                    <td>${a.birth}</td>
                                    <td>${a.position}</td>
                                    <td>${a.phone}</td>
                                    <td>${a.email}</td>
                                    <td><img src="${a.image}"></td>
                                    <td><a class="text-lock text-primary" href="UpdateAbout?action=getupdate&id=${a.id}"><span class="fas fa-edit"></span> Chỉnh sửa</a></td>
                                    <td><a class="text-danger"  href="UpdateAbout?action=delete&id=${a.id}"><span class="far fa-window-close"></span> Xóa</a></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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

<script type="text/javascript">
    $("body").on("click", "#exportPDF", function () {
        html2canvas($('#example2')[0], {
            onrendered: function (canvas) {
                var data = canvas.toDataURL();
                var docDefinition = {
                    content: [{
                        image: data,
                        width: 500,
                    }]
                };
                pdfMake.createPdf(docDefinition).download("products.pdf");
            }
        });
    });
</script>
<script>
    function exportTableToExcel(tableID, filename = ''){
        var downloadLink;
        var dataType = 'application/vnd.ms-excel';
        var tableSelect = document.getElementById(tableID);
        var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');

        // Specify file name
        filename = filename?filename+'.xlsx':'excel_data.xlsx';

        // Create download link element
        downloadLink = document.createElement("a");

        document.body.appendChild(downloadLink);

        if(navigator.msSaveOrOpenBlob){
            var blob = new Blob(['\ufeff', tableHTML], {
                type: dataType
            });
            navigator.msSaveOrOpenBlob( blob, filename);
        }else{
            // Create a link to the file
            downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

            // Setting the file name
            downloadLink.download = filename;

            //triggering the function
            downloadLink.click();
        }
    }
</script>
</body>

</html>
