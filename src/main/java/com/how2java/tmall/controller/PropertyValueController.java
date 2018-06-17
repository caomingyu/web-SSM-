package com.how2java.tmall.controller;

import com.how2java.tmall.pojo.Category;
import com.how2java.tmall.pojo.Product;
import com.how2java.tmall.pojo.PropertyValue;
import com.how2java.tmall.service.CategoryService;
import com.how2java.tmall.service.ProductService;
import com.how2java.tmall.service.PropertyValueService;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Component
@RequestMapping("")
public class PropertyValueController {
    @Autowired
    PropertyValueService propertyValueService;
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;
@RequestMapping("admin_propertyValue_edit")
    public String edit(Model model, int pid){
    Product p = productService.get(pid);
    Category c = categoryService.get(p.getCid());
    propertyValueService.init(p);
    List<PropertyValue> pvs = propertyValueService.list(pid);
    model.addAttribute("pvs", pvs);
    model.addAttribute("p", p);
    model.addAttribute("c", c);
    return"admin/listPropertyValue";
}
@RequestMapping("admin_propertyValue_update")
@ResponseBody
    public String update(PropertyValue propertyValue) {
    propertyValueService.update(propertyValue);
    return "success";
}
}
