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
    <title>Quản lý đơn hàng</title>
    <!-- Bootstrap -->
    <meta charset="utf-8">
    <link href="admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="admin/assets/styles.css" rel="stylesheet" media="screen">
    <link href="admin/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
                        <div class="muted pull-left">Quản lý đơn hàng</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <div class="table-toolbar">
                                <div class="btn-group" style="visibility: hidden">
                                    <a href="#"><button class="btn btn-success"><i class="icon-plus icon-white"></i></button></a>
                                </div>
                                <div class="btn-group pull-right">
                                    <button data-toggle="dropdown" class="btn dropdown-toggle">Công cụ <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">In</a></li>
                                        <li><a id="exportPDF">Lưu file PDF</a></li>
                                        <li><a onclick="exportTableToExcel('example2','orders')">Xuất ra Excel</a></li>
                                    </ul>
                                </div>
                            </div>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="example2">
                                <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Tên khách hàng</th>
                                    <th>Tổng đơn hàng</th>
                                    <th>Ngày đặt</th>
                                    <th>Trạng thái</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--@elvariable id="listO" type="java.util.List"--%>
                                <c:forEach items="${listO}" var="o">
                                    <tr id="${o.orderID}">
                                        <td>${o.orderID}</td>
                                        <td>${o.fullName}</td>
                                        <td><fmt:formatNumber type="currency" currencySymbol="" minFractionDigits="0" value="${o.totalPrice}"/> VNĐ</td>
                                        <td>${o.createDate}</td>
                                        <td id="orderstatus"><c:if test="${o.status ==1}">Đã xử lý</c:if>
                                            <c:if test="${o.status ==0}">Chưa xử lý</c:if></td>
                                        <td id="rowupdate"><c:if test="${o.status ==1}"></c:if>
                                            <c:if test="${o.status ==0}"><a id="linkupdate" href="UpdateOrder?action=update&id=${o.orderID}">
                                                <span class="fas fa-shipping-fast"></span> Xử lý</a></c:if></td>
                                        <td><a href="ListOrderDetailAd?id=${o.orderID}&fullName=${o.fullName}&address=${o.address}&phone=${o.phone}&createDate=${o.createDate}&total=${o.totalPrice}">
                                            <span class="fas fa-address-book"></span> Xem chi tiết</a></td>
                                        <td><a class="text-danger" href="UpdateOrder?action=delete&id=${o.orderID}" ><span class="far fa-window-close"></span> Xóa</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div id="id01" class="modal">
                                <!-- Modal Content -->
                                <form class="modal-content animate">
                    <span onclick="document.getElementById('id01').style.display='none'"
                          class="close" title="Close Modal">&times;</span>
                                    <div class="header-modal"><h3>Bạn có chắc là muốn xóa đơn hàng này</h3></div>
<%--                                    <input id="delete" name="action" style="display: none" value="delete">--%>
                                    <input id="deleteval" name="id" style="display: none">
                                    <div class="button-group">
                                        <button id="btnDelete" class="btn-yes" type="button" onclick="document.getElementById('id01').style.display='none'">Có</button>
                                        <button class="btn-no" type="button" onclick="document.getElementById('id01').style.display='none'">Không</button>
                                    </div>
                                </form>
                            </div>
                            <div id="id02" class="modal">
                                <!-- Modal Content -->
                                <form class="modal-content animate">
                    <span onclick="document.getElementById('id01').style.display='none'"
                          class="close" title="Close Modal">&times;</span>
                                    <div class="header-modal"><h3>Bạn có chắc là muốn xử lý đơn hàng này</h3></div>
                                    <%--                                    <input id="delete" name="action" style="display: none" value="delete">--%>
                                    <input id="updateval" name="id" style="display: none">
                                    <div class="button-group">
                                        <button id="btnUpdate" class="btn-yes" type="button" onclick="document.getElementById('id02').style.display='none'">Có</button>
                                        <button class="btn-no" type="button" onclick="document.getElementById('id02').style.display='none'">Không</button>
                                    </div>
                                </form>
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

<script src="admin/vendors/jquery-1.9.1.js"></script>
<script src="admin/bootstrap/js/bootstrap.min.js"></script>
<script src="admin/vendors/datatables/js/jquery.dataTables.min.js"></script>


<script src="admin/assets/scripts.js"></script>
<script src="admin/assets/DT_bootstrap.js"></script>
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
    // // Get the modal
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
            var href= $(this).attr("href")
            $("#deleteval").attr("value",href)
            document.getElementById('id01').style.display='block'
        });
        $("#linkupdate").click(function (){
            var href= $(this).attr("href")
            $("#updateval").attr("value",href)
            document.getElementById('id02').style.display='block'
        });
    })
</script>
<script>
    $(document).ready(function (){
        $("#btnDelete").click(function (){
            var id = $("#deleteval").attr("value");
            $.ajax({
                type: "GET",
                data: {
                    action: "delete",
                    id: id
                },
                url: "/project_BookStore/ListOrderAd"
            })
            $("#"+id).remove();
        });
        $("#btnUpdate").click(function (){
            var id = $("#updateval").attr("value");
            $.ajax({
                type: "GET",
                data: {
                    action: "update",
                    id: id
                },
                url: "/project_BookStore/ListOrderAd"
            })
            $("#"+id).children("#rowupdate").children().remove();
            $("#"+id).children("#orderstatus").text("Đã xử lý");
        });
    })
</script>
<script type="text/javascript">
    $("body").on("click", "#exportPDF", function () {
        html2canvas($('#example2')[0], {
            onrendered: function (canvas) {
                var data = canvas.toDataURL();
                var docDefinition = {
                    content: [{
                        image: data,
                        width: 500
                    }]
                };
                pdfMake.createPdf(docDefinition).download("Order.pdf");
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
        filename = filename?filename+'.xls':'excel_data.xls';

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
