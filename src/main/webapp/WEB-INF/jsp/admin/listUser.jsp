<%@ page pageEncoding="UTF-8" language="java" %>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<html>
<head>
    <title>list</title>
</head>
<body>
<div>
    <table class="table">
        <thead class="">
        <th class="success">ID</th>
        <th class="success">用户</th>
        <th class="success">密码</th>
        </thead>
        <tbody>
        <c:forEach items="${us}" var="u">
            <tr>
                <td>${u.id}</td>
                <td>${u.name}</td>
                <td>${u.password}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div align="center">
    <%@include file="../include/admin/adminPage.jsp"%>
</div>
<div>
    <%@include file="../include/admin/adminFooter.jsp" %>
</div>
</body>
</html>
