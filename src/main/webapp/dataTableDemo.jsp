<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<form>
    <table border="1" width="500" height="350" cellpadding="0" cellspacing="0" align="center" style="margin-top: 80px;">
        <tr>
            <th colspan="2" style="font-size: 30px;">用户注册</th>
        </tr>
        <tr align="center">
            <td colspan="2" height="30px">
                <span id="sapnId"></span>
            </td>
        </tr>
        <tr align="center">
            <td>用户名</td>
            <td>
                <input type="text" name="userName" onblur="judgeUserName(this)">
            </td>
        </tr>
        <tr align="center">
            <td>用户密码</td>
            <td>
                <input type="hidden" name="userPwd">
                <input type="text" id="userPwd">
            </td>
        </tr>
        <tr align="center">
            <td>确认密码</td>
            <td>
                <input type="text" id="password" onblur="passwordBlur()">
            </td>
        </tr>
        <tr align="center">
            <td colspan="2">
                <input type="button" value="注册" onclick="submitClick()">
                <input type="reset" value="取消">
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="/html/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/html/js/md5.js"></script>
<script type="text/javascript">
    function passwordBlur() {
        var v_userPwd = $("#userPwd").val();
        var v_sureUserPwd = $("#password").val();
        if (v_userPwd != v_sureUserPwd) {
            $("#sapnId").html("<font color='red'>您输入的确认密码不正确，请重新输入！</font>");
        } else {
            $("#sapnId").html("<font color='#7cfc00'>通过√</font>");
        }
    }
    function submitClick() {
        $("input[name='userPwd']").val(hex_md5($("#userPwd").val()));
        var v_userName=$("input[name='userName']").val();
        var v_userPwd=$("input[name='userPwd']").val();
        $.ajax({
            url:"<%=request.getContextPath()%>/user/addUser.jhtml",
            data:{
                "userName":v_userName,
                "userPwd":v_userPwd
            },
            type:"post",
            success:function (data) {
                if(data.code == 200){
                    alert("状态信息:"+data.msg);
                    location.href="<%=request.getContextPath()%>/index.jsp";
                }else{
                    alert("状态信息:"+data.msg);
                }
            }
        })

    }
    function judgeUserName(obj) {
        var v_userName=$(obj).val();
        if(v_userName != null && v_userName != ""){
            $.ajax({
                url:"<%=request.getContextPath()%>/user/judgeUserName.jhtml",
                data:{
                    "userName":v_userName
                },
                type:"post",
                success:function (data) {
                    if(data.code == 200){
                        $("#sapnId").html("<font color='#7cfc00'>此用户可以使用√</font>");
                    }else{
                        $("#sapnId").html("<font color='red'>对不起，该用户已存在！</font>");
                    }
                }
            })
        }
    }
</script>
</body>
</html>