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
<%--<%@include file="../first/navBar.jsp"%>--%>
<div style="margin:0;padding:0;margin-top:80px;margin-left:200px;">
    <div id="chooser" class="container-fluid" style="box-shadow:1px 1px 3px #777">
        <div class="row">
            <div class="col-xs-2" style="border-bottom: 1px solid #aaa;border-right: 2px solid #aaa;">
                <label style="font-size:20px;font-family: 'Microsoft YaHei';text-align: center;">&nbsp&nbsp策&nbsp&nbsp&nbsp&nbsp略</label>
            </div>
            <div id="stock_choice_div" class="col-xs-10" >
                <ul class="stock_choice_ul" id="flag_ul"></ul>
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
</body>
</html>