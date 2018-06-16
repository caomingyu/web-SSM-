package com.how2java.tmall.service;

import com.how2java.tmall.pojo.Product;
import com.how2java.tmall.pojo.PropertyValue;

import java.util.List;

public interface PropertyValueService {
    void add(PropertyValue propertyValue);

    void delete(int pvid);

    void update(PropertyValue propertyValue);

    List<PropertyValue> list(int pid);

    void init(Product p);

    PropertyValue get(int pid,int pvid);
}
