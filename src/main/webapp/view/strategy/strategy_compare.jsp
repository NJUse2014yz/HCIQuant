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
    <link rel="stylesheet" href="../../css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="../../css/bootstrap-select.min.css">
    <link href="../../css/common/common.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="../../js/echarts.min.js"></script>
    <script src="../../js/bootstrap-select.min.js"></script>
    <script src="../../js/bootstrap-datetimepicker.js"></script>
    <script src="../../js/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<body>
<%@include file="../first/navBar.jsp"%>
<div class="container-fluid main-content">
    <div id="select_strategy_div" class="row list-row" style="margin:20px;width:1000px;height:150px;">
        <div class="row">
            <div class="title" style="margin-top:20px;">
                <span>选择策略</span>
            </div>
        </div>
        <br>
        <div class="row">
            <select id="select_strategy" class="selectpicker show-tick form-control" multiple data-live-search="false" >
                <option value="strategy1">strategy 1</option>
                <option value="strategy2">strategy 2</option>
                <option value="strategy3">strategy 3</option>
                <option value="strategy4">strategy 4</option>
            </select>
        </div>
    </div>
    <div id="backinfo" class="row list-row" style="margin:20px;width:1000px;height:200px;">
        <div class="row">
            <div class="title" style="margin-top:20px;">
                <span>回测信息</span>
            </div>
        </div>
        <div class="row" style="position:relative;">
            <div id="start_date" class="input-group">
                <span id="start_text" class="input-group-addon">回测开始日期</span>
                <input id="datetimepicker1" type="text">
            </div>
            <div id="end_date" class="input-group">
                <span id="end_text" class="input-group-addon">回测结束日期</span>
                <input id="datetimepicker2" type="text">
            </div>
            <div id="cycle" class="input-group">
                <span class="input-group-addon">
                    <span id="frequency">周期：<input id="frequency_input" type="number" name="frequency"></span>
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
                        起始资金：<input id="asset_input" type="number" min="10000" name="frequency">元
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
    <div class="row list-row" style="margin:20px;width:1000px;">
        <div class="row">
            <div class="title" style="margin-top:20px;">
                <span>回测结果</span>
            </div>
        </div>
        <div class="row">
            <table id="backtable" class="table table-bordered">
                <caption></caption>
                <thead>
                <tr>
                    <th>编号</th>
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
                    <td>strategy1</td>
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
                <tr>
                    <td>strategy2</td>
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
                <tr>
                    <td>strategy3</td>
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
        strategy1_data=[];
        strategy2_data=[];
        strategy3_data=[];
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
            strategy1_data.push((Math.random()*100-50+1/8*i*i).toFixed(2));
            strategy2_data.push((Math.random()*100-50+1/8*i*i).toFixed(2));
            strategy3_data.push((Math.random()*100-50+1/8*i*i).toFixed(2));
        }
        option.series[0].name="strategy1";
        option.series[0].data=strategy1_data;
        option.series[1].name="strategy2";
        option.series[1].data=strategy2_data;
        option.series[2].name="strategy3";
        option.series[2].data=strategy3_data;
        option.xAxis.data=date_list;
        myChart.setOption(option);
    }
</script>
<!--策略-->
<script type="text/javascript">
    var flag_ul=document.getElementById("flag_ul");
    var flaggroup_ul=document.getElementById("flaggroup_ul");
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
            data:['strategy1','strategy2','strategy3']
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
                name:'strategy',
                type:'line',
                stack: '总量1',
                data:strategy_data
            },
            {
                name:'indice',
                type:'line',
                stack: '总量2',
                data:indice_data
            },
            {
                name:'indice',
                type:'line',
                stack: '总量3',
                data:indice_data
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<script type="text/javascript">
    /*(function(){
        var selector=document.getElementById("select_strategy");
        var option=new Option((flaglist.length+"")+" "+text,flaglist.length);
        selector.options.add(option);

    })();*/
</script>
</body>
</html>