package controller;

import bean.Role;
import bean.User;
import model.UserSession;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        User msg = UserService.checkUser(username, password);
        try {
            if (username.equals("") || password.equals("")) {
                request.setAttribute("errMes1", "Vui lòng điền đầy đủ thông tin!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (UserService.checkUser(username, password) != null) {
                if (UserService.getStatus(username) == 0) {
                    request.setAttribute("errMes0", "Tài khoản đã bị khoá");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    User u = UserService.getUser(username);
                    if (u.getIsAdmin() != 0) {
                        ArrayList<String> listRole = new ArrayList<>();
                        listRole.add("admin.index");
                        Role role = new Role(listRole);
                        u.setRole(role);
                    } else {
                        Role role = new Role(null);
                        u.setRole(role);
                    }
                    HttpSession session = request.getSession();
                    session.getAttribute("user");
                    UserSession us = UserSession.getUS(session);
                    int rol = UserService.getRoleDB(username);
                    us.put(u);
                    us.commit(session);
                    User user = UserService.checkUser(username, password);
                    session.setAttribute("Role", rol);
                    session.setAttribute("userN", username);
                    session.setAttribute("userID", user);
                    session.setMaxInactiveInterval(900);
                    if (u.getIsAdmin() > 0) {
                        response.sendRedirect("ListProductAd");
                    } else
                        response.sendRedirect("Home");

                }

            } else {
                request.setAttribute("errMes2", "Tên đăng nhập hoặc mật khẩu không đúng");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

