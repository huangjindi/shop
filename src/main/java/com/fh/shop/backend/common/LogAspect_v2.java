package com.fh.shop.backend.common;

import com.fh.shop.backend.annotation.LogAnnotation;
import com.fh.shop.backend.biz.log.ILogService;
import com.fh.shop.backend.po.log.Log;
import com.fh.shop.backend.po.user.User;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.lang.reflect.Method;

public class LogAspect_v2 {
    @Resource(name="logService")
    private ILogService logService;
    Log log=new Log();

    private static final Logger LOG = LoggerFactory.getLogger(LogAspect_v2.class);

    public Object logAspect(ProceedingJoinPoint pjp){

        Object result = null;
        User userInfo = null;
        String logValue ="";
        String className = pjp.getTarget().getClass().getName();
        String methodName = pjp.getSignature().getName();
        MethodSignature ms = (MethodSignature) pjp.getSignature();
        String simpleName = ms.getReturnType().getSimpleName();
        Method method = ms.getMethod();
        if(method.isAnnotationPresent(LogAnnotation.class)){
            LogAnnotation logAnnotation = method.getAnnotation(LogAnnotation.class);
            logValue = logAnnotation.value();
        }
        try {
            result = pjp.proceed();
            userInfo = (User) WebContext.getRequest().getSession().getAttribute("user");
            if(userInfo != null){
                LOG.info("{}执行{}中的{}()成功", userInfo.getUserName(), className, methodName);
            }
        } catch (Throwable e) {
            e.printStackTrace();
            userInfo = (User) WebContext.getRequest().getSession().getAttribute("user");
            if(userInfo != null) {
                LOG.error("{}执行{}中的{}()失败，原因：{}", userInfo.getUserName(), className, methodName, e.getMessage());
            }
            if(simpleName.equalsIgnoreCase("string")){
                return "/error";
            }else{
                return ServerResponse.error();
            }
        }
        return result;
    }
}
