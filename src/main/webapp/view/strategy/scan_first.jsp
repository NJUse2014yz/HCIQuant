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
    <link rel="stylesheet" href="../../css/jquery.pagewalkthrough.css">
    <link rel="stylesheet" href="../../css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="../../css/datetimepicker.css">
    <link href="../../css/common/common.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="../../js/echarts.min.js"></script>
    <script src="../../js/html5.js"></script>
    <script src="../../js/jquery.pagewalkthrough.min.js"></script>
    <script src="../../js/bootstrap-datetimepicker.js"></script>
    <script src="../../js/bootstrap-datetimepicker.zh-CN.js"></script>
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

</body>
</html>
<div class="container-fluid main-content">
    <div id="chooser" class="row list-row" style="margin:20px;width:1000px;height:600px;">
        <div class="row">
            <div class="title" style="margin-top:20px;">
                <span>策略</span>
            </div>
            <!--选择股票-->
            <div id="stock_choice_div" class="col-xs-10" >
                <ul class="stock_choice_ul" id="flag_ul">
                    <li class="stock_choice_li">
                        <label>sh600000</label>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div id="metric_div" class="col-xs-2">
                <!--已选指标-->
                <div id="metric_choice_div" style="max-height:500px;">
                    <ul class="metric_choice_ul" id="flaggroup_ul"></ul>
                </div>
            </div>
            <div class="col-xs-10" style="height:480px;">
                <!--三种情况放不同的内容-->
                <div id="single_plot" style="margin:0;padding:0;position:absolute;visibility: visible">
                    <div id="strategyplot" style="width:600px;height:460px;margin:10px;"></div>
                </div>

            </div>
        </div>
    </div>
    <!--回测信息-->
    <div id="backinfo" class="row list-row" style=" position:relative;margin:20px;width:1000px;height:200px;">
        <div class="row">
            <div class="title" style="margin-top:20px;">
                <span>回测信息</span>
            </div>
        </div>
        <div class="row" style="position:relative">
            </br>
            <div id="start_date" class="input-group">
                <span id="start_text" class="input-group-addon">回测开始日期</span>
                <input id="datetimepicker1" type="text" value="2016-11-01">
            </div>
            <div id="end_date" class="input-group">
                <span id="end_text" class="input-group-addon">回测结束日期</span>
                <input id="datetimepicker2" type="text" value="2017-03-01">
            </div>
            <div id="cycle" class="input-group">
                        <span class="input-group-addon">
                            <span id="frequency">周期：<input id="frequency_input" type="number" name="frequency" value="1"></span>
                            <div id="radios">
                                <label class="radio_label">
                                    <input class="radio" type="radio" name="frequency-radios" id="day" value="day" checked onclick="JavaScript:frequency_day();">天
                                </label>
                                <label class="radio_label">
                                    <input class="radio" type="radio" name="frequency-radios" id="week" value="week" onclick="JavaScript:frequency_week();">周
                                </label>
                                <label class="radio_label">
                                    <input class="radio" type="radio" name="frequency-radios" id="month" value="month" onclick="JavaScript:frequency_month();">月
                                </label>
                            </div>
                        </span>
            </div>
            <text id="frequency_warning">请输入1~100之间的整数值</text>
            <div id="asset" class="input-group">
                    <span id="asset_text" class="input-group-addon">
                        起始资金：<input id="asset_input" type="number" min="10000" name="frequency" value="100000">元
                    </span>
            </div>
            <text id="asset_warning">请输入10000~ 1000000之间的值</text>
            <button id="startback" class="btn btn-default btn-sm" onclick="JavaScript:backtest();">回测一下</button>
        </div>
    </div>
    <!--回测图-->
    <div class="row list-row" style="margin:20px;width:1000px;">
        <div class="row">
            <div class="title" style="margin-top:20px;">
                <span>回测图</span>
            </div>
        </div>
        <div class="row">
            <div id="backplot">

            </div>
        </div>
    </div>
    <!--回测结果-->
    <div class="row list-row" style="margin:20px;width:1000px;height:200px;">
        <div class="row">
            <div class="title" style="margin-top:20px;">
                <span>回测结果</span>
            </div>
        </div>
        <div class="row">
            <div id="backtable_flag" style="position:absolute;width:830px;height:130px;top:1700px;left:130px;"></div>
            <table id="backtable" class="table table-bordered">
                <caption></caption>
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
</div>
<!--策略-->
<script type="text/javascript">
    var flag_ul=document.getElementById("flag_ul");
    var flaggroup_ul=document.getElementById("flaggroup_ul");
    var flaggroup_list=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];//标志组合
    var flag_list=[1,4,7];//每个组合中的标志
    var flaggroup_selected=0;
    var flag_selected=0;


    (function(){
        for(var i=0;i<flaggroup_list.length;i++)
        {
            var flaggroup=document.createElement("li");
            flaggroup.setAttribute("class","metric_choice_li");
            flaggroup.setAttribute("id",flaggroup_list[i]);

            var flaggroup_label=document.createElement("label");
            flaggroup_label.innerHTML=flaggroup_list[i];
            flaggroup_label.setAttribute("id",flaggroup_list[i]+"_label");

            flaggroup.appendChild(flaggroup_label);

            (function(flag_group)
            {
                flaggroup.onclick=function()
                {
                    flaggroup_selected=flag_group;
                    //TODO change flag
                };
            })(flaggroup_list[i]);
            flaggroup_ul.appendChild(flaggroup);
        }
        for(var i=0;i<flag_list.length;i++) {
            var flag_li = document.createElement("li");
            flag_li.setAttribute("class", "stock_choice_li");
            var label = document.createElement("label");
            label.innerHTML = flag_list[i];
            flag_li.appendChild(label);
            (function(flag)
            {
                flag_li.onclick=function()
                {
                    flag_selected=flag;
                    //TODO change plot
                };
            })(flag_list[i]);
            flag_ul.appendChild(flag_li);
        }
    })();
</script>

<script type="text/javascript">
    var data=[90,80,70,60,55,42,30,29,25,70,90];
    var xdata=[-50,-40,-30,-20,-10,0,10,20,30,40,50];
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
            data:['sh600000']
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
            data: xdata
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'评分',
                type:'line',
                stack: '总量',
                data:data
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    strategyplot.setOption(strategyoption);
</script>
<!--回测图-->
<script type="text/javascript">
    Date.prototype.format=function (){
        var s='';
        s+=this.getFullYear()+'-';          // 获取年份。
        s+=(this.getMonth()+1)+"-";         // 获取月份。
        s+= this.getDate();                 // 获取日。
        return(s);                          // 返回日期。
    };
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('backplot'));

    var strategy_data=[];
    var indice_data=[];
    var date_list=[];

    var start="2016-11-01";
    var end="2017-03-01";
    var ab = start.split("-");
    var ae = end.split("-");
    var db = new Date();
    db.setUTCFullYear(ab[0], ab[1] - 1, ab[2]);
    var de = new Date();
    de.setUTCFullYear(ae[0], ae[1] - 1, ae[2]);
    var unixDb = db.getTime();
    var unixDe = de.getTime();
    for (var k = unixDb; k <= unixDe;) {
        date_list.push(new Date(parseInt(k)).format());
        k = k + 24 * 60 * 60 * 1000;
    }
    var days=date_list.length;
    for(var i=0;i<days;i++)
    {
        strategy_data.push((Math.random()*100-50+1/8*i*i).toFixed(2));
        indice_data.push((Math.random()*100-50+1/8*i*i).toFixed(2));
    }
//    option.series[0].data=strategy_data;
//    option.series[1].data=indice_data;
//    option.xAxis.data=date_list;

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
            data:date_list                   /*待修改*/
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'策略',
                type:'line',
                stack: '总量1',
                data:strategy_data
            },
            {
                name:'大盘',
                type:'line',
                stack: '总量2',
                data:indice_data
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>


<script type="text/javascript">
    $('#datetimepicker1').datetimepicker(
        {
            language: 'zh-CN',
            minView: "month",
            format: 'yyyy-mm-dd'
        }
    );
    $('#datetimepicker2').datetimepicker(
        {
            language: 'zh-CN',
            minView: "month",
            format: 'yyyy-mm-dd'
        }
    );
    var frequency_unit="day";
    function frequency_day()
    {
        frequency_unit="day";
    }
    function frequency_week()
    {
        frequency_unit="week";
    }
    function frequency_month()
    {
        frequency_unit="month";
    }
    Date.prototype.format=function (){
        var s='';
        s+=this.getFullYear()+'-';          // 获取年份。
        s+=(this.getMonth()+1)+"-";         // 获取月份。
        s+= this.getDate();                 // 获取日。
        return(s);                          // 返回日期。
    };
    function backtest()
    {
        strategy_data=[];
        indice_data=[];
        date_list=[];
        var start=$("#datetimepicker1").val();
        var end=$("#datetimepicker2").val();
        var frequency_number=document.getElementById("frequency_input");
        var asset=document.getElementById("asset_input");

        var ab = start.split("-");
        var ae = end.split("-");
        var db = new Date();
        db.setUTCFullYear(ab[0], ab[1] - 1, ab[2]);
        var de = new Date();
        de.setUTCFullYear(ae[0], ae[1] - 1, ae[2]);
        var unixDb = db.getTime();
        var unixDe = de.getTime();
        for (var k = unixDb; k <= unixDe;) {
            date_list.push(new Date(parseInt(k)).format());
            k = k + 24 * 60 * 60 * 1000;
        }

        var days=date_list.length;
        for(var i=0;i<days;i++)
        {
            strategy_data.push((Math.random()*100-50+1/8*i*i).toFixed(2));
            indice_data.push((Math.random()*100-50+1/8*i*i).toFixed(2));
        }
        option.series[0].data=strategy_data;
        option.series[1].data=indice_data;
        option.xAxis.data=date_list;
        myChart.setOption(option);
    }

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('backplot'));

    var strategy_data=[];
    var indice_data=[];
    var date_list=[];

    var start="2016-11-01";
    var end="2017-03-01";
    var ab = start.split("-");
    var ae = end.split("-");
    var db = new Date();
    db.setUTCFullYear(ab[0], ab[1] - 1, ab[2]);
    var de = new Date();
    de.setUTCFullYear(ae[0], ae[1] - 1, ae[2]);
    var unixDb = db.getTime();
    var unixDe = de.getTime();
    for (var k = unixDb; k <= unixDe;) {
        date_list.push(new Date(parseInt(k)).format());
        k = k + 24 * 60 * 60 * 1000;
    }
    var days=date_list.length;
    for(var i=0;i<days;i++)
    {
        strategy_data.push((Math.random()*100-50+1/8*i*i).toFixed(2));
        indice_data.push((Math.random()*100-50+1/8*i*i).toFixed(2));
    }
    //    option.series[0].data=strategy_data;
    //    option.series[1].data=indice_data;
    //    option.xAxis.data=date_list;

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
            data:date_list                   /*待修改*/
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'策略',
                type:'line',
                stack: '总量1',
                data:strategy_data
            },
            {
                name:'大盘',
                type:'line',
                stack: '总量2',
                data:indice_data
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
<div id="walkthrough-content" style="display: none;">
    <div id="walkthrough-1">
        <h3>这是策略分析页面</h3>

        <p>根据指定的策略进行回测</p>
        <p>点击下一步了解更多...</p>
    </div>

    <div id="walkthrough-2">
        这里可以看到不同交易标志的定义
    </div>

    <div id="walkthrough-3">
        这里指定回测数据
    </div>

    <div id="walkthrough-4">
        这里可以看到回测的图像
    </div>

    <div id="walkthrough-5">
        这里可以看到回测结果
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
                wrapper: '#chooser',
                popup: {
                    content: '#walkthrough-2',
                    type: 'tooltip',
                    position: 'bottom'
                }
            }, {
                wrapper: '#backinfo',
                popup: {
                    content: '#walkthrough-3',
                    type: 'tooltip',
                    position: 'top'
                }
            }, {
                wrapper: '#backplot',
                popup: {
                    content: '#walkthrough-4',
                    type: 'tooltip',
                    position: 'top'
                }
            }, {
                wrapper: '#backtable_flag',
                popup: {
                    content: '#walkthrough-5',
                    type: 'tooltip',
                    position: 'top'
                }
            }]
        });

// Show the tour
        $('body').pagewalkthrough('show');
    });
</script>
</html>