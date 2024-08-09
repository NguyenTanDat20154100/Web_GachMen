package controller;

import bean.Product;
import bean.Reviews;
import service.ProductService;
import service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Random;

@WebServlet(name = "ReviewProduct", value = "/reviewProduct")
public class ReviewProduct extends HttpServlet {

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Reviews> listReview = ReviewService.getAllReviewProduct();
        request.setAttribute("listReview", listReview);
        String username = request.getParameter("username");
        String comments = request.getParameter("comments");

        ReviewService.insertReview(new Reviews(username,comments));
        String productID = request.getParameter("productID");
        Product p = ProductService.getProductDetail(productID);
        request.setAttribute("product",p);
        response.sendRedirect("ProductDetail?productID="+productID);
    }
}
