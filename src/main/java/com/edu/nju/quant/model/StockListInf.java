package com.edu.nju.quant.model;

/**
 * Created by dell on 2017/3/20.
 */
public class StockListInf {
    // StockData的列表信息
    public String stockId;
    public String name;
    /** 日期 */
    public String date;
    /** 开盘价 */
    public double open;
    /** 收盘价 */
    public double close;
    /** 涨跌额 */
//    public double increase;
    /** 涨跌百分比 */
    public String incrPer;
    /** 最低价 */
    public double low;
    /** 最高价 */
    public double high;
    /** 成交量 */
    public long volume;
    /** 成交额 */
    public int amount;
    /** 换手率 */
    public String turnover;

    public StockListInf(String stockId, String date, double open, double close, String incrPer,
                        double low, double high, long volume, int amount, String turnover) {
        super();
        this.stockId = stockId;
        this.date = date;
        this.open = open;
        this.close = close;
//        this.increase = increase;
        this.incrPer = incrPer;
        this.low = low;
        this.high = high;
        this.volume = volume;
        this.amount = amount;
        this.turnover = turnover;
    }

    public StockListInf() {
        stockId = null;
        this.date = null;
        this.open = 0;
        this.close = 0;
//        this.increase = 0;
        this.incrPer = "";
        this.low = 0;
        this.high = 0;
        this.volume = 0;
        this.amount = 0;
        this.turnover = "";
    }
}
