package controller;

import bean.OrderDetail;
import service.OrderDetailService;
import service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "ListOrderDetailAd", value = "/ListOrderDetailAd")
public class ListOrderDetailAd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String total = request.getParameter("total");
        Collection<OrderDetail> listOrderDetails = OrderDetailService.getDetailOrder(id);
        request.setAttribute("listOrderDetails",listOrderDetails);
        request.setAttribute("total",total);
        request.getRequestDispatcher("admin/OrderDetail.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
