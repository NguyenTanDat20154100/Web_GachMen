package service;

import bean.Reviews;
import controller.ProductDetail;
import database.ConnectDB;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class ReviewService {
    public static List<Reviews> getAllReviewProduct() {
        List<Reviews> listReviewProducts;

        try {

            PreparedStatement pState = null;
            String sql = "select * from reviews";
            pState = ConnectDB.connect(sql);
            ResultSet rs = pState.executeQuery();
            listReviewProducts = new LinkedList<>();
            while (rs.next()) {
                listReviewProducts.add(new Reviews(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3)));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listReviewProducts;
    }

    public static void insertReview(Reviews reviews) {
        PreparedStatement ps = null;
        try {
            String sql = "insert into reviews values(?, ?, ?)";
            ps = ConnectDB.connect(sql);
            ps.setString(1, reviews.getUserName());
            ps.setString(2, reviews.getContent());
            ps.setDate(3, Date.valueOf(java.time.LocalDate.now()));
            ps.executeUpdate();
            ps.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
        }
    }

    public static void main(String[] args) {
        insertReview(new Reviews("151515", "trung"));
        System.out.println(getAllReviewProduct().toString());
    }
}
