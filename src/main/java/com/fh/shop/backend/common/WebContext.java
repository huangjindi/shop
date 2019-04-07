package com.fh.shop.backend.common;

import javax.servlet.http.HttpServletRequest;

public class WebContext {

    private static ThreadLocal<HttpServletRequest> requestContext=new ThreadLocal<>();

    public static void setRequest(HttpServletRequest request){
        requestContext.set(request);
    }

    public static HttpServletRequest getRequest(){
        return requestContext.get();
    }

    public static void remove(){
        requestContext.remove();
    }
}
