<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>商品管理</title>
<jsp:include page="/WEB-INF/common/head.jsp"></jsp:include>
</head>
<body>
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
    <div>
        <button type="button" class="btn btn-info" onclick="addUser();"><span
                class="glyphicon glyphicon-ok"></span> 新增
        </button>
        <button type="reset" class="btn btn-warning" onclick="updateUser();"><span
                class="glyphicon glyphicon-refresh"></span> 修改
        </button>
        <button type="button" class="btn btn-danger" onclick="search();"><span
                class="glyphicon glyphicon-ok"></span> 删除
        </button>
        <button type="reset" class="btn btn-info" onclick="updateUser();"><span
                class="glyphicon glyphicon-refresh"></span> 解锁
        </button>
        <button type="button" class="btn btn-info" onclick="search();"><span
                class="glyphicon glyphicon-ok"></span> 批量换部门
        </button>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title"><span class="glyphicon glyphicon-align-justify"></span> 用户列表</h3>
        </div>
        <table id="userTable" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>选择</th>
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
<script type="text/html" id="insertform">
    <form class="form-horizontal" id="insertPer" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label class="col-sm-3 control-label">部门</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="deptName" name="deptName">
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
</script>
<script type="text/html" id="updateform">
    <form class="form-horizontal" id="insertPers" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label class="col-sm-3 control-label">部门</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="deptNames" name="deptName">
                <input type="text" class="form-control" id="deptIds" name="deptId">
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
                <input type="text" class="form-control" id="addUserNames" placeholder="用户名称"
                       onblur="judgeUserName(this)">
            </div>
            <div class="col-md-3" id="userNameIds"></div>
        </div>
        <div class="form-group">
            <label for="realName" class="col-md-3 control-label">真实姓名</label>
            <div class="col-md-6">
                <input type="text" class="form-control" id="realNames" placeholder="真实姓名">
            </div>
        </div>
        <div class="form-group">
            <label for="userpwd" class="col-md-3 control-label">用户密码</label>
            <div class="col-md-6">
                <div class="input-group">
                    <input type="password" class="form-control" id="userPwds" placeholder="用户密码">
                    <span class="input-group-addon" onclick="seeUserPwd();">
										<i class="glyphicon glyphicon-eye-open"></i>
									</span>
                </div>

            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-md-3 control-label">确认密码</label>
            <div class="col-md-6">
                <input type="password" class="form-control" id="passwords" placeholder="确认密码" onblur="passwordBlur()">
            </div>
            <div class="col-md-3" class="userPassword"></div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">用户性别</label>
            <div class="col-md-6">
                <label class="radio-inline">
                    <input type="radio" name="userSex" id="sexMan" value="1"> 男
                </label>
                <label class="radio-inline">
                    <input type="radio" name="userSex" id="sexWorman" value="0"> 女
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="birthday" class="col-md-3 control-label">用户生日</label>
            <div class="col-md-6">
                <div class="input-group">
                    <input type="text" class="form-control form_datetime" id="birthdays" name="birthday"
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
                <input type="text" class="form-control" id="userPays" placeholder="用户薪资">
            </div>
        </div>
    </form>
</script>
<jsp:include page="/WEB-INF/common/body.jsp"></jsp:include>
<script type="text/javascript">

    var v_userTable;
    $(function () {
        initTable();
        brandList("brandSelect");
        tableColor();
        initTime();

    });

    function  initTime(){
        $(".form_datetime").datetimepicker({
            format: "yyyy-mm-dd hh:ii",
            autoclose: true,
            todayBtn: true,
            language: 'zh-CN',
        });
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
    function getData(){
        $.ajax({
            url: "<%=request.getContextPath()%>/department/findDepartment.jhtml",
            type: "post",
            dataType: "json",
            success: function (data) {
                znodes=data;
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
                {"targets": 7, "orderable": false},
                {"targets": 8, "orderable": false}], "order": [[5, '']
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

        v_userTable.settings()[0].ajax.data = parem;
        v_userTable.ajax.reload();
    }

    var v_ids = [];

    function tableColor() {
        $("#userTable tbody").on("click", "tr", function () {
            var v_checkbox = $(this).find("input[type='checkbox']")[0];
            for (var i = 0; i < v_ids.length; i++) {
                if (v_ids[i] == $(v_checkbox).val()) {
                    $(this).css("background", "gray");
                    v_checkbox.checked = true;
                    console.log(v_ids[i])
                }
            }
            if (this.style.background == "gray") {
                $(this).css("background", "");
                v_checkbox.checked = false;
                deleteIds($(v_checkbox).val());
            } else {
                $(this).css("background", "gray");
                v_checkbox.checked = true;
                v_ids.push($(v_checkbox).val());
            }
            console.log(v_ids)
        })
    }

    function deleteIds(id) {
        for (var i = v_ids.length - 1; i >= 0; i--) {
            if (v_ids[i] == id) {
                v_ids.splice(i, 1);
            }
        }
    }

    function isExist(id) {
        for (var i = v_ids.length - 1; i >= 0; i--) {
            if (v_ids[i] == id) {
                return true;
            }
        }
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

    function unlockUser(id) {
        $.ajax({
            url: "<%=request.getContextPath()%>/user/unlockUser.jhtml",
            data: {"id": id},
            type: "post",
            success: function (data) {
                if (data.code == 200) {
                    bootbox.alert("用户解锁成功")
                    v_userTable.ajax.reload();
                }
            }
        })
    }

    function addUser() {
        bootbox.dialog({
            title: '增加信息',
            size: "large",
            message: $("#insertform").html(),
            buttons: {
                cancel: {
                    label: "取消",
                    className: 'btn-danger',
                },
                ok: {
                    label: "保存",
                    className: 'btn-info',
                    callback: function (result) {
                        if(result){
                            var parem = {};
                            var v_addUserName = $("#addUserName").val();
                            var v_realName = $("#realName").val();
                            var v_userPwd = $("#userPwd").val();
                            var v_userSex = $("input[name='userSex']:checked").val();
                            var v_birthday = $("#birthday").val();
                            var v_userPay = $("#userPay").val();
                            var v_deptId = $("#deptId").val();
                            parem.userName = v_addUserName;
                            parem.realName = v_realName;
                            parem.userPwd = hex_md5(v_userPwd);
                            parem.userSex = v_userSex;
                            parem.birthday = v_birthday;
                            parem.userPay = v_userPay;
                            parem["department.id"] = v_deptId;
                            $.ajax({
                                url: "<%=request.getContextPath()%>/user/addUser.jhtml",
                                type: "post",
                                data: parem,
                                success: function (data) {
                                    bootbox.alert(data.msg)
                                    v_userTable.ajax.reload();
                                },
                                error: function (err) {
                                    bootbox.alert(data.msg)
                                }
                            });
                        }
                    }
                }
            }
        })
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
                        $("#userNameId").html("<span class='glyphicon glyphicon-remove' style='color: red;'> 该用户已存在，请重新输入！</span>");
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

    function passwordBlur() {
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
    function updateUser() {
        if(v_ids.length==1){
            $.ajax({
                url:"<%=request.getContextPath()%>/user/toUpdateUser.jhtml",
                data:{"id":v_ids[0]},
                type:"post",
                success:function (result) {
                    $("#deptNames").val(result.data.department.deptName);
                    $("#deptIds").val(result.data.department.id);
                    $("#addUserNames").val(result.data.userName);
                    $("#realNames").val(result.data.realName);
                    if(result.data.userSex==1){
                        $("#sexMan").prop("checked",true);
                    }else{
                        $("#sexWorman").prop("checked",true);
                    }
                    $("#birthdays").val(result.data.birthday);
                    $("#userPays").val(result.data.userPay);
                }
            })
            bootbox.dialog({
                title: '修改信息',
                size: "large",
                message: $("#updateform").html(),
                buttons: {
                    cancel: {
                        label: "取消",
                        className: 'btn-danger',
                    },
                    ok: {
                        label: "保存",
                        className: 'btn-info',
                        callback: function (result) {
                            if(result){
                                var parem = {};
                                var v_addUserName = $("#addUserNames").val();
                                var v_realName = $("#realNames").val();
                                var v_userPwd = $("#userPwds").val();
                                var v_userSex = $("input[name='userSex']:checked").val();
                                var v_birthday = $("#birthdays").val();
                                var v_userPay = $("#userPays").val();
                                var v_deptId = $("#deptIds").val();
                                parem.id = v_ids[0];
                                parem.userName = v_addUserName;
                                parem.realName = v_realName;
                                parem.userPwd = hex_md5(v_userPwd);
                                parem.userSex = v_userSex;
                                parem.birthday = v_birthday;
                                parem.userPay = v_userPay;
                                parem["department.id"] = v_deptId;
                                if(v_userPwd != null && v_userPwd !=""){
                                    $.ajax({
                                        url: "<%=request.getContextPath()%>/user/updateUser.jhtml",
                                        type: "post",
                                        data: parem,
                                        success: function (data) {
                                            bootbox.alert(data.msg)
                                            v_userTable.ajax.reload();
                                        },
                                        error: function (err) {
                                            bootbox.alert(data.msg)
                                        }
                                    });
                                }else{
                                    bootbox.alert("用户密码不能为空！")
                                }
                            }
                        }
                    }
                }
            })
        }else{
            bootbox.alert("请选择一条哦！")
        }
    }
</script>
<div id="selectDeptId" style="display: none">
    <ul id="tree2" class="ztree"></ul>
</div>
</body>
</html>