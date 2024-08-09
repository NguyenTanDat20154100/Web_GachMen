<%@ page import="bean.User" %>
<%@ page import="java.util.Collection" %>
<%@ page import="model.UserSession" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    UserSession u = UserSession.getUS(session);
    Collection<User> user = u.getUser();
    String username = u.getUserName();
    if(username.equalsIgnoreCase("")||!user.iterator().next().accept("admin.index")) response.sendRedirect("http://localhost:8080/project_BookStore/Home");
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
        thành viên</title>
    <!-- Bootstrap -->
    <meta charset="utf-8">
    <link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/admin/assets/styles.css" rel="stylesheet" media="screen">
    <!--[if lte IE 8]>
    <script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<body>
<jsp:include page="headerAd.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row-fluid">
        <!--/span--><jsp:include page="menu.jsp"></jsp:include>
        <div class="span9" id="content">
            <!-- block -->
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">
                        <c:choose>
                            <c:when test="${param.action eq 'getadd'}">Thêm</c:when>
                            <c:when test="${param.action eq 'getupdate'}">Chỉnh sửa</c:when>
                            <c:when test="${param.action eq 'add'}">Thêm </c:when>
                            <c:when test="${param.action eq 'update'}">Chỉnh sửa</c:when>
                        </c:choose> thành viên
                    </div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <h4 style="color: red"><%=request.getAttribute("err") == null ? "" : request.getAttribute("err")%>
                        </h4>
                        <form class="form-horizontal" action="UpdateAbout" method="get">
                            <fieldset>
                                <legend><c:choose>
                                    <c:when test="${param.action eq'getadd'}">Thêm</c:when>
                                    <c:when test="${param.action eq 'getupdate'}">Chỉnh sửa</c:when>
                                    <c:when test="${param.action eq 'add'}">Thêm </c:when>
                                    <c:when test="${param.action eq 'update'}">Chỉnh sửa </c:when>
                                </c:choose> thành viên
                                </legend>
                                <input style="display: none" name="action"
                                       value="<c:choose><c:when test="${param.action eq 'getadd'}">add</c:when><c:when test="${param.action eq 'getupdate'}">update</c:when><c:when test="${param.action eq 'add'}">add</c:when><c:when test="${param.action eq 'update'}">update</c:when></c:choose>">
                                <c:choose>
                                    <c:when test="${param.action eq 'getupdate'}"><input style="display: none"
                                                                                         name="id"
                                                                                         value="<%=request.getParameter("id")%>"></c:when>
                                    <c:when test="${param.action eq 'update'}"><input style="display: none"
                                                                                      name="id"
                                                                                      value="<%=request.getParameter("id")%>"></c:when>
                                </c:choose>
                                <div class="control-group">
                                    <label class="control-label" for="fullname">Họ tên (*) </label>
                                    <div class="controls">
                                        <input type="text" name="fullname" class="span6" id="fullname"
                                               placeholder="Nhập tên gạch"
                                               value="<%=request.getParameter("fullname")==null? "":request.getParameter("fullname")%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="gender">Giới tính</label>
                                    <div class="controls">
                                        <select id="gender" class="chzn-select" name="gender" style="width:49%;">
                                            <option value="Nam"
                                                    <c:if test="${param.gender eq 'Nam'}">selected="selected"</c:if>>
                                                Nam
                                            </option>
                                            <option value="Nữ"
                                                    <c:if test="${param.gender eq 'Nữ'}">selected="selected"</c:if>>
                                               Nữ
                                            </option>


                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="birth">Ngày sinh (*) </label>
                                    <div class="controls">
                                        <input type="date" name="birth" class="span6" id="birth"
                                               placeholder="Nhập ngày sinh"
                                               value="<%=request.getParameter("birth")==null? "":request.getParameter("birth")%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="position">Vị trí (*) </label>
                                    <div class="controls">
                                        <input type="text" name="position" class="span6" id="position"
                                               placeholder="Nhập vị trí trong nhóm"
                                               value="<%=request.getParameter("position")==null? "":request.getParameter("position")%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="image">Link hình ảnh </label>
                                    <div class="controls">
                                        <input type="text" name="image" class="span6" id="image"
                                               placeholder="Nhập link hình ảnh"
                                               value="<%=request.getParameter("image")==null? "":request.getParameter("image")%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="facebook">Link facebook(*) </label>
                                    <div class="controls">
                                        <input type="text" name="facebook" class="span6" id="facebook"
                                               placeholder="Nhập link facebook"
                                               value="<%=request.getParameter("facebook")==null? "":request.getParameter("facebook")%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="phone">Số điện thoại(*) </label>
                                    <div class="controls">
                                        <input type="text" name="phone" class="span6" id="phone"
                                               placeholder="Nhập số điện thoại"
                                               value="<%=request.getParameter("phone")==null? "":request.getParameter("phone")%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="email">Email(*) </label>
                                    <div class="controls">
                                        <input type="email" name="email" class="span6" id="email"
                                               placeholder="Nhập địa chỉ email"
                                               value="<%=request.getParameter("email")==null? "":request.getParameter("email")%>">
                                    </div>
                                </div>

                                <div class="form-actions" style="background: white">
                                    <button type="submit" class="btn btn-primary"><c:choose><c:when
                                            test="${param.action eq 'getadd'}">Thêm </c:when><c:when
                                            test="${param.action eq 'getupdate'}">Chỉnh sửa </c:when><c:when
                                            test="${param.action eq 'add'}">Thêm </c:when><c:when
                                            test="${param.action eq 'update'}">Chỉnh sửa </c:when></c:choose>thành viên
                                    </button>
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
</div>

<!--/.fluid-container-->
<link href="${pageContext.request.contextPath}/admin/vendors/datepicker.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/admin/vendors/uniform.default.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/admin/vendors/chosen.min.css" rel="stylesheet" media="screen">

<link href="${pageContext.request.contextPath}/admin/vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">

<script src="${pageContext.request.contextPath}/admin/vendors/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/vendors/jquery.uniform.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/vendors/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/vendors/bootstrap-datepicker.js"></script>

<script src="${pageContext.request.contextPath}/admin/vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
<script src="${pageContext.request.contextPath}/admin/vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

<script src="${pageContext.request.contextPath}/admin/vendors/wizard/jquery.bootstrap.wizard.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/admin/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/form-validation.js"></script>

<script src="${pageContext.request.contextPath}/admin/assets/scripts.js"></script>
<script>

    jQuery(document).ready(function () {
        FormValidation.init();
    });


    $(function () {
        $(".datepicker").datepicker();
        $(".uniform_on").uniform();
        $(".chzn-select").chosen();
        $('.textarea').wysihtml5();

        $('#rootwizard').bootstrapWizard({
            onTabShow: function (tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index + 1;
                var $percent = ($current / $total) * 100;
                $('#rootwizard').find('.bar').css({width: $percent + '%'});
                // If it's the last tab then hide the last button and show the finish instead
                if ($current >= $total) {
                    $('#rootwizard').find('.pager .next').hide();
                    $('#rootwizard').find('.pager .finish').show();
                    $('#rootwizard').find('.pager .finish').removeClass('disabled');
                } else {
                    $('#rootwizard').find('.pager .next').show();
                    $('#rootwizard').find('.pager .finish').hide();
                }
            }
        });
        $('#rootwizard .finish').click(function () {
            alert('Finished!, Starting over!');
            $('#rootwizard').find("a[href*='tab1']").trigger('click');
        });
    });
</script>
</body>

</html>
