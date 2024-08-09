package controller;

import tool.SendToMail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SendMail", value = "/sendMail")
public class ForgetPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emailTo = request.getParameter("email");
        String emailSuject = "Reset password";
        String emailContect = "Vui lòng nhấn vào đường link sau để thay đổi mật khẩu: http://localhost:8080/GachMen_Store_war/reset-password.jsp ";
        SendToMail.sendEmail(emailTo, emailSuject, emailContect);
        request.setAttribute("msg","Vui lòng kiểm tra email để đổi mật khẩu");
        request.getRequestDispatcher("forgot-password.jsp").forward(request,response);
    }
}
