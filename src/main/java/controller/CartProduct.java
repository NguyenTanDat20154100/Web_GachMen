package controller;

import bean.Product;
import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "CartProduct", value = "/Cart")
public class CartProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart c = (Cart) request.getSession().getAttribute("cart");
        if(c==null){
            response.sendRedirect("ProductLists");
        }else{
            Collection<Product> list=c.getData();
            request.setAttribute("listCart",list);
            request.getSession().setAttribute("cart",c);
            request.getRequestDispatcher("cart.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
