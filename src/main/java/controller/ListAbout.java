package controller;

import bean.About;
import service.AboutService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListAbout", value = "/ListAbout")
public class ListAbout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<About>listA= AboutService.getAll();
        request.setAttribute("listA",listA);
        request.getRequestDispatcher("admin/ManageMember.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
