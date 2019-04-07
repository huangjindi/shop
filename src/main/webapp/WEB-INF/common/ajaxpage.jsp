<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${page.pageIndex == 1 }">
	<font color="red" class="title">首页</font>
	<span class="title">上一页</span>
</c:if>

<c:if test="${page.pageIndex != 1}">
	<a class="title" href="javascript:;" onclick="turnPage(1)">
	首页
	</a>
	<a class="title" href="javascript:;" onclick="turnPage(${page.pageIndex - 1})">上一页</a>
</c:if>

<c:if test="${page.totalCount > 0 && page.pageIndex != page.pageCount }">
	<a class="title" href="javascript:;" onclick="turnPage(${page.pageIndex + 1 })">下一页</a>
	<a class="title" href="javascript:;" onclick="turnPage(${page.pageCount})">尾页</a>
</c:if>

<c:if test="${page.totalCount == 0 || page.pageIndex == page.pageCount }">
	<span class="title">下一页</span>
	<font class="title" color='red'>尾页</font>
</c:if>
当前为${page.pageIndex}/${page.pageCount}
共${page.totalCount}条数据
<select class="title" onchange="changePageSize(this.value);" style="width:100px;opacity:100;border:1px solid #ccc">
<option value="5" ${page.pageSize==5?"selected":"" }>每页5条</option>
<option value="10" ${page.pageSize==10?"selected":"" }>每页10条</option>
<option value="15" ${page.pageSize==15?"selected":"" }>每页15条</option>
<option value="20" ${page.pageSize==20?"selected":"" }>每页20条</option>
</select>


