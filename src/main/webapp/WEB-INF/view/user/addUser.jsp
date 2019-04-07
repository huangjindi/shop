<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>商品管理</title>
	<jsp:include page="/WEB-INF/common/head.jsp"></jsp:include>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#bs-productTable-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=request.getContextPath()%>/product/toList.jhtml">电商后台管理系统</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-productTable-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown active">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					   aria-expanded="false"> <i class="glyphicon glyphicon-th-large"></i> 模块管理
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath()%>/product/toList.jhtml">
							<i class="glyphicon glyphicon-th"></i>&nbsp;&nbsp;产品管理</a>
						</li>
						<li role="separator" class="divider"></li>
						<li><a href="<%=request.getContextPath()%>/brand/toBueryBrandList.jhtml">
							<i class="glyphicon glyphicon-tags"></i>&nbsp;&nbsp;品牌管理</a>
						</li>
						<li role="separator" class="divider"></li>
						<li><a href="<%=request.getContextPath()%>/user/toQueryUserList.jhtml">
							<i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;用户管理</a>
						</li>
						<li role="separator" class="divider"></li>
						<li><a href="<%=request.getContextPath()%>/log/toFindLogList.jhtml">
							<i class="glyphicon glyphicon-list-alt"></i>&nbsp;&nbsp;日志管理</a>
						</li>
						<li role="separator" class="divider"></li>
						<li><a href="<%=request.getContextPath()%>/product/todepartment.jhtml"> <i
								class="glyphicon glyphicon-heart"></i>&nbsp;&nbsp;部门管理</a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					   aria-expanded="false"><i class="glyphicon glyphicon-cog"></i>&nbsp;设置
					</a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath()%>/user/toAddUser.jhtml">注册用户</a></li>
						<li><a href="#">关于</a></li>
						<li><a href="#">帮助</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#" onclick="loginOut();">退出</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
<div class="container" style="margin-top: 55px;">
	<div class="row">
		<div class="col-md-12">
			<fieldset style="text-align: center;">
				<legend>
					<h3 class="lead   fadeInDown">
						亲爱的用户：
						<mark><font color="red">${user.userName}</font></mark>
						, 您上次登录的时间是:
						<mark><font color="red"><fmt:formatDate value="${user.lastLoginTime}"
																pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></font>
						</mark>
						,
						今天您登陆了
						<mark><font color="red">${user.loginFlag}</font></mark>
						次。
					</h3>
				</legend>
			</fieldset>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title"><span class="glyphicon glyphicon-user"></span> 用户注册</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" id="excelForm">
						<div class="form-group">
							<label for="userName" class="col-md-3 control-label">用户名称</label>
							<div class="col-md-6">
								<input type="text" class="form-control" id="userName" placeholder="用户名称" onblur="judgeUserName(this)">
							</div>
							<div class="col-md-3" id="userNameId"></div>
						</div>
						<div class="form-group">
							<label for="realName" class="col-md-3 control-label">真实姓名</label>
							<div class="col-md-6">
								<input type="text" class="form-control" id="realName" placeholder="真实姓名">
							</div>
						</div>
						<div class="form-group">
							<label for="userpwd" class="col-md-3 control-label">用户密码</label>
							<div class="col-md-6">
								<div class="input-group">
									<input type="password" class="form-control" id="userPwd" placeholder="用户密码">
									<span class="input-group-addon" onclick="seeUserPwd();">
										<i class="glyphicon glyphicon-eye-open"></i>
									</span>
								</div>

							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-md-3 control-label">确认密码</label>
							<div class="col-md-6">
								<input type="password" class="form-control" id="password" placeholder="确认密码" onblur="passwordBlur()">
							</div>
							<div class="col-md-3" id="userPassword"></div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">用户性别</label>
							<div class="col-md-6">
								<label class="radio-inline">
									<input type="radio" name="userSex" value="1"> 男
								</label>
								<label class="radio-inline">
									<input type="radio" name="userSex" value="0"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="birthday" class="col-md-3 control-label">用户生日</label>
							<div class="col-md-6">
								<div class="input-group">
									<input type="text" class="form-control form_datetime" id="birthday" name="birthday"
										   placeholder="用户生日">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-calendar"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="userPay" class="col-md-3 control-label">用户薪资</label>
							<div class="col-md-6">
								<input type="text" class="form-control" id="userPay" placeholder="用户薪资">
							</div>
						</div>
						<div class="form-group" style="text-align: center;">
							<div class="col-sm-offset-1 col-sm-10">
								<button type="button" class="btn btn-info" onclick="search();"><span
										class="glyphicon glyphicon-ok"></span> Submit
								</button>
								<button type="reset" class="btn btn-warning"><span
										class="glyphicon glyphicon-refresh"></span> Reset
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/common/body.jsp"></jsp:include>
<script type="text/javascript">
    //dateTime时间插件
    $(".form_datetime").datetimepicker({
        format: "yyyy-mm-dd hh:ii",
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-left"
    });
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
                        $("#userNameId").html("<span class='glyphicon glyphicon-ok' style='color: lawngreen;'></span>");
                    }else{
                        $("#userNameId").html("<span class='glyphicon glyphicon-remove' style='color: #85a4ff;'> 该用户已存在，请重新输入！</span>");
                    }
                }
            })
        }else{
            $("#userNameId").html("");
		}
    }
    function seeUserPwd() {
        var v_userPwd = $("#userPwd").val();
		alert(v_userPwd);
    }
    function passwordBlur() {
        var v_userPwd = $("#userPwd").val();
        var v_sureUserPwd = $("#password").val();
        if(v_sureUserPwd != null && v_sureUserPwd != "") {
            if (v_userPwd != v_sureUserPwd) {
                $("#userPassword").html("<span class='glyphicon glyphicon-remove' style='color: red;'> 确认密码不正确，请重新输入！</span>");
            } else {
                $("#userPassword").html("<span class='glyphicon glyphicon-ok' style='color: lawngreen;'></span>");
            }
        }else{
            $("#userPassword").html("");
		}
    }
</script>
</body>
</html>