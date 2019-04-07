/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:ProductServiceImpl.java 
 * 包名:com.fh.shop.backend.biz.product.impl 
 * 创建日期:2018年12月23日下午8:05:01 
 * Copyright (c) 2018, 1328055490@qq.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.product.impl;

import com.fh.shop.backend.api.ProductVO;
import com.fh.shop.backend.biz.photo.IPhotoService;
import com.fh.shop.backend.biz.product.IProductService;
import com.fh.shop.backend.common.FileInfo;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.mapper.product.IProductMapper;
import com.fh.shop.backend.po.photo.Photo;
import com.fh.shop.backend.po.product.Product;
import com.fh.shop.backend.util.DateUtils;
import com.fh.shop.backend.util.FileUtil;
import com.fh.shop.backend.util.SystemContent;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：ProductServiceImpl    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2018年12月23日 下午8:05:01    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2018年12月23日 下午8:05:01    
 * 修改备注：       
 * @version </pre>    
 */
//<bean id="productServiceImpl" class="com.fh.shop.backend.biz.product.impl.ProductServiceImpl"></bean>
@Service("productService")
public class ProductServiceImpl implements IProductService{

	@Autowired
	private IProductMapper productMapper;
	@Resource(name="photoService")
	private IPhotoService photoService;
	
	public ServerResponse addProduct(Product product) {
		Date dateNow = DateUtils.getDateNow();
		product.setCreateTime(dateNow);
		product.setUpdateTime(dateNow);
		try {
			productMapper.addProduct(product);
		} catch (Exception e) {
			e.printStackTrace();
			return ServerResponse.error();
		}
		return ServerResponse.success();
	}

	private List<Photo> addChildPhoto(Product product, String realPath , FileInfo fileInfo) {
		List<Photo> photoList=new ArrayList<>();
		for (int i=0; i<fileInfo.getMultipartFile().length; i++){
			MultipartFile multipartFile = fileInfo.getMultipartFile()[i];
			if(multipartFile.getSize()>0) {
				try {
					String copyFile = FileUtil.copyFile(multipartFile.getInputStream(), multipartFile.getOriginalFilename(), realPath);
					Photo photoInfo=new Photo();
					photoInfo.getProduct().setId(product.getId());
					photoInfo.setPhotoPath(SystemContent.PRODUCT_IMAGES_PATH + copyFile);
					photoInfo.setPhotoName(multipartFile.getOriginalFilename());
					photoList.add(photoInfo);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return photoList;
	}

	private void addPhoto(Product product, String realPath, FileInfo fileInfo) {
		if(fileInfo.getSize()>0) {
			String copyFile = FileUtil.copyFile(fileInfo.getIs(), fileInfo.getFileName(), realPath);
			product.setPhotoPath(SystemContent.PRODUCT_IMAGES_PATH + copyFile);
			product.setPhotoName(fileInfo.getFileName());
		}
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.product.IProductService#queryProductList()    
	 */
	@Override
	public List<Product> queryProductList(Product product) {
		return productMapper.queryProductList(product);
	}
	
	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.product.IProductService#countProduct(com.fh.shop.backend.po.product.Product)    
	 */
	@Override
	public Long countProduct(Product product) {
			return productMapper.countProduct(product);
	}
	
	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.product.IProductService#deleteProduct(java.lang.Integer)    
	 */
	@Override
	public void deleteProduct(Integer id) {
		productMapper.deleteProduct(id);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.product.IProductService#updateProduct(java.lang.Integer)    
	 */
	@Override
	public Product toUpdateProduct(Integer id) {
		return productMapper.toUpdateProduct(id);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.product.IProductService#updateProduct(com.fh.shop.backend.po.product.Product)    
	 */
	@Override
	public void updateProduct(FileInfo fileInfo, Product product,String realPath) {
		//获取当前时间
		product.setUpdateTime(DateUtils.getDateNow());
		//更新主图
		updatePhoto(fileInfo, product, realPath);
		//修改主图
		productMapper.updateProduct(product);
		//子图片的批量删除
		deletePhoto(product, realPath);
		//添加子图
		addChildPhoto(fileInfo, product, realPath);
	}

	private void addChildPhoto(FileInfo fileInfo, Product product, String realPath) {
		List<Photo> photoList=new ArrayList<>();
		MultipartFile[] photo = fileInfo.getMultipartFile();
		for (int i=0; i<photo.length; i++){
			MultipartFile multipartFile = photo[i];
			if(multipartFile.getSize()>0) {
				try {
					String copyFile = FileUtil.copyFile(multipartFile.getInputStream(), multipartFile.getOriginalFilename(), realPath+SystemContent.PRODUCT_IMAGES_PATH);
					Photo photoDB=new Photo();
					photoDB.getProduct().setId(product.getId());
					photoDB.setPhotoName(multipartFile.getOriginalFilename());
					photoDB.setPhotoPath(SystemContent.PRODUCT_IMAGES_PATH + copyFile);
					photoList.add(photoDB);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		if(photoList.size()>0) {
			photoService.addPhoto(photoList);
		}
	}

	private void deletePhoto(Product product, String realPath) {
		if(!product.getIds().isEmpty()){
			String photoIds = product.getIds();
			String[] splitIds = photoIds.split(",");
			List listIds=new ArrayList();
			for (int i=0; i<splitIds.length;i++){
				listIds.add(splitIds[i]);
				Integer splitId = Integer.parseInt(splitIds[i]);
				Photo photoInfo=photoService.selectPhoto(splitId);
				//删除服务器硬盘上的旧图片
				FileUtil.deletePhoto(realPath+photoInfo.getPhotoPath());
			}
			//删除数据库的图片
			photoService.deletePhoto(listIds);
		}
	}

	private void updatePhoto(FileInfo fileInfo, Product product, String realPath) {
		if(fileInfo.getSize()>0){
			//删除旧图片
			FileUtil.deletePhoto(realPath);
			//上传新图片
			addImage(fileInfo, product, realPath);
		}
	}

	private void addImage(FileInfo fileInfo, Product product, String realPath) {
		String copyFile = FileUtil.copyFile(fileInfo.getIs(), fileInfo.getFileName(), realPath+SystemContent.PRODUCT_IMAGES_PATH);
		product.setPhotoPath(SystemContent.PRODUCT_IMAGES_PATH+copyFile);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.product.IProductService#deleteAll(java.lang.String)    
	 */
	@Override
	public void deleteAll(String ids) {
		if(StringUtils.isNotEmpty(ids)){
			List<Integer> idsList=new ArrayList<Integer>();
			String[] idsArr = ids.split(",");
			for (String id : idsArr) {
				idsList.add(Integer.parseInt(id));
			}
			productMapper.deleteAll(idsList);
		}
	}

	@Override
	public List<Product> productList(Product product) {
		return productMapper.productList(product);
	}

	@Override
	public Integer selectMaxId() {
		return productMapper.selectMaxId();
	}

    @Override
    public List<ProductVO> queryProductApi() {
		List<Product> productList = productMapper.queryProductApi();
		List<ProductVO> productVOList = new ArrayList<>();
		for (Product product : productList) {
			ProductVO productVO = new ProductVO();
			productVO.setId(product.getId());
			productVO.setProductName(product.getProductName());
			productVO.setProductPrice(product.getProductPrice());
			productVO.setPhotoPath(product.getPhotoPath());
			productVOList.add(productVO);
		}
		return productVOList;
    }
}
