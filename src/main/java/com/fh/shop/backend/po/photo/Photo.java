package com.fh.shop.backend.po.photo;

import com.fh.shop.backend.po.product.Product;

import java.io.Serializable;

public class Photo implements Serializable {
    private static final long serialVersionUID = -6013959861610520910L;
    private int id;
    private String photoPath;
    private String photoName;
    private Product product=new Product();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
