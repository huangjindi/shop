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
            <a class="navbar-brand" href="javascript:;"
               onclick="firstJsp('/product/queryProductList.jhtml')">电商后台管理系统</a>
            <a class="navbar-brand" href="javascript:;" onclick="firstJsp('/product/queryProductList.jhtml')"
               style="font-size: 14px;"> <i
                    class="glyphicon glyphicon-th"></i>&nbsp;&nbsp;产品管理</a>
            <a class="navbar-brand" href="javascript:;" onclick="firstJsp('/brand/toBueryBrandJsp.jhtml')"
               style="font-size: 14px;"> <i
                    class="glyphicon glyphicon-tags"></i>&nbsp;&nbsp;品牌管理</a>
            <a class="navbar-brand" href="/department/toDepartmentJsp.jhtml" style="font-size: 14px;"> <i
                    class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;用户管理</a>
            <a class="navbar-brand" href="javascript:;" onclick="firstJsp('/log/findLogList.jhtml')"
               style="font-size: 14px;"> <i
                    class="glyphicon glyphicon-list-alt"></i>&nbsp;&nbsp;日志管理</a>
            <a class="navbar-brand" href="/area/toAreaList.jhtml" style="font-size: 14px;"> <i
                    class="glyphicon glyphicon-globe"></i>&nbsp;&nbsp;地区管理</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-productTable-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><i class="glyphicon glyphicon-cog"></i>&nbsp;设置
                    </a>
                    <ul class="dropdown-menu   bounceInDown faster">
                        <li><a href="<%=request.getContextPath()%>/user/toAddUser.jhtml"> <i
                                class="glyphicon glyphicon-user"></i> 注册用户</a></li>
                        <li><a href="#"> <i class="glyphicon glyphicon-list-alt"></i> 关于</a></li>
                        <li><a href="#"> <i class="glyphicon glyphicon-cog"></i> 帮助</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" onclick="loginOut();"> <i class="glyphicon glyphicon-off"></i> 退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<fieldset style="margin-top: 50px; text-align: center;">
    <legend>
        <h3 class="lead   fadeInDown slow">
            亲爱的用户：
            <mark><font color="red">${user.userName}</font></mark>
            , 您上次登录的时间是:
            <mark><font color="red"><fmt:formatDate value="${user.lastLoginTime}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></font></mark>
            ,
            今天您登陆了
            <mark><font color="red">${user.loginFlag}</font></mark>
            次。
        </h3>
    </legend>
</fieldset>
<div class="container" style="width: 100%; margin-top: -20px;">
    <div class="row">
        <div class="col-lg-3   bounceInLeft">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        地区管理
                        <button type="button" class="btn btn-success   bounceInLeft" onclick="addArea();"><span
                                class="glyphicon glyphicon-plus"></span> 新增
                        </button>
                        <button type="reset" class="btn btn-warning   bounceInLeft" onclick="updateArea();"><span
                                class="glyphicon glyphicon-pencil"></span> 修改
                        </button>
                        <button type="reset" class="btn btn-danger   bounceInLeft" onclick="deleteArea();"><span
                                class="glyphicon glyphicon-trash"></span> 删除
                        </button>
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="content_wrap   flipInX fast">
                        <div class="zTreeDemoBackground left">
                            <ul id="areaZtree" class="ztree"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9   bounceInRight">
            <div id="firstJsp">
                <div class="col-md-12">
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/html" id="addAreaId">
    <form class="form-horizontal" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label class="col-sm-3 control-label">地区名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="areaName">
            </div>
        </div>
    </form>
</script>
<jsp:include page="/WEB-INF/common/body.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
        initTree();
    })

    var v_areaZtree;

    function initTree() {
        var setting = {
            view: {
                dblClickExpand: true,//双击节点时，是否自动展开父节点的标识
                showLine: true,//是否显示节点之间的连线
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
        };
        $.ajax({
            url: "<%=request.getContextPath()%>/area/areaZtree.jhtml",
            type: "post",
            dataType: "json",
            success: function (result) {
                v_areaZtree = $.fn.zTree.init($("#areaZtree"), setting, result);
            },
        })
    }

    function addArea() {
        var nodes = v_areaZtree.getSelectedNodes();
        if (nodes.length == 1) {
            var v_nodeId = nodes[0].id;
            bootbox.dialog({
                title: '增加信息',
                size: "large",
                message: $("#addAreaId").html(),
                className: '  lightSpeedIn faster',
                buttons: {
                    cancel: {
                        label: "取消",
                        className: 'btn-danger',
                    },
                    ok: {
                        label: "保存",
                        className: 'btn-info',
                        callback: function () {
                            var v_areaName = $("#areaName").val();
                           $.ajax({
                                url: "<%=request.getContextPath()%>/area/addArea.jhtml",
                                data: {
                                    "name": v_areaName,
                                    "pId": v_nodeId
                                },
                                type: "post",
                                success: function (data) {
                                    if (data.code == 200) {
                                        bootbox.alert({
                                            title: '<font color="red"><b>提示信息</b></font>',
                                            message: '地区添加成功',
                                            className: '  lightSpeedIn faster',
                                            backdrop: true
                                        });
                                        var newNode = {
                                            id: data.data,
                                            name: v_areaName,
                                            pId: v_nodeId
                                        };
                                        v_areaZtree.addNodes(nodes[0], newNode);
                                    }
                                }
                            })
                        }
                    }
                }
            })
        } else {
            bootbox.alert({
                title: '<font color="red"><b>提示信息</b></font>',
                message: '请选择一个地区！',
                className: '  lightSpeedIn faster',
                backdrop: true
            });
        }
    }
    function deleteArea() {
        var nodeArr = v_areaZtree.transformToArray(v_areaZtree.getSelectedNodes());
        var ids = [];
        for (var i = 0; i < nodeArr.length; i++) {
            ids.push(nodeArr[i].id)
        }
        if (nodeArr.length > 0) {
            bootbox.confirm({
                title: "温馨提示：",
                message: "您确定要删除该地区吗？",
                buttons: {
                    confirm: {
                        label: '<i class="glyphicon glyphicon-ok"></i> 确定',
                        className: 'btn-primary',
                    },
                    cancel: {
                        label: '<i class="glyphicon glyphicon-remove"></i> 取消',
                        className: 'btn-warning',
                    },
                },
                callback: function (result) {
                    if (result) {
                        $.ajax({
                            url: "<%=request.getContextPath()%>/area/deleteArea.jhtml",
                            data: {"ids": ids},
                            type: "post",
                            success: function (data) {
                                if (data.code == 200) {
                                    bootbox.alert({
                                        title: '<font color="red"><b>提示信息</b></font>',
                                        message: "地区删除成功！",
                                        className: '  lightSpeedIn faster',
                                        backdrop: true
                                    });
                                    for (var i = 0; i < nodeArr.length; i++) {
                                        v_areaZtree.removeNode(nodeArr[i]);
                                    }
                                }
                            },
                        })
                    }
                }
            });
        } else {
            bootbox.alert({
                title: '<font color="red"><b>提示信息</b></font>',
                message: '请选择需要删除的地区！',
                className: '  lightSpeedIn faster',
                backdrop: true
            });
        }
    }

    function updateArea() {
        var nodes = v_areaZtree.getSelectedNodes();
        if (nodes.length == 1) {
            var v_nodes = nodes[0];
            bootbox.dialog({
                title: '修改信息',
                size: "large",
                message: $("#addAreaId").html(),
                className: '  lightSpeedIn faster',
                buttons: {
                    cancel: {
                        label: "取消",
                        className: 'btn-danger',
                    },
                    ok: {
                        label: "保存",
                        className: 'btn-info',
                        callback: function () {
                            var v_areaName = $("#areaName").val();
                            $.ajax({
                                url: "<%=request.getContextPath()%>/area/updateArea.jhtml",
                                data: {
                                    "name": v_areaName,
                                    "id": v_nodes.id
                                },
                                type: "post",
                                success: function (data) {
                                    if (data.code == 200) {
                                        bootbox.alert({
                                            title: '<font color="red"><b>提示信息</b></font>',
                                            message: '地区修改成功!',
                                            className: '  lightSpeedIn faster',
                                            backdrop: true
                                        });
                                        nodes[0].name = v_areaName;
                                        v_areaZtree.updateNode(nodes[0]);
                                    } else {
                                        bootbox.alert({
                                            title: '<font color="red"><b>提示信息</b></font>',
                                            message: '地区修改失败!',
                                            className: '  lightSpeedIn faster',
                                            backdrop: true
                                        });
                                    }
                                }
                            })
                        }
                    }
                }
            })
            $("#areaName").attr("value", v_nodes.name);
        } else {
            bootbox.alert({
                title: '<font color="red"><b>提示信息</b></font>',
                message: '请选择一个地区!',
                className: '  lightSpeedIn faster',
                backdrop: true
            });
        }
    }
</script>
</body>
</html>