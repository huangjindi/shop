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
                    <h3 class="panel-title">日志查询</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" id="excelForm">
                        <div class="form-group">
                            <label for="userName" class="col-sm-2 control-label">用户名称</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="userName" placeholder="用户名称">
                            </div>
                            <label class="col-sm-1 control-label">日志状态</label>
                            <div class="col-md-4">
                                <label class="radio-inline">
                                    <input type="radio" name="status" id="inlineRadio1" value="0"> 失败
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" id="inlineRadio2" value="1"> 成功
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">创建时间</label>
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
                                    <input type="text" class="form-control" id="minUserTime" placeholder="最小毫秒值">

                                    <span class="input-group-addon">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                                    <input type="text" class="form-control" id="maxUserTime" placeholder="最大毫秒值">

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
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">日志列表</h3>
                </div>
                <table id="logTable" class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>选择</th>
                        <th>用户名</th>
                        <th>干了什么事</th>
                        <th>运行状态</th>
                        <th>执行时间</th>
                        <th>运行费时</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>选择</th>
                        <th>用户名</th>
                        <th>干了什么事</th>
                        <th>运行状态</th>
                        <th>执行时间</th>
                        <th>运行费时</th>
                    </tr>
                    </tfoot>

                </table>
            </div>
        </div>
        <jsp:include page="/WEB-INF/common/body.jsp"></jsp:include>
<script type="text/javascript">
    $(".form_datetime").datetimepicker({
        format: "yyyy-mm-dd hh:ii",
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-left"
    });
    var v_logTable;
    $(function () {
        initTable();
        brandList("brandSelect");
        tableColor();
    });

    function initTable() {
        v_logTable = $('#logTable').DataTable({
            // 是否允许排序
            "ordering": true,
            "processing": true,
            "serverSide": true,
            "searching": false,
            "columnDefs": [
                {"targets": 0, "orderable": false},
                {"targets": 1, "orderable": false},
                {"targets": 2, "orderable": false},
                {"targets": 3, "orderable": false}], "order": [[4, '']
            ],
            "ajax": {
                "url": "<%=request.getContextPath()%>/log/selectLogList.jhtml",
                "type": "POST",
                "dataSrc":function (result) {
                    if(result.code == 200){
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
                    "data": "content",
                },
                {
                    "data": "status",
                    "render": function (data, type, row, meta) {
                        if (data == 1) {
                            return '成功';
                        }
                        if (data == 0) {
                            return '失败';
                        }
                    }
                },
                {
                    "data": "createTime",
                    "render": function (data, type, row, meta) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    "data": "useTime",
                    "render": function (data, type, row, meta) {
                        return data + "毫秒";
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

        v_logTable.settings()[0].ajax.data = parem;
        v_logTable.ajax.reload();
    }

    var v_ids = [];

    function tableColor() {
        $("#brandTable tbody").on("click", "tr", function () {
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
</script>
</body>
</html>