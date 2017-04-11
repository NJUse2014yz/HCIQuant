<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>股票信息</title>
    <meta charset="utf-8">
    <title>全部股票</title>
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <link rel="stylesheet" href="../../css/stockdata/tabs.css">
    <link href="../../css/common/common.css" rel="stylesheet">

    <%--<link rel="stylesheet" href="../../css/stockdata/table2.css">--%>
    <%--<link rel="stylesheet" href="../../css/stockdata/table1.css">--%>
    <%--<link rel="stylesheet" type="text/css" media="screen" href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">--%>

    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="../../js/echarts.min.js"></script>
    <script src="../../js/stockdata/echarts.js"></script>
    <%--<script src="../../js/stockdata/highstock.js"></script>--%>
    <%--<script src="../../js/stockdata/KLine.js"></script>--%>
    <script src="../../js/stockdata/echart_kline.js"></script>
    <script src="../../js/stockdata/paintTab.js"></script>

    <style type="text/css">

    </style>


</head>
<body>
<%@include file="../first/navBar.jsp"%>
<div class="container-fluid main-content" >
        <div class="row content-row" style="margin-top:0;padding-top:0">
                    <div class="stockHead" style="margin-left: 5%;padding: 20px 0 10px">
                        <h1 class="stockname" style="display:inline;">浦发银行</h1>
                        <h1 class="stockId" style="display:inline;">(${sid})</h1>
                        <img class="likeImage" width="30px" style="cursor:pointer;margin-top: -10px;" onclick='likeStock()'
                         data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="关注" src="../../img/stockdata/like.svg">
                        <img class="strategyImage" width="30px" style="cursor:pointer;margin-top: -10px;"
                         data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="策略" src="../../img/stockdata/strategy.svg">
                        <img class="radarImage" width="30px" style="cursor:pointer;margin-top: -10px;"
                         data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="指标" src="../../img/stockdata/radar.svg">
                        <img class="compareImage" width="30px" style="cursor:pointer;margin-top: -10px;"
                         data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="对比" src="../../img/stockdata/compare.svg">
                    </div>
                    </div>
                    <div class="row content-row" style="margin-top:0px;padding-top:0px ">
                        <div class="row list-row input-row" style="margin-top:0px;padding-top:0px " > 
                        <div id="chart" style="height:550px;margin-top:0px;"></div>
                        <%--横线--%>
                        <div width="100%" style="border-bottom: 2px solid #666"></div>
                        <div class="accordion" id="accordion-k">
                            <div class="accordion-group">
                                <a class="accordion-heading">

                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-k" href="#accordion-element-k">
                                        <p style="text-align: center;margin-top:5px;margin-bottom: 5px;" >
                                            <img class="explainSignal" width="3%" style="cursor:pointer;align: center;" onclick='getKexplain()'
                                                     src="../../img/stockdata/open.png">
                                        </p>
                                    </a>
                                            <%--<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-907578" href="#accordion-element-855414">选项卡 #1</a>--%>
                            </div>
                            <div id="accordion-element-k" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    <p style="margin: 15px;font-size: 16px;font-family: Arial;color:#333;line-height:30px">
                                        上证股票:${sid} 在上海证券交易所挂牌上市。<br>
                                        Volumn(成交量):股票买卖双方达成交易的数量<br>
                                        open(开盘价):又称开市价，是指某种证券在证券交易所每个交易日开市后的第一笔每股买卖成交价格。
                                        世界上大多数证券交易所都采用成交额最大原则来确定开盘价。<br>
                                        close(收盘价):沪市收盘价为当日该证券最后一笔交易前一分钟所有交易的成交量加权平均价（含最后一笔交易）。当日无成交的，以前收盘价为当日收盘价。
                                        深市的收盘价通过集合竞价的方式产生。收盘集合竞价不能产生收盘价的，以当日该证券最后一笔交易前一分钟所有交易的成交量加权平均价(含最后一笔交易)为收盘价。<br>
                                        lowest(最低价):股票单个交易日交易过程中所产生的最低价格。<br>
                                        highest(最高价):股票单个交易日交易过程中所产生的最高价格。<br>
                                        MA5:移动平均线的数值是最近5日收盘价的平均值。<br>
                                        MA10:移动平均线的数值是最近10日收盘价的平均值。<br>
                                        MA20:移动平均线的数值是最近20日收盘价的平均值。<br>
                                        MA30:移动平均线的数值是最近30日收盘价的平均值。<br>
                                        <br>
                                    </p>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="row content-row" style="margin-top:0px;padding-top:0px ">
                        <div class="row list-row input-row" style="margin-top:0px;padding-top:0px ;" > 
                            <div class="col-md-2">
                                <ul class="tabs-container" style="overflow: auto;height:320px">
                                    <%--<div id="wins"--%>
                                         <%--style="position:absolute;height:200;width:200;overflow:scroll;background:#EEEEEE;">--%>
                                        <%--</div>--%>
                                    <li class="tab" id="tab_BIAS" onclick="chooseTab(this)">BIAS</li>
                                    <li class="tab" id="tab_VR" onclick=chooseTab(this)>VR</li>
                                    <li class="tab" id="tab_RSV" onclick=chooseTab(this)>RSV</li>
                                    <li class="tab" id="tab_MACD" onclick=chooseTab(this)>MACD</li>
                                    <li class="tab" id="tab_ROC" onclick=chooseTab(this)>ROC</li>
                                    <li class="tab" id="tab_OBV" onclick=chooseTab(this)>OBV</li>
                                    <li class="tab" id="tab_KDJ" onclick=chooseTab(this)>KDJ</li>
                                    <li class="tab" id="tab_RSI" onclick=chooseTab(this)>RSI</li>
                                    <li class="tab" id="tab_BOLL" onclick=chooseTab(this)>BOLL</li>
                                        <li class="tab" id="tab_F_pri" onclick=chooseTab(this)>F_pri</li>
                                        <li class="tab" id="tab_F_vol" onclick=chooseTab(this)>F_vol</li>
                                        <li class="tab" id="tab_F_tra" onclick=chooseTab(this)>F_tra</li>

                                </ul>
                            </div>
                            <div class="col-md-6">
                                <%--<p>sssssssssssssss</p>--%>
                                <div id="tab_chart" style="margin-top:0px;width:100%;height:320px"></div>

                            </div>
                            <div class="col-md-4">
                                <div class="line" width="2px" float="left" height="320px"></div>
                                <%--<p>HHHHHHHHHHHHHHHHHHHHH</p>--%>
                                <div id="tab_explain" style="height:320px;overflow: auto" >
                                <p>乖离率(BIAS)，又称偏离率，简称Y值，是通过计算市场指数或收盘价与某条移动平均线之间的差距百分比，以反映一定时期内价格与其MA偏离程度的指标，从而得出价格在剧烈波动时因偏离移动平均趋势而造成回档或反弹的可能性，以及价格在正常波动范围内移动而形成继续原有势的可信度。</p>
                                <p>乖离率，是用百分比来表示价格与MA间的偏离程度(差距率)。</p>
                                <p>图中的BIAS1取6日平均，BIAS2取10日平均，BIAS3取20日平均。</p>
                                    <%--<p>图中的BIAS1取6日平均，BIAS2取10日平均，BIAS3取20日平均。</p>--%>
                                    <%--<p>图中的BIAS1取6日平均，BIAS2取10日平均，BIAS3取20日平均。</p>--%>
                                </div>
                            </div>
                            <%--<p>ddddddddddddddddd</p>--%>
                            </div>
                        </div>



            </div>


                <%--line chart--%>
                <%--<div  class="chart bias">--%>
                    <%--<div id="bias" class="smallChart"></div>--%>
                <%--</div>--%>
                <%--<div class="chart vr">--%>
                    <%--<div id="vr" class="smallChart"></div>--%>
                <%--</div>--%>
                <%--<div class="chart rsv">--%>
                    <%--<div id="rsv" class="smallChart"></div>--%>
                <%--</div>--%>
                <%--<div class="chart macd">--%>
                    <%--<div id="macd" class="smallChart"></div>--%>
                <%--</div>--%>
                <%--<div class="chart roc">--%>
                    <%--<div id="roc" class="smallChart"></div>--%>
                <%--</div>--%>
                <%--<div class="chart obv">--%>
                    <%--<div id="obv" class="smallChart"></div>--%>
                <%--</div>--%>
                <%--<!-- kdj -->--%>
                <%--<div  class="chart kdj">--%>
                    <%--<div id="kdj" class="smallChart"></div>--%>
                <%--</div>--%>
                <%--<!-- kdj -->--%>
                <%--<!--rsi-->--%>
                <%--<div  class="chart rsi">--%>
                    <%--<div id="rsi" class="smallChart"></div>--%>
                <%--</div>--%>
                <%--<!--rsi-->--%>

                <%--<div  class="chart boll">--%>
                    <%--<div id="boll" class="smallChart"></div>--%>
                <%--</div>--%>


                <%--&lt;%&ndash;predict&ndash;%&gt;--%>
                <%--<div class="chart futurePrice">--%>
                    <%--<div id="futurePrice" class="smallChart"></div>--%>
                <%--</div>--%>
                <%--<div class="chart futureVolume">--%>
                    <%--<div id="futureVolume" class="smallChart"></div>--%>
                <%--</div>--%>
                <%--<div class="chart futureTrade">--%>
                    <%--<div id="futureTrade" class="smallChart"></div>--%>
                <%--</div>--%>

            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="col-md-1"></div>--%>
        <%--</div>--%>
    </div>
</body>


<script type="text/javascript">
    var islike=0;
    function likeStock() {
        islike++;
        if (islike % 2 == 0) {
            src = "../../img/stockdata/like.svg";
            var temp="关注";
//            data:{
//                content="关注"
//            }
        } else {
//            alert("BBBBBBBBBBB"+islike);
            src = "../../img/stockdata/liked.png";
            var temp="取消关注";
//            data:{
//                content="取消关注"
//            }
        }
        $(".likeImage").attr('src',src);
        $(".likeImage").attr('data-content',temp);
//        $(".likeImage").attr('content',content);
    }

    var showKexplain=0;
    function getKexplain(){
        if(showKexplain==0){
            src = "../../img/stockdata/close.png";
            $(".explainSignal").attr('src',src);
            showKexplain++;
        }else{
            src = "../../img/stockdata/open.png";
            $(".explainSignal").attr('src',src);
            showKexplain--;
        }
    }



//    //tab函数
//    function chooseTab(tabid) {
//
//        $(".tab").attr('background-color','#85aeca');
//        $("#tab_"+tabid).attr('background-color','#5b8fb2');
//        alert("#tab_"+tabid+"AAAAAAAAAAAAAAAAAAAA");
//
//
//        paintTab("tab_"+tabid,tabid);
//
//
////        switch(tabid){
////            case 'BIAS':
////                paintBIAS();
////
////        }
//    }

    $(function () {
        $("[data-toggle='popover']").popover();
        paintTab('tab_chart',"BIAS");
        paintKLine('chart',${sid});
//        alert("TTTTTTTTTTTTTTTT");
//        chooseTab('BIAS');
//        alert("AAAAAAAAAAAAAAAA");
//        paintTab('tab_chart',"BIAS");
//        alert("AAAAAAAAAAAAAAAA");
        <%--paintRSI('tab_chart',${sid});--%>
        <%--paintLineChart();--%>
        <%--paintForecast();--%>
    });
</script>


<%--<script src="../../js/stockdata/jquery-3.2.0.js"></script>--%>
<%--<script src="../../js/jquery-3.1.1.min.js"></script>--%>
<%--<script type="text/javascript" src="../../js/stockdata/echarts.js"></script>--%>
<%--<script src="../../js/bootstrap.js"></script>--%>
<%--&lt;%&ndash;<script src="../../js/echarts.min.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="../../js/stockdata/highstock.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="../../js/stockdata/KLine.js"></script>&ndash;%&gt;--%>
<%--<script type="text/javascript" src="../../js/stockdata/echart_kline.js"></script>--%>
<%--<script type="text/javascript" src="../../js/stockdata/paintTab.js"></script>--%>

</html>