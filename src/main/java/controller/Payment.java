package controller;

import bean.Product;
import model.Cart;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "Payment", value = "/Payment")
public class Payment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart c = (Cart) request.getSession().getAttribute("cart");
        if(c==null){
            response.sendRedirect("ProductLists");
        }else{
            Collection<Product> list=c.getData();
            request.setAttribute("listCart",list);
            request.getSession().setAttribute("cart",c);
            request.getRequestDispatcher("checkout.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
