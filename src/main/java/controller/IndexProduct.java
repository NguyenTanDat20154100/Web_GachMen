package controller;

import bean.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "IndexProduct", value = "/Home")
public class IndexProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Product> list = ListProducts.getAllProduct();
        List<Product>listNewProduct= ProductService.listNewProduct();
        List<Product>listBestSeller=ProductService.listBestSeller();
        List<Product>listHintForYou=ProductService.listHintForYou();
        request.setAttribute("homeProduct",listNewProduct);
        request.setAttribute("homeProduct1",listBestSeller);
        request.setAttribute("homeProduct2",listHintForYou);
        request.setAttribute("listNewProduct", listNewProduct);
        request.setAttribute("listBestSeller", listBestSeller);
        request.setAttribute("listHintForYou", listHintForYou);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
