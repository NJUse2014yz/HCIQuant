package com.edu.nju.quant.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author congye6
 *
 */
@Controller
public class CompareController {

	@RequestMapping("compare")
	public  ModelAndView compare(String stock1,String stock2) throws UnsupportedEncodingException{
		ModelAndView model=new ModelAndView("compare");
		if(stock1==null)
			stock1="腾讯控股";
		if(stock2==null)
			stock2="百度";
		model.addObject("stock1", new String(stock1.getBytes("iso8859-1"),"UTF-8"));
		model.addObject("stock2", new String(stock2.getBytes("iso8859-1"),"UTF-8"));
		return model;
	}
	
}
