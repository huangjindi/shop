/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:User.java 
 * 包名:com.fh.shop.backend.po.user 
 * 创建日期:2019年1月7日下午3:53:18 
 * Copyright (c) 2019, 1328055490@qq.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.po.user;

import com.fh.shop.backend.po.Page;
import com.fh.shop.backend.po.department.Department;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：User    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2019年1月7日 下午3:53:18    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2019年1月7日 下午3:53:18    
 * 修改备注：       
 * @version </pre>    
 */
public class User extends Page implements Serializable{

	private static final long serialVersionUID = -3155258104276029543L;
	
	private Integer id;
	private String userName;
	private String userPwd;
	private String imgCode;
	private String salt;
	private Integer loginFlag = 0;
	private Date loginTime;
	private Date lastLoginTime;
	private Integer loginErrorFlag = 0;
	private Date loginErrorTime;
	private Integer status;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	private int userSex;
	private double userPay;
	private String realName;
	private String headerImg;
	//部门
	private Department department = new Department();

	private String ids;
	private List<Integer> deptList;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public String getImgCode() {
		return imgCode;
	}

	public void setImgCode(String imgCode) {
		this.imgCode = imgCode;
	}


	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public Integer getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(Integer loginFlag) {
		this.loginFlag = loginFlag;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Integer getLoginErrorFlag() {
		return loginErrorFlag;
	}

	public void setLoginErrorFlag(Integer loginErrorFlag) {
		this.loginErrorFlag = loginErrorFlag;
	}

	public Date getLoginErrorTime() {
		return loginErrorTime;
	}

	public void setLoginErrorTime(Date loginErrorTime) {
		this.loginErrorTime = loginErrorTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public int getUserSex() {
		return userSex;
	}

	public void setUserSex(int userSex) {
		this.userSex = userSex;
	}

	public double getUserPay() {
		return userPay;
	}

	public void setUserPay(double userPay) {
		this.userPay = userPay;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public List<Integer> getDeptList() {
		return deptList;
	}

	public void setDeptList(List<Integer> deptList) {
		this.deptList = deptList;
	}

	public String getHeaderImg() {
		return headerImg;
	}

	public void setHeaderImg(String headerImg) {
		this.headerImg = headerImg;
	}
}
