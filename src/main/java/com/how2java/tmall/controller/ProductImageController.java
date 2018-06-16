package com.how2java.tmall.controller;

import com.how2java.tmall.pojo.Product;
import com.how2java.tmall.pojo.ProductImage;
import com.how2java.tmall.service.ProductImageService;
import com.how2java.tmall.service.ProductService;
import com.how2java.tmall.util.ImageUtil;
import com.how2java.tmall.util.UploadedImageFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Component
@RequestMapping("")
public class ProductImageController {
    @Autowired
    ProductImageService productImageService;
    @Autowired
    ProductService productService;
    @RequestMapping("admin_productImage_list")
    public String list(Model model,int pid){
        Product p = productService.get(pid);
        List<ProductImage> productSingleImages = productImageService.list(pid, productImageService.type_single);
        List<ProductImage> productDetailImages = productImageService.list(pid, productImageService.type_detail);
        model.addAttribute("singleImage", productSingleImages);
        model.addAttribute("detailImage", productDetailImages);
        model.addAttribute("p", p);
        return "admin/listProductImage";
    }

    @RequestMapping("admin_productImage_add")
    public String add(HttpSession session, UploadedImageFile uploadedImageFile, ProductImage productImage) throws IOException {
        productImageService.add(productImage);
        File imageFolder;
        File imageFoler_small=null;
        File imageFoler_middle=null;
        if (productImageService.type_single.equals( productImage.getType())){
            imageFolder = new File(session.getServletContext().getRealPath("img/product/single"));
            imageFoler_small=new File(session.getServletContext().getRealPath("img/product/single_small"));
            imageFoler_middle=new File(session.getServletContext().getRealPath("img/product/single_middle"));
        }
        else{
             imageFolder=new File(session.getServletContext().getRealPath("img/product/detail"));
        }
        File file = new File(imageFolder,productImage.getId()+".jpg");
        if (!file.getParentFile().exists()){
            file.getParentFile().mkdirs();
        }
        uploadedImageFile.getImage().transferTo(file);
        BufferedImage img = ImageUtil.change2jpg(file);
        ImageIO.write(img, "jpg", file);
        if (productImageService.type_single.equals( productImage.getType())){
            File filesmall = new File(imageFoler_small,productImage.getId()+".jpg");
            File filemiddle = new File(imageFoler_middle,productImage.getId()+".jpg");
            ImageUtil.resizeImage(file,57,57,filesmall);
            ImageUtil.resizeImage(file,217,190,filemiddle);
        }
        return "redirect:admin_productImage_list?pid="+productImage.getPid();
    }
    @RequestMapping("admin_prodcutImage_delete")
    public String delete(int piid,HttpSession session){
        ProductImage pi = productImageService.get(piid);
        productImageService.delete(piid);
        File imageFolder ;
        File image_small = null;
        File image_middle = null;
        if (productImageService.type_single.equals(pi.getType())){
            imageFolder = new File(session.getServletContext().getRealPath("img/product/single"));
            image_small = new File(session.getServletContext().getRealPath("img/product/single_small"));
            image_middle = new File(session.getServletContext().getRealPath("img/product/single_middle"));
        }else {
            imageFolder = new File(session.getServletContext().getRealPath("img/product/detail"));
        }
        File file = new File(imageFolder,pi.getId()+".jpg");
        file.delete();
        if (productImageService.type_single.equals(pi.getType())){
            File img_small = new File(image_small,pi.getId()+".jpg");
            File img_middle = new File(image_middle, pi.getId() + ".jpg");
            img_small.delete();
            img_middle.delete();
        }
        return "redirect:admin_productImage_list?pid="+pi.getPid();
    }
}
