package service;

import bean.About;
import bean.Contact;
import bean.Product;
import database.ConnectDB;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class AboutService {
    public static List<About> getAll() {
        PreparedStatement s = null;
        try {
            String sql = "select  * from about";
            s = ConnectDB.connect(sql);
            ResultSet rs = s.executeQuery();
            List<About> listAbout = new LinkedList<>();
            while (rs.next()) {
                listAbout.add(new About(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
            rs.close();
            s.close();
            return listAbout;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return new LinkedList<>();
        }
    }
    public static About getContactById(String id) {
        PreparedStatement s = null;
        try {
            About about=null;
            String sql = "select  * from about where id =?";
            s = ConnectDB.connect(sql);
            s.setString(1,id);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                about= new About(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );
            }
            rs.close();
            s.close();
            return about;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    public static void deleteAbout(String id){
        PreparedStatement s = null;
        try {
            String sql="DELETE  from about where id =?";
            s = ConnectDB.connect(sql);
            s.setString(1,id);
            int rs = s.executeUpdate();
            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public static boolean existMemberName(String name) {
        PreparedStatement s = null;
        try {
            String sql = "select * from about where id = ?";
            s = ConnectDB.connect(sql);
            s.setString(1, name);
            ResultSet rs = s.executeQuery();
            if (rs.next()) return true;
            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void updateAbout(String id, About about){
        PreparedStatement s = null;
        try {
            String sql="UPDATE about set fullname= ?, birth = ?, gender = ?, position = ?, image = ?, facebook = ?," +
                    " phone = ?, email = ? where id = ?";
            s = ConnectDB.connect(sql);
            s.setString(1, about.getFullname());
            s.setString(2, about.getBirth());
            s.setString(3, about.getGender());
            s.setString(4, about.getPosition());
            s.setString(5, about.getImage());
            s.setString(6, about.getFacebook());
            s.setString(7, about.getPhone());
            s.setString(8, about.getEmail());
            s.setString(9, id);
            int rs=s.executeUpdate();

            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public static void insertAbout(About about){
        PreparedStatement ps = null;
        try{
            String sql = "insert into about values(?, ?, ?, ?, ?, ?, ?,?,?)";
            ps = ConnectDB.connect(sql);
            ps.setString(1, about.getId());
            ps.setString(2, about.getFullname());
            ps.setString(3, about.getBirth());
            ps.setString(4, about.getGender());
            ps.setString(5, about.getPosition());
            ps.setString(6, about.getImage());
            ps.setString(7, about.getFacebook());
            ps.setString(8, about.getPhone());
            ps.setString(9, about.getEmail());

            ps.executeUpdate();
            ps.close();
        }
        catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
        }
    }

    public static void main(String[] args) {
        About a = new About("554","2quanghuy","12/4/2002","nam","thanh vien","image","facebook","0981722033","email");
        insertAbout(a);
//        updateAbout("447",a);
//        deleteAbout("adf");
    }
}
