package controller;

import bean.Product;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListByType", value = "/ListByType")
public class ListByType extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        List<Product>list = ProductService.getByType(type);
        int page,show=12;
        int size = list.size();;
        int numberPage = size%show==0?size/show :(size/show+1);
        String currentPage=request.getParameter("page");
        if(currentPage==null){
            page=1;
        }else{
            page=Integer.parseInt(currentPage);
        }
        int start,end;
        start= (page-1)*show;
        end=Math.min(page*show, list.size());
        List<Product>listP= ProductService.getByPage(list,start,end);
        request.setAttribute("listP",listP);
        request.setAttribute("page",page);
        request.setAttribute("numberPage",numberPage);
        request.getRequestDispatcher("product-type.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
