package com.edu.nju.quant.controller;

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
	public  ModelAndView compare(String stock1,String stock2){
		ModelAndView model=new ModelAndView("compare");
		if(stock1==null)
			stock1="腾讯控股";
		if(stock2==null)
			stock2="百度";
		model.addObject("stock1", stock1);
		model.addObject("stock2", stock2);
		return model;
	}
	
}
