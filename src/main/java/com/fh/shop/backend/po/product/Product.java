/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:Product.java 
 * 包名:com.fh.shop.backend.po.product 
 * 创建日期:2018年12月23日下午8:03:18 
 * Copyright (c) 2018, 1328055490@qq.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.po.product;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fh.shop.backend.po.Page;
import com.fh.shop.backend.po.brand.Brand;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：Product    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2018年12月23日 下午8:03:18    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2018年12月23日 下午8:03:18    
 * 修改备注：       
 * @version </pre>    
 */
public class Product extends Page implements Serializable{

	private static final long serialVersionUID = 5306087749856060545L;

	private Integer id;
	private String productName;
	private Float productPrice;
	private Brand brand=new Brand();
	private String photoPath;
	private String photoName;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date updateTime;

	private String ids;
	
	private Float minPrice;
	private Float maxPrice;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date minCreateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date maxCreateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date minUpdateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date maxUpdateTime;
	
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Date getMinCreateTime() {
		return minCreateTime;
	}
	public void setMinCreateTime(Date minCreateTime) {
		this.minCreateTime = minCreateTime;
	}
	public Date getMaxCreateTime() {
		return maxCreateTime;
	}
	public void setMaxCreateTime(Date maxCreateTime) {
		this.maxCreateTime = maxCreateTime;
	}
	public Date getMinUpdateTime() {
		return minUpdateTime;
	}
	public void setMinUpdateTime(Date minUpdateTime) {
		this.minUpdateTime = minUpdateTime;
	}
	public Date getMaxUpdateTime() {
		return maxUpdateTime;
	}
	public void setMaxUpdateTime(Date maxUpdateTime) {
		this.maxUpdateTime = maxUpdateTime;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Float getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(Float minPrice) {
		this.minPrice = minPrice;
	}
	public Float getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Float maxPrice) {
		this.maxPrice = maxPrice;
	}
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

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
