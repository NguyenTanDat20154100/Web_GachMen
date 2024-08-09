package service;

import bean.Product;
import bean.User;
import database.ConnectDB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

public class UserService {
    public static List<User> getAll() {
        PreparedStatement s = null;
        List<User> listUsers;
        try {
            String sql = "select  * from user";
            s = ConnectDB.connect(sql);
            ResultSet rs = s.executeQuery();
            listUsers = new LinkedList<>();
            while (rs.next()) {
                listUsers.add(new User(
                        rs.getString(1), rs.getString(2), rs.getString(3)
                        , rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                ));
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }

        return listUsers;
    }

    public static User getByIdUser(String id) {
        PreparedStatement s = null;
        User user = null;
        try {
            String sql = "select  * from user where id = ?";
            s = ConnectDB.connect(sql);
            s.setString(1, id);
            ResultSet rs = s.executeQuery();
            rs.first();
            user = new User(
                    rs.getString(1), rs.getString(2), rs.getString(3)
                    , rs.getString(4),
                    rs.getInt(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getInt(8),
                    rs.getString(9)
            );
            rs.close();
            s.close();

        } catch (ClassNotFoundException |
                 SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public static boolean existUserName(String uname) {
        PreparedStatement s = null;
        try {
            String sql = "select * from user where username = ?";
            s = ConnectDB.connect(sql);
            s.setString(1, uname);
            ResultSet rs = s.executeQuery();
            if (rs.next()) return true;
            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean addUser(User user) {
        PreparedStatement preSta = null;
        Random rd = new Random();
        try {
            String sql = "INSERT INTO user VALUES (?,?,?,?,?,?,?,?,?);";
            preSta = ConnectDB.connect(sql);
            preSta.setString(1, user.getIdUser());
            preSta.setString(2, user.getUserName());
            preSta.setString(3, user.getEmail());
            preSta.setString(4, user.getPassWord());
            preSta.setInt(5, user.getIsAdmin());
            preSta.setString(6, user.getName());
            preSta.setString(7, user.getPhone());
            preSta.setInt(8, user.getStatus());
            preSta.setString(9, user.getDay_register());
            int rs = preSta.executeUpdate();
            preSta.close();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean register(User user) {
        PreparedStatement preSta = null;
        Random rd = new Random();
        try {
            String sql = "INSERT INTO user(id,username,email,password,role,name,phone,status,day_register) VALUES (?,?,?,?,?,?,?,?,?);";
            preSta = ConnectDB.connect(sql);
            preSta.setString(1, "user" + rd.nextInt(1000000) + rd.nextInt(100000));
            preSta.setString(2, user.getUserName());
            preSta.setString(3, user.getEmail());
            preSta.setString(4, user.getPassWord());
            preSta.setInt(5, user.getIsAdmin());
            preSta.setString(6, user.getName());
            preSta.setString(7, user.getPhone());
            preSta.setInt(8, user.getStatus());
            preSta.setString(9, user.getDay_register());
            int rs = preSta.executeUpdate();
            preSta.close();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean updateUser(String id, User user) {
        PreparedStatement preSta = null;
        Random rd = new Random();
        try {
            String sql = "UPDATE user set username=? ,email=?,password=?,role,=?,name=?,phone=?,status=? where id = ?";
            preSta = ConnectDB.connect(sql);
            preSta.setString(1, user.getUserName());
            preSta.setString(2, user.getEmail());
            preSta.setString(3, user.getPassWord());
            preSta.setInt(4, user.getIsAdmin());
            preSta.setString(5, user.getName());
            preSta.setString(6, user.getPhone());
            preSta.setInt(7, user.getStatus());
            preSta.setString(9, id);
            int rs = preSta.executeUpdate();
            preSta.close();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    //
    public static void deleteUser(String idUser) {
        PreparedStatement s = null;
        try {
            String sql = "DELETE  from user where id = ?";
            s = ConnectDB.connect(sql);
            s.setString(1, idUser);
            int rs = s.executeUpdate();
            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void lockUser(String idUser) {
        PreparedStatement s = null;
        try {
            String sql = "UPDATE user set status = 0 where id = ?";
            s = ConnectDB.connect(sql);
            s.setString(1, idUser);
            int rs = s.executeUpdate();
            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void unlockUser(String idUser) {
        PreparedStatement s = null;
        try {
            String sql = "UPDATE user set status = 1 where id = ?";
            s = ConnectDB.connect(sql);
            s.setString(1, idUser);
            int rs = s.executeUpdate();
            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }


    public static boolean existEmail(String email) {
        PreparedStatement s = null;
        try {
            String sql = "select * from user where email = ?";
            s = ConnectDB.connect(sql);
            s.setString(1, email);
            ResultSet rs = s.executeQuery();
            if (rs.next()) return true;
            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public static boolean checkUsernameEmail(String userName, String email) {
        PreparedStatement preSta = null;
        try {
            String sql = "select username,email from user where username=? and email =?";
            preSta = ConnectDB.connect(sql);
            preSta.setString(1, userName);
            preSta.setString(2, email);
            ResultSet rs = preSta.executeQuery();
            if (rs.next()) {
                rs.getString(2);
                rs.getString(3);
                return true;
            }
            rs.close();
            preSta.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }


    public int countUser() {
        PreparedStatement pre = null;
        int count = 0;
        try {
            String sql = "SELECT * FROM user";
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

    // tìm kiếm theo tên sản phẩm

    public static void updatePassword(String email, String password) {
        PreparedStatement preSta = null;
        try {
            String sql = "UPDATE user SET password=? WHERE email=? ";
            preSta = ConnectDB.connect(sql);
            preSta.setString(1, password);
            preSta.setString(2, email);
            preSta.executeUpdate();

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public static User checkUser(String username, String password) {
        PreparedStatement preSta = null;
        try {
            String sql = "select * from user where username = ? and password = ?";
            preSta = ConnectDB.connect(sql);
            preSta.setString(1, username);
            preSta.setString(2, password);
            ResultSet rs = preSta.executeQuery();
            User user =null;
            if (rs.next()) {
                user = new User(
                        rs.getString(1), rs.getString(2), rs.getString(3)
                        , rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                );
                return user;
            }
            rs.close();
            preSta.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int getStatus(String username) {
        int status=0;
        PreparedStatement pre = null;
        try {
            String sql = "select status from user where username=? ";
            pre = ConnectDB.connect(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return status = rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public static User getUser(String username) {
        PreparedStatement preSta = null;
        try {
            String sql = "select * from user where username = ? ";
            preSta = ConnectDB.connect(sql);
            preSta.setString(1, username);
            ResultSet rs = preSta.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getString(1), rs.getString(2), rs.getString(3)
                        , rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                );
                return user;
            }
            rs.close();
            preSta.close();
            return null;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static int getRoleDB(String username){
        int res = 0;
        PreparedStatement pre = null;
        try {
            String sql = "select role from user where username=? ";
            pre = ConnectDB.connect(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return res = rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    public static void main(String[] args) {
        UserService service = new UserService();
        boolean u = existUserName("quanghuy.fs");
        User user = new User("user10000000", "quahuysuper", "qy0029a@gmail.com", "212002", 1, "Bùi Quang Huy", "0981722033", 1, "12/12/2002");
//        register(user);
        System.out.println(getByIdUser("user65428064694"));
//        System.out.println(u);
//        System.out.println(register(user));
//        UserService u = new UserService();
//        System.out.println(u.register(new User("2","trung2", "trung2@gmail.com", "0912271440", "đl" , "1234")));
    }
}