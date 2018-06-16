package com.how2java.tmall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.how2java.tmall.pojo.Category;
import com.how2java.tmall.pojo.Property;
import com.how2java.tmall.service.CategoryService;
import com.how2java.tmall.service.PropertyService;
import com.how2java.tmall.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Component
@RequestMapping("")
public class PropertyController {
    @Autowired
    PropertyService propertyService;
    @Autowired
    CategoryService categoryService;
    @RequestMapping("admin_property_list")
    public String list(Model model, Page page,int cid){
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Property> ps = propertyService.list(cid);
        for (Property p:ps
             ) {
            System.out.println(p.getName());
        }
        int total = (int) new PageInfo<>(ps).getTotal();
        Category c = categoryService.get(cid);
        page.setTotal(total);
        page.setParam("&cid="+cid);
        model.addAttribute("ps", ps);
        model.addAttribute("page", page);
        model.addAttribute("c", c);
        return "admin/listProperty";
    }
    @RequestMapping("admin_property_add")
    public String add(Model model,Property property){
        System.out.println(property.getCid()+" "+property.getName());
        propertyService.add(property);

        return "redirect:admin_property_list?cid="+ property.getCid();
    }
    @RequestMapping("admin_property_delete")
    public String delete(int cid,int pid){
        propertyService.delete(pid);
        return "redirect:/admin_property_list?cid="+cid;
    }
    @RequestMapping("admin_property_edit")
    public String edit(Model model,int pid){
        Property p = propertyService.get(pid);
        model.addAttribute("p", p);
        return "admin/editProperty";
    }
    @RequestMapping("admin_property_update")
    public String update(Property property){
        propertyService.update(property);
        return "redirect:/admin_property_list?cid="+ property.getCid();
    }
}
