package com.how2java.tmall.service;

import com.how2java.tmall.pojo.Property;

import java.util.List;

public interface PropertyService {
    void add(Property property);

    void delete(int pid);

    void update(Property property);

    List<Property> list(int cid);

    Property get(int pid);
}
