<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/html/css/bootstrap.min.css">
    <link href="/html/animate/animate.css" rel="stylesheet">
</head>
<body>


<form class="form-horizontal">
    <div class="col-sm-12" align="center">
        <div class="alert alert-info" role="alert">
            <h1 class="  infinite swing">Login Page</h1>
        </div>
    </div>
    <div class="alert alert-success" role="alert" style="height: 700px;">
        <div class="col-sm-12" style="height: 30px;" align="center">
            <span id="spanId"></span>
        </div>
        <div class="form-group">
            <label for="userName" class="col-sm-4 control-label   bounce delay-1s">userName</label>
            <div class="col-sm-8">
                <input type="text" style="width: 500px;" class="form-control" id="userName" placeholder="Name">
            </div>
        </div>
        <div class="form-group">
            <label for="userPwd" class="col-sm-4 control-label   bounce delay-2s">Password</label>
            <div class="col-sm-8">
                <input type="password" style="width: 500px;" class="form-control" id="userPwd"
                       placeholder="Password">
            </div>
        </div>
        <div class="form-group">
            <label for="imgCode" class="col-sm-4 control-label   bounce delay-3s">ImgCode</label>
            <div class="col-sm-8">
                <div class="col-sm-2">
                    <input type="text" style="width: 150px;" class="form-control" id="imgCode"
                           placeholder="ImgCode">
                </div>
                <div class="col-sm-4">
                    <img src="<%=request.getContextPath()%>/imgCode" onclick="refushImgCode();" style="width: 90px; height: 30px; cursor:pointer;" alt="验证码"
                         id="imageCode">
                    <a href="javascript:;" onclick="refushImgCode();">
                        <font style="font-size: 14px;">Change another one.</font></a><br/>
                </div>
            </div>
        </div>
        <div class="form-group" align="center">
            <div class="col-sm-offset-5 col-sm-2">
                <button type="button" class="btn btn-success   bounceInLeft" onclick="userLogin();">Sign in</button>
                <button type="reset" class="btn btn-warning   bounceInRight">Reset</button>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" src="/html/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/html/js/bootstrap.js"></script>
<script type="text/javascript" src="/html/js/md5.js"></script>
<script type="text/javascript">
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
                    location.href="<%=request.getContextPath()%>/department/toDepartmentJsp.jhtml";
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