package controller;

import bean.Contact;
import service.ContactService;
import tool.SendToMail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ReplyContact", value = "/ReplyContact")
public class ReplyContact extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String replytext = request.getParameter("replytext");
        request.setCharacterEncoding("UTF-8");
        response.getCharacterEncoding();
        if(action!=null){
            Contact contact = ContactService.getContactById(id);
            if(action.equals("getcontact")){
                String forward="admin/ContactDetail.jsp?";
                forward+="fullname="+contact.getUsername();
                forward+="&email="+ contact.getEmail();
                forward+="&usersubject="+contact.getUserSubject();
                forward+="&contactcontent="+contact.getContactContent();
                request.getRequestDispatcher(forward).forward(request, response);
            }
            if(action.equals("delete")){
                ContactService.deleteContact(id);
                response.sendRedirect("ListContact");
            }
            if(action.equals("replycontact")){
                if(replytext.equals("")){
                    request.setAttribute("err", "Vui lòng nhập phản hồi");
                    request.getRequestDispatcher("admin/ContactDetail.jsp");
                }
                else{
                    SendToMail mail = new SendToMail();
                    String forward="admin/ContactDetail.jsp?";
                    forward+="fullname="+contact.getUsername();
                    forward+="&email="+ contact.getEmail();
                    forward+="&usersubject="+contact.getUserSubject();
                    forward+="&contactcontent="+contact.getContactContent();
                    mail.sendEmail(contact.getEmail(),"Reply from TrueMart-Gach men cao cap",replytext);
                    ContactService.updateStatus(id);
                    request.setAttribute("message", "Phản hồi liên hệ thành công");
                    request.getRequestDispatcher(forward).forward(request,response);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
