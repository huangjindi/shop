/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:BrandMapper.java 
 * 包名:com.fh.shop.backend.mapper.brand 
 * 创建日期:2018年12月24日下午2:01:07 
 * Copyright (c) 2018, 1328055490@qq.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.mapper.brand;

import java.util.List;

import com.fh.shop.backend.po.brand.Brand;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：BrandMapper    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2018年12月24日 下午2:01:07    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2018年12月24日 下午2:01:07    
 * 修改备注：       
 * @version </pre>    
 */
public interface BrandMapper {

	/** <pre>queryCount(查询总条数)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 上午9:17:03    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 上午9:17:03    
	 * 修改备注： 
	 * @param brand
	 * @return</pre>    
	 */
	public Long queryCount(Brand brand);

	/** <pre>queryBrandList(查询列表数据)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 上午9:23:27    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 上午9:23:27    
	 * 修改备注： 
	 * @param brand
	 * @return</pre>    
	 */
	public List<Brand> queryBrandList(Brand brand);

	/** <pre>addBrand(这里用一句话描述这个方法的作用)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 上午10:38:58    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 上午10:38:58    
	 * 修改备注： 
	 * @param brand</pre>    
	 */
	public void addBrand(Brand brand);

	/** <pre>deleteProduct(这里用一句话描述这个方法的作用)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 上午11:26:20    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 上午11:26:20    
	 * 修改备注： 
	 * @param id</pre>    
	 */
	public void deleteProduct(Integer id);

	/** <pre>updateBrand(这里用一句话描述这个方法的作用)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 上午11:34:41    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 上午11:34:41    
	 * 修改备注： 
	 * @param id
	 * @return</pre>    
	 */
	public Brand toUpdateBrand(Integer id);

	/** <pre>updateBrand(这里用一句话描述这个方法的作用)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月28日 上午11:41:28    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月28日 上午11:41:28    
	 * 修改备注： 
	 * @param brand</pre>    
	 */
	public void updateBrand(Brand brand);


	public void deleteAll(List idList);

	/** <pre>brandList(查询产品全部信息)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2018年12月29日 下午2:13:55    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2018年12月29日 下午2:13:55    
	 * 修改备注： 
	 * @return</pre>    
	 */
	public List<Brand> brandList();

    List<Brand> findBrandList(Brand brand);
}
