package com.edu.nju.quant.controller;

import com.edu.nju.quant.model.StockListInf;
import com.edu.nju.quant.service.AllStockService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by dell on 2017/3/16.
 */
@Controller
public class AllStockController {

    AllStockService stockBl=new AllStockService();

    @RequestMapping("allstock")
    public String allstock(HttpServletRequest request, HttpServletResponse response)throws Exception{
//        stockBl.showListStock(1);
        return "stockdata/allstock";
}


    /**
     * 获得所有股票的数据列表
     * @param pageNumber 页号
     * @throws Exception
     */
    @RequestMapping("/getStockList")
    public @ResponseBody
    List<StockListInf> getStockList(int pageNumber) throws Exception{
        System.out.println("PageNumber:"+pageNumber);
        List<StockListInf> stockList=null;
        stockList=stockBl.showListStock(pageNumber);
        return stockList;
    }

//    @RequestMapping("stockinf")
//    public String stockInf(HttpServletRequest request, HttpServletResponse response){
//        return "stockdata/stockInf";
//    }

}
