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
    <title>Phản hồi liên hệ</title>
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
    <script src="Admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
                        <div class="muted pull-left">Phản hồi liên hệ</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                            <h4 style="color:#62ab00;"> <%=request.getAttribute("err")==null? "":request.getAttribute("err")%></h4>
                            <h4 style="color:red;"> <%=request.getAttribute("message")==null? "":request.getAttribute("message")%></h4>
                            <form class="form-horizontal" action="ReplyContact" method="get">
                                <fieldset>
                                    <legend>Phản hồi liên hệ</legend>
                                    <input style="display: none" name="action" value="<c:choose><c:when test="${param.action eq 'getcontact'}">replycontact</c:when><c:when test="${param.action eq 'replycontact'}">replycontact</c:when></c:choose>">
                                    <input style="display: none" name="id" value="<%=request.getParameter("id")%>">
                                    <div class="control-group">
                                        <label class="control-label" for="fullname">Họ và tên </label>
                                        <div class="controls">
                                            <input type="text" class="span6" id="fullname" placeholder="Nhập họ và tên"
                                                   value="<%=request.getParameter("fullname")==null? "":request.getParameter("fullname")%>" readonly>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="email">Email </label>
                                        <div class="controls">
                                            <input type="text" class="span6" id="email" placeholder="Nhập email"
                                                   value="<%=request.getParameter("email")==null? "":request.getParameter("email")%>" readonly>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="usersubject">Tiêu đề liên hệ </label>
                                        <div class="controls">
                                            <input type="text" name="usersubject" class="span6" id="usersubject" placeholder="Nhập email"
                                                   value="<%=request.getParameter("usersubject")==null? "":request.getParameter("usersubject")%>" readonly>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="contactcontent">Chi tiết liên hệ </label>
                                        <div class="controls">
                                            <textarea rows="100" cols="200"  id="contactcontent" class="description" placeholder="Nhập mô tả" style="width: 810px; height: 200px"
                                             readonly><%=request.getParameter("contactcontent")==null? "":request.getParameter("contactcontent")%></textarea>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="replytext">Phản hồi (*) </label>
                                        <div class="controls">
                                            <textarea rows="100" cols="200" name="replytext" id="replytext" class="description" placeholder="Nhập phản hồi" style="width: 810px; height: 200px"
                                            ><%=request.getParameter("replytext")==null? "":request.getParameter("replytext")%></textarea>
                                        </div>
                                    </div>

                                    <div class="form-actions">
                                        <button type="submit" class="btn btn-primary">Gửi phản hồi</button>
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

<script type="text/javascript" src="admin/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
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

