package com.edu.nju.quant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zs on 2017/3/15.
 */
@Controller
public class LoginController {
    @RequestMapping(value = "login")
    public String login(HttpServletRequest request, HttpServletResponse response){
        return "login";
    }

    @RequestMapping(value = "property")
    public String property(HttpServletRequest request, HttpServletResponse response){
        return "property";
    }
}
