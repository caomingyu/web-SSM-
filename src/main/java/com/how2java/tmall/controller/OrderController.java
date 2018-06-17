package com.how2java.tmall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.how2java.tmall.pojo.Order;
import com.how2java.tmall.pojo.OrderItem;
import com.how2java.tmall.pojo.Product;
import com.how2java.tmall.service.OrderItemService;
import com.how2java.tmall.service.OrderService;
import com.how2java.tmall.service.ProductService;
import com.how2java.tmall.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.Date;
import java.util.List;

@Component
@RequestMapping("")
public class OrderController {
    @Autowired
    OrderService orderService;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    ProductService productService;
    @RequestMapping("admin_order_list")
    public String list(Model model, Page page){
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Order> os = orderService.list();
        orderItemService.fill(os);
        for (Order o:os
             ) {
            for (OrderItem oi:o.getOrderItems()
                 ) {
                Product p = oi.getProduct();
                productService.setFirstProductImage(p);
            }
        }
        int total = (int)new PageInfo<>(os).getTotal();
        page.setTotal(total);
        model.addAttribute("os", os);
        model.addAttribute("page", page);
        return "admin/listOrder";
    }
    @RequestMapping("admin_order_delivery")
    @ResponseBody
    public String delivery(Order order){
        order.setDeliveryDate(new Date());
        orderService.update(order);
        return "success";
    }
}
