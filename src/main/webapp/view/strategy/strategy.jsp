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
    <link rel="stylesheet" href="../../css/strategy/flagtable.css">
    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="../../js/bootstrap-datetimepicker.js"></script>
    <script src="../../js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="../../js/echarts.min.js"></script>
</head>
<body>
<%@include file="../first/navBar.jsp"%>
<div class="container-fluid" style="margin:0;padding:0;margin-top:80px;margin-left:15%;">
    <%--<div class="row">--%>
        <%--<div class="col-md-10">--%>
            <!--股票选择器-->
            <input type="text" id="stock">
            <button id="confirm">confirm</button>
            <!--策略制作器-->
            <div id="chooser" class="container-fluid" style="box-shadow:-1px -1px 2px #777">
                <div class="row">
                    <div class="col-xs-2" style="border-bottom: 1px solid #aaa;border-right: 2px solid #aaa;">
                        <label style="font-size:20px;font-family: 'Microsoft YaHei';text-align: center;">选择-</label>
                        <label style="font-size:20px;font-family: 'Microsoft YaHei';text-align: center;"><a onclick="JavaScript:clean();">清空</a></label>
                    </div>
                    <!--选择股票-->
                    <div id="stock_choice_div" class="col-xs-10" >
                        <ul class="stock_choice_ul" id="stock_choice_ul"></ul>
                    </div>
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
                        <div id="single_plot" style="margin:0;padding:0;position:absolute;visibility: hidden">
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
                                        <input class="from-control" type="number" max="10000" id="to" name="to" style=";width:60px" />
                                    </div>
                                    <label id="warning_to" style="font-size:10px;font-family:'Microsoft YaHei';color:#5893e0;position:absolute;left:0;top:5px;visibility:hidden;">请输入终止值</label>
                                </div>
                                <div id="control-part" style="position: absolute;top:350px">
                                    <button class="btn btn-default btn-sm" onclick="allclear()" style="position: absolute;left: 0;top:5px;">清空</button>
                                    <button class="btn btn-info btn-sm" onclick="restart()" style="position: absolute;left:70px;top:5px;border-color:#aaaaaa;background-color: #5389d2">开始</button>
                                    <div class="input-group" style="position:absolute;width:200px;top:5px;left: 400px;" >
                                        <span class="input-group-addon">买卖阈值：</span><input class="form-control" type="number" width="40px" max="100" min="0" id="score_flag" name="score_flag"></label>
                                    </div>
                                    <button id="save_flag" class="btn btn-info btn-sm" style="position:absolute;top:40px;border-color:#aaaaaa;background-color: #5389d2" onclick="JavaScript:save_flag()">保存标志</button>
                                </div>
                            </div>
                        </div>
                        <div id="multiple_plot" style="margin:0;padding:0;position:absolute;visibility: hidden">
                            <div id="morphology_button_group">
                                <image id="add_row" class="add_icon" src="${pageContext.request.contextPath}/img/add_active.png" style="display:block;"></image>
                                <div id="5" class="morphology_button_row"><button id="0-5" class="morphology_button">&nbsp</button><button id="1-5" class="morphology_button">&nbsp</button><button id="2-5" class="morphology_button">&nbsp</button><button id="3-5" class="morphology_button">&nbsp</button></button><button id="4-5" class="morphology_button">&nbsp</button><button id="5-5" class="morphology_button">&nbsp</button></div>
                                <div id="4" class="morphology_button_row"><button id="0-4" class="morphology_button">&nbsp</button><button id="1-4" class="morphology_button">&nbsp</button><button id="2-4" class="morphology_button">&nbsp</button><button id="3-4" class="morphology_button">&nbsp</button></button><button id="4-4" class="morphology_button">&nbsp</button><button id="5-4" class="morphology_button">&nbsp</button></div>
                                <div id="3" class="morphology_button_row"><button id="0-3" class="morphology_button">&nbsp</button><button id="1-3" class="morphology_button">&nbsp</button><button id="2-3" class="morphology_button">&nbsp</button><button id="3-3" class="morphology_button">&nbsp</button></button><button id="4-3" class="morphology_button">&nbsp</button><button id="5-3" class="morphology_button">&nbsp</button></div>
                                <div id="2" class="morphology_button_row"><button id="0-2" class="morphology_button">&nbsp</button><button id="1-2" class="morphology_button">&nbsp</button><button id="2-2" class="morphology_button">&nbsp</button><button id="3-2" class="morphology_button">&nbsp</button></button><button id="4-2" class="morphology_button">&nbsp</button><button id="5-2" class="morphology_button">&nbsp</button></div>
                                <div id="1" class="morphology_button_row"><button id="0-1" class="morphology_button">&nbsp</button><button id="1-1" class="morphology_button">&nbsp</button><button id="2-1" class="morphology_button">&nbsp</button><button id="3-1" class="morphology_button">&nbsp</button></button><button id="4-1" class="morphology_button">&nbsp</button><button id="5-1" class="morphology_button">&nbsp</button></div>
                                <div style="margin:0;padding:0;">
                                    <div id="0" class="morphology_button_row" style="display:inline;"><button id="0-0" class="morphology_button">&nbsp</button><button id="1-0" class="morphology_button">&nbsp</button><button id="2-0" class="morphology_button">&nbsp</button><button id="3-0" class="morphology_button">&nbsp</button></button><button id="4-0" class="morphology_button">&nbsp</button><button id="5-0" class="morphology_button">&nbsp</button></div>
                                    <image id="add_column" class="add_icon" src="${pageContext.request.contextPath}/img/add_active.png" style="display:inline;"></image>
                                </div>
                            </div>
                            <button id="save_flag2" class="btn btn-info btn-sm" onclick="JavaScript:save_flag()">保存标志</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--标志显示板-->
            <div id="flags">
                <table id="flagtable" class="table table-striped"><%--table-hover table-bordered--%>
                    <caption>交易标志</caption>
                    <thead></thead>
                    <tbody>
                    <tr>
                        <th>1</th>
                        <td>@#$%^^%#</td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td>^#$%&^%$#$^</td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td>$%%^&^%^</td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td>%&^#*&^#</td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td>$^&^%$#*&$</td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td>@#$%^^%#</td>
                    </tr>
                    <tr>
                        <th>7</th>
                        <td>^#$%&^%$#$^</td>
                    </tr>
                    <tr>
                        <th>8</th>
                        <td>$%%^&^%^</td>
                    </tr>
                    <tr>
                        <th>9</th>
                        <td>%&^#*&^#</td>
                    </tr>
                    </tbody>
                </table>
                <table id="tradeflag" class="table table-striped"><%--table-hover table-bordered--%>
                    <caption>标志组合</caption>
                    <thead></thead>
                    <tbody>
                    <tr>
                        <th>1</th>
                        <td>1 4 7</td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td>2 3</td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td>5 8</td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td>6</td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td>9</td>
                    </tr>
                    </tbody>
                </table>
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
            <!--回测图-->
            <div id="backplot">
            </div>
            <!--回测结果-->
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
        <%--<div class="col-md-2">--%>
            <%--指导教程--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
</div>
</body>
<!--股票选择器-->
<script type="text/javascript">
    var confirm=document.getElementById("confirm");
    var stock=document.getElementById("stock");
    confirm.onclick=function()
    {
        stocklist.push(stock.value);
        console.log(JSON.stringify(stocklist));
        changeStock();
    };
</script>
<!--指标和股票选择-->
<script type="text/javascript">
    var single_plot=document.getElementById("single_plot");
    var multiple_plot=document.getElementById("multiple_plot");
    var state="neither";//图像状态：neither single multiple

    var stock_choice_ul=document.getElementById("stock_choice_ul");
    var metric_choice_ul=document.getElementById("metric_choice_ul");
    var metric_choose_ul=document.getElementById("metric_choose_ul");
    var metric_add_button=document.getElementById("metric_add_button");
    var stock_add_button=document.getElementById("stock_add_button");

    var metric_list=['BIAS','BOLL1','BOLL2','BOLL3','K','D','J','MACD','OBV','ROC','RSI','VR','PDI','MDI','ADX','ADXR'];
    var stocklist=[];

    //指标相关
    (function(){
        for(var i=0;i<metric_list.length;i++)
        {
            //初始化指标，将所有置于待选列表中
            var some_metric=document.createElement("li");
            some_metric.setAttribute("class","metric_choose_li");
            some_metric.setAttribute("id",metric_list[i]);

            var some_metric_label=document.createElement("label");
            some_metric_label.innerHTML=metric_list[i];
            some_metric_label.setAttribute("id",metric_list[i]+"_label");
            (function(metric)
            {
//                点击指标label
                some_metric_label.onclick=function()
                {
                    console.log("your state is "+state);
                    if (metric.getAttribute("class") == "metric_choose_li") {
                        //当点击的是待选的指标
                        if(state=="neither"||state=="multiple") {
                            //如果未定状态或多股多指标状态，将其添加到已选指标列表中
                            metric.lastChild.style.visibility = "visible";//删除图标可见
                            metric.setAttribute("class", "metric_choice_li");//设为已选类
                            metric_choose_ul.removeChild(metric);//待选列表中移除
                            if (metric_choose_ul.childElementCount == 0) {
                                //待选列表中全部选择，提示不可见
                                document.getElementById("metric_choose_tip").style.visibility = "hidden";
                            }
                            metric_choice_ul.appendChild(metric);//已选列表中添加
                        }
                    }
                    else {
                        //当点击的是已选的指标
                        //将选择的标蓝
                        var list = metric_choice_ul.getElementsByTagName("li");
                        for (var j = 0; j < list.length; j++) {
                            list[j].firstChild.style.color = "#aaaaaa";
                        }
                        metric.firstChild.style.color = "#5389d2";
                        //记录选择的指标名称
                        metric_selected = metric.getAttribute("id");
                        console.log("you select "+metric_selected);

                        //给出画板
                        if (stock_selected != "" && (stock_choice_ul.childElementCount > 2 || metric_choice_ul.childElementCount > 1)) {
                            //多模式
                            var color = getRandomColor();
                            log.push(new log_stock(stock_selected, color));
                            state = "multiple";
                            single_plot.style.visibility = "hidden";
                            document.getElementById("from").style.visibility="hidden";
                            document.getElementById("to").style.visibility="hidden";
                            multiple_plot.style.visibility = "visible";
                        }
                        else if (stock_selected != "" && stock_choice_ul.childElementCount == 2 && metric_choice_ul.childElementCount == 1) {
                            //单模式
                            state = "single";
                            single_plot.style.visibility = "visible";
                            document.getElementById("from").style.visibility="visible";
                            document.getElementById("to").style.visibility="visible";
                            multiple_plot.style.visibility = "hidden";
                        }
                        else {
                            state = "neither";
                        }
                    }
                }
            })(some_metric);

            some_metric.appendChild(some_metric_label);

            var some_metric_choice_a=document.createElement("a");
            some_metric_choice_a.setAttribute("id",metric_list[i]+"_a");

            (function(metric)
            {
//                点击指标删除
                some_metric_choice_a.onclick=function()
                {
                    console.log("your state is "+state);
                    metric_choice_ul.removeChild(metric);//已选中移除
                    metric.lastElementChild.style.visibility="hidden";//隐藏删除图标
                    metric.setAttribute("class","metric_choose_li");//改为待选类
                    metric_choose_ul.appendChild(metric);//添加到待选中
                    document.getElementById("metric_choose_tip").style.visibility="visible";//提示可见
                    console.log("now which metric is selected "+metric_selected);
                    if(state="single")
                    {
                        //如果处于单模式
                        state="neither";//改为未定义模式
                        single_plot.style.visibility="hidden";
                        document.getElementById("from").style.visibility="hidden";
                        document.getElementById("to").style.visibility="hidden";
                        multiple_plot.style.visibility="hidden";
                        allclear();//画板清空

                        stock_choice_init();//股票列表初始化
                        stock_selected="";//已点股票清空
                        metric_selected="";//已点指标清空
                    }
                    else if(state="multiple")
                    {
                        //如果处于多模式
                        if((metric_selected+"_label")==metric.getAttribute("id"))
                        {
                            //刚好删除了选择的
                            //TODO
                        }
                    }
                    else
                    {
                        //未定义模式
                        //TODO
                    }
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

    //股票初始化
    function stock_choice_init()
    {
        for(var i=0;i<stocklist.length;i++)
        {
            var stock_choice_li=document.createElement("li");
            stock_choice_li.setAttribute("class","stock_choice_li");
            var label=document.createElement("label");
            label.innerHTML=stocklist[i];
            label.setAttribute("id",stocklist[i]);
            //点击股票标签
            (function(stock_label)
            {
                label.onclick=function()
                {
                    console.log("your state is "+state);
                    //当点击的是已选的股票
                    //将选择的标蓝
                    var list = stock_choice_ul.getElementsByTagName("li");
                    for (var j = 0; j < list.length; j++) {
                        list[j].firstChild.style.color = "#aaaaaa";
                    }
                    stock_label.style.color = "#5389d2";
                    //记录选择的股票名称
                    stock_selected = stock_label.getAttribute("id");
                    console.log("you select "+stock_selected);

                    //给出画板
                    if (metric_selected != "" && (stock_choice_ul.childElementCount > 2 || metric_choice_ul.childElementCount > 1)) {
                        //多模式
                        var color = getRandomColor();
                        log.push(new log_stock(stock_selected, color));
                        state = "multiple";
                        single_plot.style.visibility = "hidden";
                        document.getElementById("from").style.visibility="hidden";
                        document.getElementById("to").style.visibility="hidden";
                        multiple_plot.style.visibility = "visible";
                    }
                    else if (metric_selected != "" && stock_choice_ul.childElementCount == 2 && metric_choice_ul.childElementCount == 1) {
                        //单模式
                        state = "single";
                        single_plot.style.visibility = "visible";
                        document.getElementById("from").style.visibility="visible";
                        document.getElementById("to").style.visibility="visible";
                        multiple_plot.style.visibility = "hidden";
                    }
                    else {
                        state = "neither";
                    }
                }
            })(label);

            var delete_icon=new Image();
            delete_icon.src="${pageContext.request.contextPath}/img/delete_inactive.png";
            delete_icon.setAttribute("class","delete_icon");
            (function(stock)
            {
                delete_icon.onclick=function()
                {
                    //删除股票
                    stock_choice_ul.removeChild(stock);
                    //TODO
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
    }
    //股票选择
    function changeStock()
    {
        stock_choice_ul.innerHTML="";
        //TODO
        stock_choice_init();
    };
</script>
<!--描点作图-->
<script type="text/javascript">
    function point($cx,$cy){
        this.x=$cx;
        this.y=$cy;
    };

    var points=[];//记录描的点
    var t = 1;

    var canvas = document.getElementById("canvas");
    var ctx = canvas.getContext("2d");
    var innercanvas=document.getElementById("innercanvas");
    var innerctx=innercanvas.getContext("2d");

    function allclear()
    {
        t=1;

        var from=document.getElementById("from");
        from.style.visibility="visible";
        var from_text=document.getElementById("from_text");
        from_text.style.visibility="hidden";

        var to=document.getElementById("to");
        to.style.visibility="visible";
        var to_text=document.getElementById("to_text");
        to_text.style.visibility="hidden";

        points=[];
        ctx.clearRect(0,0,canvas.width,canvas.height);
        innerctx.clearRect(0,0,innercanvas.width,innercanvas.height);
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

    function save_flag()
    {
        //TODO
        clean();
    }
</script>
<!--形态标志-->
<script>
    //随机色彩生成器
    var getRandomColor = function(){
        return  '#' +
                (function(color){
                    return (color +=  '0123456789abcdef'[Math.floor(Math.random()*16)])
                    && (color.length == 6) ?  color : arguments.callee(color);
                })('');
    };
    function Point($x,$y)
    {
        this.x=$x;
        this.y=$y;
    }
    //指标线
    function metric_line($metric)
    {
        this.metric=$metric;
        this.line=[];
        this.setLine=function($line)
        {
            this.line=$line;
        }
    };
    //一个股票的所有指标情况
    function log_stock($stock,$color)
    {
        this.stock=$stock;
        this.metric_lines=[];//多个指标
        this.color=$color;
    }

    var row=6;
    var column=6;

    //当前的股票和指标
    var metric_selected="";
    var stock_selected="";

    //所有记录(log_stock)
    var log=[];

    var add_row=document.getElementById("add_row");
    var add_column=document.getElementById("add_column");
    //    添加行
    add_row.onclick=function()
    {
        var button_group=document.getElementById("morphology_button_group");
        var new_row=document.createElement("div");
        new_row.setAttribute("id",row+"");
        new_row.setAttribute("class","morphology_button_row");
        for(var i=0;i<column;i++)
        {
            var new_button=document.createElement("button");
            new_button.setAttribute("id",i+"-"+row);
            new_button.setAttribute("class","morphology_button");
            new_button.innerHTML="&nbsp";
            (function(button) {
                new_button.onclick = function () {
                    var id = button.id;
                    var pointxy = new Point(Number(id.substr(0, id.indexOf("-"))), Number(id.substr(id.indexOf("-") + 1, id.length - id.indexOf("-") - 1)));
                    //点击一个单元，根据当前选择的股票和指标将其标记
                    for (var j = 0; j < log.length; j++) {
                        if (log[j].stock == stock_selected)//已经有这只股票
                        {
                            console.log("already have the stock in" + j);
                            addPoint(j, metric_selected, pointxy);//处理添加的点
                            return;
                        }
                    }
                    var color = getRandomColor();
                    log.push(new log_stock(stock_selected, color));
                    message1.innerHTML = JSON.stringify(log);
                    addPoint(log.length - 1, metric_selected, pointxy);//处理添加的点

                    new_stock = false;
                    new_metric = false;
                }
            })(new_button);
            new_row.appendChild(new_button);
        }
        button_group.insertBefore(new_row,document.getElementById(row-1));
        row++;
    };
    //    添加列
    add_column.onclick=function()
    {
        var rows=document.getElementsByClassName("morphology_button_row");
        for(var i=0;i<row;i++)
        {
            var new_button=document.createElement("button");
            new_button.setAttribute("id",column+"-"+(row-i-1));
            new_button.setAttribute("class","morphology_button");
            new_button.innerHTML="&nbsp";
            (function(button) {
                new_button.onclick = function () {
                    var id = button.id;
                    var pointxy = new Point(Number(id.substr(0, id.indexOf("-"))), Number(id.substr(id.indexOf("-") + 1, id.length - id.indexOf("-") - 1)));
                    //点击一个单元，根据当前选择的股票和指标将其标记
                    for (var j = 0; j < log.length; j++) {
                        if (log[j].stock == stock_selected)//已经有这只股票
                        {
                            console.log("already have the stock in" + j);
                            addPoint(j, metric_selected, pointxy);//处理添加的点
                            return;
                        }
                    }
                    var color = getRandomColor();
                    log.push(new log_stock(stock_selected, color));
                    message1.innerHTML = JSON.stringify(log);
                    addPoint(log.length - 1, metric_selected, pointxy);//处理添加的点

                    new_stock = false;
                    new_metric = false;
                }
            })(new_button);
            rows[i].appendChild(new_button);
        }
        column++;
    };

    //    点击按钮画点
    function addPoint($location,$metric,$point)
    {
        console.log("yes in "+$location);
        var x=$point.x;
        var y=$point.y;
        var metric_lines=log[$location].metric_lines;
        for(var i=0;i<metric_lines.length;i++)
        {
            if(metric_lines[i].metric==$metric)//已经有这个指标
            {
                console.log("already have the metric in "+i);
                var line=metric_lines[i].line;

                if(line.length==0)
                {
                    line.push($point);
                    var node= document.getElementById($point.x+"-"+$point.y);
                    node.style.backgroundColor=log[$location].color;
                    node.innerHTML=$metric;
                    return;
                }

                var index=-1;
                for(var j=0;j<line.length;j++)
                {
                    if(line[j].x==$point.x&&line[j].y==$point.y)
                    {
                        index=j;
                    }
                }
                console.log("this point index is"+index);
                if(index==0)//在开头
                {
                    line.splice(0,1);
                    var node= document.getElementById($point.x+"-"+$point.y);
                    node.style.backgroundColor="#fff";
                    var str=JSON.stringify(node.innerHTML);
                    str=str.replace('"'+$metric+'"',"&nbsp");
                    node.innerHTML=str;
                }
                else if(index==line.length-1)//在结尾
                {
                    line.splice(line.length-1,1);
                    var node= document.getElementById($point.x+"-"+$point.y);
                    node.style.backgroundColor="#fff";
                    var str=JSON.stringify(node.innerHTML);
                    str=str.replace('"'+$metric+'"',"&nbsp");
                    node.innerHTML=str;
                }
                else if(index==-1)//没有该点
                {
                    var line_length=line.length;
                    var scope_x1=line[0].x-1;
                    var scope_x2=line[0].x+1;
                    var scope_y1=line[0].y-1;
                    var scope_y2=line[0].y+1;
                    var scope_x3=line[line_length-1].x-1;
                    var scope_x4=line[line_length-1].x+1;
                    var scope_y3=line[line_length-1].y-1;
                    var scope_y4=line[line_length-1].y+1;
                    if(x>=scope_x1&& x<=scope_x2&& y>=scope_y1&& y<=scope_y2)//必须与头尾相连
                    {
                        if(line_length==1)
                        {
                            if(x>line[0].x||y>line[0].y)
                            {
                                line.push($point);
                                var node= document.getElementById($point.x+"-"+$point.y);
                                node.style.backgroundColor=log[$location].color;
                                node.innerHTML=$metric;
                            }
                            else
                            {
                                line.splice(0,0,$point);
                                var node= document.getElementById($point.x+"-"+$point.y);
                                node.style.backgroundColor=log[$location].color;
                                node.innerHTML=$metric;
                            }
                        }
                        else
                        {
                            line.splice(0,0,$point);
                            var node= document.getElementById($point.x+"-"+$point.y);
                            node.style.backgroundColor=log[$location].color;
                            node.innerHTML=$metric;
                        }
                    }
                    else if(x>=scope_x3&& x<=scope_x4&& y>=scope_y3&& y<=scope_y4)
                    {
                        line.push($point);
                        document.getElementById($point.x+"-"+$point.y).style.backgroundColor=log[$location].color;
                        document.getElementById($point.x+"-"+$point.y).textContent=$metric;
                    }
                    else
                    {
                        console.log("have to be connected,you can append");//提示
                    }
                }
                else//在中间
                {
                    console.log("have to be connected,you can delete");//提示
                }
                message1.innerHTML=JSON.stringify(log);
                return;
            }
        }
        metric_lines.push(new metric_line($metric));
        metric_lines[metric_lines.length-1].line.push($point);
        document.getElementById($point.x+"-"+$point.y).style.backgroundColor=log[$location].color;
        document.getElementById($point.x+"-"+$point.y).innerHTML=$metric;
    }

    var point_list=document.getElementsByClassName("morphology_button");
    //为每个格子添加监听
    (function()
    {
        for(var i=0;i<point_list.length;i++)
        {
            var point=point_list[i];
            (function(button)
            {
                point.onclick=function()
                {
                    var id=button.id;
                    var pointxy=new Point(Number(id.substr(0,id.indexOf("-"))),Number(id.substr(id.indexOf("-")+1,id.length-id.indexOf("-")-1)));
                    //点击一个单元，根据当前选择的股票和指标将其标记
                    for(var j=0;j<log.length;j++)
                    {
                        if(log[j].stock==stock_selected)//已经有这只股票
                        {
                            console.log("already have the stock in"+j);
                            addPoint(j,metric_selected,pointxy);//处理添加的点
                            return;
                        }
                    }
                    var color=getRandomColor();
                    log.push(new log_stock(stock_selected,color));
                    addPoint(log.length-1,metric_selected,pointxy);//处理添加的点
                }
            })(point);
        }
    })();
    //清空点阵
    function buttonallclear()
    {
        for(var i=0;i<point_list.length;i++)
        {
            var point=point_list[i];
            point.style.color="#fff";
            point.innerHTML="&nbps";
        }
    }

    function clean()
    {
        state="neither";
        stock_selected="";
        metric_selected="";
        allclear();
        points=[];
        single_plot.style.visibility="hidden";
        document.getElementById("from").style.visibility="hidden";
        document.getElementById("to").style.visibility="hidden";
        buttonallclear();
        log=[];
        multiple_plot.style.visibility="hidden";
        stocklist=[];

        {
            stock_choice_ul.innerHTML = "";
            stock_choice_init();
        }

        {
            metric_choice_ul.innerHTML = "";
            //TODO
        }
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