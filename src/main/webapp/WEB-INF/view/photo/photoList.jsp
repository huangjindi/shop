<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                    <h3 class="panel-title">相关图片</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" action="<%=request.getContextPath()%>/product/updateProduct.jhtml"
                          method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <c:forEach items="${photoList}" var="photo">
                                <div class="col-xs-6 col-md-3   rotateIn slow" id="${photo.id}">
                                    <a class="thumbnail">
                                        <div align="center">
                                            <img style="width: 240px; height: 170px;"
                                                 src="<%=request.getContextPath()%>${photo.photoPath}">
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/common/body.jsp"></jsp:include>
<script type="text/javascript">
    function fileClickAdd() {
        $("[name='fileName']").last().after('<div class="form-group" name="fileName"><div class="col-sm-1 control-label"></div><div class="col-sm-3"> <input type="file" id="photo" name="photo"> </div> <div class="col-sm-1"><button class="btn btn-default btn-xs" type="button" onclick="fileClickDelete(this);"> <span class="glyphicon glyphicon-minus"></span> </button> </div> </div>');
    }

    function fileClickDelete(obj) {
        $(obj).parent().parent().remove();
    }

    function loginOut() {
        $.ajax({
            url: "<%=request.getContextPath()%>/user/loginOut.jhtml",
            success: function (data) {
                bootbox.alert("退出登录成功")
                location.href = "/index.jsp";
            }
        })
    }
</script>
</body>
</html>