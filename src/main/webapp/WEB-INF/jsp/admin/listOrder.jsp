<%@ page pageEncoding="UTF-8" language="java" %>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<html>
<script>
    $(function () {
        $("input.OrderItem").click(function () {
            $("tr.OrderItemTR").toggle();
        });
        $("input.Delivery").click(function () {
            var page = "admin_order_delivery";
            var oid = $(this).attr("oid");
            var status = $(this).attr("status");
            $.post(
                page,
                {"id":oid,"status":status},
                function (result) {
                    if ("success" == result) {
                        location.reload();
                    }
                }
            );
        });
    });
</script>
<head>
    <title>list</title>
</head>
<body>
<div>
    <table class="table">
        <thead>
        <th class="success">ID</th>
        <th class="success">状态</th>
        <th class="success">金额</th>
        <th class="success">数量</th>
        <th class="success">创建时间</th>
        <th class="success">支付时间</th>
        <th class="success">发货时间</th>
        <th class="success">确认收货时间</th>
        <th class="success">购买者</th>
        <th class="success">订单项详情</th>
        <th class="success">发货</th>
        </thead>
        <tbody>
        <c:forEach items="${os}" var="o">
            <tr>
                <td>${o.id}</td>
                <td>${o.statusDesc}</td>
                <td>${o.total}</td>
                <td>${o.totalNumber}</td>
                <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${o.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${o.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${o.user.name}</td>
                <td><input class="btn-info OrderItem" type="button" value="订单项"></td>
                <c:if test="${o.status=='waitDelivery'}">
                    <td><input type="button" oid="${o.id}" status="waitConfirm" class="btn-info Delivery" value="发货"></td>
                </c:if>
            </tr>
            <tr class="OrderItemTR" style="display:none ">
                <td colspan="11" align="center">
                    <div>
                        <table class="table">
                            <thead>
                            <th>图片</th>
                            <th>产品名</th>
                            <th>数量</th>
                            <th>单价</th>
                            </thead>
                            <tbody>
                            <c:forEach items="${o.orderItems}" var="oi">
                                <tr>
                                    <td><img width="40px" height="40px" src="img/product/single/${oi.product.firstProductImage.id}.jpg"></td>
                                    <td>${oi.product.name}</td>
                                    <td>${oi.number}</td>
                                    <td>${oi.product.promotePrice}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div align="center">
    <%@include file="../include/admin/adminPage.jsp" %>
</div>
<div>
    <%@include file="../include/admin/adminFooter.jsp" %>
</div>
</body>
</html>
