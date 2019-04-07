package com.fh.shop.backend.controller;

import com.fh.shop.backend.po.Brand;
import com.fh.shop.backend.po.Product;
import org.junit.Test;

public class MainController {
    public static void main(String[] args) {
       /* Product productInfo = (Product) createObj("com.fh.shop.backend.po.Product");
            productInfo.setProductName("小米6s");
            productInfo.setPrice(3400);
        System.out.println(productInfo);
        Brand brandInfo = (Brand) createObj("com.fh.shop.backend.po.Brand");
        brandInfo.setBrandName("小米");
        System.out.println(brandInfo);*/

        Product product = Product.getInstance();
        product.setProductName("苹果x");
        product.setPrice(10000);
        System.out.println(product.getProductName()+":"+product.getPrice());
        Product product1 = Product.getInstance();
        product1.setProductName("小米8");
        product1.setPrice(3200);
        System.out.println(product1.getProductName()+":"+product1.getPrice());
        System.out.println(product.getProductName()+":"+product.getPrice());
        System.out.println(product == product1);
    }


    public static Object createObj(String name){
        try {
            Object instance = Class.forName(name).newInstance();
            return instance;
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
