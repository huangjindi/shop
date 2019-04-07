package com.fh.shop.backend.biz.brand;

import com.fh.shop.backend.po.brand.Brand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-common.xml"})
public class TestBrandService extends AbstractJUnit4SpringContextTests {
    @Resource(name="brandService")
    private IBrandService brandService;

    @Test
    public void addBrand(){
        Brand brandInfo=new Brand();
        brandInfo.setBrandName("苹果xs");
        Date newDate = new Date();
        brandInfo.setCreateTime(newDate);
        brandInfo.setUpdateTime(newDate);
        brandService.addBrand(brandInfo);
    }

    @Test
    public void findBrandList(){
        List<Brand> brandList = brandService.brandList();
        System.out.println(brandList);
    }

    @Test
    public void deleteBrand(){
        brandService.deleteProduct(88);
    }

    @Test
    public void updateBrand(){
        Brand brand=new Brand();
        brand.setBrandName("美图");
        brand.setUpdateTime(new Date());
        brand.setId(26);
        brandService.updateBrand(brand);
    }
}
