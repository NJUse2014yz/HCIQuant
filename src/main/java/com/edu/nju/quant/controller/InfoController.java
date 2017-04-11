package com.edu.nju.quant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zs on 2017/3/15.
 */
@Controller
public class InfoController {
    @RequestMapping(value = "person_zone")
    public String personZone(HttpServletRequest request, HttpServletResponse response){
        return "personZone";
    }

    @RequestMapping(value = "learn")
    public String learn(HttpServletRequest request, HttpServletResponse response){
        return "block/learn";
    }

    @RequestMapping(value = "my_stock")
    public String my_stock(HttpServletRequest request, HttpServletResponse response){
        return "user/my_stock";
    }

    @RequestMapping(value = "my_strategy")
    public String my_strategy(HttpServletRequest request, HttpServletResponse response){
        return "user/my_strategy";
    }
}
