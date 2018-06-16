<%@ page pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<html>
<head>
    <title>edit</title>
</head>
<body>
<div class="panel panel-warning" style="width: 500px;margin: auto">
    <div class="panel-heading">编辑属性</div>
    <div class="panel-body" align="center" >
        <form action="admin_property_update" method="post">
            <table class="">
                <tr>
                    <td>名称</td>
                    <td><input class="form-control" type="text" name="name" value="${p.name}"></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="id" value="${p.id}"></td>
                    <td><input type="hidden" name="cid" value="${p.cid}"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" class="btn-success" value="提交">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div>
    <%@include file="../include/admin/adminFooter.jsp"%>
</div>
</body>
</html>
