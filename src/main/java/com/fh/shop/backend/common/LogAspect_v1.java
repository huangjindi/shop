package com.fh.shop.backend.common;

import com.fh.shop.backend.annotation.LogAnnotation;
import com.fh.shop.backend.biz.log.ILogService;
import com.fh.shop.backend.po.log.Log;
import com.fh.shop.backend.po.user.User;
import com.fh.shop.backend.util.SystemContent;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.lang.reflect.Method;
import java.util.Date;

public class LogAspect_v1 {
    @Resource(name="logService")
    private ILogService logService;
    Log log=new Log();

    private static final Logger LOG = LoggerFactory.getLogger(LogAspect_v1.class);

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
            long beginTime = System.currentTimeMillis();
            result = pjp.proceed();
            long endTime = System.currentTimeMillis();
            userInfo = (User) WebContext.getRequest().getSession().getAttribute(SystemContent.SESSION_USER);
            if(userInfo != null){
                LOG.info("{}执行{}中的{}()成功", userInfo.getUserName(), className, methodName);
                log.setUserName(userInfo.getUserName());
                log.setInfo("执行"+className+"中的"+methodName+"()方法");
                log.setStatus(SystemContent.STATUS_SUCCESS);
                log.setContent(logValue);
                log.setCreateTime(new Date());
                log.setUseTime((int) (endTime-beginTime));
                logService.addLog(log);
            }
        } catch (Throwable e) {
            e.printStackTrace();
            userInfo = (User) WebContext.getRequest().getSession().getAttribute(SystemContent.SESSION_USER);
            if(userInfo != null) {
                LOG.error("{}执行{}中的{}()失败，原因：{}", userInfo.getUserName(), className, methodName, e.getMessage());
                log.setUserName(userInfo.getUserName());
                log.setInfo("执行" + className + "中的" + methodName + "()方法");
                log.setStatus(SystemContent.STATUS_ERROR);
                log.setContent(logValue);
                log.setCreateTime(new Date());
                log.setUseTime(SystemContent.EXECUTE_TIME_ERROR);
                logService.addLog(log);
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
