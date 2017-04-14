<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Title</title>
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <link rel="stylesheet" href="../../css/strategy/metric_chooser.css">
    <link href="../../css/common/common.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="../../js/echarts.min.js"></script>
</head>
<body>
<%@include file="../first/navBar.jsp"%>
<script type="text/javascript">
    var start=document.cookie.indexOf("level=")+6;
    var M=unescape(document.cookie.substring(start,start+1));
    alert(M);
    if( M != 3)
        window.location.href="property";
</script>

<div class="container-fluid main-content">
    <div class="row list-row" style="margin:20px;width:1000px;">
        <!--选择指标-->
        <div class="row">
            <div class="title" style="margin-top:20px;">
                <span>选择指标</span>
            </div>
        </div>
        <div class="row">
            <div class="button-row">
                <button id="BIAS_button" class="btn btn-default btn-sm metric_button">BIAS</button>
                <button id="OBV_button"class="btn btn-default btn-sm metric_button">OBV</button>
                <button id="VR_button" class="btn btn-default btn-sm metric_button">VR</button>
                <button id="MACD_button" class="btn btn-default btn-sm metric_button">MACD</button>
                <button id="BOLL_button" class="btn btn-default btn-sm metric_button">BOLL</button>
                <button id="ROC_button" class="btn btn-default btn-sm metric_button">ROC</button>
                <button id="DMI_button" class="btn btn-default btn-sm metric_button">DMI</button>
                <button id="RSI_button" class="btn btn-default btn-sm metric_button">RSI</button>
            </div>
        </div>
    </div>
    <div class="row list-row" style="margin:20px;width:1000px;">
        <!--雷达图-->
        <div class="row">
            <div class="title" style="margin-top:20px;">
                <span>指标分析</span>
            </div>
        </div>
        <div class="row">
            <div class="col-md-7">
                <div id="anlysisplot" style="position:relative;width: 500px;height:500px;"></div>
            </div>
            <div class="col-md-5">
                <!--文字分析-->
                <div id="text_analysis">
                    <p>这是一个很长很长很长很长很长很长很长很长很长很长很长很长的分析过程</p>
                    <p>这是一个很长很长很长很长很长很长很长很长很长很长很长很长的分析过程</p>
                    <p>这是一个很长很长很长很长很长很长很长很长很长很长很长很长的分析过程</p>
                    <p>这是一个很长很长很长很长很长很长很长很长很长很长很长很长的分析过程</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--选择指标-->
<script type="text/javascript">
    var metric_button=document.getElementsByClassName("metric_button");
    var text_analysis=document.getElementById("text_analysis");
    var metric_ns=[
        {metric:'BIAS',state:'inactive'},
        {metric:'OBV',state:'inactive'},
        {metric:'VR',state:'inactive'},
        {metric:'MACD',state:'inactive'},
        {metric:'BOLL',state:'inactive'},
        {metric:'ROC',state:'inactive'},
        {metric:'DMI',state:'inactive'},
        {metric:'RSI',state:'inactive'}];
//    var metrics=[];
    var metrics_in_plot=[];
    for(var i=0;i<metric_button.length;i++)
    {
//        var metric_name=metric_button[i].id.substr(0,metric_button[i].id.indexOf("_"));
        (function(index){
            metric_button[i].onclick=function()
            {
                if(metric_ns[index].state=='inactive')
                {
                    metric_button[index].style.backgroundColor="rgb(91, 148, 226)";
                    metric_button[index].style.color="#fff";
                    metric_ns[index].state='active';
//                    metrics.push(metric_ns[index].metric);
                    metrics_in_plot.push({name:metric_ns[index].metric,max:"100"});
                }
                else
                {
                    metric_button[index].style.backgroundColor="#fff";
                    metric_button[index].style.color="#333";
                    metric_ns[index].state='inactive';
//                    metrics.splice(metrics.indexOf(metric_ns[index].metric),1);
                    metrics_in_plot.splice(metrics_in_plot.indexOf({name:metric_ns[index].metric,max:"100"}));
                }
                myChart.setOption(option);
                if(metrics_in_plot.length>0)
                {
                    text_analysis.style.visibility="visible";
                }
                else
                {
                    text_analysis.style.visibility="hidden";
                }
            };
        })(i);
    }
</script>
<!--雷达图-->
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('anlysisplot'));
    var dataBJ = [
//        [55,9,56,0.46,18,6,1],
//        [25,11,21,0.65,34,9,2],
        [86,42,72,88,93,59,18],
//        [52,24,60,1.03,50,21,30],
//        [46,5,49,0.28,10,6,31]
    ];

    var dataGZ = [
//        [26,37,27,1.163,27,13,1],
//        [56,48,68,1.336,37,9,28],
//        [82,92,174,3.29,0,13,29],
        [45,19,88,36,37,16,30],
//        [118,50,0,1.383,76,11,31]
    ];

    var lineStyle = {
        normal: {
            width: 1,
            opacity: 0.5
        }
    };

    option = {
        backgroundColor: '#fff',
        title: {
            text: '指标分析结果',
            left: 'center',
            textStyle: {
                color: '#555'
            }
        },
        legend: {
            bottom: 5,
            data: ['买入','卖出'],
            itemGap: 20,
            textStyle: {
                color: '#555',
                fontSize: 14
            },
            selectedMode: 'both'
        },
        radar: {
            indicator:metrics_in_plot
//                [
//                {name: 'AQI', max: 300},
//                {name: 'PM2.5', max: 250},
//                {name: 'PM10', max: 300},
//                {name: 'CO', max: 5},
//                {name: 'NO2', max: 200},
//                {name: 'SO2', max: 100}]
            ,
            shape: 'circle',
            splitNumber: 5,
            name: {
                textStyle: {
                    color: '#aaa'
                }
            },
            splitLine: {
                lineStyle: {
                    color: [
                        '#ddd', '#ccc',
                        '#bbb', '#aaa',
                    ].reverse()
                }
            },
            splitArea: {
                show: false
            },
            axisLine: {
                lineStyle: {
                    color: '#aaa'
                }
            }
        },
        tooltip: {
            trigger: 'item'
        },
        series: [
            {
                name: '买入',
                type: 'radar',
                lineStyle: lineStyle,
                data: dataBJ,
                symbol: 'none',
                itemStyle: {
                    normal: {
                        color: '#d9663e'
                    }
                },
                areaStyle: {
                    normal: {
                        opacity: 0.2
                    }
                }
            }
            ,
            {
                name: '卖出',
                type: 'radar',
                lineStyle: lineStyle,
                data: dataGZ,
                symbol: 'none',
                itemStyle: {
                    normal: {
                        color: '#8b5eff'
                    }
                },
                areaStyle: {
                    normal: {
                        opacity: 0.2
                    }
                }
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<!--文字分析-->
</body>
</html>