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
                    <label for="userName" class="col-sm-1 control-label">生日</label>
                    <div class="col-md-4">
                        <div class="input-group">
                            <input type="text" class="form-control form_datetime" id="minBirthday" name="minBirthday"
                                   placeholder="最小生日">
                            <span class="input-group-addon">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                            <input type="text" class="form-control form_datetime" id="maxBirthday" name="maxBirthday"
                                   placeholder="最大生日">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">地区</label>
                    <div id="cityId">
                    </div>
                </div>
                <div class="form-group" style="text-align: center;">
                    <div class="col-sm-offset-1 col-sm-10">
                        <button type="button" class="btn btn-info" onclick="search();"><span
                                class="glyphicon glyphicon-ok"></span> Submit
                        </button>
                        <button type="reset" class="btn btn-warning" onclick="resetAll()"><span
                                class="glyphicon glyphicon-refresh"></span> Reset
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%--<div>
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
    </div>--%>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title"><span class="glyphicon glyphicon-align-justify"></span> 用户列表</h3>
        </div>
        <table id="memberTable" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>选择</th>
                <th>会员名</th>
                <th>生日</th>
                <th>电话号码</th>
                <th>email</th>
                <th>地区</th>
                <th>操作</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>选择</th>
                <th>会员名</th>
                <th>生日</th>
                <th>电话号码</th>
                <th>email</th>
                <th>地区</th>
                <th>操作</th>
            </tr>
            </tfoot>

        </table>
    </div>
</div>
<jsp:include page="/WEB-INF/common/body.jsp"></jsp:include>
<script type="text/javascript">

    var v_memberTable;
    $(function () {
        initTable();
        tableColor();
        initTime();
        cityClick(1);
    });

    function  initTime(){
        $(".form_datetime").datetimepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
            todayBtn: true,
            language: 'zh-CN',
        });
    }
    function initTable() {
        v_memberTable = $('#memberTable').DataTable({
            // 是否允许排序
            "ordering": true,
            "processing": true,
            "serverSide": true,
            "searching": false,
            "columnDefs": [
                {"targets": 0, "orderable": false},
                {"targets": 1, "orderable": false},
                {"targets": 2, "orderable": false},
                {"targets": 4, "orderable": false}], "order": [[5, '']
            ],
            "ajax": {
                "url": "<%=request.getContextPath()%>/member/queryMember.jhtml",
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
                    "data": "birthday",
                    'render': function (data, type, row) {
                        return (new Date(data)).Format("yyyy-MM-dd");
                    }
                },
                {
                    "data": "phone",
                },
                {
                    "data": "email",
                },
                {
                    "data": "areaName",
                },
                {
                    "data": "id",
                    'render': function (data, type, row) {
                        return '<div class="btn-group btn-group-xs" role="group" aria-label="...">\n' +
                            '  <div class="btn-group" role="group">\n' +
                            '    <button type="button" class="btn btn-warning btn-sm" onclick="updateMember(' + data + ')"><span class="glyphicon glyphicon-pencil"></span> 修改</button>\n' +
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

    function search() {
        var v_areaIds = "";
        $("select[name='cityShengSelect']").each(function () {
            if(this.value != -1){
                v_areaIds += this.value+",";
            }
        })
        console.log(v_areaIds)
        var parem = {};
        var v_userName = $("#userName").val();
        var v_minBirthday = $("#minBirthday").val();
        var v_maxBirthday = $("#maxBirthday").val();

        parem.userName = v_userName;
        parem.minBirthday = v_minBirthday;
        parem.maxBirthday = v_maxBirthday;
        parem.areaIds = v_areaIds;

        v_memberTable.settings()[0].ajax.data = parem;
        v_memberTable.ajax.reload();
    }

    function cityClick(id, obj) {
        $.ajax({
            url: "<%=request.getContextPath()%>/member/cityTownList.jhtml",
            data: {"id": id},
            type: "post",
            async:"true",
            success: function (result) {
                if (result.code == 200) {
                    if (obj) {
                        $(obj).parent().nextAll().remove();
                    }
                    if (result.data.length == 0) {
                        return;
                    }
                    var titleSelect = '<div class="col-md-3">\n' +
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

    function resetAll() {
        $("select[name='cityShengSelect']").parent().nextAll().remove();
    }

    var v_ids = [];

    function tableColor() {
        $("#memberTable tbody").on("click", "tr", function () {
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
    function updateMember(id) {
        location.href="<%=request.getContextPath()%>/member/toUpdateMember.jhtml?id="+id;
    }
</script>
<div id="selectDeptId" style="display: none">
    <ul id="tree2" class="ztree"></ul>
</div>
</body>
</html>