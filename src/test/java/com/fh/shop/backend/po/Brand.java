package com.fh.shop.backend.po;

public class Brand {

    private String brandName;

    public Brand (){

    }
    public Brand(String brandName){
        this.brandName = brandName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}
