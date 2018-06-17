<%@ page pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<html>
<script>
    $(function () {
        $("#addForm").submit(function () {
            if (!checkEmpty("name", "姓名"))
                return false;
            if (!checkEmpty("originalPrice", "初始价格"))
                return false;
            if (!checkEmpty("promotePrice", "优惠价格"))
                return false;
            if (!checkEmpty("stock", "库存"))
                return false;
            return true;
        });
    });
</script>
<head>
    <title>list</title>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="/admin_category_list">全部分类</a></li>
    <li class="active">${c.name}</li>
</ol>
<div>
    <table class="table">
        <thead>
        <th>ID</th>
        <th>Name</th>
        <th>Picture</th>
        <th>SubTitle</th>
        <th>originalPrice</th>
        <th>promotePrice</th>
        <th>stock</th>
        <th>createDate</th>
        <th>PictureContorll</th>
        <th>Property</th>
        <th>Edit</th>
        <th>Delete</th>
        </thead>
        <tbody>
        <c:forEach items="${ps}" var="p">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td><img src="../../../img/product/single/${p.firstProductImage.id}.jpg" style="width: 50px"></td>
                <td>${fn:substring(p.subTitle,0 ,50 )}</td>
                <td><fmt:formatNumber value="${p.originalPrice}" maxFractionDigits="2"></fmt:formatNumber></td>
                <td><fmt:formatNumber value="${p.promotePrice}" maxFractionDigits="2"></fmt:formatNumber></td>
                <td>${p.stock}</td>
                <td><fmt:formatDate value="${p.createDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                <td><a href="admin_productImage_list?pid=${p.id}"><span class="glyphicon glyphicon-picture"></span></a></td>
                <td><a href="admin_propertyValue_edit?pid=${p.id}"><span class="glyphicon glyphicon-file"></span></a></td>
                <td><a href="admin_product_edit?pid=${p.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                <td><a href="admin_product_delete?pid=${p.id}"><span class="glyphicon glyphicon-remove"></span></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div align="center">
    <%@include file="../include/admin/adminPage.jsp" %>
</div>
<div class="panel panel-warning" align="center" style="width: 500px;margin: auto">
    <div class="panel-heading">新增产品</div>
    <div class="panel-body">
        <form id="addForm" action="admin_product_add" method="post">
            <table class="table">
                <tr>
                    <td>姓名</td>
                    <td><input type="text" id="name" class="form-control" name="name"></td>
                </tr>
                <tr>
                    <td>小标题</td>
                    <td><input type="text" id="subTitle" class="form-control" name="subTitle"></td>
                </tr>
                <tr>
                    <td>初始价格</td>
                    <td><input type="text" class="form-control" id="originalPrice" name="originalPrice"></td>
                </tr>
                <tr>
                    <td>优惠价格</td>
                    <td><input type="text" class="form-control" id="promotePrice" name="promotePrice"></td>
                </tr>
                <tr>
                    <td>库存</td>
                    <td><input type="text" class="form-control" id="stock" name="stock"></td>
                </tr>
                <tr>
                    <td><input type="hidden" value="${c.id}"  name="cid"></td>
                </tr>
                <%--<tr>--%>
                    <%--<td>产品圖片</td>--%>
                    <%--<td>--%>
                        <%--<input id="image" accept="image/*" type="file" name="image"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="提交" class="btn-success">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<div>
    <%@include file="../include/admin/adminFooter.jsp" %>
</div>
</body>
</html>
