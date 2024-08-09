package service;

import bean.Order;
import bean.OrderDetail;
import bean.Product;
import database.ConnectDB;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

public class OrderService {
    public static List<Order> getAllOrder() {
        List<Order> listOrder = new LinkedList<>();
            PreparedStatement pState = null;
            String sql = "SELECT * FROM `order` ";
        try {
            pState = ConnectDB.connect(sql);
            ResultSet rs = pState.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10));
                listOrder.add(order);
            }
            rs.close();
            pState.close();

        } catch (SQLException|ClassNotFoundException e) {
            e.printStackTrace();

        }
        return listOrder;
    }
    public static List<OrderDetail> getOrderNotDeliver(String id) {
            PreparedStatement s = null;
            try {
                String sql = "SELECT o.id_product,o.id_order,p.`name`,p.price-p.price*(p.sale/100),o.quantity,o.totalPrice FROM products p join order_detail o on p.id=o.id_product JOIN `order` d on o.id_order=d.id WHERE d.id_user=? AND d.`status`=?;";
                s = ConnectDB.connect(sql);
                s.setString(1, id);
                s.setInt(2, 0);
                ResultSet rs = s.executeQuery();
                List<OrderDetail> listOrder = new LinkedList<>();
                while (rs.next()) {
                    OrderDetail orderDetail = new OrderDetail(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getInt(6));
                    listOrder.add(orderDetail);
                }
                rs.close();
                s.close();
                return listOrder;
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                return new LinkedList<>();
            }
        }
    public static void insertOrder(String userID, String username, int priceTotal,
                            String address, String phone,String email){
        PreparedStatement ps = null;
        try{
            String sql = "insert into `order`values (?,?,?,?,?,?,?,?,?,?)";
            ps = ConnectDB.connect(sql);
            Random rd = new Random();
            String idOrder="order"+rd.nextInt(1000000000)+rd.nextInt(1000000);
            ps.setString(1, idOrder);
            ps.setString(2, userID);
            ps.setString(3, username);
            ps.setInt(4, priceTotal);
            ps.setString(5, address);
            ps.setString(6, phone);
            ps.setString(7, email);
            ps.setInt(8, 0);
            ps.setDate(9, Date.valueOf(java.time.LocalDate.now()));
            ps.setDate(10, Date.valueOf(java.time.LocalDate.now()));
            ps.executeUpdate();
            ps.close();

        }

        catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
        }

    }


    public static void updateStatus(String id){
        PreparedStatement s = null;
        try {
            String sql = "update `order` set status = 1 where id = ?";
            s = ConnectDB.connect(sql);
            s.setString(1,id);
            int rs = s.executeUpdate();
            s.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public static void deleteOrder(String id){
        PreparedStatement s = null;
        try {
            String sql = "DELETE from `order` WHERE id = ?";
            s = ConnectDB.connect(sql);
            s.setString(1,id);
            int rs = s.executeUpdate();
            s.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static int countOrder() {
        PreparedStatement pre = null;
        int count=0;
        try {
            String sql = "SELECT * FROM `order`";
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

    public static void main(String[] args) {
//        deleteOrder("1324653113234");
        insertOrder("admin","unaghuy",45554545,"binhduong","134910843","@gmail");
    }
}
