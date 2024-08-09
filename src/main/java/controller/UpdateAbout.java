package controller;

import bean.About;
import bean.Product;
import service.AboutService;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "UpdateAbout", value = "/UpdateAbout")
public class UpdateAbout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String birth = request.getParameter("birth");
        String gender = request.getParameter("gender");
        String position = request.getParameter("position");
        String image = request.getParameter("image");
        String facebook = request.getParameter("facebook");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        request.setCharacterEncoding("UTF-8");
        String err="";
        if (!action.equals(null)) {
            if (action.equals("getadd")) {
                request.setAttribute("err", "");
                request.getRequestDispatcher("admin/AddMember.jsp").forward(request, response);
            }

            if (action.equals("getupdate")) {
                About about = AboutService.getContactById(id);
                String forward = "admin/AddMember.jsp?";
                forward += "fullname=" + about.getFullname();
                forward += "&birth=" + about.getBirth();
                forward += "&gender=" + about.getGender();
                forward += "&position=" + about.getPosition();
                forward += "&image=" + about.getImage();
                forward += "&facebook=" + about.getFacebook();
                forward += "&phone=" + about.getPhone();
                forward += "&email=" + about.getEmail();
                request.getRequestDispatcher(forward).forward(request, response);
            }

            if (action.equals("add")) {
                boolean isErr = false;
                if (fullname.equals("") || birth.equals("") || gender.equals("") || position.equals("")
                        || image.equals("") || facebook.equals("") || phone.equals("") || email.equals("")) {
                    request.setAttribute("err", "Vui lòng nhập dữ liệu trong các mục có đánh dấu *");
                    request.getRequestDispatcher("admin/AddMember.jsp").forward(request, response);
                    isErr = true;
                } else if (AboutService.existMemberName(fullname)) {
                    request.setAttribute("err", "Tên thành viên đã tồn tại");
                    request.getRequestDispatcher("admin/AddMember.jsp").forward(request, response);
                    isErr = true;
                }
                if (!isErr) {
                    Random rd = new Random();
                    String idMember = "sp" + (rd.nextInt(1000000) / 2 + 1);
                    About a = new About(idMember,fullname,birth,gender,position,image,facebook,phone,email);
                    AboutService.insertAbout(a);
                    request.setAttribute("err", "Thêm sản phẩm thành công");
                    response.sendRedirect("ListAbout");
                }
            }

            if (action.equals("update")) {
                boolean isErr = false;
                if (fullname.equals("") || birth.equals("") || gender.equals("") || position.equals("")
                        || image.equals("") || facebook.equals("") || phone.equals("") || email.equals("")) {
                    request.setAttribute("err", "Vui lòng nhập dữ liệu trong các mục có đánh dấu *");
                    request.getRequestDispatcher("admin/AddMember.jsp").forward(request, response);
                    isErr = true;
                }
                if (!isErr) {
                    About a = new About(id,fullname,birth,gender,position,image,facebook,phone,email);
                    AboutService.updateAbout(id,a);
                    request.setAttribute("err", "Chỉnh sửa thành công");
                    response.sendRedirect("ListAbout");
                }
            }if (action.equals("delete")) {
                AboutService.deleteAbout(id);
                response.sendRedirect("ListAbout");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
