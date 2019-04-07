package com.fh.shop.backend.api;

import java.io.Serializable;

public class ProductVO implements Serializable {

    private static final long serialVersionUID = -2917333609625212524L;
    private Integer id;
    private String productName;
    private Float productPrice;
    private String photoPath;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Float getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Float productPrice) {
        this.productPrice = productPrice;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }
}
