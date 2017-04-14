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
    <link rel="stylesheet" href="../../css/jquery.pagewalkthrough.css">
    <link rel="stylesheet" href="../../css/strategy/metric_chooser.css">
    <link href="../../css/common/common.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="../../js/echarts.min.js"></script>
    <script src="../../js/html5.js"></script>
    <script src="../../js/jquery.pagewalkthrough.min.js"></script>
</head>
<body>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>导航栏</title>
    <link href="${pageContext.request.contextPath}/css/first/navBar.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/first/search.css" />

    <%--<script src="../js/jquery-3.1.1.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/js/cookie.js"></script>
</head>

<body>

<div class="top">

    <div class="logo">
        <img alt="" src="../../img/common/logo.png">
    </div>

    <div class="stock-search">
        <div id="sb-search" class="search">
            <input id="stock-search"  placeholder="股票代码或名称">
            <button onclick="search()"></button>
        </div>
    </div>

    <div class="container">
        <ul class="menu">
            <li><a href="first">首页</a></li>
            <li><a href="#">股票数据</a>
                <ul class="submenu">
                    <li><a href="allstock">全部</a></li>
                    <li><a href="indexInfo?id=sh000001">上证指数</a></li>
                    <li><a href="indexInfo?id=sz399001">深证成指</a></li>
                    <li><a href="compare">股票对比</a></li>
                    <li><a href="learn">股票学堂</a></li>
                </ul>
            </li>
            <li class="active"><a href="#s2">指标策略</a>
                <ul class="submenu">
                    <li><a href="anlysis_first">指标分析</a></li>
                    <li><a href="make_first1">策略分析</a></li>
                </ul>
            </li>
            <li><a href="#">板块统计</a>
                <ul class="submenu">
                    <li><a href="all_block">板块统计</a></li>
                </ul>
            </li>
            <li><a href="#">个人空间</a>
                <ul class="submenu">
                    <li><a href="my_stock">我的股票</a></li>
                    <li><a href="my_strategy">我的策略</a></li>
                    <li><a href="person_zone">我的信息</a></li>
                </ul>
            </li>
        </ul>
    </div>

    <div id="login-area">
        <!--未登陆的界面 -->


        <!-- 已登录的界面 -->
        <!-- <ul class="logined">
            <li class="header-signup">
                <a class="logout">注销</a>
            </li>
            <li id="signined" class="header-signin">
                <a>已登录</a>
            </li>

        </ul> -->
    </div>
</div>

<script type="text/javascript">
    $(function(){
        showUserInfo();
    });

    function search(){
        var stock=$("input#stock-search").val();
        if(stock=="")
            return;
        window.location.href="/HCIQuant/stockInfo?id="+stock;
    }

    //判断是否已经登录
    function showUserInfo(){
        var userName=getCookie("userName");

        if(userName!='""'){
            //显示头像

            $("#login-area").append("<img class='user' src='../img/first/user.jpg' />");
        }
        else{
            //显示登录注册
            $("#login-area").append("<div class='unlogin'><div class='header-signup'><a href='${pageContext.request.contextPath}/askForRegister.action'>注册</a></div>	<div class='header-signin'><a class='login' href='${pageContext.request.contextPath}${pageContext.request.contextPath}/login'>登录</a></div>			</div>");
        }

    }
    //注销
    $(".logout").click(function(){
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/logout.action',
            data:'',
            success:function(data){
                showUserInfo();
            }
        });
    });
</script>
<div class="container-fluid main-content">
    <div id="flag_div" class="row list-row" style="margin:20px;width:1000px;">
        <!--选择指标-->
        <div class="row">
            <div class="title" style="margin-top:20px;">
                <span>选择指标</span>
            </div>
        </div>
        <div class="row">
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
                <div id="text_analysis" style="visibility:visible;">
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
        {metric:'BIAS',state:'active'},
        {metric:'OBV',state:'inactive'},
        {metric:'VR',state:'inactive'},
        {metric:'MACD',state:'active'},
        {metric:'BOLL',state:'inactive'},
        {metric:'ROC',state:'active'},
        {metric:'DMI',state:'inactive'},
        {metric:'RSI',state:'inactive'}];
//    var metrics=[];
    var metrics_in_plot=[];
    metric_button[0].style.backgroundColor="#5389e2";
    metrics_in_plot.push({name:metric_ns[0].metric,max:"100"});
    metric_button[3].style.backgroundColor="#5389e2";
    metrics_in_plot.push({name:metric_ns[3].metric,max:"100"});
    metric_button[5].style.backgroundColor="#5389e2";
    metrics_in_plot.push({name:metric_ns[5].metric,max:"100"});

    for(var i=0;i<metric_button.length;i++)
    {
//        var metric_name=metric_button[i].id.substr(0,metric_button[i].id.indexOf("_"));
        (function(index){
            metric_button[i].onclick=function()
            {
                if(metric_ns[index].state=='inactive')
                {
                    metric_button[index].style.backgroundColor="#5389e2";
                    metric_ns[index].state='active';
//                    metrics.push(metric_ns[index].metric);
                    metrics_in_plot.push({name:metric_ns[index].metric,max:"100"});
                }
                else
                {
                    metric_button[index].style.backgroundColor="#fff";
                    metric_ns[index].state='inactive';
//                    metrics.splice(metrics.indexOf(metric_ns[index].metric),1);
                    metrics_in_plot.splice(metrics_in_plot.indexOf({name:metric_ns[index].metric,max:"100"}));
                }
                console.log(metrics_in_plot);
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
        [86,42,92,88,93,79,18],
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
        series: [
            {
                name: '买入',
                type: 'radar',
                lineStyle: lineStyle,
                data: dataBJ,
                symbol: 'none',
                itemStyle: {
                    normal: {
                        color: '#44d9d2'
                    }
                },
                areaStyle: {
                    normal: {
                        opacity: 0.1
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
                        color: '#ffdd22'
                    }
                },
                areaStyle: {
                    normal: {
                        opacity: 0.05
                    }
                }
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
<div id="walkthrough-content" style="display: none;">
    <div id="walkthrough-1">
        <h3>这是指标分析页面</h3>

        <p>选择一个或多个指标了解关于这些指标的卖出和买入评分</p>
        <p>点击下一步了解更多...</p>
    </div>

    <div id="walkthrough-2">
        在这里可以选择一个或多个指标
    </div>

    <div id="walkthrough-3">
        这里可以看到选择的指标的对应买卖评分雷达图
    </div>

    <div id="walkthrough-4">
        这里可以看到根据选择指标得到的买卖分析结果
    </div>
</div>
<script type="text/javascript">
    $(function() {
        $('body').pagewalkthrough({
            name: 'introduction',
            steps: [{
                popup: {
                    content: '#walkthrough-1',
                    type: 'modal'
                }
            }, {
                wrapper: '#flag_div',
                popup: {
                    content: '#walkthrough-2',
                    type: 'tooltip',
                    position: 'bottom'
                }
            }, {
                wrapper: '#anlysisplot',
                popup: {
                    content: '#walkthrough-3',
                    type: 'tooltip',
                    position: 'right'
                }
            }, {
                wrapper: '#text_analysis',
                popup: {
                    content: '#walkthrough-4',
                    type: 'tooltip',
                    position: 'left'
                }
            }]
        });

// Show the tour
        $('body').pagewalkthrough('show');
    });
</script>

</html>