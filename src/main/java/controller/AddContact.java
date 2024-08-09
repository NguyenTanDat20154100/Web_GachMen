package controller;


import bean.Contact;
import bean.User;
import service.ContactService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "AddContact", urlPatterns = "/contact")

public class AddContact extends HttpServlet {
    private bean.Contact contact;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        //todo
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        Random rd = new Random();
        Contact contact = new Contact();
        contact.setContactID(String.valueOf(rd.nextInt(100000000)+rd.nextInt(1000000)));
        contact.setUsername(name);
        contact.setEmail(email);
        contact.setUserSubject(subject);
        contact.setContactContent(message);
        ContactService ContactService = new ContactService();
        ContactService.insertContact(contact);
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }
}