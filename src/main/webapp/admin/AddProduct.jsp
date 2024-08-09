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
                        </c:choose> sản phẩm
                    </div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <h4 style="color: red"><%=request.getAttribute("err") == null ? "" : request.getAttribute("err")%>
                        </h4>
                        <form class="form-horizontal" action="AddOrUpdateProduct" method="get">
                            <fieldset>
                                <legend><c:choose>
                                    <c:when test="${param.action eq'getadd'}">Thêm</c:when>
                                    <c:when test="${param.action eq 'getupdate'}">Chỉnh sửa</c:when>
                                    <c:when test="${param.action eq 'add'}">Thêm </c:when>
                                    <c:when test="${param.action eq 'update'}">Chỉnh sửa </c:when>
                                </c:choose> sản phẩm
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
                                    <label class="control-label" for="productname">Tên gạch (*) </label>
                                    <div class="controls">
                                        <input type="text" name="productname" class="span6" id="productname"
                                               placeholder="Nhập tên gạch"
                                               value="<%=request.getParameter("productname")==null? "":request.getParameter("productname")%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="type">Loại gạch</label>
                                    <div class="controls">
                                        <select id="type" class="chzn-select" name="type" style="width:49%;">
                                            <option value="Ốp Tường"
                                                    <c:if test="${param.type eq 'Ốp Tường'}">selected="selected"</c:if>>
                                                Ốp Tường
                                            </option>
                                            <option value="Ốp Tường"
                                                    <c:if test="${param.type eq 'Ốp Tường'}">selected="selected"</c:if>>
                                                Ốp Tường
                                            </option>
                                            <option value="Trang Trí"
                                                    <c:if test="${param.type eq 'Trang Trí'}">selected="selected"</c:if>>
                                                Trang Trí
                                            </option>
                                            <option value="Vân Gỗ"
                                                    <c:if test="${param.type eq 'Vân Gỗ'}">selected="selected"</c:if>>
                                                Vân Gỗ
                                            </option>

                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="sizeProduct">Kích thước </label>
                                    <div class="controls">
                                        <select id="sizeProduct" class="chzn-select" name="sizeProduct"
                                                style="width:49% ;">
                                            <option value="600x600"
                                                    <c:if test="${param.sizeProduct eq '600x600'}">selected="selected"</c:if>>
                                                600 x 600
                                            </option>
                                            <option value="800x800"
                                                    <c:if test="${param.sizeProduct eq '800x800'}">selected="selected"</c:if>>
                                                800 x 800
                                            </option>
                                            <option value="600x1200"
                                                    <c:if test="${param.sizeProduct eq '600x1200'}">selected="selected"</c:if>>
                                                600 x 1200
                                            </option>
                                            <option value="300x600"
                                                    <c:if test="${param.sizeProduct eq '300x600'}">selected="selected"</c:if>>
                                                300 x 600
                                            </option>
                                            <option value="300x800"
                                                    <c:if test="${param.sizeProduct eq '300x800'}">selected="selected"</c:if>>
                                                300 x 800
                                            </option>
                                            <option value="150x900"
                                                    <c:if test="${param.sizeProduct eq '150x900'}">selected="selected"</c:if>>
                                                150 x 900
                                            </option>
                                            <option value="150x800"
                                                    <c:if test="${param.sizeProduct eq '150x800'}">selected="selected"</c:if>>
                                                150 x 800
                                            </option>
                                            <option value="200x1200"
                                                    <c:if test="${param.sizeProduct eq '200x1200'}">selected="selected"</c:if>>
                                                200 x 1200
                                            </option>
                                            <option value="200x200"
                                                    <c:if test="${param.sizeProduct eq '200x200'}">selected="selected"</c:if>>
                                                200 x 200
                                            </option>
                                            <option value="200x230"
                                                    <c:if test="${param.sizeProduct eq '200x230'}">selected="selected"</c:if>>
                                                200 x 230
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="price">Giá tiền (*) </label>
                                    <div class="controls">
                                        <input type="number" name="price" class="span6" id="price"
                                               placeholder="Nhập giá tiền"
                                               value="<%=request.getParameter("price")==null? "":request.getParameter("price")%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="quantity">Số lượng (*) </label>
                                    <div class="controls">
                                        <input type="number" name="quantity" class="span6" id="quantity"
                                               placeholder="Nhập số lượng"
                                               value="<%=request.getParameter("quantity")==null? "":request.getParameter("quantity")%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="sale">Khuyến mãi </label>
                                    <div class="controls">
                                        <input type="number" name="sale" class="span6" id="sale"
                                               placeholder="Nhập phần trăm giảm giá"
                                               value="<%=request.getParameter("sale")==null? "":request.getParameter("sale")%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="link1">Link ảnh gạch 1(*) </label>
                                    <div class="controls">
                                        <input type="text" name="link1" class="span6" id="link1"
                                               placeholder="Nhập link ảnh gạch"
                                               value="<%=request.getParameter("link1")==null? "":request.getParameter("link1")%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="link2">Link ảnh gạch 2(*) </label>
                                    <div class="controls">
                                        <input type="text" name="link2" class="span6" id="link2"
                                               placeholder="Nhập link ảnh gạch"
                                               value="<%=request.getParameter("link2")==null? "":request.getParameter("link2")%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="newProduct">Hàng mới</label>
                                    <div class="controls">
                                        <select id="newProduct" class="chzn-select" name="newProduct">
                                            <option value="0"<c:if test="${param.newProduct eq '0'}">selected="selected"</c:if>>Có</option>
                                            <option value="1"<c:if test="${param.newProduct eq '1'}">selected="selected"</c:if>>Không</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="description">Mô tả (*) </label>
                                    <div class="controls">
                                            <textarea rows="100" cols="200" name="description" id="description"
                                                      class="description" placeholder="Nhập mô tả"
                                                      style="width: 810px; height: 200px"
                                            ><%=request.getParameter("description") == null ? "" : request.getParameter("description")%></textarea>
                                    </div>
                                </div>

                                <div class="form-actions" style="background: white">
                                    <button type="submit" class="btn btn-primary"><c:choose><c:when
                                            test="${param.action eq 'getadd'}">Thêm </c:when><c:when
                                            test="${param.action eq 'getupdate'}">Chỉnh sửa </c:when><c:when
                                            test="${param.action eq 'add'}">Thêm </c:when><c:when
                                            test="${param.action eq 'update'}">Chỉnh sửa </c:when></c:choose>sản
                                        phẩm
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
