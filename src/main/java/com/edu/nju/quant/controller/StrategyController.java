package com.edu.nju.quant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author congye6
 *
 */
@Controller
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

	@RequestMapping("/strategy_compare")
	public String compare(){
		return "strategy/strategy_compare";
	}

	@RequestMapping("/scan_first")
	public String scan_first(){
		return "strategy/scan_first";
	}

	@RequestMapping("/anlysis_first")
	public String anlysis_first(){
		return "strategy/anlysis_first";
	}

	@RequestMapping("/make_first1")
	public String make_first1(){
		return "strategy/strategy_first1";
	}

	@RequestMapping("/make_first2")
	public String make_first2(){
		return "strategy/strategy_first2";
	}

	@RequestMapping("/choose")
	public String choose(){
		return "first/stock_chooser";
	}
}
