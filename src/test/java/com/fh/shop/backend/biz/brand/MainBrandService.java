package com.fh.shop.backend.biz.brand;

import org.springframework.context.support.ClassPathXmlApplicationContext;
/**
 * @Description:    MainBrandService
 * @Author:         ChenZR 1328055490@qq.com
 * @CreateDate:     2019/2/24 20:03
 * @UpdateUser:     ChenZR 1328055490@qq.com
 * @UpdateDate:     2019/2/24 20:03
 * @UpdateRemark:
 * @Version:        1.0
 */
public class MainBrandService {

    public static void main(String[] args) {
        String[] ContextPath = {"classpath:spring/spring-common.xml"};
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(ContextPath);
        IBrandService brandService = (IBrandService) context.getBean("brandService");
        brandService.deleteProduct(59);
    }
}
