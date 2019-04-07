<%--
  Created by IntelliJ IDEA.
  User: 13280
  Date: 2019/2/14
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>错误</title>
</head>
<body>
    <div align="center">
        <h3 style="color: red;">错误提示</h3>
    </div>

    <div align="center">
        <h2 style="color: red;">非常遗憾，您访问的页面不存在！</h2><p/>
        <a href="<%=request.getContextPath()%>/index.jsp">返回首页</a>
    </div>
</body>
</html>
