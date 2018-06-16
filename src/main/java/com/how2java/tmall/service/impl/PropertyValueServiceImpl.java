package com.how2java.tmall.service.impl;

import com.how2java.tmall.mapper.PropertyMapper;
import com.how2java.tmall.mapper.PropertyValueMapper;
import com.how2java.tmall.pojo.*;
import com.how2java.tmall.service.ProductService;
import com.how2java.tmall.service.PropertyService;
import com.how2java.tmall.service.PropertyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PropertyValueServiceImpl implements PropertyValueService {
    @Autowired
    PropertyValueMapper propertyValueMapper;
    @Autowired
    PropertyService propertyService;
    @Override
    public void add(PropertyValue propertyValue) {

    }

    @Override
    public void delete(int pvid) {

    }

    @Override
    public void update(PropertyValue propertyValue) {
        propertyValueMapper.updateByPrimaryKey(propertyValue);
    }

    @Override
    public List<PropertyValue> list(int pid) {
        PropertyValueExample example = new PropertyValueExample();
        example.createCriteria().andPidEqualTo(pid);
        List<PropertyValue> pvs = propertyValueMapper.selectByExample(example);
        for (PropertyValue pv:pvs
             ) {
            Property pt = propertyService.get(pv.getPtid());
            pv.setProperty(pt);
        }
        return pvs;
    }

    @Override
    public void init(Product p) {
        List<Property> ps =propertyService.list(p.getId());
        for (Property pt:ps
             ) {
            PropertyValue pv = get(p.getId(), pt.getId());
            if (pv == null) {
                pv = new PropertyValue();
                pv.setPid(p.getId());
                pv.setPtid(pt.getId());
                pv.setProperty(pt);
                propertyValueMapper.insert(pv);
            }
        }
    }

    @Override
    public PropertyValue get(int pid, int pvid) {
        PropertyValueExample example = new PropertyValueExample();
        example.createCriteria().andPidEqualTo(pid).andPtidEqualTo(pvid);
        List<PropertyValue> pvs = propertyValueMapper.selectByExample(example);
        if (pvs.isEmpty())
            return null;
        return pvs.get(0);
    }

}
