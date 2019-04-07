<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:if test="${!empty logList}">
<table border="1" width="1200" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <th>选择</th>
        <th>序号</th>
        <th>用户名</th>
        <th>做了什么事</th>
        <th>状态</th>
        <th>创建时间</th>
        <th>费时</th>
    </tr>
    <c:forEach items="${logList}" var="log">
        <c:if test="${log.status == 0}">
            <tr align="center" bgcolor="red" class="colorClass">
                <td><input type="checkbox" name="checkbox"></td>
                <td>${log.id}</td>
                <td>${log.userName}</td>
                <td>${log.content}</td>
                <td>${log.status==1?"成功":"失败"}</td>
                <td><fmt:formatDate value="${log.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${log.useTime}毫秒(ms)</td>
            </tr>
        </c:if>
        <c:if test="${log.status == 1}">
            <tr align="center" class="colorClass">
                <td><input type="checkbox" name="checkbox"></td>
                <td>${log.id}</td>
                <td>${log.userName}</td>
                <td>${log.content}</td>
                <td>${log.status==1?"成功":"失败"}</td>
                <td><fmt:formatDate value="${log.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${log.useTime}毫秒(ms)</td>
            </tr>
        </c:if>
    </c:forEach>
</table>
</c:if>
<c:if test="${empty logList}">
    <h3 align="center"><font color="red">对不起，没有相关的信息！</font></h3>
</c:if>