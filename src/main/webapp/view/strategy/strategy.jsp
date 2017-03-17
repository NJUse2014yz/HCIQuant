<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <link rel="stylesheet" href="../../css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="../../css/strategy/chooser.css">
    <link rel="stylesheet" href="../../css/strategy/backinfo.css">
    <link rel="stylesheet" href="../../css/strategy/backplot.css">
    <link rel="stylesheet" href="backtable.css">
    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="../../js/bootstrap-datetimepicker.js"></script>
    <script src="../../js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="../../js/echarts.min.js"></script>
</head>
<body>
<%@include file="../first/navBar.jsp"%>
<div style="margin:0;padding:0;margin-top:80px;margin-left:20%;">
    <!--选择器-->
    <div id="chooser" class="container-fluid" style="box-shadow:1px 1px 3px #777">
        <div class="row">
            <div class="col-xs-2" style="border-bottom: 1px solid #aaa;border-right: 2px solid #aaa;">
                <label style="font-size:20px;font-family: 'Microsoft YaHei';text-align: center;">&nbsp&nbsp选&nbsp&nbsp&nbsp&nbsp择</label>
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
                <!--已选指标-->
                <div id="metric_choice_div">
                    <ul class="metric_choice_ul" id="metric_choice_ul"></ul>
                </div>
                <!--未选指标-->
                <div id="metric_choose_div">
                    <!--添加-->
                    <div id="metric_choose_tip" style="font-family: 'Microsoft YaHei';color:#555555;font-size:15px;">可选指标：</div>
                    <ul class="metric_choose_ul" id="metric_choose_ul">
                        <!--<li class="metric_choose_li">-->
                        <!--<label>OBV</label>-->
                        <!--</li>-->
                        <!--<li class="metric_choose_li">-->
                        <!--<label>ROC</label>-->
                        <!--</li>-->
                        <!--<li class="metric_choose_li">-->
                        <!--<label>VR</label>-->
                        <!--</li>-->
                    </ul>
                </div>
            </div>
            <div class="col-xs-10">
                <!--三种情况放不同的内容-->
                <div id="single_single" style="margin:0;padding:0;position:absolute;visibility: visible">
                    <div style="position:absolute;left:10px;top:10px;margin:0;padding:0;">
                        <div id="canvas-container" style="position: absolute;padding: 0;margin: 0;width:600px;height:300px">
                            <text style="position: absolute;top: 0px;left: 610px">100</text>
                            <text style="position: absolute;top: 290px;left: 610px">0</text>
                            <canvas id="innercanvas" style="background-color:transparent;border: 1px solid #e2e2e2; margin: 0; padding: 0;position:absolute;" width="600px" height="300px" right="0">
                                线
                            </canvas>
                            <canvas id="canvas" style="background-color: transparent; margin: 0; padding: 0;position:absolute;" width="600px" height="300px">
                                点
                            </canvas>
                        </div>
                        <div style="position: absolute;top:310px;left:0px;width:200px;height:50px">
                            <label id="from_text" style="visible:hidden;position: absolute;font-family: 'Mircosoft YaHei';color:#5893e0" width="40px"></label>
                            <div class="input-group-sm" style="position:absolute;width:60px;" >
                                <input class="form-control" type="number" min="-10000" id="from" name="from" style=";width:60px" />
                            </div>
                            <label id="warning_from" style="font-size:10px;font-family:'Microsoft YaHei';color:#5893e0;position:absolute;left:65px;top:5px;visibility:hidden;">请输入起始值</label>
                        </div>
                        <div style="position: absolute;left:250px;top:310px;width:200px;height:50px">
                            <label id="message" style="position: absolute;font-size: 18px;"></label>
                        </div>
                        <div style="position: absolute;left:460px;top:310px;width:200px;height:50px">
                            <label id="to_text" style="visible:hidden;position: absolute;left:120px;font-family: 'Mircosoft YaHei';color:#5893e0" width="40px"></label>
                            <div class="input-group-sm" style="position:absolute;left:80px;width:70px;" >
                                <input class="form-control" type="number" max="10000" id="to" name="from" style=";width:60px" />
                            </div>
                            <label id="warning_to" style="font-size:10px;font-family:'Microsoft YaHei';color:#5893e0;position:absolute;left:0;top:5px;visibility:hidden;">请输入终止值</label>
                        </div>
                        <div id="control-part" style="position: absolute;top:350px">
                            <button class="btn btn-default btn-sm" onclick="allclear()" style="position: absolute;left: 0;top:5px;">清空</button>
                            <button class="btn btn-info btn-sm" onclick="restart()" style="position: absolute;left:70px;top:5px;border-color:#aaaaaa;background-color: #5389d2">开始</button>
                            <div class="input-group" style="position:absolute;width:200px;top:5px;left: 400px;" >
                                <span class="input-group-addon">买卖阈值：</span><input class="form-control" type="number" width="40px" max="100" min="0" id="score_flag" name="score_flag"></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="single_multiple" style="margin:0;padding:0;position:absolute;visibility: hidden">

                </div>
                <div id="multiple_multiple" style="margin:0;padding:0;position:absolute;visibility: hidden">

                </div>
            </div>
        </div>
    </div>
    <div id="flags">

    </div>
    <!--回测信息-->
    <div id="backinfo">
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
                <span id="frequency">周期：<input id="frequency_input" type="text" name="frequency"></span>
                <div id="radios">
                    <label class="radio_label">
                        <input class="radio" type="radio" name="frequency-radios" id="day" value="day" checked>天
                    </label>
                    <label class="radio_label">
                        <input class="radio" type="radio" name="frequency-radios" id="week" value="week">周
                    </label>
                    <label class="radio_label">
                        <input class="radio" type="radio" name="frequency-radios" id="month" value="month">月
                    </label>
                </div>
            </span>
        </div>
        <div id="asset" class="input-group">
            <span id="asset_text" class="input-group-addon">
                起始资金：<input id="asset_input" type="text" name="frequency">元
            </span>
        </div>
        <button id="startback" class="btn btn-default btn-sm" onclick="">回测一下</button>
    </div>
    <div id="backplot">
    </div>
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
        <button id="saveback" class="btn btn-default btn-sm" onclick="">保存策略</button>
    </div>
</div>
</body>
<!--指标和股票选择-->
<script type="text/javascript">
    var stock_choice_ul=document.getElementById("stock_choice_ul");
    var metric_choice_ul=document.getElementById("metric_choice_ul");
    var metric_choose_ul=document.getElementById("metric_choose_ul");
    var metric_add_button=document.getElementById("metric_add_button");
    var stock_add_button=document.getElementById("stock_add_button");
    var metric_list=['BIAS','BOLL1','BOLL2','BOLL3','K','D','J','MACD','OBV','ROC','RSI','VR','PDI','MDI','ADX','ADXR'];
    var stocklist=['sh600002','sh600400','sh600600','sh600002','sh600400','sh600600','sh600002','sh600400','sh600600','sh600002','sh600400','sh600600','sh600002','sh600400','sh600600'];
    //已选指标和未选指标之间的转换
    (function(){
        for(var i=0;i<metric_list.length;i++)
        {
            var some_metric=document.createElement("li");
            some_metric.setAttribute("class","metric_choose_li");
            some_metric.setAttribute("id",metric_list[i]);

            var some_metric_label=document.createElement("label");
            some_metric_label.innerHTML=metric_list[i];
            some_metric_label.setAttribute("id",metric_list[i]+"_label");
            (function(metric)
            {
                some_metric_label.onclick=function()
                {
                    metric.lastChild.style.visibility="visible";
                    metric.setAttribute("class","metric_choice_li");
                    metric_choose_ul.removeChild(metric);
                    if(metric_choose_ul.childElementCount==0)
                    {
                        document.getElementById("metric_choose_tip").style.visibility="hidden";
                    }
                    metric_choice_ul.appendChild(metric);
                }
            })(some_metric);

            some_metric.appendChild(some_metric_label);

            var some_metric_choice_a=document.createElement("a");
            some_metric_choice_a.setAttribute("id",metric_list[i]+"_a");

            (function(metric)
            {
                some_metric_choice_a.onclick=function()
                {
                    metric_choice_ul.removeChild(metric);
                    metric.lastElementChild.style.visibility="hidden";
                    metric.setAttribute("class","metric_choose_li");
                    metric_choose_ul.appendChild(metric);
                    document.getElementById("metric_choose_tip").style.visibility="visible";
                }
            })(some_metric);

            var some_metric_choice_a_image=new Image();//document.createElement("image");不行
            some_metric_choice_a_image.src="${pageContext.request.contextPath}/img/delete_inactive.png";
            some_metric_choice_a_image.setAttribute("class","delete_icon");
            some_metric_choice_a_image.setAttribute("id", metric_list[i]+"_image");
            (function(image)
            {
                some_metric_choice_a_image.onmouseover=function()
                {
                    image.src="${pageContext.request.contextPath}/img/delete_active.png";
                };
                some_metric_choice_a_image.onmouseout=function()
                {
                    image.src="${pageContext.request.contextPath}/img/delete_inactive.png";
                };
            })(some_metric_choice_a_image);

            some_metric_choice_a.appendChild(some_metric_choice_a_image);
            some_metric_choice_a.style.visibility="hidden";
            some_metric.appendChild(some_metric_choice_a);

            metric_choose_ul.appendChild(some_metric);
        }
    })();
    //股票选择
    (function change_stock(stocklist)
    {
        for(var i=0;i<stocklist.length;i++)
        {
            var stock_choice_li=document.createElement("li");
            stock_choice_li.setAttribute("class","stock_choice_li");
            var label=document.createElement("label");
            label.innerHTML=stocklist[i];
            var delete_icon=new Image();
            delete_icon.src="${pageContext.request.contextPath}/img/delete_inactive.png";
            delete_icon.setAttribute("class","delete_icon");
            (function(stock)
            {
                delete_icon.onclick=function()
                {
                    stock_choice_ul.removeChild(stock);
                };
                delete_icon.onmouseover=function()
                {
                    stock.lastElementChild.src="${pageContext.request.contextPath}/img/delete_active.png";
                };
                delete_icon.onmouseout=function()
                {
                    stock.lastElementChild.src="${pageContext.request.contextPath}/img/delete_inactive.png";
                };
            })(stock_choice_li);
            stock_choice_li.appendChild(label);
            stock_choice_li.appendChild(delete_icon);
            stock_choice_ul.appendChild(stock_choice_li);
        }
        var stock_add_button=new Image();
        stock_add_button.setAttribute("id","stock_add_icon");
        stock_add_button.setAttribute("class","add_icon");
        stock_add_button.src="${pageContext.request.contextPath}/img/add_inactive.png";
        stock_add_button.onclick=function()
        {
            //新增股票
        };
        stock_add_button.onmouseover=function()
        {
            stock_add_button.src="${pageContext.request.contextPath}/img/add_active.png";
        };
        stock_add_button.onmouseout=function()
        {
            stock_add_button.src="${pageContext.request.contextPath}/img/add_inactive.png";
        };
        stock_choice_ul.appendChild(stock_add_button);
    })(stocklist);
</script>
<!--描点作图-->
<script type="text/javascript">
    function point($cx,$cy){
        this.x=$cx;
        this.y=$cy;
    };

    var points=[];
    var t = 1;

    var canvas = document.getElementById("canvas");
    var ctx = canvas.getContext("2d");
    var innercanvas=document.getElementById("innercanvas");
    var innerctx=innercanvas.getContext("2d");

    function allclear()
    {
        var from=document.getElementById("from");
        from.style.visibility="visible";
        var from_text=document.getElementById("from_text");
        from_text.style.visibility="hidden";

        var to=document.getElementById("to");
        to.style.visibility="visible";
        var to_text=document.getElementById("to_text");
        to_text.style.visibility="hidden";

        points.splice(0,points.length);
        ctx.clearRect(0,0,canvas.width,canvas.height);
        innerctx.clearRect(0,0,innercanvas.width,innercanvas.height);
        document.getElementById("points").innerHTML=JSON.stringify(points);
    }

    //描点，记录
    canvas.onmousemove = function(e) {
        var bbox = canvas.getBoundingClientRect();
        var height=canvas.offsetHeight;//这样可以不带单位
        var x =  e.clientX - bbox.left * (canvas.width/bbox.width);
        var y = e.clientY - bbox.top * (canvas.height/bbox.height);
        var from=Number(document.getElementById("from").value);
        var to=Number(document.getElementById("to").value);
        var dis=to-from;
        x=Number(x/600*dis+from);
        y=Number((height-y)/300*100);
        document.getElementById("message").innerHTML = "x="+x.toFixed(2)+", y="+y.toFixed(2);
    }
    canvas.onclick=function(e){
        if(document.getElementById("from").value=="")
        {
            document.getElementById("warning_from").style.visibility="visible";
            return;
        }
        else
        {
            document.getElementById("warning_from").style.visibility="hidden";
        }
        if(document.getElementById("to").value=="")
        {
            var warning_to=document.getElementById("warning_to");
            warning_to.innerHTML="请输入终止值";
            warning_to.style.visibility="visible";
            return;
        }
        else
        {
            document.getElementById("warning_to").style.visibility="hidden";
        }
        if(Number(document.getElementById("from").value)>Number(document.getElementById("to").value))
        {
            var warning_to=document.getElementById("warning_to");
            warning_to.innerHTML="应小于起始值";
            warning_to.style.visibility="visible";
            return;
        }
        var bbox = canvas.getBoundingClientRect();
        var height=canvas.getAttribute("height");
        var x =  e.clientX - bbox.left * (canvas.width/bbox.width);
        var y = e.clientY - bbox.top * (canvas.height/bbox.height);

        for(var i=0;i<points.length;i++)
        {
            if(x<points[i].x+5&&x>points[i].x-5&&y<points[i].y+5&&y>points[i].y-5)
            {
                innerctx.clearRect(0,0,innercanvas.width,innercanvas.height);
                ctx.clearRect(x-5,y-5,10,10);
                points.splice(i,1);
                document.getElementById("points").innerHTML=JSON.stringify(points);
                return;
            }
        }

        ctx.beginPath();
        ctx.arc(x,y,2,0,Math.PI*2,true);
        ctx.closePath();
        ctx.strokeStyle = "#000";
        ctx.fillStyle="black";
        ctx.fill();
        innerctx.clearRect(0,0,innercanvas.width,innercanvas.height);
        if(points.length==0)
        {
            points.push(new point(x,y));
        }
        else
        {
            for(var i=0;i<points.length;i++)
            {
                if(x>points[points.length-1].x)
                {
                    points.push(new point(x,y));
                    break;
                }
                if(x>points[i].x) {
                    continue;
                }
                else
                {
                    points.splice(i,0,new point(x,y));
                    break;
                }
            }
        }
        document.getElementById("points").innerHTML=JSON.stringify(points);
    }

    //画线
    function restart()
    {
        draw();
        var from=document.getElementById("from");
        var from_text=document.getElementById("from_text");
        from.style.visibility="hidden";
        from_text.innerHTML=from.value;
        from_text.style.visibility="visible";

        var to=document.getElementById("to");
        var to_text=document.getElementById("to_text");
        to.style.visibility="hidden";
        to_text.innerHTML=to.value;
        to_text.style.visibility="visible";
    }

    function draw() {
        t=1;
        innerctx.lineCap = "round";
        innerctx.lineWidth = 2;
        innerctx.strokeStyle = "#5389d2";
        animate();
    }

    function animate() {
        if (t < points.length - 1) {
            requestAnimationFrame(animate);
        }

        innerctx.beginPath();
        innerctx.moveTo(points[t - 1].x, points[t - 1].y);
        innerctx.lineTo(points[t].x, points[t].y);
        innerctx.stroke();
        // increment "t" to get the next waypoint
        t++;
    }
</script>
<!--回测值-->
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
<!--回测结果-->

</html>