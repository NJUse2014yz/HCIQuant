package com.edu.nju.quant.controller;

import com.edu.nju.quant.model.KgraInf;
import com.edu.nju.quant.model.StockListInf;
import com.edu.nju.quant.service.AllStockService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by dell on 2017/3/23.
 */
@Controller
public class StockInfController {
    AllStockService stockBl=new AllStockService();
    /**
     * 进入股票界面
     * 2016年5月22日
     * @throws Exception
     */
    @RequestMapping("stockInfo")
    public ModelAndView stockInfo(String id, HttpServletRequest request) throws Exception{
        System.out.println("stockid="+id);
        ModelAndView modelAndView=new ModelAndView();
//        String userName=CookieHelper.getCookie(request, CookieHelper.USER_NAME);
//        if(userName.length()==0)
//            modelAndView.addObject("isLogin","false");
//            else{
//            //check islike this stock
//        }

        //latest stock info
//        StockListInf latestInfo=stockBl.showSingleStock(id);
//        modelAndView.addObject("latestInfo",latestInfo);
        modelAndView.addObject("sid",id);

//        if((!id.startsWith("sh000"))&&(!id.startsWith("sz399")))
//            modelAndView.addObject("isStock","true");

        modelAndView.setViewName("stockdata/stockInf");

        return modelAndView;
    }

    /**
     * 获得预测结果
     * @throws Exception
     */
//    @RequestMapping("/getForecast")
//    public @ResponseBody
//    List<StrategyRecInf> getForecast(String id) throws Exception {
//        if(id.startsWith("sh000")||id.startsWith("sz399"))
//            return null;
//
//        List<StrategyRecInf> list=null;
//        try{
//            list = strategyBl.getRecStrategy(id);
//        }catch(DataLackException e){
//            return null;
//        }
//
//        return list;
//    }

//    @RequestMapping("/getPairStock")
//    public @ResponseBody StockInf getPairStock(String id) throws Exception{
//        List<StockPair> list=pairBl.getSolemate(id);
//        if(list.size()==0)
//            return null;
//        StockPair pair=list.get(0);
//        return pair.stock2;
//    }

    /**
     * 收藏股票
     */
//    @RequestMapping("/likeStock")
//    public @ResponseBody void likeStock(String isLike,
//                                        HttpServletRequest request,HttpServletResponse response){
//        System.out.println("isLike:"+isLike);
//
//        CookieHelper.addCookie(CookieHelper.IS_LIKE, isLike, response, request);
//
//
//    }

//    @RequestMapping("/getLineData")
//    public @ResponseBody List<LinegraInf> getLineData(String id) throws Exception{
//        List<LinegraInf> lineData=stockBl.getLinegraph(id, null, get30BeforeDay(), getToday());
//        for(LinegraInf info:lineData){
//            //转换日期格式2016-05-12为20160512
//            info.date=info.date.replace("-", "");
//        }
//        return lineData;
//    }

    /**
     * 获取k线图json数据
     * 2016年5月22日
     * @throws Exception
     */
    @RequestMapping("getKLineData")
    public @ResponseBody List<KgraInf> getKLineData(String id) throws Exception{
//        ,String type
//        List<KgraInf> list=stockBl.getKgraph(id, Ktype.DAILY, "2006-05-06", getToday());
//        List<KgraInf> list=stockBl.getKgraph(id,type);
        List<KgraInf> list=stockBl.getKgraph(id, "Day");
        System.out.println("controller-kline:"+list.size());

        for(KgraInf info:list){
            //转换日期格式2016-05-12为20160512
            info.date=info.date.replace("/", "");
        }

        System.out.println("siaze="+list.size());

        return list;
    }

//    /**
//     * 分时图
//     */
//    @RequestMapping("/priceByMinute")
//    public @ResponseBody List<RealTimeInf> priceByMinute(String id) throws Exception{
//        List<RealTimeInf> list=null;
//
//        list=stockBl.getRealTime(id);
//
//        return list;
//    }
//
//    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//
//    private String getToday(){
//        Calendar today=Calendar.getInstance();
//        return sdf.format(today.getTime());
//    }
//
//    private String get30BeforeDay(){
//        Calendar cal=Calendar.getInstance();
//        cal.add(Calendar.MONTH, -1);
//        return sdf.format(cal.getTime());
//    }

}
