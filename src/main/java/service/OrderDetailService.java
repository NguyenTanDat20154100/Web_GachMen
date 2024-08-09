package service;

import bean.OrderDetail;
import bean.Product;
import database.ConnectDB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class OrderDetailService {
    public static List<OrderDetail> getDetailOrder(String id) {
        PreparedStatement s = null;
        try {
            String sql = "SELECT o.id_product,o.id_order,p.`name`,p.price-p.price*(p.sale/100),o.quantity,o.totalPrice\n" +
                    "                    FROM products p join order_detail o on p.id=o.id_product\n" +
                    "                    WHERE o.id_order=?";
            s = ConnectDB.connect(sql);
            s.setString(1, id);
            ResultSet rs = s.executeQuery();
            List<OrderDetail> listDetailOrders = new LinkedList<>();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6));
                listDetailOrders.add(orderDetail);
            }
            rs.close();
            s.close();
            return listDetailOrders;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return new LinkedList<>();
        }
    }

    public static List<OrderDetail> historyBuy(String id) {
        PreparedStatement s = null;
        try {
            String sql = "SELECT o.id_product,o.id_order,p.`name`,p.price-p.price*(p.sale/100),o.quantity,o.totalPrice\n" +
                    "FROM products p join order_detail o on p.id=o.id_product JOIN `order` d on o.id_order=d.id \n" +
                    "WHERE d.id_user=?";
            s = ConnectDB.connect(sql);
            s.setString(1, id);
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

    public static void updateStatus(String id) {
        PreparedStatement s = null;
        try {
            String sql = "update `order` set status = 1 where id = ?";
            s = ConnectDB.connect(sql);
            s.setString(1, id);
            int rs = s.executeUpdate();
            s.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }


    public static String getIdOrder() {
        PreparedStatement ps = null;
        try {
            String sql = "select * from `order` ";
            ps = ConnectDB.connect(sql);
            ResultSet rs = ps.executeQuery();
            rs.last();
            String id = rs.getString(1);
            rs.close();
            ps.close();
            return id;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
            return null;
        }
    }

    public static void insertOrderDetail(List<Product> p) {
        PreparedStatement ps = null;
        String orderID = getIdOrder();
        try {
            String sql = "insert into order_detail values (?,?,?,?)";
            ps = ConnectDB.connect(sql);

            for (int i = 0; i < p.size(); i++) {
                Product product = p.get(i);
                ps.setString(1, product.getProductID());
                ps.setString(2, orderID);
                ps.setInt(3, product.getQuantityCart());
                ps.setInt(4, ((int) (product.getPriceAfterSale() * product.getQuantityCart())));
                ps.executeUpdate();
            }
            ps.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
        }
    }

    public static void deleteOrderDetail(String id) {
        PreparedStatement s = null;
        try {
            String sql = "DELETE  from order_detail where id_order = ?";
            s = ConnectDB.connect(sql);
            s.setString(1, id);
            int rs = s.executeUpdate();
            s.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public static void deleteHistory(String id) {
        PreparedStatement s = null;
        try {
            String sql = "DELETE  from order_detail where id_product = ?";
            s = ConnectDB.connect(sql);
            s.setString(1, id);
            int rs = s.executeUpdate();
            s.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
//        System.out.println(getDetailOrder("13246531132342"));
//        System.out.println(getIdOrder());
//        Product p = new Product("sp35945", "Gạch bông F2118", "Gạch bông F2118 là sản phẩm gạch quen thuộc với người Việt Nam, được ứng dụng nhiều trong những không gian bếp, nhà vệ sinh, mảng miếng trang trí bởi tính thẩm mỹ, dễ phối màu, dễ lau " +
//                "chùi bụi bẩn. Khi bạn cần gạch ốp bếp, gạch ốp lát trang trí không gian quán cafe, sapa, ốp lát nhà tắm thì gạch bông men sẽ là 1 lựa chọn đầy thú vị cho ngôi nhà của bạn.", "200x200", "Gạch lát nền, Gạch ốp tường", 358000, 47,
//                "https://khatra.com.vn/wp-content/uploads/2022/10/F2118-view.jpg",
//                "https://khatra.com.vn/wp-content/uploads/2022/10/F2118-map.jpg", 189, 1, 1, 1);
//        Product p2 = new Product("sp31594", "Gạch bông F2118", "Gạch bông F2118 là sản phẩm gạch quen thuộc với người Việt Nam, được ứng dụng nhiều trong những không gian bếp, nhà vệ sinh, mảng miếng trang trí bởi tính thẩm mỹ, dễ phối màu, dễ lau " +
//                "chùi bụi bẩn. Khi bạn cần gạch ốp bếp, gạch ốp lát trang trí không gian quán cafe, sapa, ốp lát nhà tắm thì gạch bông men sẽ là 1 lựa chọn đầy thú vị cho ngôi nhà của bạn.", "200x200", "Gạch lát nền, Gạch ốp tường", 358000, 47,
//                "https://khatra.com.vn/wp-content/uploads/2022/10/F2118-view.jpg",
//                "https://khatra.com.vn/wp-content/uploads/2022/10/F2118-map.jpg", 189, 1, 1, 1);
//        Product p3 = new Product("sp15945", "Gạch bông F2118", "Gạch bông F2118 là sản phẩm gạch quen thuộc với người Việt Nam, được ứng dụng nhiều trong những không gian bếp, nhà vệ sinh, mảng miếng trang trí bởi tính thẩm mỹ, dễ phối màu, dễ lau " +
//                "chùi bụi bẩn. Khi bạn cần gạch ốp bếp, gạch ốp lát trang trí không gian quán cafe, sapa, ốp lát nhà tắm thì gạch bông men sẽ là 1 lựa chọn đầy thú vị cho ngôi nhà của bạn.", "200x200", "Gạch lát nền, Gạch ốp tường", 358000, 47,
//                "https://khatra.com.vn/wp-content/uploads/2022/10/F2118-view.jpg",
//                "https://khatra.com.vn/wp-content/uploads/2022/10/F2118-map.jpg", 189, 1, 1, 1);
//        List<Product> list = new ArrayList<>();
//        list.add(p);
//        list.add(p2);
//        list.add(p3);
//        insertOrderDetail(list);
            System.out.println(getDetailOrder("order178892416887043").toString());
    }
}
