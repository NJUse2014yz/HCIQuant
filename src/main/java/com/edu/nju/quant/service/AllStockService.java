package com.edu.nju.quant.service;

//import com.alibaba.fastjson.JSONArray;
//import com.alibaba.fastjson.JSONObject;
import com.edu.nju.quant.model.KgraInf;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.edu.nju.quant.model.StockListInf;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2017/3/20.
 */
public class AllStockService {
    public List<StockListInf> showListStock(int n)throws Exception{
        // TODO Auto-generated method stub
        ArrayList<StockListInf> list = new ArrayList<StockListInf>();
        int numperpage = 10;// 假设一页有10条
        String result = "";

        try {
            ClassLoader classLoader = getClass().getClassLoader();
            File file = new File(classLoader.getResource("stockdata/stockList.txt").getFile());
            if(file.isFile() && file.exists()) {
                InputStreamReader isr = new InputStreamReader(new FileInputStream(file), "utf-8");
                BufferedReader br = new BufferedReader(isr);
                String lineTxt = null;
                while ((lineTxt = br.readLine()) != null) {
//                    System.out.println(lineTxt);
                    result=result+lineTxt;
                }
                br.close();
            } else {
                System.out.println("文件不存在!");
            }
        } catch (Exception e) {
            System.out.println("文件读取错误!");
        }

        result = "{\"head\":" + result + "}";
//        System.out.println(result);

        JSONObject obj = JSONObject.fromObject(result);
        JSONArray jsonArray = obj.getJSONArray("head");
        java.util.Date utilDate = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String today=formatter.format(utilDate);
        for (int i = (n-1)*numperpage; (i < n*numperpage)&&(i<jsonArray.size()); i++) {
                JSONObject temp=(JSONObject) jsonArray.get(i);
                StockListInf inf=new StockListInf();
                inf.stockId=temp.getString("code");
                inf.name=temp.getString("name");
                inf.incrPer=Double.toString(temp.getDouble("changepercent"))+"%";
                inf.amount=temp.getInt("amount");
                inf.date=today;
                inf.open=temp.getDouble("open");
                inf.close=temp.getDouble("settlement");
                inf.high=temp.getDouble("high");
                inf.low=temp.getDouble("low");
                inf.turnover=Double.toString(temp.getDouble("turnoverratio"))+"%";
                list.add(inf);
            }
//        for(int i=0;i<list.size();i++){
//            System.out.println(list.get(i).name);
//        }
        return list;
    }

    public List<KgraInf> getKgraph(String sid,String type){
        List<KgraInf> list=new ArrayList<KgraInf>();
        try {
            ClassLoader classLoader = getClass().getClassLoader();
            File file=null;
            switch (type) {
                case "Day":file = new File(classLoader.getResource("stockdata/dk600000.csv").getFile());
                    break;
                case "Week":file = new File(classLoader.getResource("stockdata/wk600000.csv").getFile());
                    break;
                case "Month":file = new File(classLoader.getResource("stockdata/mk600000.csv").getFile());
                    break;
                default: break;
            }
            BufferedReader in = new BufferedReader(new FileReader(file));
            String line=in.readLine();
            while((line = in.readLine())!=null){
//                System.out.println(line);
                String[] group=line.split(",");
                KgraInf temp=new KgraInf();
                //,date,open,close,high,low,volume,code,m5,m10,m30
                //0,2012/1/4,6.133,6.04,6.148,6.025,342013,600000,6.04,6.04,6.04
                String stock_date=group[1];
                String[] datalist=stock_date.split("/");
                if(datalist[1].length()==1){
                    datalist[1]="0"+datalist[1];
                }
                if(datalist[2].length()==1){
                    datalist[2]="0"+datalist[2];
                }
                stock_date=datalist[0]+"-"+datalist[1]+"-"+datalist[2];
                temp.date=stock_date;
                temp.openPrice=Double.parseDouble(group[2]);
                temp.closePrice=Double.parseDouble(group[3]);
                temp.highPrice=Double.parseDouble(group[4]);
                temp.lowPrice=Double.parseDouble(group[5]);
                temp.volume=(int)Double.parseDouble(group[6]);
                temp.m5=Double.parseDouble(group[8]);
                temp.m10=Double.parseDouble(group[9]);
                temp.m30=Double.parseDouble(group[10]);
                list.add(temp);
            }
            in.close();

        }catch (Exception e) {
            System.out.println(e);
            System.out.println("文件读取错误!");
        }
        return list;
    }

    public static void main(String[] args) throws Exception{
        new AllStockService().showListStock(1);
    }
}
