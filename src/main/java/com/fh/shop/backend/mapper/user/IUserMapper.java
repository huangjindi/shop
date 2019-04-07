/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:IUserMapper.java 
 * 包名:com.fh.shop.backend.mapper.user 
 * 创建日期:2019年1月7日下午3:54:52 
 * Copyright (c) 2019, 1328055490@qq.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.mapper.user;

import java.util.List;

import com.fh.shop.backend.po.department.Department;
import com.fh.shop.backend.po.user.User;
import org.apache.ibatis.annotations.Param;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：IUserMapper    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2019年1月7日 下午3:54:52    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2019年1月7日 下午3:54:52    
 * 修改备注：       
 * @version </pre>    
 */
public interface IUserMapper {

	/** <pre>queryUserList(查询用户信息)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2019年1月7日 下午4:28:21    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2019年1月7日 下午4:28:21    
	 * 修改备注： 
	 * @return</pre>    
	 */
	public List<User> queryUserList(User user);

	/** <pre>fingUser(用户验证)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2019年1月7日 下午4:48:37    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2019年1月7日 下午4:48:37    
	 * 修改备注： 
	 * @param user
	 * @return</pre>    
	 */
	public User fingUser(User user);

	/** <pre>addUser(用户注册)   
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2019年1月11日 下午1:00:53    
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2019年1月11日 下午1:00:53    
	 * 修改备注： 
	 * @param user</pre>    
	 */
	public void addUser(User user);

    List<User> judgeUserName(User user);

    void updateUser(User users);

	void updateUserStatus(User users);

	long totalCount(User user);

    void unlockUser(User user);

    User selectUser(User user);

    void updateUserInfo(User user);

    void updateUserDept(@Param("nodesId") Integer nodesId, @Param("userIds") List<Integer> userIds);

    List<User> excelOutUser(Department departmentInfo);

    void deleteUser(List<Integer> deptList);
}
