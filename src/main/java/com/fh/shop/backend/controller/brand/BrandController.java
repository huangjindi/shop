/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:BrandController.java 
 * 包名:com.fh.shop.backend.controller.brand 
 * 创建日期:2018年12月23日下午8:11:26 
 * Copyright (c) 2018, 1328055490@qq.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.controller.brand;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fh.shop.backend.annotation.LogAnnotation;
import com.fh.shop.backend.common.ServerResponseDataTable;
import com.fh.shop.backend.po.product.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.shop.backend.biz.brand.IBrandService;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.controller.BaseController;
import com.fh.shop.backend.po.brand.Brand;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：BrandController    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2018年12月23日 下午8:11:26    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2018年12月23日 下午8:11:26    
 * 修改备注：       
 * @version </pre>    
 */
@Controller
@RequestMapping("/brand")
public class BrandController extends BaseController{

	@Resource(name="brandService")
	private IBrandService brandService;

	@RequestMapping("toBueryBrandList")
	public String toBueryBrandList(){

		return "brand/brandList";
	}

	/**
	 * <pre>queryBrandList(品牌分页查询)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2019年1月17日 下午2:39:24    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2019年1月17日 下午2:39:24    
	 * 修改备注： 
	 * @param brand
	 * @return</pre>
	 */
	@RequestMapping("queryBrandList")
	@ResponseBody
	public ServerResponse queryBrandList(Brand brand, Integer start, Integer length, Integer draw, HttpServletRequest request){
		String order = request.getParameter("order[0][column]");
		String orderDir = request.getParameter("order[0][dir]");
		String orderName = request.getParameter("columns["+order+"][data]");
		brand.setField(orderName);
		brand.setSort(orderDir);
		brand.setStartPos(start);
		brand.setPageSize(length);
		Long totalCount=brandService.queryCount(brand);
		List<Brand> brandList=brandService.queryBrandList(brand);
        ServerResponseDataTable serverResponseDataTable = ServerResponseDataTable.success(draw, totalCount, totalCount, brandList);
		return ServerResponse.success(serverResponseDataTable);
	}
	/**
	 * <pre>addBrand(品牌添加)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2019年1月17日 下午2:40:13    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2019年1月17日 下午2:40:13    
	 * 修改备注： 
	 * @param brand
	 * @return</pre>
	 */
	@LogAnnotation("品牌添加")
	@RequestMapping("addBrand")
	@ResponseBody
	public ServerResponse addBrand(Brand brand){
			brandService.addBrand(brand);
		return ServerResponse.success();
	}
	/**
	 * <pre>deleteBrand(品牌删除)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2019年1月17日 下午2:40:31    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2019年1月17日 下午2:40:31    
	 * 修改备注： 
	 * @param id
	 * @param response
	 * @return</pre>
	 */
	@LogAnnotation("品牌删除")
	@RequestMapping("deleteBrand")
	@ResponseBody
	public ServerResponse deleteBrand(Integer id,HttpServletResponse response){
			brandService.deleteProduct(id);
		return ServerResponse.success();
	}
	/**
	 * <pre>updateBrand(品牌修改)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2019年1月17日 下午2:41:17    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2019年1月17日 下午2:41:17    
	 * 修改备注： 
	 * @param brand
	 * @return</pre>
	 */
	@LogAnnotation("品牌修改")
	@RequestMapping("updateBrand")
	@ResponseBody
	public ServerResponse updateBrand(Brand brand){
			brandService.updateBrand(brand);
		return ServerResponse.success();
	}
	/**
	 * <pre>deleteAll(品牌批量删除)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2019年1月17日 下午2:41:35    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2019年1月17日 下午2:41:35    
	 * 修改备注： 
	 * @param ids
	 * @param response
	 * @return</pre>
	 */
	@LogAnnotation("品牌批量删除")
	@RequestMapping("deleteAll")
	@ResponseBody
	public ServerResponse deleteAll(String ids,HttpServletResponse response){
			brandService.deleteAll(ids);
		return ServerResponse.success();
	}
	/**
	 * <pre>brandList(品牌普通查询)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2019年1月17日 下午2:41:51    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2019年1月17日 下午2:41:51    
	 * 修改备注： 
	 * @return</pre>
	 */
	@RequestMapping("brandList")
	public @ResponseBody ServerResponse brandList(){
		List<Brand> brandList=brandService.brandList();
		return ServerResponse.success(brandList);
	}

	@RequestMapping("toUpdateBrand")
	@ResponseBody
	public ServerResponse toUpdateBrand(Brand brand){
		Brand brandInfo = brandService.toUpdateBrand(brand.getId());
		return ServerResponse.success(brandInfo);
	}

	@RequestMapping("toBueryBrandJsp")
	public String toBueryBrandJsp(){
		return "brand/brandList";
	}
}
