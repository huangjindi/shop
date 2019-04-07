<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<table border="1" width="500" height="350" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <th colspan="2" style="font-size: 30px;">登录</th>
    </tr>
    <tr align="center" height="30">
        <td colspan="2">
            <span id="spanId"></span>
        </td>
    </tr>
    <tr align="center">
        <td>用户名</td>
        <td>
            <input type="text" id="userName">
        </td>
    </tr>
    <tr align="center">
        <td width="200">用户密码</td>
        <td>
            <input type="password" id="userPwd">
        </td>
    </tr>
    <tr align="center">
        <td width="200">验证码</td>
        <td>
            <img src="<%=request.getContextPath()%>/imgCode" alt="验证码" id="imageCode">
            <a href="javascript:;" onclick="refushImgCode();"><font style="font-size: 14px;">看不清，换一张</font></a><br/>
            <input type="text" id="imgCode" style="margin-top: 5px;">
        </td>
    </tr>
    <tr align="center">
        <td colspan="2">
            <input type="button" value="用户管理" onclick="toQueryUserList();">
            <input type="button" value="登录" onclick="userLogin();">
            <input type="button" value="注册" onclick="toAddUser();">
        </td>
    </tr>
</table>
<div id="data"></div>
<script type="text/javascript" src="<%=request.getContextPath()%>/html/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/html/js/md5.js"></script>
<script type="text/javascript">
    function toAddUser(){
        location.href="<%=request.getContextPath()%>/user/toAddUser.jhtml";
    }
    function toQueryUserList(){
        location.href="<%=request.getContextPath()%>/user/toQueryUserList.jhtml"
    }
    function userLogin(){
        var v_userName=$("#userName").val();
        var v_userPwd=hex_md5($("#userPwd").val());
        var v_imgCode=$("#imgCode").val();
        $.ajax({
            url:"<%=request.getContextPath()%>/user/userLogin.jhtml",
            data:{
                "userName":v_userName,
                "userPwd":v_userPwd,
                "imgCode":v_imgCode
            },
            dataType:"json",
            type:"post",
            success:function(data){
                if(data.code==200){
                    location.href="<%=request.getContextPath()%>/product/queryProductList.jhtml";
                }else{
                    $("#spanId").html("<font color='red'>"+data.msg+"</font>");
                }
            }
        })
    }
    function refushImgCode() {
        var t = new Date().getTime();
        $("#imageCode").attr("src","<%=request.getContextPath()%>/imgCode?"+t);
    }
</script>
</body>
</html>