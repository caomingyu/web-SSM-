<%@ page pageEncoding="UTF-8" language="java" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<div class="panel panel-warning" style="width: 500px;margin: auto" align="center">
    <div class="panel-heading">编辑产品</div>
    <div class="panel-body">
        <form action="admin_product_update" method="post">
            <table class="table">
                <tr>
                    <td>姓名</td>
                    <td><input type="text" id="name" value="${p.name}" class="form-control" name="name"></td>
                </tr>
                <tr>
                    <td>小标题</td>
                    <td><input type="text" value="${p.subTitle}" id="subTitle" class="form-control" name="subTitle"></td>
                </tr>
                <tr>
                    <td>初始价格</td>
                    <td><input type="text" class="form-control" value="${p.originalPrice}" id="originalPrice" name="originalPrice"></td>
                </tr>
                <tr>
                    <td>优惠价格</td>
                    <td><input type="text" class="form-control" value="${p.promotePrice}" id="promotePrice" name="promotePrice"></td>
                </tr>
                <tr>
                    <td>库存</td>
                    <td><input type="text" class="form-control" value="${p.stock}" id="stock" name="stock"></td>
                </tr>
                <tr>
                    <td><input type="hidden" value="${p.cid}"  name="cid"></td>
                    <td><input type="hidden" value="${p.id}"  name="id"></td>
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
    <%@include file="../include/admin/adminFooter.jsp"%>
</div>
</body>
</html>
