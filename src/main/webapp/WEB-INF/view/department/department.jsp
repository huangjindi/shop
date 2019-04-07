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
            <a class="navbar-brand" href="javascript:;" onclick="firstJsp('/member/toMemberList.jhtml')"
               style="font-size: 14px;"> <i
                    class="glyphicon glyphicon-education"></i>&nbsp;&nbsp;会员管理</a>
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
                        部门管理
                        <button type="button" class="btn btn-success   bounceInLeft" onclick="addDept();"><span
                                class="glyphicon glyphicon-plus"></span> 新增
                        </button>
                        <button type="reset" class="btn btn-warning   bounceInLeft" onclick="updateDept();"><span
                                class="glyphicon glyphicon-pencil"></span> 修改
                        </button>
                        <button type="reset" class="btn btn-danger   bounceInLeft" onclick="deleteDept();"><span
                                class="glyphicon glyphicon-trash"></span> 删除
                        </button>
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="content_wrap   flipInX fast">
                        <div class="zTreeDemoBackground left">
                            <ul id="tree" class="ztree"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9   bounceInRight">
            <div id="firstJsp">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-search"></span> 用户查询</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" id="excelForm">
                                <div class="form-group">
                                    <label for="userName" class="col-sm-2 control-label">用户名称</label>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" id="userName" placeholder="用户名称">
                                    </div>
                                    <label class="col-sm-1 control-label">用户状态</label>
                                    <div class="col-md-4">
                                        <label class="radio-inline">
                                            <input type="radio" name="status" id="inlineRadio1" value="0"> 成功
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="status" id="inlineRadio2" value="1"> 锁定
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">登录时间</label>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <input type="text" class="form-control form_datetime" id="minCreateTime"
                                                   placeholder="最小时间">

                                            <span class="input-group-addon">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                                            <input type="text" class="form-control form_datetime" id="maxCreateTime"
                                                   placeholder="最大时间">

                                        </div>
                                    </div>
                                    <label class="col-sm-1 control-label">运行费时</label>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <input type="text" class="form-control form_datetime" id="minUserTime"
                                                   placeholder="最小时间">

                                            <span class="input-group-addon">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                                            <input type="text" class="form-control form_datetime" id="maxUserTime"
                                                   placeholder="最大时间">

                                        </div>
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
                    <button type="button" class="btn btn-info   bounceInRight" onclick="addUser();"><span
                            class="glyphicon glyphicon-plus"></span> 新增
                    </button>
                    <button type="button" class="btn btn-warning   bounceInRight" onclick="updateUser();"><span
                            class="glyphicon glyphicon-pencil"></span> 修改
                    </button>
                    <button type="button" class="btn btn-danger   bounceInRight" onclick="deleteUser();"><span
                            class="glyphicon glyphicon-trash"></span> 删除
                    </button>
                    <button type="button" class="btn btn-info   bounceInRight" onclick="deptExcelOut();"><span
                            class="glyphicon glyphicon-open"></span> 按部门Excel导出
                    </button>
                    <button type="button" class="btn btn-info   bounceInRight" onclick="updateDeptAll();"><span
                            class="glyphicon glyphicon-ok"></span> 批量换部门
                    </button>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-align-justify"></span> 用户列表</h3>
                        </div>
                        <table id="userTable" width="100%" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>选择</th>
                                <th>头像</th>
                                <th>用户名</th>
                                <th>真实姓名</th>
                                <th>部门</th>
                                <th>性别</th>
                                <th>生日</th>
                                <th>薪资</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>选择</th>
                                <th>头像</th>
                                <th>用户名</th>
                                <th>真实姓名</th>
                                <th>部门</th>
                                <th>性别</th>
                                <th>生日</th>
                                <th>薪资</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </tfoot>

                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<%-- 添加部门 --%>
<script type="text/html" id="addDeptId">
    <form class="form-horizontal" id="insertPer" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label class="col-sm-3 control-label">部门名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="deptName">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">部门描述</label>
            <div class="col-sm-6">
                <textarea cols="50" rows="5" id="describe"></textarea>
            </div>
        </div>
    </form>
</script>
<%-- 添加用户 --%>
<div style="display: none;" id="insertform">
    <form class="form-horizontal" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label class="col-sm-3 control-label">部门</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="userDeptName" name="deptName">
                <input type="text" class="form-control" id="deptId" name="deptId">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-info" onclick="selectDept()"><span
                        class="glyphicon glyphicon-tasks"></span> 选择
                </button>
            </div>
        </div>
        <div class="form-group">
            <label for="userName" class="col-md-3 control-label">用户名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control" id="addUserName" placeholder="用户名称"
                       onblur="judgeUserName(this)">
            </div>
            <div class="col-md-3" id="userNameId"></div>
        </div>
        <div class="form-group">
            <label for="userPay" class="col-md-3 control-label">用户头像</label>
            <div class="col-md-6">
                <input id="headerImg" name="headerImg" type="file"/>
                <input id="uploadFile" type="text"/>
            </div>
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
                <input type="password" class="form-control" id="password" placeholder="确认密码"
                       onblur="passwordBlur(this)">
            </div>
            <div class="col-md-3" class="userPassword"></div>
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
    </form>
</div>
<%-- 修改用户 --%>
<div style="display: none;" id="updateform">
    <form class="form-horizontal" id="insertPers" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label class="col-sm-3 control-label">部门</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="updateDeptName" name="deptName">
                <input type="text" class="form-control" id="updateDeptId" name="deptId">
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-info" onclick="selectDept()"><span
                        class="glyphicon glyphicon-tasks"></span> 选择
                </button>
            </div>
        </div>
        <div class="form-group">
            <label for="userName" class="col-md-3 control-label">用户名称</label>
            <div class="col-md-6">
                <input type="text" class="form-control" id="updateUserName" placeholder="用户名称">
            </div>
            <div class="col-md-3" id="userNameIds"></div>
        </div>
        <div class="form-group">
            <label for="userPay" class="col-md-3 control-label">用户头像</label>
            <div class="col-md-6">
                <input id="updateHeaderImg" name="headerImg" type="file"/>
                <input id="updateUploadFile" type="text"/>
            </div>
        </div>
        <div class="form-group">
            <label for="realName" class="col-md-3 control-label">真实姓名</label>
            <div class="col-md-6">
                <input type="text" class="form-control" id="updateRealName" placeholder="真实姓名">
            </div>
        </div>
        <div class="form-group">
            <label for="userpwd" class="col-md-3 control-label">用户密码</label>
            <div class="col-md-6">
                <div class="input-group">
                    <input type="password" class="form-control" id="updateUserPwd" placeholder="用户密码">
                    <span class="input-group-addon" onclick="seeUserPwd();">
                        <i class="glyphicon glyphicon-eye-open"></i>
                    </span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-md-3 control-label">确认密码</label>
            <div class="col-md-6">
                <input type="password" class="form-control" id="passwords" placeholder="确认密码">
            </div>
            <div class="col-md-3" class="userPassword"></div>
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
                    <input type="text" class="form-control form_datetime" id="updateBirthday" name="birthday"
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
                <input type="text" class="form-control" id="updateUserPay" placeholder="用户薪资">
            </div>
        </div>
    </form>
</div>
<jsp:include page="/WEB-INF/common/body.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
        initTree();
        /* firstJsp('/user/toQueryUserJsp.jhtml');*/
        initTable();
        brandList("brandSelect");
        tableColor();
    })

    var v_ztree;

    function initTree() {
        var setting = {
            view: {
                dblClickExpand: true,//双击节点时，是否自动展开父节点的标识
                showLine: true,//是否显示节点之间的连线
            },
            callback: {
                onClick: zTreeOnClick
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
        };
        $.ajax({
            url: "<%=request.getContextPath()%>/department/findDepartment.jhtml",
            type: "post",
            dataType: "json",
            success: function (data) {
                v_ztree = $.fn.zTree.init($("#tree"), setting, data);
                v_ztree.expandAll(true);
            },
            error: function (data) {

            }
        })
    }

    var v_ids = [];
    var v_nodeIds;

    function zTreeOnClick() {
        v_ids = [];
        var nodeArr = v_ztree.transformToArray(v_ztree.getSelectedNodes());
        for (var i = 0; i < nodeArr.length; i++) {
            if (!isExistNode(nodeArr[i].id)) {
                v_ids.push(nodeArr[i].id);
            }
        }
        v_nodeIds = v_ids.join(",");
        search();
    }

    function isExistNode(id) {
        for (var i = 0; i < v_ids.length; i++) {
            if (v_ids[i] == id) {
                return true;
            }
        }
    }


    function addDept() {
        var nodes = v_ztree.getSelectedNodes();
        headerImg();
        if (nodes.length == 1) {
            var v_nodesId = nodes[0].id;
            bootbox.dialog({
                title: '增加信息',
                size: "large",
                message: $("#addDeptId").html(),
                buttons: {
                    cancel: {
                        label: "取消",
                        className: 'btn-danger',
                    },
                    ok: {
                        label: "保存",
                        className: 'btn-info',
                        callback: function () {
                            $.ajax({
                                url: "<%=request.getContextPath()%>/department/addDept.jhtml",
                                data: {
                                    "deptName": $("#deptName").val(),
                                    "remark": $("#describe").val(),
                                    "fatherId": v_nodesId
                                },
                                type: "post",
                                success: function (data) {
                                    if (data.code == 200) {
                                        bootbox.alert({
                                            title: "提示信息",
                                            message: '部门添加成功',
                                            className: '  lightSpeedIn faster',
                                        });
                                        var newNode = {
                                            id: data.data,
                                            name: $("#deptName").val(),
                                            remark: $("#describe").val(),
                                            pId: v_nodesId
                                        };
                                        console.log(data.data)
                                        v_ztree.addNodes(nodes[0], newNode);
                                    } else {
                                        bootbox.alert("部门添加失败");
                                    }
                                }
                            })
                        }
                    }
                }
            })
        } else {
            bootbox.alert({
                title: "提示信息",
                message: '请选择一个部门！',
                className: '  lightSpeedIn faster',
            });
        }
    }

    function deleteDept() {
        var nodeArr = v_ztree.transformToArray(v_ztree.getSelectedNodes());
        var ids = [];
        for (var i = 0; i < nodeArr.length; i++) {
            ids.push(nodeArr[i].id)
        }
        if (nodeArr.length > 0) {
            bootbox.confirm({
                title: "温馨提示：",
                message: "您确定要删除该部门吗？",
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
                            url: "<%=request.getContextPath()%>/department/deleteDept.jhtml",
                            data: {"ids": ids},
                            type: "post",
                            success: function (data) {
                                if (data.code == 200) {
                                    bootbox.alert({
                                        title: "提示信息",
                                        message: data.msg,
                                        className: '  lightSpeedIn faster',
                                    });
                                    for (var i = 0; i < nodeArr.length; i++) {
                                        v_ztree.removeNode(nodeArr[i]);
                                    }
                                } else {
                                    bootbox.alert(data.msg)
                                }
                            },
                        })
                    }
                }
            });
        } else {
            bootbox.alert({
                title: "提示信息",
                message: '请选择需要删除的部门！',
                className: '  lightSpeedIn faster',
            });
        }
    }

    function updateDept() {
        var nodes = v_ztree.getSelectedNodes();
        if (nodes.length == 1) {
            var v_nodes = nodes[0];
            bootbox.dialog({
                title: '修改信息',
                size: "large",
                message: $("#addDeptId").html(),
                buttons: {
                    cancel: {
                        label: "取消",
                        className: 'btn-danger',
                    },
                    ok: {
                        label: "保存",
                        className: 'btn-info',
                        callback: function () {
                            $.ajax({
                                url: "<%=request.getContextPath()%>/department/updateDept.jhtml",
                                data: {
                                    "deptName": $("#deptName").val(),
                                    "remark": $("#describe").val(),
                                    "id": v_nodes.id
                                },
                                type: "post",
                                success: function (data) {
                                    if (data.code == 200) {
                                        bootbox.alert({
                                            title: "提示信息",
                                            message: '部门修改成功!',
                                            className: '  lightSpeedIn faster',
                                        });
                                        nodes[0].name = $("#deptName").val();
                                        nodes[0].remark = $("#describe").val();
                                        v_ztree.updateNode(nodes[0]);
                                    } else {
                                        bootbox.alert({
                                            title: "提示信息",
                                            message: '部门修改失败!',
                                            className: '  lightSpeedIn faster',
                                        });
                                    }
                                }
                            })
                        }
                    }
                }
            })
            $("#deptName").attr("value", v_nodes.name);
            $("#describe").html(v_nodes.remark);
        } else {
            bootbox.alert({
                title: "提示信息",
                message: '请选择一个部门!',
                className: '  lightSpeedIn faster',
            });
        }
    }

    function firstJsp(v_url) {
        $.ajax({
            url: v_url,
            //  data:{"urlName":urlName},
            success: function (data) {
                $("#firstJsp").html(data)
            }
        })
    }

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

    function getData() {
        $.ajax({
            url: "<%=request.getContextPath()%>/department/findDepartment.jhtml",
            type: "post",
            dataType: "json",
            success: function (data) {
                znodes = data;
                v_tree = $.fn.zTree.init($("#tree2"), setting, znodes);
            },
            error: function (data) {

            }
        });
    }

    function initTable() {
        v_userTable = $('#userTable').DataTable({
            // 是否允许排序
            "ordering": true,
            "processing": true,
            "serverSide": true,
            "searching": false,
            "columnDefs": [
                {"targets": 0, "orderable": false},
                {"targets": 1, "orderable": false},
                {"targets": 2, "orderable": false},
                {"targets": 3, "orderable": false},
                {"targets": 4, "orderable": false},
                {"targets": 5, "orderable": false},
                {"targets": 8, "orderable": false},
                {"targets": 9, "orderable": false}], "order": [[6, '']
            ],
            "ajax": {
                "url": "<%=request.getContextPath()%>/user/queryUserList.jhtml",
                "type": "POST",
                "dataSrc": function (result) {
                    if (result.code == 200) {
                        result.draw = result.data.draw;
                        result.recordsTotal = result.data.recordsTotal;
                        result.recordsFiltered = result.data.recordsFiltered;
                        return result.data.data;
                    }
                },
            },
            "columns": [
                {
                    "data": "id",
                    "render": function (data, type, row, meta) {
                        return '<input type="checkbox" value="' + data + '">';
                    }
                },
                {
                    "data": "headerImg",
                    "render": function (data, type, row, meta) {
                        return '<img width="150px" src="'+data+'" alt="头像"/>';
                    }
                },
                {
                    "data": "userName",
                },
                {
                    "data": "realName",
                },
                {
                    "data": "department.deptName",
                },
                {
                    "data": "userSex",
                    "render": function (data, type, row, meta) {
                        if (data == 0) {
                            return "女";
                        }
                        if (data == 1) {
                            return "男";
                        }
                    }
                },
                {
                    "data": "birthday",
                    "render": function (data, type, row, meta) {
                        return (new Date(data)).Format("yyyy-MM-dd");
                    }
                },
                {
                    "data": "userPay",
                },
                {
                    "data": "status",
                    "render": function (data, type, row, meta) {
                        if (data == 0) {
                            return "正常";
                        }
                        if (data == 1) {
                            return "锁定";
                        }
                    }
                },
                {
                    "data": "id",
                    'render': function (data, type, row) {

                        return '<div class="btn-group btn-group-xs" role="group" aria-label="...">\n' +
                            '  <div class="btn-group" role="group">\n' +
                            '    <button type="button" class="btn btn-success btn-sm" onclick="unlockUser(' + data + ');"><span class="glyphicon glyphicon-lock"></span> 解锁</button>\n' +
                            '</div>';

                    }
                },
            ],
            "lengthMenu": [5, 15, 30, 45],
            //翻页按钮样式
            "pagingType": "full_numbers",
            //回调函数
            "fnDrawCallback": function () {
                //保持翻页点击行选中
                $("tbody tr input[type='checkbox']").each(function () {
                    //拿到当前页面所有行的复选框的值和数组中ids值进行比较
                    var v_checkboxId = $(this).val();
                    if (isExist(v_checkboxId)) {
                        $(this).closest("tr").css("background", "gray");
                        $(this).attr("checked", true);
                    }
                })
            },


            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                },
            },
        });
    }

    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

    function search() {
        var parem = {};
        var v_userName = $("#userName").val();
        var v_status = $("input[name='status']:checked").val();
        var v_minCreateTime = $("#minCreateTime").val();
        var v_maxCreateTime = $("#maxCreateTime").val();
        var v_minUserTime = $("#minUserTime").val();
        var v_maxUserTime = $("#maxUserTime").val();

        parem.userName = v_userName;
        parem.status = v_status;
        parem.minCreateTime = v_minCreateTime;
        parem.maxCreateTime = v_maxCreateTime;
        parem.minUserTime = v_minUserTime;
        parem.maxUserTime = v_maxUserTime;
        parem.ids = v_nodeIds;

        v_userTable.settings()[0].ajax.data = parem;
        v_userTable.ajax.reload();
    }

    var v_TableIds = [];

    function tableColor() {
        $("#userTable tbody").on("click", "tr", function () {
            var v_checkbox = $(this).find("input[type='checkbox']")[0];
            for (var i = 0; i < v_TableIds.length; i++) {
                if (v_ids[i] == $(v_checkbox).val()) {
                    $(this).css("background", "gray");
                    v_checkbox.checked = true;
                    console.log(v_TableIds[i])
                }
            }
            if (this.style.background == "gray") {
                $(this).css("background", "");
                v_checkbox.checked = false;
                deleteIds($(v_checkbox).val());
            } else {
                $(this).css("background", "gray");
                v_checkbox.checked = true;
                v_TableIds.push($(v_checkbox).val());
            }
        })
    }

    function deleteIds(id) {
        for (var i = v_TableIds.length - 1; i >= 0; i--) {
            if (v_TableIds[i] == id) {
                v_TableIds.splice(i, 1);
            }
        }
    }

    function isExist(id) {
        for (var i = v_TableIds.length - 1; i >= 0; i--) {
            if (v_TableIds[i] == id) {
                return true;
            }
        }
    }

    function loginOut() {
        $.ajax({
            url: "<%=request.getContextPath()%>/user/loginOut.jhtml",
            success: function (data) {
                bootbox.alert({
                    title: "提示信息",
                    message: '退出登录成功!',
                    className: '  lightSpeedIn faster',
                });
                location.href = "/index.jsp";
            }
        })
    }

    function unlockUser(id) {
        $.ajax({
            url: "<%=request.getContextPath()%>/user/unlockUser.jhtml",
            data: {"id": id},
            type: "post",
            success: function (data) {
                if (data.code == 200) {
                    bootbox.alert({
                        title: "提示信息",
                        message: '用户解锁成功!',
                        className: '  lightSpeedIn faster',
                    });
                    v_userTable.ajax.reload();
                }
            }
        })
    }
    function addUser() {
        var insertform = $("#insertform").html();
        headerImg();
        var insertform = bootbox.dialog({
            title: '增加信息',
            size: "large",
            message: $("#insertform form"),
            className: '  flipInX fast',
            buttons: {
                cancel: {
                    label: "取消",
                    className: 'btn-danger',
                },
                ok: {
                    label: "保存",
                    className: 'btn-info',
                    callback: function (result) {
                        $("#insertform").html(insertform);
                        if (result) {
                            var parem = {};
                            var v_addUserName = $("#addUserName").val();
                            var v_realName = $("#realName").val();
                            var v_userPwd = $("#userPwd").val();
                            var v_userSex = $("input[name='userSex']:checked").val();
                            var v_birthday = $("#birthday").val();
                            var v_userPay = $("#userPay").val();
                            var v_deptId = $("#deptId").val();
                            var v_uploadFile = $("#uploadFile").val();
                            parem.userName = v_addUserName;
                            parem.realName = v_realName;
                            parem.userPwd = hex_md5(v_userPwd);
                            parem.userSex = v_userSex;
                            parem.birthday = v_birthday;
                            parem.userPay = v_userPay;
                            parem.headerImg = v_uploadFile;
                            parem["department.id"] = v_deptId;
                            $.ajax({
                                url: "<%=request.getContextPath()%>/user/addUser.jhtml",
                                type: "post",
                                data: parem,
                                success: function (data) {
                                    bootbox.alert({
                                        title: "提示信息",
                                        message: data.msg,
                                        className: '  lightSpeedIn faster',
                                    });
                                    v_userTable.ajax.reload();
                                },
                            });
                        }
                    }
                }
            }
        })

    }

    function headerImg() {
        var fileInput = {
            language: 'zh', //设置语言
            uploadUrl: "<%=request.getContextPath()%>/user/uploadHeaderImg.jhtml", //上传的地址
            allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
            showUpload: true, //是否显示上传按钮
            showCaption: true,//是否显示标题
            browseClass: "btn btn-danger", //按钮样式
            dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount: true,
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        };
        $("#headerImg").fileinput(fileInput).on("fileuploaded",function (event, t, previewId, index) {
            console.log(t.response.data)
            $("#uploadFile").val(t.response.data);
        });
    }

    function judgeUserName(obj) {
        var v_userName = $(obj).val();
        if (v_userName != null && v_userName != "") {
            $.ajax({
                url: "<%=request.getContextPath()%>/user/judgeUserName.jhtml",
                data: {
                    "userName": v_userName
                },
                type: "post",
                success: function (data) {
                    if (data.code == 200) {
                        $("#userNameId").html("<span class='glyphicon glyphicon-ok' style='color: lawngreen;'></span>");
                    } else {
                        $("#userNameId").html("<span style='color: red;'> 该用户已存在，请重新输入！</span>");
                    }
                }
            })
        } else {
            $("#userNameId").html("");
        }
    }

    function seeUserPwd() {
        var v_userPwd = $("#userPwd").val();
        alert(v_userPwd);
    }

    function passwordBlur(value) {
        var v_userPwd = $("#userPwd").val();
        var v_sureUserPwd = $("#password").val();
        if (v_sureUserPwd != null && v_sureUserPwd != "") {
            if (v_userPwd != v_sureUserPwd) {
                $("#userPassword").html("<span class='glyphicon glyphicon-remove' style='color: red;'> 确认密码不正确，请重新输入！</span>");
            } else {
                $("#userPassword").html("<span class='glyphicon glyphicon-ok' style='color: lawngreen;'></span>");
            }
        } else {
            $("#userPassword").html("");
        }
    }

    function selectDept() {
        $("#selectDeptId").html("<ul id='tree2' class='ztree'></ul>");
        getData();
        bootbox.dialog({
            title: '部门信息',
            size: "large",
            message: $("#selectDeptId ul"),
            className: '  rubberBand',
            buttons: {
                cancel: {
                    label: "取消",
                    className: 'btn-danger',
                },
                ok: {
                    label: "确定",
                    className: 'btn-info',
                    callback: function () {
                        var nodes = v_tree.getSelectedNodes();
                        $("input[name='deptName']").val(nodes[0].name);
                        $("input[name='deptId']").val(nodes[0].id);
                    }
                }
            }
        })
    }
    var updateformTable;
    function updateUser() {
        var updateform = $("#updateform").html();
        updateHeaderImg();
        if (v_TableIds.length == 1) {
            $.ajax({
                url: "<%=request.getContextPath()%>/user/toUpdateUser.jhtml",
                data: {"id": v_TableIds[0]},
                type: "post",
                success: function (result) {
                    $("#updateDeptName",updateformTable).val(result.data.department.deptName);
                    $("#updateDeptId",updateformTable).val(result.data.department.id);
                    $("#updateUserName",updateformTable).val(result.data.userName);
                    $("#updateRealName",updateformTable).val(result.data.realName);
                    if (result.data.userSex == 1) {
                        $("input[name='userSex']",updateformTable).prop("checked", true);
                    } else {
                        $("input[name='userSex']",updateformTable).prop("checked", true);
                    }
                    $("#updateBirthday",updateformTable).val(result.data.birthday);
                    $("#updateUserPay",updateformTable).val(result.data.userPay);
                }
            })
            updateformTable = bootbox.dialog({
                title: '修改信息',
                size: "large",
                message: $("#updateform form"),
                className: '  flipInX fast',
                buttons: {
                    cancel: {
                        label: "取消",
                        className: 'btn-danger',
                    },
                    ok: {
                        label: "保存",
                        className: 'btn-info',
                        callback: function (result) {

                            if (result) {
                                var parem = {};
                                var v_addUserName = $("#updateUserName",updateformTable).val();
                                var v_realName = $("#updateRealName",updateformTable).val();
                                var v_userPwd = $("#updateUserPwd",updateformTable).val();
                                var v_userSex = $("input[name='userSex']:checked",updateformTable).val();
                                var v_birthday = $("#updateBirthday",updateformTable).val();
                                var v_userPay = $("#updateUserPay",updateformTable).val();
                                var v_deptId = $("#updateDeptId",updateformTable).val();
                                var v_updateUploadFile = $("#updateUploadFile",updateformTable).val();
                                parem.id = v_TableIds[0];
                                parem.userName = v_addUserName;
                                parem.realName = v_realName;
                                parem.userPwd = hex_md5(v_userPwd);
                                parem.userSex = v_userSex;
                                parem.birthday = v_birthday;
                                parem.userPay = v_userPay;
                                parem.headerImg = v_updateUploadFile;
                                parem["department.id"] = v_deptId;
                                if (v_userPwd != null && v_userPwd != "") {
                                    $.ajax({
                                        url: "<%=request.getContextPath()%>/user/updateUser.jhtml",
                                        type: "post",
                                        data: parem,
                                        success: function (data) {
                                            bootbox.alert({
                                                title: "提示信息",
                                                message: data.msg,
                                                className: '  lightSpeedIn faster',
                                            });
                                            v_userTable.ajax.reload();
                                        },
                                    });
                                } else {
                                    bootbox.alert({
                                        title: "提示信息",
                                        message: '用户密码不能为空！',
                                        className: '  lightSpeedIn faster',
                                    });
                                }
                            }
                        }
                    }
                }
            })
            $("#updateform").html(updateform)
        } else {
            bootbox.alert({
                title: "提示信息",
                message: '请选择一条哦!',
                className: '  lightSpeedIn faster',
            });
        }
    }

    function updateHeaderImg() {
        var fileInput = {
            language: 'zh', //设置语言
            uploadUrl: "<%=request.getContextPath()%>/user/uploadHeaderImg.jhtml", //上传的地址
            allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
            showUpload: true, //是否显示上传按钮
            showCaption: true,//是否显示标题
            browseClass: "btn btn-danger", //按钮样式
            dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount: true,
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        };
        $("#updateHeaderImg").fileinput(fileInput).on("fileuploaded",function (event, t, previewId, index) {
            console.log(t.response.data)
            $("#updateUploadFile",updateformTable).val(t.response.data);
        });
    }

    function updateDeptAll() {
        if (v_TableIds.length > 0) {
            $("#selectDeptId").html("<ul id='tree2' class='ztree'></ul>");
            getData();
            bootbox.dialog({
                title: '部门信息',
                size: "large",
                message: $("#selectDeptId ul"),
                className: '  flipInX fast',
                buttons: {
                    cancel: {
                        label: "取消",
                        className: 'btn-danger',
                    },
                    ok: {
                        label: "确定",
                        className: 'btn-info',
                        callback: function () {
                            var nodes = v_tree.getSelectedNodes();
                            if (nodes.length == 1) {
                                $.ajax({
                                    url: "<%=request.getContextPath()%>/user/updateDeptAll.jhtml",
                                    data: {
                                        "userIds": v_TableIds,
                                        "nodesId": nodes[0].id
                                    },
                                    type: "post",
                                    success: function (data) {
                                        if (data.code == 200) {
                                            bootbox.alert({
                                                title: "提示信息",
                                                message: data.msg,
                                                className: '  lightSpeedIn faster',
                                            });
                                            search();
                                        } else {
                                            bootbox.alert(data.msg);
                                        }
                                    }
                                })
                            } else {
                                bootbox.alert({
                                    title: "提示信息",
                                    message: "请选择部门！",
                                    className: '  lightSpeedIn faster',
                                });
                            }
                        }
                    }
                }
            })
        } else {
            bootbox.alert({
                title: "提示信息",
                message: "请选择用户！",
                className: '  lightSpeedIn faster',
            });
        }
    }

    function deleteUser() {
        if (v_TableIds.length > 0) {
            $.ajax({
                url: "<%=request.getContextPath()%>/user/deleteUser.jhtml",
                data: {
                    "deptList": v_TableIds.join(",")
                },
                type: "post",
                success: function (result) {
                    if (result.code == 200) {
                        v_TableIds = [];
                        bootbox.alert({
                            title: "提示信息",
                            message: "删除成功",
                            className: '  lightSpeedIn faster',
                        });
                        search();
                    }
                }
            })
        } else {
            bootbox.alert({
                title: "提示信息",
                message: "请选择用户！",
                className: '  lightSpeedIn faster',
            });
        }
    }

    function deptExcelOut() {
        var nodes = v_ztree.getSelectedNodes();
        if (nodes.length == 1) {
            location.href = "<%=request.getContextPath()%>/department/deptExcelOut.jhtml?id=" + nodes[0].id;

        } else {
            bootbox.alert({
                title: "提示信息",
                message: "请选择一个部门哦!",
                className: '  lightSpeedIn faster',
            });
        }
    }

</script>
<div id="selectDeptId" style="display: none">
    <ul id="tree2" class="ztree"></ul>
</div>
</body>
</html>