package controller;

import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateCart", value = "/UpdateCart")
public class UpdateCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] id = request.getParameterValues("productID");
        String[] quantity = request.getParameterValues("quantityCart");
        HttpSession session = request.getSession();
        session.getAttribute("cart");

        Cart c = Cart.getCart(session);
        for (int i = 0; i < id.length; i++) {
            c.update(id[i], Integer.parseInt(quantity[i]));
            c.commit(session);
        }
        response.sendRedirect("Cart");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
