<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <link rel="stylesheet" href="../../css/strategy/chooser.css">
    <link rel="stylesheet" href="../../css/strategy/backinfo.css">
    <link rel="stylesheet" href="../../css/strategy/backplot.css">
    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="../../js/echarts.min.js"></script>
</head>
<body>
<%@include file="../first/navBar.jsp"%>
<div style="margin:0;padding:0;margin-top:80px;margin-left:200px;">
    <div id="chooser" class="container-fluid" style="box-shadow:1px 1px 3px #777">
        <div class="row">
            <div class="col-xs-2" style="border-bottom: 1px solid #aaa;border-right: 2px solid #aaa;">
                <label style="font-size:20px;font-family: 'Microsoft YaHei';text-align: center;">&nbsp&nbsp策&nbsp&nbsp&nbsp&nbsp略</label>
            </div>
            <!--选择股票-->
            <div id="stock_choice_div" class="col-xs-10" >
                <ul class="stock_choice_ul" id="stock_choice_ul"></ul>
            </div>
            <!--<div class="col-xs-1" style="padding:0">-->
            <!--<button class="sale_type">股</button>-->
            <!--<button class="sale_type">股%</button>-->
            <!--<button class="sale_type">￥</button>-->
            <!--<button class="sale_type">￥%</button>-->
            <!--</div>-->
        </div>
        <div class="row">
            <div id="metric_div" class="col-xs-2">
                <!--指标-->
                <div id="metric_choice_div">
                    <ul class="metric_choice_ul" id="metric_choice_ul"></ul>
                </div>
            </div>
            <div class="col-xs-10" style="height:480px;">
                <!--三种情况放不同的内容-->
                <div id="single_single" style="margin:0;padding:0;position:absolute;visibility: visible">
                    <div id="strategyplot" style="width:600px;height:460px;margin:10px;"></div>
                </div>
                <div id="single_multiple" style="margin:0;padding:0;position:absolute;visibility: hidden">

                </div>
                <div id="multiple_multiple" style="margin:0;padding:0;position:absolute;visibility: hidden">

                </div>
            </div>
        </div>
    </div>
    <div id="backplot"></div>
    <div id="backresult">
        <table id="backtable" class="table table-bordered">
            <caption></caption>
            <thead>
            <tr>
                <th>年化收益率</th>
                <th>Alpha</th>
                <th>Beta</th>
                <th>夏普比率</th>
                <th>收益移动率</th>
                <th>信息比率</th>
                <th>最大回撤值</th>
                <th>换手率</th>
                <th>累计收益率</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>12.3%</td>
                <td>5%</td>
                <td>2.4</td>
                <td>62%</td>
                <td>53%</td>
                <td>21%</td>
                <td>24673</td>
                <td>43%</td>
                <td>10.3%</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<!--策略-->
<script type="text/javascript">
    var stock_choice_ul=document.getElementById("stock_choice_ul");
    var metric_choice_ul=document.getElementById("metric_choice_ul");
    var metric_list=['BIAS','BOLL1','BOLL2','BOLL3','K','D','J','MACD','OBV','ROC','RSI','VR','PDI','MDI','ADX','ADXR'];
    var stocklist=['sh600002','sh600400','sh600600','sh600002','sh600400','sh600600','sh600002','sh600400','sh600600','sh600002','sh600400','sh600600','sh600002','sh600400','sh600600'];

    (function(){
        for(var i=0;i<metric_list.length;i++)
        {
            var some_metric=document.createElement("li");
            some_metric.setAttribute("class","metric_choice_li");
            some_metric.setAttribute("id",metric_list[i]);

            var some_metric_label=document.createElement("label");
            some_metric_label.innerHTML=metric_list[i];
            some_metric_label.setAttribute("id",metric_list[i]+"_label");

            some_metric.appendChild(some_metric_label);
            metric_choice_ul.appendChild(some_metric);
        }
        for(var i=0;i<stocklist.length;i++) {
            var stock_choice_li = document.createElement("li");
            stock_choice_li.setAttribute("class", "stock_choice_li");
            var label = document.createElement("label");
            label.innerHTML = stocklist[i];
            stock_choice_li.appendChild(label);
            stock_choice_ul.appendChild(stock_choice_li);
        }
    })();
</script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var strategyplot = echarts.init(document.getElementById('strategyplot'));

    // 指定图表的配置项和数据
    var strategyoption = {
        title: {
            text: '交易标志图'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['买入评分']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['周一','周二','周三','周四','周五','周六','周日']/*待修改*/
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'买入评分',
                type:'line',
                stack: '总量',
                data:[120, 132, 101, 134, 90, 230, 210]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    strategyplot.setOption(strategyoption);
</script>
<!--回测图-->
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('backplot'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '回测结果'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['策略','大盘']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['周一','周二','周三','周四','周五','周六','周日']/*待修改*/
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'策略',
                type:'line',
                stack: '总量',
                data:[120, 132, 101, 134, 90, 230, 210]
            },
            {
                name:'大盘',
                type:'line',
                stack: '总量',
                data:[220, 182, 191, 234, 290, 330, 310]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>