/**
 * <pre>项目名称:shop_admin_v1
 * 文件名称:UserController.java
 * 包名:com.fh.shop.backend.controller.user
 * 创建日期:2019年1月7日下午3:54:31
 * Copyright (c) 2019, 1328055490@qq.com All Rights Reserved.</pre>
 */
package com.fh.shop.backend.controller.user;

import com.fh.shop.backend.annotation.LogAnnotation;
import com.fh.shop.backend.biz.user.IUserService;
import com.fh.shop.backend.common.ResponseEnum;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.common.ServerResponseDataTable;
import com.fh.shop.backend.controller.BaseController;
import com.fh.shop.backend.po.user.User;
import com.fh.shop.backend.util.FileUtil;
import com.fh.shop.backend.util.MD5Util;
import com.fh.shop.backend.util.SystemContent;
import com.fh.shop.backend.util.TencentCOS;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <pre>项目名称：shop_admin_v1
 * 类名称：UserController
 * 类描述：
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2019年1月7日 下午3:54:31
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2019年1月7日 下午3:54:31
 * 修改备注：
 * @version </pre>
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
    @Resource(name = "userService")
    private IUserService userService;

    @Autowired
    private HttpServletRequest request;

    /**
     * <pre>toAddUser(跳转到用户注册页面)
     * 创建人：黄锦迪 1328055490@qq.com
     * 创建时间：2019年1月17日 下午2:50:23
     * 修改人：黄锦迪 1328055490@qq.com
     * 修改时间：2019年1月17日 下午2:50:23
     * 修改备注：
     * @return</pre>
     */
    @RequestMapping("toAddUser")
    public String toAddUser() {
        return "user/addUser";
    }

    /**
     * <pre>userLogin(用户登录)
     * 创建人：黄锦迪 1328055490@qq.com
     * 创建时间：2019年1月17日 下午2:57:20
     * 修改人：黄锦迪 1328055490@qq.com
     * 修改时间：2019年1月17日 下午2:57:20
     * 修改备注：
     * @param user
     * @param request
     * @return</pre>
     */
    @LogAnnotation("用户登录")
    @RequestMapping("userLogin")
    @ResponseBody
    public ServerResponse userLogin(User user, HttpServletRequest request) {
        String userName = user.getUserName();
        String userPwd = user.getUserPwd();
        String imgCode = user.getImgCode();
        //判断用户名或密码不为空
        if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(userPwd)) {
            return ServerResponse.stats(ResponseEnum.USERNAME_USERPWD_EMPTY);
        }
        //判断验证码不为空
        if (StringUtils.isEmpty(imgCode)) {
            return ServerResponse.stats(ResponseEnum.USER_IMGCODE_EMPTY);
        }
        //获取session中的验证码
        String requestImgCode = (String) request.getSession().getAttribute(SystemContent.SESSION_IMGCODE);
        //判断验证码是否正确
        if (!imgCode.equals(requestImgCode)) {
            return ServerResponse.stats(ResponseEnum.USER_IMGCODE_ERROR);
        }
        //根据用户名获取该用户
        User users = userService.fingUser(user);
        //判断用户名是否存在
        if (users == null) {
            return ServerResponse.stats(ResponseEnum.USER_EMPTY);
        }
        //判断用户是否被锁定
        if (users.getStatus() != 1) {
            SimpleDateFormat sim = new SimpleDateFormat("yyyyMMdd");
            if (users.getLoginErrorTime() == null) {
                users.setLoginErrorTime(new Date());
            }
            String loginErrorTime = sim.format(users.getLoginErrorTime());
            String newDate = sim.format(new Date());
            if (!loginErrorTime.equals(newDate)) {
                users.setLoginErrorFlag(0);
            }
        } else {
            return ServerResponse.stats(ResponseEnum.USER_LOGINFLAG);
        }

        //将前台登录密码加盐加密
        String md5UserPwd = MD5Util.getStringMD5(userPwd + users.getSalt());
        //判断密码是否相等
        if (!md5UserPwd.equals(users.getUserPwd())) {
            Integer loginErrorFlag = users.getLoginErrorFlag();
            //判断登录错误次数是否大于3次
            if (loginErrorFlag >= 2) {
                users.setStatus(1);
            }
            users.setLoginErrorFlag(loginErrorFlag + 1);
            users.setLoginErrorTime(new Date());
            userService.updateUserStatus(users);
            return ServerResponse.stats(ResponseEnum.USERPWD_ERROR);
        }
        //判断登录时间是否为空
        if (users.getLoginTime() != null) {
            //如果登录时间不为空，则将登陆时间赋给最后一次登录时间
            users.setLastLoginTime(users.getLoginTime());
        } else {
            //如果登录时间为空，则获取当前登陆时间
            Date newDate = new Date();
            users.setLoginTime(newDate);
            users.setLastLoginTime(newDate);
        }
        request.getSession().setAttribute(SystemContent.SESSION_USER, users);
        userService.updateUser(users);
        return ServerResponse.success();
    }

    /**
     * <pre>toAddUser(用户注册)
     * 创建人：黄锦迪 1328055490@qq.com
     * 创建时间：2019年1月17日 下午2:49:48
     * 修改人：黄锦迪 1328055490@qq.com
     * 修改时间：2019年1月17日 下午2:49:48
     * 修改备注：
     * @return</pre>
     */
    @LogAnnotation("用户添加")
    @RequestMapping("addUser")
    @ResponseBody
    public ServerResponse addUser(User user) {
        userService.addUser(user);
        return ServerResponse.success();
    }

    /**
     * <pre>toQueryUserList(用户列表)
     * 创建人：黄锦迪 1328055490@qq.com
     * 创建时间：2019年1月17日 下午2:57:02
     * 修改人：黄锦迪 1328055490@qq.com
     * 修改时间：2019年1月17日 下午2:57:02
     * 修改备注：
     * @return</pre>
     */
    @RequestMapping("toQueryUserList")
    public String toQueryUserList() {
        return "user/userList";
    }

    @RequestMapping("queryUserList")
    @ResponseBody
    public ServerResponse queryUserList(User user,
                                        Integer start,
                                        Integer length,
                                        Integer draw) {
        user.setStartPos(start);
        user.setPageSize(length);
        if (user.getIds() != null && user.getIds() != "") {
            String[] splitIds = user.getIds().split(",");
            List idsList = new ArrayList();
            for (String splitId : splitIds) {
                idsList.add(splitId);
            }
            user.setDeptList(idsList);
        }
        long totalCount = userService.totalCount(user);
        List<User> userList = userService.queryUserList(user);
        ServerResponseDataTable serverResponseDataTable = ServerResponseDataTable.success(draw, totalCount, totalCount, userList);
        return ServerResponse.success(serverResponseDataTable);
    }

    @RequestMapping("judgeUserName")
    @ResponseBody
    public ServerResponse judgeUserName(User user) {
        List<User> userList = userService.judgeUserName(user);
        if (userList.size() > 0) {
            return ServerResponse.error();
        }
        return ServerResponse.success();
    }

    @LogAnnotation("退出登录")
    @RequestMapping("loginOut")
    @ResponseBody
    public ServerResponse loginOut(HttpServletRequest request) {
        request.getSession().removeAttribute(SystemContent.SESSION_USER);
        return ServerResponse.success();
    }

    @LogAnnotation("解锁用户")
    @RequestMapping("unlockUser")
    @ResponseBody
    public ServerResponse unlockUser(User user) {
        userService.unlockUser(user);
        return ServerResponse.success();
    }

    @RequestMapping("toQueryUserJsp")
    public String toQueryUserJsp(ModelMap dataMap, User user) {
        //计算总条数
        Long totalCount = userService.totalCount(user);
        //设置总条数
        user.setTotalCount(totalCount);
        //设置分页信息
        user.calculatePage();
        //获取分页列表
        List<User> dataList = userService.queryUserList(user);
        dataMap.put("page", user);
        dataMap.put("dataList", dataList);
        return "user/userList";
    }


    @RequestMapping("toUpdateUser")
    @ResponseBody
    public ServerResponse toUpdateUser(User user) {
        User userInfo = userService.selectUser(user);
        return ServerResponse.success(userInfo);
    }

    @LogAnnotation("用户修改")
    @RequestMapping("updateUser")
    @ResponseBody
    public ServerResponse updateUserInfo(User user) {
        userService.updateUserInfo(user);
        return ServerResponse.success();
    }

    @RequestMapping("updateDeptAll")
    @ResponseBody
    public ServerResponse updateDeptAll(@RequestParam("nodesId") Integer nodesId, @RequestParam("userIds[]") List<Integer> userIds) {
        userService.updateUserDept(nodesId, userIds);
        return ServerResponse.success();
    }


    @RequestMapping("deleteUser")
    @ResponseBody
    public ServerResponse deleteUser(User user) {
        userService.deleteUser(user.getDeptList());
        return ServerResponse.success();
    }

    @RequestMapping(value = "uploadHeaderImg", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse uploadHeaderImg(@RequestParam MultipartFile headerImg) {
        /*InputStream inputStream = null;
        String originalFilename = "";
        String uploadFileName = "";
        try {
            inputStream = headerImg.getInputStream();
            originalFilename = headerImg.getOriginalFilename();
            uploadFileName = FileUtil.copyFile(inputStream, originalFilename, getRootPath(request) + SystemContent.PRODUCT_IMAGES_PATH);
        } catch (IOException e) {
            e.printStackTrace();
            return ServerResponse.error();
        }*/
        /* return ServerResponse.success(SystemContent.PRODUCT_IMAGES_PATH + uploadFileName);*/
        String originalFilename = headerImg.getOriginalFilename();
        //MultipartFile格式文件转换为File格式文件
        CommonsMultipartFile cf= (CommonsMultipartFile)headerImg;
        DiskFileItem fi = (DiskFileItem)cf.getFileItem();
        File storeLocation = fi.getStoreLocation();
        String fileUrl=TencentCOS.uploadFile(storeLocation,originalFilename);
        return  ServerResponse.success(fileUrl);
    }
}
