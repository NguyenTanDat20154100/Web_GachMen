package model;

import bean.User;
import service.UserService;

import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class UserSession {

    Map<String, User> user = new HashMap<>();
    UserService us = new UserService();

    public UserSession(){

    }

    public void put(User u){
        user.put(u.getIdUser(), u);
    }

    public Collection<User> getUser(){
        return user.values();
    }

    public String getUserName(){
        String s = "";
        Collection<User> u = user.values();
        for(User s2 : u){
            s +=  s2.getUserName();
        }
        return s.trim();
    }
    public String getUserId(){
        String s = "";
        Collection<User> u = user.values();
        for(User s2 : u){
            s +=  s2.getIdUser();
        }
        return s.trim();
    }
    public int getRole(){
        int s=0;
        Collection<User> u = user.values();
        for(User s2 : u){
            s =  s2.getIsAdmin();
        }
        return s;
    }

//    public void update(String name, String birth, String gender,
//                       String address, int phone, String email){
//        Collection<User> u = user.values();
//        for(User s : u){
//            s.setName(name);
//            s.setBirth(birth);
//            s.setGender(gender);
//            s.setAddress(address);
//            s.setPhone(phone);
//            s.setEmail(email);
//        }
//    }

//    public void updateWithPass(String name, String birth, String gender,
//                               String address, int phone, String email, String pass){
//        Collection<User> u = user.values();
//        for(User s : u){
//            s.setName(name);
//            s.setBirth(birth);
//            s.setGender(gender);
//            s.setAddress(address);
//            s.setPhone(phone);
//            s.setEmail(email);
//            s.setPassWord(pass);
//        }
//    }

    public static UserSession getUS(HttpSession session){
        return session.getAttribute("user") == null
                ? new UserSession()
                : (UserSession)session.getAttribute("user");
    }

    public void commit(HttpSession session){
        session.setAttribute("user", this);
    }

}
