package com.how2java.tmall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.how2java.tmall.mapper.ProductMapper;
import com.how2java.tmall.pojo.Category;
import com.how2java.tmall.pojo.Product;
import com.how2java.tmall.service.CategoryService;
import com.how2java.tmall.service.ProductImageService;
import com.how2java.tmall.service.ProductService;
import com.how2java.tmall.util.ImageUtil;
import com.how2java.tmall.util.Page;
import com.how2java.tmall.util.UploadedImageFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Component
@RequestMapping("")
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductImageService productImageService;

    @RequestMapping("admin_product_list")
    public String list(Model model, Page page, int cid) {
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Product> ps = productService.list(cid);
        for (Product p:ps
             ) {
            productService.setFirstProductImage(p);
        }
        int total = (int) new PageInfo<>(ps).getTotal();
        page.setTotal(total);
        page.setParam("&cid="+cid);
        Category c = categoryService.get(cid);
        model.addAttribute("ps", ps);
        model.addAttribute("page", page);
        model.addAttribute("c", c);
        return "admin/listProduct";
    }

    @RequestMapping("admin_product_add")
    public String add(Model model,Product product ,int cid) throws IOException {
        product.setCreateDate(new Date());
        productService.add(product);
        return "redirect:admin_product_list?cid="+cid;
    }
    @RequestMapping("admin_product_edit")
    public String edit(Model model,int pid){
        Product p=productService.get(pid);
        model.addAttribute("p", p);
        return "admin/editProduct";
    }

    @RequestMapping("admin_product_update")
    public String update(Product product) {
        product.setCreateDate(new Date());
        productService.update(product);
        return "redirect:admin_product_list?cid="+product.getCid();
    }
    @RequestMapping("admin_product_delete")
    public String delete(int pid){
        Product p = productService.get(pid);
        productService.delete(pid);
        return "redirect:/admin_product_list?cid="+p.getCid();
    }
}
