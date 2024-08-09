package controller;

import bean.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Random;


@WebServlet(name = "Register", value = "/register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String agree = request.getParameter("agree");
        String name = request.getParameter("name");
        String uname = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("password");
        Random rd = new Random();
        Timestamp timestamp = new Timestamp(new Date().getTime());
        String timeRegister = String.valueOf(timestamp);

        User user = new User();
        user.setIdUser("user" + rd.nextInt(1000000) + rd.nextInt(100000));
        user.setName(name);
        user.setUserName(uname);
        user.setEmail(email);
        user.setDay_register(timeRegister);
        user.setPassWord(pass);
        user.setPhone(phone);
        user.setIsAdmin(0);
        user.setStatus(1);
        UserService us = new UserService();

        try {
            if (name.equals("") || uname.equals("") || email.equals("") || pass.equals("")) {
                request.setAttribute("msg", "Vui lòng điền đầy đủ thông tin");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            if (agree==null) {
                request.setAttribute("msg", "Vui lòng chấp nhận điều khoảng");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }if (UserService.existUserName(uname)) {
                request.setAttribute("msg", "Tên đăng nhập đã tồn tại");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            if (UserService.existEmail(email)) {
                request.setAttribute("msg", "Email này đã được đăng ký tài khoảng");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else if (UserService.register(user)) {
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "Tạo tài khoản thất bại.<br> Hãy thử lại!!!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
