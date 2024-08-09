package service;

import bean.Contact;
import database.ConnectDB;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class ContactService {
    public static List<Contact> getAll() {
        PreparedStatement s = null;
        try {
            String sql = "select  * from contact";
            s = ConnectDB.connect(sql);
            ResultSet rs = s.executeQuery();
            List<Contact> listContacts = new LinkedList<>();
            while (rs.next()) {
                listContacts.add(new Contact(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
            rs.close();
            s.close();
            return listContacts;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return new LinkedList<>();
        }
    }
    public static Contact getContactById(String id) {
        PreparedStatement s = null;
        try {
            Contact contact=null;
            String sql = "select  * from contact where id =?";
            s = ConnectDB.connect(sql);
            s.setString(1,id);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                contact= new Contact(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                );
            }
            rs.close();
            s.close();
            return contact;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    public static void updateStatus(String id){
        PreparedStatement s = null;
        try {
            String sql="update contact set status = ? where id =?";
            s = ConnectDB.connect(sql);
            s.setInt(1,1);
            s.setString(2,id);
            int rs = s.executeUpdate();
            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public static void deleteContact(String id){
        PreparedStatement s = null;
        try {
            String sql="DELETE  from contact where id =?";
            s = ConnectDB.connect(sql);
            s.setString(1,id);
            int rs = s.executeUpdate();
            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public static int countContact() {
        PreparedStatement pre = null;
        int count=0;
        try {
            String sql = "SELECT * FROM contact";
            pre = ConnectDB.connect(sql);
            ResultSet rs = pre.executeQuery();
            rs.last();
            count = rs.getRow();
            return count;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    public static void insertContact(Contact contact){
        PreparedStatement ps = null;
        try{
            String sql = "insert into contact (id, username,email,subject,content,create_date, status) values(?, ?, ?, ?, ?, ?, ?)";
            ps = ConnectDB.connect(sql);
            ps.setString(1, contact.getContactID());
            ps.setString(2, contact.getUsername());
            ps.setString(3, contact.getEmail());
            ps.setString(4, contact.getUserSubject());
            ps.setString(5, contact.getContactContent());
            ps.setDate(6, Date.valueOf(java.time.LocalDate.now()));
            ps.setInt(7, 0);
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
//        insertContact(new Contact("3", "trung2", "trung1@gmail.com", "SSSs", "Cccsc", "date", 1));
//        System.out.println(getAll().toString());
//        System.out.println(getContactById("46464"));
        deleteContact("3");

    }
}
