<%@ page pageEncoding="UTF-8" language="java" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<html>
<script>
    $(function () {
        $("input.editInput").keyup(function () {
            var value = $(this).val();
            var pvid = $(this).attr("pvid");
            var ptid = $(this).attr("ptid");
            var pid = $(this).attr("pid");
            var parentSpan = $(this).parent("span");
            parentSpan.css("border","1px solid yellow");
            var page = "admin_propertyValue_update";
            var params={"value":value,"id":pvid,"pid":pid,"ptid":ptid}
            $.post(
                page,params,function (result) {
                    if ("success"==result)
                        if("success"==result)
                            parentSpan.css("border","1px solid green");
                        else
                            parentSpan.css("border","1px solid red");
                }
            );
        });
    });
</script>
<head>
    <title>list</title>
</head>
<ol class="breadcrumb">
    <li><a href="/admin_category_list">全部分类</a></li>
    <li><a href="admin_product_list?cid=${c.id}">${c.name}</a></li>
    <li class="active">${p.name}</li>
    <li class="active">属性值设置</li>
    <li></li>
</ol>
<body>
<div class="panel panel-warning" style="width: 600px;margin: auto">
    <div class="panel-heading">属性</div>
    <div class="panel-body">
        <c:forEach items="${pvs}" var="pv">
                    <div style="display: inline-block;margin-left: 30px;margin-top: 30px">
                        <span style="display: inline-block">${pv.property.name}</span>
                        <span style="display: inline-block;margin-left: 20px"><input pvid="${pv.id}" ptid="${pv.ptid}"pid="${pv.pid}" id="editInput"  type="text" class="form-control editInput" value="${pv.value}"></span>
                    </div>
                </c:forEach>
    </div>
</div>
<div>
    <%@include file="../include/admin/adminFooter.jsp"%>
</div>
</body>
</html>
