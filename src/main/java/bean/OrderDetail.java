package bean;

import java.io.Serializable;

public class OrderDetail implements Serializable {
    private String productID;
    private String orderID;
    private String nameProduct;
    private int priceProduct;
    private int productQuantity;
    private int totalPrice;

    public OrderDetail(String productID, String orderID, String nameProduct, int priceProduct, int productQuantity, int totalPrice) {
        this.productID = productID;
        this.orderID = orderID;
        this.nameProduct = nameProduct;
        this.priceProduct = priceProduct;
        this.productQuantity = productQuantity;
        this.totalPrice = totalPrice;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public int getPriceProduct() {
        return priceProduct;
    }

    public void setPriceProduct(int priceProduct) {
        this.priceProduct = priceProduct;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
}