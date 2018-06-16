<%@ page pageEncoding="UTF-8" language="java" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<html>
<head>
    <title>list</title>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="/admin_category_list">全部分类</a></li>
    <li><a href="admin_product_list?cid=${p.cid}">${p.name}</a></li>
    <li class="active">图片</li>
</ol>
<div>
    <div class="panel panel-warning" style="width: 400px;display: inline-block;margin-left: 200px" >
        <div class="panel-heading">缩略图片</div>
        <div class="panel-body">
            <table class="table">
                <thead>
                <th>ID</th>
                <th>图片</th>
                <th>删除</th>
                </thead>
                <tbody>
                <c:forEach items="${singleImage}" var="sigle">
                    <tr>
                        <td>${sigle.id}</td>
                        <td><img src="../../../img/product/single/${sigle.id}.jpg" style="width: 60px"></td>
                        <td><a deleteLink="true" href="admin_prodcutImage_delete?piid=${sigle.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="panel panel-warning">
                <div class="panel-heading">新增缩略图片</div>
                <div class="panel-body">
                    <form method="post" enctype="multipart/form-data" action="admin_productImage_add">
                        <table class="">
                            <tr>
                                <td>图片:</td>
                                <td><input class="form-control-static" type="file" name="image" id="image"accept="image/*"></td>
                            </tr>
                            <tr>
                                <td><input type="hidden" value="${p.id}" name="pid"></td>
                            </tr>
                            <tr>
                                <td><input type="hidden" value="type_single" name="type"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="submit" value="提交" class="btn-success">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-warning" style="width: 400px;display: inline-block;margin-left: 100px">
        <div class="panel-heading">详情图片</div>
        <div class="panel-body">
            <table class="table">
                <thead>
                <th>ID</th>
                <th>图片</th>
                <th>删除</th>
                </thead>
                <tbody>
                <c:forEach items="${detailImage}" var="detail">
                    <tr>
                        <td>${detail.id}</td>
                        <td><img src="../../../img/product/detail/${detail.id}.jpg" style="width: 60px"></td>
                        <td><a deleteLink="true" href="admin_prodcutImage_delete?piid=${detail.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="panel panel-warning">
                <div class="panel-heading">新增详情图片</div>
                <div class="panel-body">
                    <form method="post" enctype="multipart/form-data" action="admin_productImage_add">
                        <table class="">
                            <tr>
                                <td>图片:</td>
                                <td><input class="form-control-static" type="file" name="image" id="image1"accept="image/*"></td>
                            </tr>
                            <tr>
                                <td><input type="hidden" value="${p.id}" name="pid"></td>
                            </tr>
                            <tr>
                                <td><input type="hidden" value="type_detail" name="type"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="submit" value="提交" class="btn-success">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
