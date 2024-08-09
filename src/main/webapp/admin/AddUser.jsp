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
    <title><c:choose>
        <c:when test="${param.action eq 'getadd'}">Thêm</c:when>
        <c:when test="${param.action eq 'getupdate'}">Chỉnh sửa</c:when>
        <c:when test="${param.action eq 'add'}">Thêm </c:when>
        <c:when test="${param.action eq 'update'}">Chỉnh sửa </c:when>
    </c:choose>
        tài khoản</title>
    <!-- Bootstrap -->
    <meta charset="utf-8">
    <link href="admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="admin/assets/styles.css" rel="stylesheet" media="screen">
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
                        <div class="muted pull-left">
                            <c:choose>
                                <c:when test="${param.action eq'getadd'}">Thêm </c:when>
                                <c:when test="${param.action eq 'getupdate'}">Chỉnh sửa </c:when>
                                <c:when test="${param.action eq 'add'}">Thêm </c:when>
                                <c:when test="${param.action eq 'update'}">Chỉnh sửa </c:when>
                            </c:choose>tài </div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <h4 style="color: red"> <%=request.getAttribute("err")==null? "":request.getAttribute("err")%></h4>
                            <form class="form-horizontal" action="AddOfUpdateUser" method="get">
                                <fieldset>
                                    <legend><c:choose>
                                        <c:when test="${param.action eq 'getadd'}">Thêm </c:when>
                                        <c:when test="${param.action eq 'getupdate'}">Chỉnh sửa </c:when>
                                        <c:when test="${param.action eq 'add'}">Thêm </c:when>
                                        <c:when test="${param.action eq 'update'}">Chỉnh sửa </c:when>
                                    </c:choose>tài khoản</legend>
                                    <input style="display: none" name="action" value="<c:choose><c:when test="${param.action eq 'getadd'}">add</c:when><c:when test="${param.action eq 'getupdate'}">update</c:when><c:when test="${param.action eq 'add'}">add</c:when><c:when test="${param.action eq 'update'}">update</c:when></c:choose>">
                                    <c:choose>
                                        <c:when test="${param.action eq 'getupdate'}"><input style="display: none" name="id" value="<%=request.getParameter("id")%>"></c:when>
                                        <c:when test="${param.action eq 'update'}"><input style="display: none" name="id" value="<%=request.getParameter("id")%>"></c:when>
                                    </c:choose>
                                    <div class="control-group">
                                        <label class="control-label" for="fullname">Họ và tên </label>
                                        <div class="controls">
                                            <input type="text" name="fullname" class="span6" id="fullname" placeholder="Nhập họ và tên"
                                            value="<%=request.getParameter("fullname")==null? "":request.getParameter("fullname")%>">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="phone">Số điện thoại </label>
                                        <div class="controls">
                                            <input type="number" name="phone" class="span6" id="phone" placeholder="Nhập số điện thoại"
                                                   value="<%=(request.getParameter("phone")==null||request.getParameter("phone").equals("null")) ? "":request.getParameter("phone")%>">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="username">Tên đăng nhập (*) </label>
                                        <div class="controls">
                                            <input type="text" name="username" class="span6" id="username" placeholder="Nhập tên đăng nhập"
                                                   value="<%=request.getParameter("username")==null? "":request.getParameter("username")%>" <c:choose><c:when test="${param.action eq 'getupdate'}">readonly</c:when><c:when test="${param.action eq 'update'}">readonly</c:when></c:choose>>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="email">Email </label>
                                        <div class="controls">
                                            <input type="text" name="email" class="span6" id="email" placeholder="Nhập email"
                                                   value="<%=(request.getParameter("email")==null||request.getParameter("email").equals("null")) ? "":request.getParameter("email")%>">
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="password">Mật khẩu (*) </label>
                                        <div class="controls">
                                            <input type="password" name="password" class="span6" id="password" placeholder="Nhập mật khẩu"
                                                   value="<%=request.getParameter("password")==null? "":request.getParameter("password")%>">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="status">Trạng thái(*)</label>
                                        <div class="controls">
                                            <select id="status" class="chzn-select" name="status">
                                                <option value="1"<c:if test="${param.status eq '1'}">selected="selected"</c:if>>Mở hoạt động</option>
                                                <option value="0"<c:if test="${param.status eq '0'}">selected="selected"</c:if>>Tắt hoạt động</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="permission">Quyền truy cập (*)</label>
                                        <div class="controls">
                                            <select id="permission" class="chzn-select" name="permission">
                                                <option value="0"<c:if test="${param.permission eq '0'}">selected="selected"</c:if>>User</option>
                                                <option value="1"<c:if test="${param.permission eq '1'}">selected="selected"</c:if>>Admin</option>
                                                <option value="1"<c:if test="${param.permission eq '3'}">selected="selected"readonly</c:if>>Boss</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-actions">
                                        <button type="submit" class="btn btn-primary"><c:choose><c:when test="${param.action eq 'getadd'}">Thêm </c:when><c:when test="${param.action eq 'getupdate'}">Chỉnh sửa </c:when><c:when test="${param.action eq 'add'}">Thêm </c:when><c:when test="${param.action eq 'update'}">Chỉnh sửa </c:when></c:choose>Tài khoản</legend></button>
                                    </div>
                                </fieldset>
                            </form>
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
<link href="admin/vendors/datepicker.css" rel="stylesheet" media="screen">
<link href="admin/vendors/uniform.default.css" rel="stylesheet" media="screen">
<link href="admin/vendors/chosen.min.css" rel="stylesheet" media="screen">

<link href="admin/vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">

<script src="admin/vendors/jquery-1.9.1.js"></script>
<script src="admin/bootstrap/js/bootstrap.min.js"></script>
<script src="admin/vendors/jquery.uniform.min.js"></script>
<script src="admin/vendors/chosen.jquery.min.js"></script>
<script src="admin/vendors/bootstrap-datepicker.js"></script>

<script src="admin/vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
<script src="admin/vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

<script src="admin/vendors/wizard/jquery.bootstrap.wizard.min.js"></script>

<script type="text/javascript" src="Admin/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="admin/assets/form-validation.js"></script>

<script src="admin/assets/scripts.js"></script>
<script>

    jQuery(document).ready(function() {
        FormValidation.init();
    });


    $(function() {
        $(".datepicker").datepicker();
        $(".uniform_on").uniform();
        $(".chzn-select").chosen();
        $('.textarea').wysihtml5();

        $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index+1;
                var $percent = ($current/$total) * 100;
                $('#rootwizard').find('.bar').css({width:$percent+'%'});
                // If it's the last tab then hide the last button and show the finish instead
                if($current >= $total) {
                    $('#rootwizard').find('.pager .next').hide();
                    $('#rootwizard').find('.pager .finish').show();
                    $('#rootwizard').find('.pager .finish').removeClass('disabled');
                } else {
                    $('#rootwizard').find('.pager .next').show();
                    $('#rootwizard').find('.pager .finish').hide();
                }
            }});
        $('#rootwizard .finish').click(function() {
            alert('Finished!, Starting over!');
            $('#rootwizard').find("a[href*='tab1']").trigger('click');
        });
    });
</script>
</body>

</html>
