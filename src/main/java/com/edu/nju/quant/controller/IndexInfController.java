package com.edu.nju.quant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by dell on 2017/4/12.
 */
@Controller
public class IndexInfController {
    @RequestMapping("indexInfo")
    public ModelAndView indexInfo(String id, HttpServletRequest request) throws Exception {
        System.out.println("indexid=" + id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("stockdata/indexInf");
        return modelAndView;
    }
}
