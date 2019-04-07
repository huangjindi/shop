/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:IBrandService.java 
 * 包名:com.fh.shop.backend.biz.brand 
 * 创建日期:2018年12月23日下午8:03:57 
 * Copyright (c) 2018, 1328055490@qq.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.brand;

import java.util.List;

import com.fh.shop.backend.po.brand.Brand;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：IBrandService    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2018年12月23日 下午8:03:57    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2018年12月23日 下午8:03:57    
 * 修改备注：       
 * @version </pre>    
 */
public interface IBrandService {

	/** <pre>queryCount(查询总条数)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 上午9:15:33    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 上午9:15:33    
	 * 修改备注： 
	 * @param brand
	 * @return</pre>    
	 */
	public Long queryCount(Brand brand);

	/** <pre>queryBrandList(这里用一句话描述这个方法的作用)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 上午9:23:08    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 上午9:23:08    
	 * 修改备注： 
	 * @param brand
	 * @return</pre>    
	 */
	public List<Brand> queryBrandList(Brand brand);

	/** <pre>addBrand(添加品牌)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 上午10:38:36    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 上午10:38:36    
	 * 修改备注： 
	 * @param brand</pre>    
	 */
	public void addBrand(Brand brand);

	/** <pre>deleteProduct(这里用一句话描述这个方法的作用)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 上午11:25:38    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 上午11:25:38    
	 * 修改备注： 
	 * @param id</pre>    
	 */
	public void deleteProduct(Integer id);

	/** <pre>updateBrand(这里用一句话描述这个方法的作用)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 上午11:34:12    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 上午11:34:12    
	 * 修改备注： 
	 * @param id
	 * @return</pre>    
	 */
	public Brand toUpdateBrand(Integer id);

	/** <pre>updateBrand(这里用一句话描述这个方法的作用)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 上午11:41:06    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 上午11:41:06    
	 * 修改备注： 
	 * @param brand</pre>    
	 */
	public void updateBrand(Brand brand);

	/** <pre>deleteAll(这里用一句话描述这个方法的作用)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 下午12:06:26    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 下午12:06:26    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	public void deleteAll(String ids);

	public List<Brand> brandList();

	List<Brand> findBrandList(Brand brand);
}
