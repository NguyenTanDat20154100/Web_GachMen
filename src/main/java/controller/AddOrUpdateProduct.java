package controller;

import bean.Product;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "AddOrUpdateProduct", value = "/AddOrUpdateProduct")
public class AddOrUpdateProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String name = request.getParameter("productname");
        String type = request.getParameter("type");
        String size = request.getParameter("sizeProduct");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String sale = request.getParameter("sale");
        String link1 = request.getParameter("link1");
        String link2 = request.getParameter("link2");
        String newProduct = request.getParameter("newProduct");
        String description = request.getParameter("description");
        request.setCharacterEncoding("UTF-8");
        String err="";
        if (!action.equals(null)) {
            if (action.equals("getadd")) {
                request.setAttribute("err", "");
                request.getRequestDispatcher("admin/AddProduct.jsp").forward(request, response);
            }

            if (action.equals("getupdate")) {
                Product product = ProductService.getById(id);
                String forward = "admin/AddProduct.jsp?";
                forward += "productname=" + product.getProductName();
                forward += "&type=" + product.getCategory();
                forward += "&size=" + product.getSize();
                forward += "&price=" + product.getPrice();
                forward += "&quantity=" + product.getQuantity();
                forward += "&sale=" + product.getSalePrice();
                forward += "&link1=" + product.getImage1();
                forward += "&link2=" + product.getImage2();
                forward += "&new=" + product.getIsNew();
                forward += "&description=" + product.getDescription();
                request.getRequestDispatcher(forward).forward(request, response);
            }

            if (action.equals("add")) {
                boolean isErr = false;
                if (name.equals("") || type.equals("") || size.equals("") || price.equals("")
                        || quantity.equals("") || sale.equals("") || quantity.equals("") || link1.equals("")
                        || link2.equals("") || newProduct.equals(null) || description.equals("")) {
                    request.setAttribute("err", "Vui lòng nhập dữ liệu trong các mục có đánh dấu *");
                    request.getRequestDispatcher("admin/AddProduct.jsp").forward(request, response);
                    isErr = true;
                } else if (ProductService.existProductName(name)) {
                    request.setAttribute("err", "Tên sản phẩm đã tồn tại");
                    request.getRequestDispatcher("admin/AddProduct.jsp").forward(request, response);
                    isErr = true;
                }
                if (!isErr) {
                    Random rd = new Random();
                    String idPro = "sp" + (rd.nextInt(1000000) / 2 + 1);
                    Product p = new Product(idPro, name, description, size, type, Integer.parseInt(price), Integer.parseInt(sale), link1, link2, Integer.parseInt(quantity), Integer.parseInt(newProduct), 1, 1);
                    ProductService.addProduct(p);
                    request.setAttribute("err", "Thêm sản phẩm thành công");
                    response.sendRedirect("ListProductAd");
                }
            }

            if (action.equals("update")) {
                boolean isErr = false;
                if (name.equals("") || type.equals("") || size.equals("") || price.equals("")
                        || quantity.equals("") || sale.equals("") || quantity.equals("") || link1.equals("")
                        || link2.equals("") || newProduct.equals(null) || description.equals("")) {
                    request.setAttribute("err", "Vui lòng nhập dữ liệu trong các mục có đánh dấu *");
                    request.getRequestDispatcher("admin/AddProduct.jsp").forward(request, response);
                    isErr = true;
                } else if (ProductService.existProductName(name)) {
                    request.setAttribute("err", "Tên sản phẩm đã tồn tại");
                    request.getRequestDispatcher("admin/AddProduct.jsp").forward(request, response);
                    isErr = true;
                }
                if (!isErr) {
                    Product p = new Product(id, name, description, size, type, Integer.parseInt(price), Integer.parseInt(sale), link1, link2, Integer.parseInt(quantity), Integer.parseInt(newProduct), 1, 1);
                    ProductService.updateProduct(id, p);
                    request.setAttribute("err", "Chỉnh sửa thành công");
                    response.sendRedirect("ListProductAd");
                }
            }if (action.equals("delete")) {
                ProductService.deleteProduct(id);
                response.sendRedirect("ListProductAd");
            }
            if (action.equals("hide")) {
                ProductService.hideProduct(id);
                response.sendRedirect("ListProductAd");
            }
            if (action.equals("show")) {
                ProductService.nothideProduct(id);
                response.sendRedirect("ListProductAd");
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
