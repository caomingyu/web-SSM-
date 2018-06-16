<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<script>
$(function () {
   $("#addForm").submit(function () {
       return checkEmpty("name","属性名称");
   }); 
});
</script>
<html>
<head>
    <title>list</title>
</head>
<body>
<ol class="breadcrumb">
<li><a href="/admin_category_list">所以分类</a></li>
<li><a href="admin_property_list?cid=${c.id}">${c.name}</a></li>
<li class="active">属性管理</li>
</ol>
<div>
    <table class="table table-bordered">
        <thead>
        <th>ID</th>
        <th>Name</th>
        <th>CategoryPicture</th>
        <th>Edit</th>
        <th>Delete</th>
        </thead>
        <tbody>
        <c:forEach items="${ps}" var="p">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td><img height="40px" src="img/category/${c.id}.jpg"></td>
                <td><a href="admin_property_edit?cid=${p.cid}&pid=${p.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                <td><a href="admin_property_delete?cid=${p.cid}&pid=${p.id}"><span class="glyphicon glyphicon-remove"></span></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div align="center">
    <%@include file="../include/admin/adminPage.jsp"%>
</div>
<div class="panel panel-danger" style="width: 500px;margin: auto">
    <div class="panel-heading" align="center">增加属性</div>
    <div class="panel-body">
        <form action="admin_property_add" method="post" id="addForm">
            <table align="center">
                <tr>
                    <td>名称:</td>
                    <td><input id="name" class="form-control" type="text" name="name"></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="cid" value="${c.id}"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" class="btn-success" value="提交"></td>
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
