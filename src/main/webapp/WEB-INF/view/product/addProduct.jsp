<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <h3 class="panel-title">商品添加</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" action="<%=request.getContextPath()%>/product/addProduct.jhtml"
                              method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="productName" class="col-sm-1 control-label">产品名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="productName" name="productName"
                                           placeholder="产品名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productPrice" class="col-sm-1 control-label">产品价格</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="productPrice" name="productPrice"
                                           placeholder="产品价格">
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
                                <label for="productImg" class="col-sm-1 control-label">产品图片</label>
                                <div class="col-sm-10">
                                    <input id="productImg" name="productImg" type="file"/>
                                   <%-- <input type="file" id="productImg" name="productImg">--%>
                                </div>
                            </div>
                            <div class="form-group" name="fileName">
                                <label for="photo" class="col-sm-1 control-label">相关图片</label>
                                <div class="col-sm-10">
                                    <%--<input type="file" id="photo" name="photo">--%>
                                    <input id="photo" name="photo" type="file" multiple/>
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
        brandList("brandSelect");
        initInputFile();
    });
    function initInputFile(){
        $("#productImg").fileinput({
            language: 'zh', //设置语言
            uploadUrl: "", //上传的地址
            allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
            showUpload: true, //是否显示上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount:true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        });
        $("#photo").fileinput({
            language: 'zh', //设置语言
            uploadUrl: "", //上传的地址
            allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
            showUpload: true, //是否显示上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount:true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        });
    };

    function fileClickAdd() {
        $("[name='fileName']").last().after('<div class="form-group" name="fileName"><div class="col-sm-1 control-label"></div><div class="col-sm-3"> <input type="file" id="photo" name="photo"> </div> <div class="col-sm-1"><button class="btn btn-default btn-xs" type="button" onclick="fileClickDelete(this);"> <span class="glyphicon glyphicon-minus"></span> </button> </div> </div>');
    }

    function fileClickDelete(obj) {
        $(obj).parent().parent().remove();
    }

</script>
</body>
</html>