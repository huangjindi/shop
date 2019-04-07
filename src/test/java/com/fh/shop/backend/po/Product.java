package com.fh.shop.backend.po;

public class Product {

    private String productName;
    private Integer price;

    private static final Product product = new Product();
    private Product (){

    }
    public static Product getInstance(){
        return product;
    }


    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }
}
