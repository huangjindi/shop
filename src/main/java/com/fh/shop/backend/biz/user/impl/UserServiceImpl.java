/**
 * <pre>项目名称:shop_admin_v1
 * 文件名称:UserServiceImpl.java
 * 包名:com.fh.shop.backend.biz.user.impl
 * 创建日期:2019年1月7日下午3:54:07
 * Copyright (c) 2019, 1328055490@qq.com All Rights Reserved.</pre>
 */
package com.fh.shop.backend.biz.user.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.fh.shop.backend.po.department.Department;
import com.fh.shop.backend.util.MD5Util;
import com.fh.shop.backend.util.SystemContent;
import org.springframework.stereotype.Service;

import com.fh.shop.backend.biz.user.IUserService;
import com.fh.shop.backend.mapper.user.IUserMapper;
import com.fh.shop.backend.po.user.User;

/**
 * <pre>项目名称：shop_admin_v1    
 * 类名称：UserServiceImpl    
 * 类描述：    
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2019年1月7日 下午3:54:07    
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2019年1月7日 下午3:54:07    
 * 修改备注：       
 * @version </pre>    
 */
@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserMapper userMapper;

    /* (non-Javadoc)
     * @see com.fh.shop.backend.biz.user.IUserService#queryUserList()
     */
    @Override
    public List<User> queryUserList(User user) {
        return userMapper.queryUserList(user);
    }

    /* (non-Javadoc)
     * @see com.fh.shop.backend.biz.user.IUserService#fingUser(com.fh.shop.backend.po.user.User)
     */
    @Override
    public User fingUser(User user) {
        return userMapper.fingUser(user);
    }

    /* (non-Javadoc)
     * @see com.fh.shop.backend.biz.user.IUserService#addUser(com.fh.shop.backend.po.user.User)
     */
    @Override
    public void addUser(User user) {
        String saltUuid = SystemContent.SALT_UUID;
        String userPwd = user.getUserPwd() + saltUuid;
        user.setUserPwd(MD5Util.getStringMD5(userPwd));
        user.setSalt(saltUuid);
        userMapper.addUser(user);
    }

    @Override
    public List<User> judgeUserName(User user) {
        return userMapper.judgeUserName(user);
    }

    @Override
    public void updateUser(User users) {
        SimpleDateFormat sim = new SimpleDateFormat("yyyyMMdd");
        Date newDate = new Date();
        Date loginTime = users.getLoginTime();
        String simNewDate = sim.format(newDate);
        String simLoginTime = sim.format(loginTime);
        if (simNewDate.equals(simLoginTime)) {
            Integer loginFlag = users.getLoginFlag();
            users.setLoginFlag(loginFlag + 1);
            users.setLoginTime(newDate);
        } else {
            users.setLoginFlag(1);
            users.setLoginTime(newDate);
        }
        users.setLoginErrorFlag(0);
        users.setLoginErrorTime(newDate);
        userMapper.updateUser(users);
    }

    @Override
    public void updateUserStatus(User users) {
        userMapper.updateUserStatus(users);
    }

    @Override
    public long totalCount(User user) {
        return userMapper.totalCount(user);
    }

    @Override
    public void unlockUser(User user) {
        user.setLoginErrorFlag(SystemContent.STATUS_ERROR);
        user.setStatus(SystemContent.STATUS_ERROR);
        userMapper.unlockUser(user);
    }

    @Override
    public User selectUser(User user) {
        return userMapper.selectUser(user);
    }

    @Override
    public void updateUserInfo(User user) {
        String saltUuid = SystemContent.SALT_UUID;
        String userPwd = user.getUserPwd() + saltUuid;
        user.setUserPwd(MD5Util.getStringMD5(userPwd));
        user.setSalt(saltUuid);
        userMapper.updateUserInfo(user);
    }

    @Override
    public void updateUserDept(Integer nodesId, List<Integer> userIds) {
        userMapper.updateUserDept(nodesId,userIds);
    }

    @Override
    public List<User> excelOutUser(Department departmentInfo) {
        return userMapper.excelOutUser(departmentInfo);
    }

    @Override
    public void deleteUser(List<Integer> deptList) {
        userMapper.deleteUser(deptList);
    }
}
