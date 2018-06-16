package com.how2java.tmall.service.impl;

import com.how2java.tmall.mapper.ProductImageMapper;
import com.how2java.tmall.pojo.Product;
import com.how2java.tmall.pojo.ProductImage;
import com.how2java.tmall.pojo.ProductImageExample;
import com.how2java.tmall.service.ProductImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductImageServiceImpl implements ProductImageService {
    @Autowired
    ProductImageMapper productImageMapper;
    @Override
    public void add(ProductImage productImage) {
        productImageMapper.insert(productImage);
    }

    @Override
    public void delete(int piid) {
        productImageMapper.deleteByPrimaryKey(piid);
    }

    @Override
    public void update(ProductImage productImage) {

    }

    @Override
    public List<ProductImage> list(int pid, String type) {
        ProductImageExample example = new ProductImageExample();
        example.createCriteria().andPidEqualTo(pid).andTypeEqualTo(type);
        return productImageMapper.selectByExample(example);
    }

    @Override
    public ProductImage get(int piid) {
        return productImageMapper.selectByPrimaryKey(piid);
    }

}
