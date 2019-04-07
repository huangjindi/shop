/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:IUserService.java 
 * 包名:com.fh.shop.backend.biz.user 
 * 创建日期:2019年1月7日下午3:53:45 
 * Copyright (c) 2019, 1328055490@qq.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.user;

import java.util.List;

import com.fh.shop.backend.po.department.Department;
import com.fh.shop.backend.po.user.User;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：IUserService    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2019年1月7日 下午3:53:45    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2019年1月7日 下午3:53:45    
 * 修改备注：       
 * @version </pre>    
 */
public interface IUserService {
	/** <pre>queryUserList(查询用户信息)
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2019年1月7日 下午4:27:13
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2019年1月7日 下午4:27:13
	 * 修改备注：
	 * @return</pre>
	 */

	List<User> queryUserList(User user);


	/** <pre>fingUser(登录验证)
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2019年1月7日 下午4:48:01
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2019年1月7日 下午4:48:01
	 * 修改备注：
	 * @param user
	 * @return</pre>
	 */
	public User fingUser(User user);

	/** <pre>addUser(这里用一句话描述这个方法的作用)
	 * 创建人：黄锦迪 1328055490@qq.com
	 * 创建时间：2019年1月11日 上午9:34:49
	 * 修改人：黄锦迪 1328055490@qq.com
	 * 修改时间：2019年1月11日 上午9:34:49
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

    void updateUserDept(Integer nodesId, List<Integer> userIds);

    List<User> excelOutUser(Department departmentInfo);

    void deleteUser(List<Integer> deptList);
}
