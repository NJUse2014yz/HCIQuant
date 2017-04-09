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
    <%--<link rel="stylesheet" href="../../css/stockdata/table2.css">--%>
    <%--<link rel="stylesheet" href="../../css/stockdata/table1.css">--%>
    <%--<link rel="stylesheet" type="text/css" media="screen" href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">--%>

    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="../../js/echarts.min.js"></script>
    <script src="../../js/stockdata/echarts.js"></script>
    <script src="../../js/stockdata/highstock.js"></script>
    <%--<script src="../../js/stockdata/KLine.js"></script>--%>
    <script src="../../js/stockdata/echart_kline.js"></script>

    <style type="text/css">

    </style>


</head>
<body>
<%@include file="../first/navBar.jsp"%>
<div class="container-fluid" style="padding:0;margin:7%;margin-top:80px;">
    <div class="row-fluid" >
        <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="row-fluid">
                    <!-- stocktitle -->
                    <div class="stockHead">
                        <h1 class="stockname" style="display:inline;">浦发银行</h1>
                        <h1 class="stockId" style="display:inline;">(${sid})</h1>
                        <img class="likeImage" width="30px" style="cursor:pointer;" onclick='likeStock()'
                         data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="关注" src="../../img/stockdata/like.svg"></img>
                        <img class="strategyImage" width="30px" style="cursor:pointer;"
                         data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="策略" src="../../img/stockdata/strategy.svg"></img>
                        <img class="radarImage" width="30px" style="cursor:pointer;"
                         data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="指标" src="../../img/stockdata/radar.svg"></img>
                        <img class="compareImage" width="30px" style="cursor:pointer;"
                         data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="对比" src="../../img/stockdata/compare.svg"></img>
                    <%--<div class="pairStock">对冲股票:</div>--%>
                    <%--<div class="orange button pairStockName" onclick=""></div>--%>
                    </div>
                    <%--kline--%>
                    <div class="chart kLineContainer" style="background-color: #eee;">
                        <div id="chart" style="height:550px;margin-top:30px;"></div>
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


                <%--line chart--%>
                <div  class="chart bias">
                    <div id="bias" class="smallChart"></div>
                </div>
                <div class="chart vr">
                    <div id="vr" class="smallChart"></div>
                </div>
                <div class="chart rsv">
                    <div id="rsv" class="smallChart"></div>
                </div>
                <div class="chart macd">
                    <div id="macd" class="smallChart"></div>
                </div>
                <div class="chart roc">
                    <div id="roc" class="smallChart"></div>
                </div>
                <div class="chart obv">
                    <div id="obv" class="smallChart"></div>
                </div>
                <!-- kdj -->
                <div  class="chart kdj">
                    <div id="kdj" class="smallChart"></div>
                </div>
                <!-- kdj -->
                <!--rsi-->
                <div  class="chart rsi">
                    <div id="rsi" class="smallChart"></div>
                </div>
                <!--rsi-->

                <div  class="chart boll">
                    <div id="boll" class="smallChart"></div>
                </div>


                <%--predict--%>
                <div class="chart futurePrice">
                    <div id="futurePrice" class="smallChart"></div>
                </div>
                <div class="chart futureVolume">
                    <div id="futureVolume" class="smallChart"></div>
                </div>
                <div class="chart futureTrade">
                    <div id="futureTrade" class="smallChart"></div>
                </div>

            </div>
        </div>
        <div class="col-md-1"></div>
        </div>
    </div>
</body>
<script>

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



    //预测统计图
    function paintForecast(){
        $(".futureVolume").hide();
        $(".futurePrice").hide();
        $(".futureTrade").hide();
        var barChart=bar('futureVolume');
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/getForecast.action',
            data:'id=${latestInfo.stockId}',
            success:function(data){
                if(data.length==0){
                    return;
                }
                $(".futureVolume").show();
                $(".futurePrice").show();
                $(".futureTrade").show();
                setBarData(barChart,data);
                lineChart2(data, "futurePrice", ["open","close"], ['开盘价','收盘价'], "未来七天股价预测");
                lineChart2(data, "futureTrade", ["turnover"], ["换手率"], "未来七天换手率预测");
            }
        });

    }

    //折线图
    function paintLineChart(){
        var dateName="date";

        var rsi=["rsi5","rsi10","rsi20"];
        var rsiName=["五日相对强弱指标","十日相对强弱指标","二十日相对强弱指标"];

        var boll=["boll1","boll2","boll3"];
        var bollName=["布林线1","布林线2","布林线3"];

        var bias=["bias5","bias10","bias20"];
        var biasName=["五日乖离率","十日乖离率","二十日乖离率"];

        var vr=["vr"];
        var vrName=["成交量变异率"];

        var rsv=["rsv"];
        var rsvName=["未成熟随机值"];

        var kdj=["k","d","j"];

        var macd=["macd","diff","dea"];

        var obv=["obv"];
        var obvName=["能量潮"];

        var roc=["roc12","roc25"];
        var rocName=["12日roc","25日roc"];

        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/getLineData.action',
            data:'id=${latestInfo.stockId}',
            success:function(data){

                $("h2#rsih2").text(data[data.length-1]["rsi"]);

                var rsiSeries=createDataSeries(data, dateName, rsi, rsiName,"");
                lineChart("rsi",rsiSeries,"相对强弱指标");

                var bollSeries=createDataSeries(data, dateName, boll, bollName,"true");
                lineChart("boll",bollSeries,"布林线");

                var biasSeries=createDataSeries(data, dateName, bias, biasName);
                lineChart("bias",biasSeries,"乖离率");

                var vrSeries=createDataSeries(data, dateName,vr, vrName);
                lineChart("vr", vrSeries, "成交量变异率");

                var rsvSeries=createDataSeries(data, dateName, rsv,rsvName);
                lineChart("rsv", rsvSeries, "未成熟随机值");

                var kdjSeries=createDataSeries(data, dateName, kdj, kdj);
                lineChart("kdj", kdjSeries, "随机指标");

                var macdSeries=createDataSeries(data, dateName, macd, macd);
                lineChart("macd", macdSeries, "指数平滑曲线");

                var obvSeries=createDataSeries(data, dateName, obv, obvName);
                lineChart("obv", obvSeries, "能量潮");

                var rocSeries=createDataSeries(data, dateName, roc, rocName);
                lineChart("roc", rocSeries, "变动速率指标");
            }
        });
    }


    $(function () {
        $("[data-toggle='popover']").popover();
//        alert("SSSSSSSSSSSSSS");
        paintKLine('chart',${sid});
//        alert("TTTTTTTTTTTTTTTT");
        paintLineChart();
        paintForecast();
    });
</script>
</html>