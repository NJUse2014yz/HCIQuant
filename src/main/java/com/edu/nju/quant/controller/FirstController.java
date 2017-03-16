package com.edu.nju.quant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author congye6
 *
 */
@Controller
public class FirstController {

	@RequestMapping("/navigation")
	public String navigation(){
		return "first/navBar";
	}
	
	@RequestMapping("/first")
	public String first(){
		return "first/first";
	}
}
