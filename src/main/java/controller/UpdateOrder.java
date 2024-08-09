package controller;

import bean.Order;
import bean.OrderDetail;
import bean.Product;
import service.OrderDetailService;
import service.OrderService;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

@WebServlet(name = "UpdateOrder", value = "/UpdateOrder")
public class UpdateOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        if(action!=null){
            if(action.equals("delete")){
                OrderDetailService.deleteOrderDetail(id);
                OrderService.deleteOrder(id);
                response.sendRedirect("ListOrder");
            }
            if(action.equals("update")){
                OrderDetailService.updateStatus(id);
                response.sendRedirect("ListOrder");
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
