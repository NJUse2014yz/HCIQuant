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
	public  ModelAndView compare(){
		ModelAndView model=new ModelAndView("compare");
		
		
		return model;
	}
	
}
