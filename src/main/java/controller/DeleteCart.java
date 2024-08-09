package controller;

import bean.Product;
import model.Cart;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "DeleteCart", value = "/DeleteCart")
public class DeleteCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("productID");
        Product p = ProductService.getById(id);
        HttpSession session = request.getSession();
        session.getAttribute("cart");
        Cart c = Cart.getCart(session);
        c.remove(p.getProductID());
        c.commit(session);
        response.sendRedirect("Cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
