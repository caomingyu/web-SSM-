package com.how2java.tmall.service.impl;

import com.how2java.tmall.mapper.ProductMapper;
import com.how2java.tmall.pojo.Product;
import com.how2java.tmall.pojo.ProductExample;
import com.how2java.tmall.pojo.ProductImage;
import com.how2java.tmall.service.ProductImageService;
import com.how2java.tmall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;
    @Autowired
    ProductImageService productImageService;

    @Override
    public void add(Product product) {
        productMapper.insert(product);
    }

    @Override
    public void delete(int pid) {
        productMapper.deleteByPrimaryKey(pid);
    }

    @Override
    public void update(Product product) {
        productMapper.updateByPrimaryKey(product);
    }

    @Override
    public List<Product> list(int cid) {
        ProductExample example = new ProductExample();
        example.createCriteria().andCidEqualTo(cid);
        example.setOrderByClause("id desc");
        List<Product> ps = productMapper.selectByExample(example);
        return ps;
    }

    @Override
    public Product get(int pid) {
        return productMapper.selectByPrimaryKey(pid);
    }

    @Override
    public void setFirstProductImage(Product product) {
        List<ProductImage> pis = productImageService.list(product.getId(), productImageService.type_single);
        if (!pis.isEmpty()) {
            ProductImage pi = pis.get(0);
            product.setFirstProductImage(pi);
        }
    }
}
