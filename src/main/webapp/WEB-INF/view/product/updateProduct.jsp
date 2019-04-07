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
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container" style="margin-top: 55px;">
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>商品信息</legend>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">商品修改</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" action="<%=request.getContextPath()%>/product/updateProduct.jhtml"
                              method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="productName" class="col-sm-1 control-label">产品名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="productName" name="productName"
                                           value="${product.productName}" placeholder="产品名称">
                                    <input type="hidden" value="${product.id}" name="id">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productPrice" class="col-sm-1 control-label">产品价格</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="productPrice" name="productPrice"
                                           value="${product.productPrice}" placeholder="产品价格">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">产品品牌</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="brand.id" id="brandSelect">
                                        <option value="-1">-- 请选择 --</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-1 control-label"></div>
                                <div class="col-xs-6 col-md-3">
                                    <a class="thumbnail   flipInX">
                                        <img style="width: 240px; height: 150px;;"
                                             src="<%=request.getContextPath()%>${product.photoPath}">
                                        <input type="hidden" value="${product.photoPath}" name="photoPath">
                                    </a>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productImg" class="col-sm-1 control-label">产品图片</label>
                                <div class="col-sm-10">
                                    <%--<input type="file" id="productImg" name="productImg">--%>
                                    <input id="productImg" name="productImg" type="file" class="file" />
                                </div>
                            </div>
                            <div class="form-group">
                                <c:forEach items="${photoList}" var="photo">
                                    <div class="col-xs-6 col-md-3" id="${photo.id}">
                                        <a class="thumbnail   flipInX">
                                            <div align="center">
                                                <img style="width: 240px; height: 150px;"
                                                     src="<%=request.getContextPath()%>${photo.photoPath}">
                                                <button type="button" class="btn btn-danger"
                                                        onclick="deletePhoto('${photo.id}');"><i
                                                        class="glyphicon glyphicon-remove"></i></button>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="form-group" name="fileName">
                                <label for="photo" class="col-sm-1 control-label">相关图片</label>
                                <div class="col-sm-10">
                                    <%--<input type="file" id="photo" name="photo">--%>
                                    <input id="photo" name="photo" type="file" class="file" />
                                </div>
                                <div class="col-sm-1">
                                    <button class="btn btn-default btn-xs" type="button" onclick="fileClickAdd();">
                                        <span class="glyphicon glyphicon-plus"></span>
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-5 col-sm-10">
                                    <button type="submit" class="btn btn-info">Submit</button>
                                    <button type="reset" class="btn btn-warning">Reset</button>
                                    <input type="hidden" name="ids">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/common/body.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
        brandList("brandSelect", '${product.brand.id}');
    });

    function fileClickAdd() {
        $("[name='fileName']").last().after('<div class="form-group" name="fileName"><div class="col-sm-1 control-label"></div><div class="col-sm-3"> <input type="file" id="photo" name="photo"> </div> <div class="col-sm-1"><button class="btn btn-default btn-xs" type="button" onclick="fileClickDelete(this);"> <span class="glyphicon glyphicon-minus"></span> </button> </div> </div>');
    }

    function fileClickDelete(obj) {
        $(obj).parent().parent().remove();
    }

    v_photoIds = [];

    function deletePhoto(photoId) {
        v_photoIds.push(photoId)
        $("input[name='ids']").val(v_photoIds)
        $("#" + photoId).remove();
    }
</script>
</body>
</html>