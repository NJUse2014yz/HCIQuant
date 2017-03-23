package com.edu.nju.quant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author congye6
 *
 */
@Controller
@RequestMapping("/strategy")
public class StrategyController {

	@RequestMapping("/scan")
	public String scan(){
		return "strategy/scan";
	}
	
	@RequestMapping("/anlysis")
	public String anlysis(){
		return "strategy/anlysis";
	}

	@RequestMapping("/make")
	public String make(){
		return "strategy/strategy";
	}

	@RequestMapping("/compare")
	public String compare(){
		return "strategy/strategy_compare";
	}

	@RequestMapping("/choose")
	public String choose(){
		return "first/stock_chooser";
	}
}
