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
                    <h3 class="panel-title"><span class="glyphicon glyphicon-search"></span> 品牌查询</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" id="excelForm">
                        <div class="form-group">
                            <label for="brandName" class="col-sm-4 control-label">品牌名称</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="brandName" placeholder="品牌名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">录入时间</label>
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
                            <label class="col-sm-1 control-label">修改时间</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="text" class="form-control form_datetime" id="minUpdateTime"
                                           placeholder="最小时间">

                                    <span class="input-group-addon">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                                    <input type="text" class="form-control form_datetime" id="maxUpdateTime"
                                           placeholder="最大时间">

                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="text-align: center;">
                            <div class="col-sm-offset-1 col-sm-10">
                                <button type="button" class="btn btn-primary" onclick="search();"><span
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
            <div style="width: 100%; text-align: right;">
                <button type="button" class="btn btn-primary" onclick="insertStu();">添加品牌</button>
                <button type="button" class="btn btn-danger" onclick="deleteAll();">批量删除</button>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-align-justify"></span> 品牌列表</h3>
                </div>
                <table id="brandTable" class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>选择</th>
                        <th>品牌名</th>
                        <th>录入时间</th>
                        <th>修改时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>选择</th>
                        <th>品牌名</th>
                        <th>录入时间</th>
                        <th>修改时间</th>
                        <th>操作</th>
                    </tr>
                    </tfoot>

                </table>
            </div>
        </div>
<%-- 品牌添加 --%>
<script type="text/html" id="insertform">
    <form class="form-horizontal" id="insertPer" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label class="col-sm-3 control-label">品牌名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="addName" name="brandName">
            </div>
        </div>
    </form>
</script>
<%-- 品牌修改 --%>
<script type="text/html" id="updateform">
    <form class="form-horizontal" id="updateBrand" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label class="col-sm-3 control-label">品牌名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="updateName" name="brandName">
            </div>
        </div>
    </form>
</script>
<div id="err"></div>
        <jsp:include page="/WEB-INF/common/body.jsp"></jsp:include>
<script type="text/javascript">
    $(".form_datetime").datetimepicker({
        format: "yyyy-mm-dd hh:ii",
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-left"
    });
    var v_brandTable;
    $(function () {
        initTable();
        brandList("brandSelect");
        tableColor();
    });

    function initTable() {
        v_brandTable = $('#brandTable').DataTable({
            // 是否允许排序
            "ordering": true,
            "processing": true,
            "serverSide": true,
            "searching": false,
            "columnDefs": [
                {"targets": 0, "orderable": false},
                {"targets": 1, "orderable": false},
                {"targets": 4, "orderable": false}], "order": [[2, '']
            ],
            "ajax": {
                "url": "<%=request.getContextPath()%>/brand/queryBrandList.jhtml",
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
                    "data": "brandName",
                },
                {
                    "data": "createTime",
                    "render": function (data, type, row, meta) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    "data": "updateTime",
                    "render": function (data, type, row, meta) {
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    "data": "id",
                    'render': function (data, type, row) {

                        return '<div class="btn-group btn-group-xs" role="group" aria-label="...">\n' +
                            '  <div class="btn-group" role="group">\n' +
                            '    <button type="button" class="btn btn-warning btn-sm" onclick="updateBrand(' + data + ')"><span class="glyphicon glyphicon-pencil"></span> 修改</button>\n' +
                            '  </div>\n' +
                            '  <div class="btn-group" role="group">\n' +
                            '    <button type="button" class="btn btn-danger btn-sm" onclick="deleteBrand(' + data + ')"><span class="glyphicon glyphicon-trash"></span> 删除</button>\n' +
                            '  </div>\n' +
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
        var v_brandName = $("#brandName").val();
        var v_minCreateTime = $("#minCreateTime").val();
        var v_maxCreateTime = $("#maxCreateTime").val();
        var v_minUpdateTime = $("#minUpdateTime").val();
        var v_maxUpdateTime = $("#maxUpdateTime").val();

        parem.brandName = v_brandName;
        parem.minCreateTime = v_minCreateTime;
        parem.maxCreateTime = v_maxCreateTime;
        parem.minUpdateTime = v_minUpdateTime;
        parem.maxUpdateTime = v_maxUpdateTime;

        v_brandTable.settings()[0].ajax.data = parem;
        v_brandTable.ajax.reload();
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

    function deleteBrand(id) {
        bootbox.confirm({
            title: "温馨提示：",
            message: "您确定要删除该信息吗？",
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
                        url: "<%=request.getContextPath()%>/brand/deleteBrand.jhtml",
                        data: {"id": id},
                        type: "post",
                        dataType: "json",
                        async: true,
                        success: function (data) {
                            if (data.code == 200) {
                                bootbox.alert(data.msg)
                                v_brandTable.ajax.reload();
                            } else {
                                bootbox.alert(data.msg)
                            }
                        },
                        error: function (err) {
                            $("#error").html(err.responseText);
                        }
                    })
                }
            }
        });
    }

    //添加
    function insertStu() {
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
                    callback: function () {
                        var v_brandName = $("#addName").val();
                        $.ajax({
                            url: "<%=request.getContextPath()%>/brand/addBrand.jhtml",
                            type: "post",
                            data: {"brandName": v_brandName},
                            success: function (data) {
                                bootbox.alert(data.msg)
                                v_brandTable.ajax.reload();
                            },
                            error: function (err) {
                                bootbox.alert(data.msg)
                            }
                        });
                    }
                }
            }
        })
    }

    //修改
    function updateBrand(id) {
        var pid = id.toString().replace(new RegExp("/", 'g'), "");
        $.ajax({
            url: "<%=request.getContextPath()%>/brand/toUpdateBrand.jhtml",
            data: {id: pid},
            type: "post",
            dataType: "json",
            success: function (res) {
                $("#updateName").val(res.data.brandName);
            },
            error: function () {
                bootbox.alert("回显失败")
            }
        });
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
                    callback: function () {
                        var v_brandName = $("#updateName").val();
                        $.ajax({
                            url: "<%=request.getContextPath()%>/brand/updateBrand.jhtml",
                            type: "post",
                            data: {
                                "id": id,
                                "brandName": v_brandName,
                            },
                            success: function (data) {
                                bootbox.alert(data.msg)
                                v_brandTable.ajax.reload();
                            },
                            error: function (data) {
                                bootbox.alert(data.msg)
                            }
                        });
                    }
                }
            }
        })
    }

    /* 批量删除 */
    function deleteAll() {
        var ids = v_ids.join(",");
        bootbox.confirm({
            title: "温馨提示：",
            message: "您确定要删除吗？",
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
                    if (ids.length > 0) {
                        $.ajax({
                            url: "<%=request.getContextPath()%>/brand/deleteAll.jhtml",
                            data: {"ids": ids},
                            type: "post",
                            success: function (data) {
                                if (data.code == 200) {
                                    bootbox.alert(data.msg)
                                    v_brandTable.ajax.reload();
                                } else {
                                    bootbox.alert(data.msg)
                                }
                            }
                        })
                    } else {
                        bootbox.alert({
                            message: "请选择您要删除的信息！",
                            locale: 'ok'
                        });
                    }
                }
            }
        });
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