package controller;

import bean.Product;
import model.Cart;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BuyNow", value = "/buyNow")
public class BuyNow extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("productID");
        Product p = ProductService.getById(id);
        HttpSession session = request.getSession();
        session.getAttribute("cart");

        p.setQuantityCart(1);

        Cart c = Cart.getCart(session);
        c.put(p);
        c.commit(session);
        response.sendRedirect("Payment");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
