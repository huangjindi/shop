package com.fh.shop.backend.common;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class WebContextFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//进行绑定
        WebContext.setRequest((HttpServletRequest) request);
        try{
            chain.doFilter(request, response);
            //不管执行成功与否，finally中的代码都会执行
        }finally{
            //解除绑定
            WebContext.remove();
        }
    }

    @Override
    public void destroy() {

    }
}
