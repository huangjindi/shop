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
            <h3 class="panel-title"><span class="glyphicon glyphicon-search"></span> 商品查询</h3>
        </div>
        <div class="panel-body">
            <form class="form-horizontal" id="excelForm">
                <div class="form-group">
                    <label for="productName" class="col-sm-4 control-label">产品名称</label>
                    <div class="col-md-4">
                        <input type="text" class="form-control" id="productName" name="productName"
                               placeholder="产品名称">
                    </div>
                </div>
                <div class="form-group">

                    <label class="col-sm-2 control-label">产品价格</label>
                    <div class="col-md-4">
                        <div class="input-group">
                            <input type="text" class="form-control" id="minPrice" name="minPrice"
                                   placeholder="最小价格">
                            <span class="input-group-addon">
                                                <i class="glyphicon glyphicon-jpy"></i>
                                            </span>
                            <input type="text" class="form-control" id="maxPrice" name="maxPrice"
                                   placeholder="最大价格">
                        </div>
                    </div>

                    <label class="col-sm-1 control-label">产品品牌</label>
                    <div class="col-md-4">
                        <select class="form-control" name="brand.id" id="brandSelect">
                            <option value="-1">-- 请选择 --</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">录入时间</label>
                    <div class="col-md-4">
                        <div class="input-group">
                            <input type="text" class="form-control form_datetime" id="minCreateTime"
                                   name="minCreateTime"
                                   placeholder="最小时间">
                            <span class="input-group-addon">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                            <input type="text" class="form-control form_datetime" id="maxCreateTime"
                                   name="maxCreateTime"
                                   placeholder="最大时间">
                        </div>
                    </div>

                    <label class="col-sm-1 control-label">修改时间</label>
                    <div class="col-md-4">
                        <div class="input-group">
                            <input type="text" class="form-control form_datetime" id="minUpdateTime"
                                   name="minUpdateTime"
                                   placeholder="最小时间">
                            <span class="input-group-addon">
                                                <i class="glyphicon glyphicon-calendar"></i>
                                            </span>
                            <input type="text" class="form-control form_datetime" id="maxUpdateTime"
                                   name="maxUpdateTime"
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
    <div style="width: 100%; text-align: right;">
        <button type="button" class="btn btn-info" onclick="insertProduct();"><span
                class="glyphicon glyphicon-plus"></span> 添加产品
        </button>
        <button type="button" class="btn btn-info" onclick="excelOut();"><span
                class="glyphicon glyphicon-new-window"></span> Excel导出
        </button>
        <button type="button" class="btn btn-danger" onclick="deleteAll();"><span
                class="glyphicon glyphicon-trash"></span> 批量删除
        </button>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title"><span class="glyphicon glyphicon-align-justify"></span> 商品列表</h3>
        </div>
        <table id="productTable" width="100%" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>选择</th>
                <th>产品图片</th>
                <th>产品名</th>
                <th>产品价格</th>
                <th>品牌名</th>
                <th>录入时间</th>
                <th>修改时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>选择</th>
                <th width="160px">产品图片</th>
                <th>产品名</th>
                <th>产品价格</th>
                <th>品牌名</th>
                <th>录入时间</th>
                <th>修改时间</th>
                <th width="200px">操作</th>
            </tr>
            </tfoot>

        </table>
    </div>
</div>
<div style="display: none;" id="addproduct">
    <form class="form-horizontal">
        <div class="form-group">
            <label for="addProductName" class="col-sm-2 control-label">产品名称</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="addProductName" name="productName"
                       placeholder="产品名称">
            </div>
        </div>
        <div class="form-group">
            <label for="addProductPrice" class="col-sm-2 control-label">产品价格</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="addProductPrice" name="productPrice"
                       placeholder="产品价格">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">产品品牌</label>
            <div class="col-sm-9">
                <select class="form-control" name="brandId" id="addBrandSelect">
                    <option value="-1">-- 请选择 --</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="productImg" class="col-sm-2 control-label">产品图片</label>
            <div class="col-sm-9">
                <input id="productImg" name="productImg" type="file"/>
                <%-- <input type="file" id="productImg" name="productImg">--%>
            </div>
        </div>
        <div class="form-group" name="fileName">
            <label for="photo" class="col-sm-2 control-label">相关图片</label>
            <div class="col-sm-9">
                <%--<input type="file" id="photo" name="photo">--%>
                <input id="photo" name="photo" type="file" multiple/>
            </div>
        </div>
    </form>
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

    function initInputFile() {
        $("#productImg").fileinput({
            language: 'zh', //设置语言
            uploadUrl: "<%=request.getContextPath()%>/product/addImage.jhtml", //上传的地址
            allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
            showUpload: true, //是否显示上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            dropZoneEnabled: false,//是否显示拖拽区域
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
        });
        $("#photo").fileinput({
            language: 'zh', //设置语言
            uploadUrl: "", //上传的地址
            allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
            showUpload: true, //是否显示上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            dropZoneEnabled: false,//是否显示拖拽区域
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
        });
    }

    /* 添加产品 */
    function insertProduct() {
        var addproduct = $("#addproduct").html();
        initInputFile();
        var addProduct = bootbox.dialog({
            title: '增加信息',
            size: "large",
            message: $("#addproduct form"),
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
                            var v_addProductName = $("#addProductName",addProduct).val();
                            var v_addProductPrice = $("#addProductPrice",addProduct).val();
                            var v_addBrandSelect = $("#addBrandSelect",addProduct).val();
                            parem.productName = v_addProductName;
                            parem.productPrice = v_addProductPrice;
                            parem["brand.id"] = v_addBrandSelect;
                            console.log(parem)
                            $.ajax({
                                url: "<%=request.getContextPath()%>/product/addProduct.jhtml",
                                type: "post",
                                data: parem,
                                success: function (data) {
                                    bootbox.alert({
                                        title: "提示信息",
                                        message: data.msg,
                                        className: '  lightSpeedIn faster',
                                    });
                                    v_productTable.ajax.reload();
                                },
                            });
                        }
                    }
                }
            }
        })
        $("#addproduct").html(addproduct)
    }

    /*excel导出*/
    function excelOut() {
        var productForm = document.getElementById("excelForm");
        productForm.action = "<%=request.getContextPath()%>/product/excelOut.jhtml";
        productForm.submit();
    }

    var v_productTable;
    $(function () {
        initTable();
        brandList("brandSelect");
        brandList("addBrandSelect");
        tableColor();
    });

    function initTable() {
        v_productTable = $('#productTable').DataTable({
            // 是否允许排序
            "ordering": true,
            "processing": true,
            "serverSide": true,
            "searching": false,
            "columnDefs": [
                {"targets": 0, "orderable": false},
                {"targets": 1, "orderable": false},
                {"targets": 2, "orderable": false},
                {"targets": 4, "orderable": false},
                {"targets": 7, "orderable": false}], "order": [[3, '']
            ],
            "ajax": {
                "url": "<%=request.getContextPath()%>/product/list.jhtml",
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
                    'render': function (data, type, row) {
                        return '<input type="checkbox" value="' + data + '">';
                    }
                },
                {
                    "data": "photoPath",
                    'render': function (data, type, row) {

                        return '<img width="150px" height="100px" src="<%=request.getContextPath()%>' + data + '" alt="">';

                    }
                },
                {"data": "productName"},
                {"data": "productPrice"},
                {"data": "brand.brandName"},
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
                            '    <button type="button" class="btn btn-info btn-sm" onclick="findPhotoList(' + data + ');"><span class="glyphicon glyphicon-eye-open"></span> 查看图片</button>\n' +
                            '  </div>\n' +
                            '  <div class="btn-group" role="group">\n' +
                            '    <button type="button" class="btn btn-warning btn-sm" onclick="updateProduct(' + data + ')"><span class="glyphicon glyphicon-pencil"></span> 修改</button>\n' +
                            '  </div>\n' +
                            '  <div class="btn-group" role="group">\n' +
                            '    <button type="button" class="btn btn-danger btn-sm" onclick="deleteProduct(' + data + ')"><span class="glyphicon glyphicon-trash"></span> 删除</button>\n' +
                            '  </div>\n' +
                            '</div>';

                    }
                },
            ],
            "lengthMenu": [5, 15, 30, 45],
            //翻页按钮样式
            "pagingType": "full_numbers",
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
        var v_productName = $("#productName").val();
        var v_minPrice = $("#minPrice").val();
        var v_maxPrice = $("#maxPrice").val();
        var v_minCreateTime = $("#minCreateTime").val();
        var v_maxCreateTime = $("#maxCreateTime").val();
        var v_brandId = $("select[name='brand.id']").val();

        parem.productName = v_productName;
        parem.minPrice = v_minPrice;
        parem.maxPrice = v_maxPrice;
        parem.minCreateTime = v_minCreateTime;
        parem.maxCreateTime = v_maxCreateTime;
        parem["brand.id"] = v_brandId;
        v_productTable.settings()[0].ajax.data = parem;
        v_productTable.ajax.reload();
    }

    var v_ids = [];

    function tableColor() {
        $("#productTable tbody").on("click", "tr", function () {
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

    function findPhotoList(id) {
        location.href = "<%=request.getContextPath()%>/photo/findPhotoList.jhtml?id=" + id;
    }

    /* 修改产品 */
    function updateProduct(id) {
        location.href = "<%=request.getContextPath()%>/product/toUpdateProduct.jhtml?id=" + id;
    }

    /* 删除产品 */
    function deleteProduct(id) {
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
                        url: "<%=request.getContextPath()%>/product/deleteProduct.jhtml",
                        data: {"id": id},
                        type: "post",
                        async: true,
                        success: function (data) {
                            if (data.code == 200) {
                                bootbox.alert("删除成功！");
                                v_productTable.ajax.reload();
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
                            url: "<%=request.getContextPath()%>/product/deleteAll.jhtml",
                            data: {"ids": ids},
                            type: "post",
                            success: function (data) {
                                if (data.code == 200) {
                                    bootbox.alert("删除成功！");
                                    v_productTable.ajax.reload();
                                } else {
                                    alert("状态信息:" + data.msg);
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