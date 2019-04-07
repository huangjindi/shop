/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:LoginInterceptor.java 
 * 包名:com.fh.shop.backend.Interceptor 
 * 创建日期:2019年1月7日下午8:18:27 
 * Copyright (c) 2019, 1328055490@qq.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.Interceptor;

import com.fh.shop.backend.util.SystemContent;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：LoginInterceptor    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2019年1月7日 下午8:18:27    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2019年1月7日 下午8:18:27    
 * 修改备注：       
 * @version </pre>    
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// 在拦截点执行前拦截，如果返回true则不执行拦截点后的操作（拦截成功）
		//String uri = request.getRequestURI(); // 获取登录的uri，这个是不进行拦截的
		//if(session.getAttribute("LOGIN_USER")!=null || uri.indexOf("system/login")!=-1) {// 说明登录成功 或者 执行登录功能
		HttpSession session = request.getSession();
		if(session.getAttribute(SystemContent.SESSION_USER)!=null) {
			// 登录成功不拦截
			return true;
		}else {
			// 拦截后进入登录页面
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			// 返回false则不执行拦截
			return false;
		}
	}

}
