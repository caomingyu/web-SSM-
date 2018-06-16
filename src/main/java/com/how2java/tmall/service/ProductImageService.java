package com.how2java.tmall.service;

import com.how2java.tmall.pojo.Product;
import com.how2java.tmall.pojo.ProductImage;

import java.util.List;

public interface ProductImageService {
    final String type_single = "type_single";
    final String type_detail = "type_detail";

    void add(ProductImage productImage);

    void delete(int piid);

    void update(ProductImage productImage);

    List<ProductImage> list(int pid, String type);

    ProductImage get(int piid);

}
