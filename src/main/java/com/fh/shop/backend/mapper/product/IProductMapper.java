/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:ProductMapper.java 
 * 包名:com.fh.shop.backend.mapper.product 
 * 创建日期:2018年12月24日下午2:01:27 
 * Copyright (c) 2018, 1328055490@qq.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.mapper.product;

import com.fh.shop.backend.api.ProductVO;
import com.fh.shop.backend.po.product.Product;
import org.springframework.stereotype.Repository;

import java.util.List;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：ProductMapper    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2018年12月24日 下午2:01:27    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2018年12月24日 下午2:01:27    
 * 修改备注：       
 * @version </pre>    0:37    
	 * 修改备注： 
	 * @param product</pre>    
 */
@Repository
public interface IProductMapper {

	/** <pre>addProduct(产品添加)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月24日 下午2:10:37    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月24日 下午2:1
	 */
	public Integer addProduct(Product product);

	/** <pre>queryProductList(升序分页查询)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月24日 下午9:15:13    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月24日 下午9:15:13    
	 * 修改备注： 
	 * @return</pre>    
	 */
	public List<Product> queryProductList(Product product);

	/** <pre>deleteProduct(产品删除)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月25日 下午2:54:13    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月25日 下午2:54:13    
	 * 修改备注： 
	 * @param id</pre>    
	 */
	public void deleteProduct(Integer id);

	/** <pre>updateProduct(修改回显)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月25日 下午3:37:01    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月25日 下午3:37:01    
	 * 修改备注： 
	 * @param id
	 * @return</pre>    
	 */
	public Product toUpdateProduct(Integer id);

	/** <pre>updateProduct(产品修改)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月25日 下午3:54:11    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月25日 下午3:54:11    
	 * 修改备注： 
	 * @param product</pre>    
	 */
	public void updateProduct(Product product);

	/** <pre>deleteAll(批量删除)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月25日 下午10:41:23    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月25日 下午10:41:23    
	 * 修改备注： 
	 * @param idsList</pre>    
	 */
	public void deleteAll(List<Integer> idsList);

	/** <pre>countProduct(查询总条数)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月26日 下午7:35:17    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月26日 下午7:35:17    
	 * 修改备注： 
	 * @param product
	 * @return</pre>    
	 */
	public Long countProduct(Product product);

    List<Product> productList(Product product);

    Integer selectMaxId();

	List<Product> queryProductApi();
}
