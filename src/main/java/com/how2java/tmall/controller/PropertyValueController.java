package com.how2java.tmall.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("")
public class PropertyValueController {
@RequestMapping("admin_propertyValue_edit")
    public String edit(){
    return"";
}
}
