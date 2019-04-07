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
                        <form class="form-horizontal" action="<%=request.getContextPath()%>/member/updateMember.jhtml" method="post">
                            <div class="form-group">
                                <label for="userName" class="col-sm-3 control-label">名称</label>
                                <input type="hidden" value="${memberInfo.id}" name="id">
                                <div class="col-sm-6">
                                    <input type="text" value="${memberInfo.userName}" class="form-control" id="userName"
                                           name="userName" placeholder="名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-3 control-label">密码</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="password" name="password" placeholder="密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="relPassword" class="col-sm-3 control-label">确认密码</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="relPassword" placeholder="确认密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="birthday" class="col-sm-3 control-label">生日</label>
                                <input type="hidden" value="${memberInfo.phone}" name="phone"/>
                                <div class="col-sm-6">
                                    <input type="text"
                                           value="<fmt:formatDate value="${memberInfo.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>"
                                           class="form-control" placeholder="生日" name="birthday" id="birthday"
                                           aria-describedby="sizing-addon2">
                                </div>
                            </div >
                            <div class="form-group">
                                <label for="email" class="col-sm-3 control-label">Email</label>
                                <div class="col-sm-6">
                                    <input type="email" value="${memberInfo.email}" class="form-control" id="email"
                                           name="email" placeholder="Email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="birthday" class="col-sm-3 control-label">地区</label>
                                <input type="hidden" value="${memberInfo.areaIds}" id="areaIds" name="areaIds">
                                <div class="col-sm-6">
                                    <div class="input-group">
                                        <input type="text" value="${memberInfo.areaName}" readonly class="form-control"
                                               placeholder="地区" id="areaName" name="areaName"
                                               aria-describedby="sizing-addon2">
                                        <span class="input-group-addon" style="cursor:pointer;"
                                              onclick="cityClick(1);">编辑</span>
                                        <span class="input-group-addon" style="cursor:pointer;"
                                              onclick="removeCity();">取消</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div id="cityId">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-10">
                                    <button type="submit" style="width: 150px;" class="btn btn-success">保存</button>
                                    <button type="reset" style="width: 150px;" class="btn btn-warning">重置</button>
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
    function cityClick(id, obj) {
        var v_areaName = "";
        var v_areaIds = "";
        $("select[name='cityShengSelect']").each(function () {
            v_areaName += this.options[this.selectedIndex].text;
            v_areaIds += this.value+",";
        });
        $("#areaName").val(v_areaName)
        $("#areaIds").val(v_areaIds)
        $.ajax({
            url: "<%=request.getContextPath()%>/member/cityTownList.jhtml",
            data: {"id": id},
            type: "post",
            async: "true",
            success: function (result) {
                if (result.code == 200) {
                    if (obj) {
                        $(obj).parent().nextAll().remove();
                    }
                    if (result.data.length == 0) {
                        return;
                    }
                    var titleSelect = '<div class="col-md-2">\n' +
                        '                  <select class="form-control" name="cityShengSelect"\n' +
                        '                       id="cityShengSelect" onchange="cityClick(this.value,this)">' +
                        '                       <option value="-1">······请选择······</option>';
                    for (var i = 0; i < result.data.length; i++) {
                        var data = result.data[i];
                        titleSelect += '<option value="' + data.id + '">' + data.name + '</option>';
                    }
                    titleSelect += '</select></div>';
                    $("#cityId").append(titleSelect);
                }
            }
        })
    }
    function removeCity() {
        var v_cityName = '${memberInfo.areaName}';
        var v_cityIds = '${memberInfo.areaIds}';
        $("#areaName").val(v_cityName)
        $("#areaIds").val(v_cityIds)
        $("#cityId").children().remove();
    }
</script>
</body>
</html>