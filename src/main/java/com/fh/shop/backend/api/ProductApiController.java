package com.fh.shop.backend.api;

import com.fh.shop.backend.biz.product.IProductService;
import com.fh.shop.backend.common.ServerResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("api/product")
public class ProductApiController {

    @Resource(name = "productService")
    private IProductService productService;


    @RequestMapping("queryProductApi")
    public Object queryProductApi(String callback){
        List<ProductVO> productVOList= productService.queryProductApi();
        if(StringUtils.isNotEmpty(callback)){
            MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(ServerResponse.success(productVOList));
            mappingJacksonValue.setJsonpFunction(callback);
            return mappingJacksonValue;
        }else{
            return ServerResponse.success(productVOList);
        }

    }
}
