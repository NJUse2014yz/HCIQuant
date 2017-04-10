package com.edu.nju.quant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zs on 2017/3/19.
 */
@Controller
public class BlockController {
    @RequestMapping(value = "all_block")
    public String all_block(HttpServletRequest request, HttpServletResponse response){
        return "block/all_block";
    }
    @RequestMapping(value = "block")
    public String block(HttpServletRequest request, HttpServletResponse response){
        return "block/block";
    }
}
