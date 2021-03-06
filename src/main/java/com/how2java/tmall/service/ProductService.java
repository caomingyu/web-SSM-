package com.how2java.tmall.service;
import com.how2java.tmall.pojo.Category;
import com.how2java.tmall.pojo.Product;

import java.util.List;

public interface ProductService {
    void add(Product product);

    void delete(int pid);

    void update(Product product);

    List<Product> list(int pid);

    Product get(int pid);

    void setFirstProductImage(Product product);

    void fill(Category c);
    void fill(List<Category>cs);
    void fillByRow(List<Category>cs);
}
