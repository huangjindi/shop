/** 
 * <pre>项目名称:shop-admin-v1 
 * 文件名称:ResponseEnum.java 
 * 包名:com.fh.shop.backend.common 
 * 创建日期:2019年1月12日上午10:43:26 
 * Copyright (c) 2019, 1328055490@qq.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.common;

/** 
 * <pre>项目名称：shop-admin-v1    
 * 类名称：ResponseEnum    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2019年1月12日 上午10:43:26    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2019年1月12日 上午10:43:26    
 * 修改备注：       
 * @version </pre>    
 */
public enum ResponseEnum {

	USERNAME_USERPWD_EMPTY(1001,"用户名或密码不能为空"),
	USER_EMPTY(1002,"用户名不存在"),
	USERPWD_ERROR(1003,"用户名或密码错误"),
	USER_IMGCODE_EMPTY(1004,"验证码不能为空"),
	USER_IMGCODE_ERROR(1005,"验证码错误"),
	USER_LOGINFLAG(1006,"账号已被锁定"),
	ERROR(-1,"ERROR"),
	SUCCESS(200,"SUCCESS");
	
	private int code;
	private String msg;
	
	public int getCode() {
		return code;
	}
	public String getMsg() {
		return msg;
	}
	   
	/**    
	 * <pre>无参 ResponseEnum.    
	 *    
	 * @param code
	 * @param msg</pre>    
	 */
	private ResponseEnum(int code, String msg) {
		this.code = code;
		this.msg = msg;
	}
	
}
