/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:IProductService.java 
 * 包名:com.fh.shop.backend.biz.product 
 * 创建日期:2018年12月23日下午8:04:43 
 * Copyright (c) 2018, 1328055490@qq.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.product;

import java.util.List;

import com.fh.shop.backend.api.ProductVO;
import com.fh.shop.backend.common.FileInfo;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.product.Product;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：IProductService    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2018年12月23日 下午8:04:43    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2018年12月23日 下午8:04:43    
 * 修改备注：       
 * @version </pre>    
 */
public interface IProductService {
	/** <pre>addProduct(产品添加)
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月23日 下午8:44:24
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月23日 下午8:44:24
	 * 修改备注：
	 * @param product
	 */

	ServerResponse addProduct(Product product);


	/** <pre>countProduct(查询总条数)
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月26日 下午7:33:44
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月26日 下午7:33:44
	 * 修改备注：
	 * @param product
	 * @return</pre>
	 */
	public Long countProduct(Product product);

	/** <pre>queryProductList(产品查询)
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月24日 下午9:13:41
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月24日 下午9:13:41
	 * 修改备注：
	 * @return</pre>
	 */
	public List<Product> queryProductList(Product product);

	/** <pre>deleteProduct(产品删除)
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月25日 下午2:53:42
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月25日 下午2:53:42
	 * 修改备注：
	 * @param id</pre>
	 */
	public void deleteProduct(Integer id);

	/** <pre>updateProduct(修改回显)
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月25日 下午3:36:34
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月25日 下午3:36:34
	 * 修改备注：
	 * @param id
	 * @return</pre>
	 */
	public Product toUpdateProduct(Integer id);

	/** <pre>updateProduct(产品修改)
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月25日 下午3:53:43
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月25日 下午3:53:43
	 * 修改备注：
	 * @param product</pre>
	 */
	public void updateProduct(FileInfo fileInfo, Product product,String realPath);

	/** <pre>deleteAll(批量删除)
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月25日 下午10:36:31
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月25日 下午10:36:31
	 * 修改备注：
	 * @param ids</pre>
	 */
	public void deleteAll(String ids);

	List<Product> productList(Product product);

    Integer selectMaxId();

    List<ProductVO> queryProductApi();
}
