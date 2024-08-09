package service;

import bean.Product;
import controller.ListProduct;
import database.ConnectDB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class ProductService {
    public static List<Product> getAllProduct() {
        List<Product> listProducts;

        try {

            PreparedStatement pState = null;
            String sql = "select * from products where status=?";
            pState = ConnectDB.connect(sql);
            pState.setInt(1, 1);
            ResultSet rs = pState.executeQuery();
            listProducts = new LinkedList<>();
            while (rs.next()) {
                listProducts.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listProducts;
    }

    public static List<Product> getAll() {
        List<Product> listProducts;

        List<Product> listByCategory;

        try {

            PreparedStatement pState = null;
            String sql = "select * from products";
            pState = ConnectDB.connect(sql);
            ResultSet rs = pState.executeQuery();
            listProducts = new LinkedList<>();
            while (rs.next()) {
                listProducts.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listProducts;
    }

    public static Product getProductDetail(String idProduct) {
        Product p = null;
        try {
            PreparedStatement pState = null;
            String sql = "SELECT * FROM products WHERE id=?";
            pState = ConnectDB.connect(sql);

            pState.setString(1, idProduct);

            ResultSet rs = pState.executeQuery();
            rs.first();
            p = new Product(rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getInt(6),
                    rs.getInt(7),
                    rs.getString(8),
                    rs.getString(9),
                    rs.getInt(10),
                    rs.getInt(11),
                    rs.getInt(12), 1);


        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return p;
    }

    public static List<Product> getByPage(List<Product> list, int start, int end) {
        List<Product> listP = new ArrayList<>();
        for (int i = start; i < end; i++) {
            listP.add(list.get(i));
        }
        return listP;
    }

    public static Product getById(String idProduct) {
        Product p = null;
        try {
            PreparedStatement pState = null;
            String sql = "SELECT * FROM products WHERE id=?";
            pState = ConnectDB.connect(sql);

            pState.setString(1, idProduct);

            ResultSet rs = pState.executeQuery();
            rs.first();
            p = new Product(rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getInt(6),
                    rs.getInt(7),
                    rs.getString(8),
                    rs.getString(9),
                    rs.getInt(10),
                    rs.getInt(11),
                    rs.getInt(12), 1);

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return p;
    }

    public static List<Product> listNewProduct() {
        List<Product> listNewProduct;
        try {

            PreparedStatement pState = null;
            String sql = "select * from products where isNew=? and status=?";
            pState = ConnectDB.connect(sql);
            pState.setInt(1, 1);
            pState.setInt(2, 1);
            ResultSet rs = pState.executeQuery();
            listNewProduct = new LinkedList<>();
            while (rs.next()) {
                listNewProduct.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listNewProduct;
    }

    public static List<Product> getByType(String type) {
        List<Product> list;
        try {

            PreparedStatement pState = null;
            String sql = "select * from products where category=? and status=?";
            pState = ConnectDB.connect(sql);
            pState.setString(1, type);
            pState.setInt(2, 1);
            ResultSet rs = pState.executeQuery();
            list = new LinkedList<>();
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static void deleteProduct(String idProduct) {


        PreparedStatement pState = null;
        String sql = "Delete from products where id=?";
        try {
            pState = ConnectDB.connect(sql);
            pState.setString(1, idProduct);
            int rs = pState.executeUpdate();
            pState.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static void hideProduct(String id) {
        PreparedStatement s = null;
        try {

            String sql = "UPDATE products set status = ? where id = ?";
            s = ConnectDB.connect(sql);
            s.setInt(1, 0);
            s.setString(2, id);
            int rs = s.executeUpdate();
            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void nothideProduct(String id) {
        PreparedStatement s = null;
        try {
            String sql = "UPDATE products set status = ? where id = ?";
            s = ConnectDB.connect(sql);
            s.setInt(1, 1);
            s.setString(2, id);
            int rs = s.executeUpdate();
            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean existProductName(String name) {
        PreparedStatement s = null;
        try {
            String sql = "select * from products where name = ?";
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

    public static List<Product> listBestSeller() {
        List<Product> listBestSeller;
        try {

            PreparedStatement pState = null;
            String sql = "SELECT * FROM products where status =? limit 20;";
            pState = ConnectDB.connect(sql);
            pState.setInt(1, 1);
            ResultSet rs = pState.executeQuery();
            listBestSeller = new LinkedList<>();
            while (rs.next()) {
                listBestSeller.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listBestSeller;
    }

    public static List<Product> listHintForYou() {
        List<Product> listHintForYou;
        try {

            PreparedStatement pState = null;
            String sql = "SELECT * FROM products where status =? limit 10;";
            pState = ConnectDB.connect(sql);
            pState.setInt(1, 1);
            ResultSet rs = pState.executeQuery();
            listHintForYou = new LinkedList<>();
            while (rs.next()) {
                listHintForYou.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listHintForYou;
    }

    public static void updateProduct(String id, Product product) {
        PreparedStatement s = null;
        try {
            String sql = "UPDATE products set name= ?, descripsion = ?, size = ?, category = ?, price = ?, sale = ?," +
                    " image1 = ?, image2 = ?, quantity = ?, isNew = ?, status = ? where id = ?";
            s = ConnectDB.connect(sql);
            s.setString(1, product.getProductName());
            s.setString(2, product.getDescription());
            s.setString(3, product.getSize());
            s.setString(4, product.getCategory());
            s.setInt(5, product.getPrice());
            s.setInt(6, product.getSalePrice());
            s.setString(7, product.getImage1());
            s.setString(8, product.getImage2());
            s.setInt(9, product.getQuantity());
            s.setInt(10, product.getIsNew());
            s.setInt(11, product.getStatus());
            s.setString(12, id);
            int rs = s.executeUpdate();

            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void addProduct(Product product) {
        PreparedStatement s = null;
        try {

            String sql = "INSERT into products values (?,?,?,?,?,?,?,?,?,?,?,?);";
            s = ConnectDB.connect(sql);
            s.setString(1, product.getProductID());
            s.setString(2, product.getProductName());
            s.setString(3, product.getDescription());
            s.setString(4, product.getSize());
            s.setString(5, product.getCategory());
            s.setInt(6, product.getPrice());
            s.setInt(7, product.getSalePrice());
            s.setString(8, product.getImage1());
            s.setString(9, product.getImage2());
            s.setInt(10, product.getQuantity());
            s.setInt(11, product.getIsNew());
            s.setInt(12, product.getStatus());
            int rs = s.executeUpdate();

            s.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Product> searchByName(String txtSearch) {

        PreparedStatement pre = null;
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE name LIKE ?;";
        try {
            pre = ConnectDB.connect(sql);
            pre.setString(1, "%" + txtSearch + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        1));
            }
        } catch (Exception e) {
            e.getStackTrace();
        }
        return list;
    }



    public static List<Product> listProductA_Z() {
        List<Product> listProductA_Z;
        try {

            PreparedStatement pState = null;
            String sql = "select * from products order by name asc";
            pState = ConnectDB.connect(sql);
            ResultSet rs = pState.executeQuery();
            listProductA_Z = new LinkedList<>();
            while (rs.next()) {
                listProductA_Z.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listProductA_Z;
    }

    public static List<Product> listProductZ_A() {
        List<Product> listProductZ_A;
        try {

            PreparedStatement pState = null;
            String sql = "select * from products order by name desc";
            pState = ConnectDB.connect(sql);
            ResultSet rs = pState.executeQuery();
            listProductZ_A = new LinkedList<>();
            while (rs.next()) {
                listProductZ_A.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listProductZ_A;
    }

    public static List<Product> listPriceHighToLow() {
        List<Product> listPriceHighToLow;
        try {

            PreparedStatement pState = null;
            String sql = "select * from products ORDER BY price-(price*sale/100) desc";
            pState = ConnectDB.connect(sql);
            ResultSet rs = pState.executeQuery();
            listPriceHighToLow = new LinkedList<>();
            while (rs.next()) {
                listPriceHighToLow.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listPriceHighToLow;
    }

    public static List<Product> listPriceLowToHigh() {
        List<Product> listPriceLowToHigh;
        try {

            PreparedStatement pState = null;
            String sql = "select * from products ORDER BY price-(price*sale/100) asc";
            pState = ConnectDB.connect(sql);
            ResultSet rs = pState.executeQuery();
            listPriceLowToHigh = new LinkedList<>();
            while (rs.next()) {
                listPriceLowToHigh.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listPriceLowToHigh;
    }

    public static List<Product> getCategory1() {
        List<Product> getCategory;
        try {

            PreparedStatement pState = null;
            String sql = "select * from products where category=?";
            pState = ConnectDB.connect(sql);
            pState.setString(1, "Gạch lát nền");
            ResultSet rs = pState.executeQuery();
            getCategory = new LinkedList<>();
            while (rs.next()) {
                getCategory.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return getCategory;
    }

    public static List<Product> getCategory2() {
        List<Product> getCategory;
        try {

            PreparedStatement pState = null;
            String sql = "select * from products where category=?";
            pState = ConnectDB.connect(sql);
            pState.setString(1, "Gạch ốp tường");
            ResultSet rs = pState.executeQuery();
            getCategory = new LinkedList<>();
            while (rs.next()) {
                getCategory.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return getCategory;
    }

    public static List<Product> getCategory3() {
        List<Product> getCategory;
        try {

            PreparedStatement pState = null;
            String sql = "select * from products where category=?";
            pState = ConnectDB.connect(sql);
            pState.setString(1, "Gạch trang trí");
            ResultSet rs = pState.executeQuery();
            getCategory = new LinkedList<>();
            while (rs.next()) {
                getCategory.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return getCategory;
    }

    public static List<Product> getCategory4() {
        List<Product> getCategory;
        try {

            PreparedStatement pState = null;
            String sql = "select * from products where category=?";
            pState = ConnectDB.connect(sql);
            pState.setString(1, "Gạch giả gỗ");
            ResultSet rs = pState.executeQuery();
            getCategory = new LinkedList<>();
            while (rs.next()) {
                getCategory.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12), 1));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return getCategory;
    }

    public static void main(String[] args) {
//        ProductService list = new ProductService();
////        System.out.println(list.getAllProduct().toString());
////        System.out.println(list.listNewProduct().toString());
//
        System.out.println(2/12);
//        Product p = new Product("sp315945", "Gạch bông F2118", "Gạch bông F2118 là sản phẩm gạch quen thuộc với người Việt Nam, được ứng dụng nhiều trong những không gian bếp, nhà vệ sinh, mảng miếng trang trí bởi tính thẩm mỹ, dễ phối màu, dễ lau " +
//                "chùi bụi bẩn. Khi bạn cần gạch ốp bếp, gạch ốp lát trang trí không gian quán cafe, sapa, ốp lát nhà tắm thì gạch bông men sẽ là 1 lựa chọn đầy thú vị cho ngôi nhà của bạn.", "200x200", "Gạch lát nền, Gạch ốp tường", 358000, 47,
//                "https://khatra.com.vn/wp-content/uploads/2022/10/F2118-view.jpg",
//                "https://khatra.com.vn/wp-content/uploads/2022/10/F2118-map.jpg", 189, 1, 1, 1);
//        addProduct(p);
//        deleteProduct("sp031");
//        updateProduct("sp315945",p);
//        System.out.println(searchByName("158224").toString());
    }

}
