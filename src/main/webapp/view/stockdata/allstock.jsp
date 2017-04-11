<%@ page language="java" contentType="text/html;charset=UTF-8"
          pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>全部股票</title>
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <link rel="stylesheet" href="../../css/stockdata/table2.css">
    <link rel="stylesheet" href="../../css/stockdata/table1.css">
    <link href="../../css/common/common.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="../../css/stockdata/data-pagination.css">--%>
    <link rel="stylesheet" href="../../css/stockdata/page.css">
    <link rel="stylesheet" href="../../css/stockdata/list_table.css">
    <link rel="stylesheet" type="text/css" media="screen" href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
    <style type="text/css">
        .pageTest {
            position:relative;
            /*width: 600px;*/
            width:100%;
            height: 30px;
            /*left:230px;*/
            /*top:5px;*/
        }

        .activP {
            background-color: #85aeca !important;
            color: #fff !important;
        }
    </style>
</head>
<body>
<%@include file="../first/navBar.jsp"%>


<div class="container-fluid main-content">
    <div class="row content-row">
        <div class="row list-row input-row"> 
            <div class="title">
                <span>沪深指数</span>
            </div>
            <div class="row info-row">
                <div class="col-md-4" style="padding:0px;">
                        <div class="chart szContainer" style="padding:0px;">
                            <div id="szline" style="height:350px;margin-top:0px;padding:0px"></div>
                            </div>
                </div>
                <div class="col-md-4" style="padding:0px;">
                    <div class="chart scContainer" style="padding:0px;">
                        <div id="scline" style="height:350px;margin-top:0px;padding:0px"></div>
                    </div>
                </div>
                <div class="col-md-4" style="padding:0px;">
                    <div class="chart hsContainer" style="padding:0px;">
                        <div id="hsline" style="height:350px;margin-top:0px;padding:0px"></div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <%--新股和停盘--%>
        <div class="row list-row">
            <div class="col-md-6" style="padding:0px;">
                <div class="newstock_Container" style="padding:15px;">
                    <div class="title">
                        <span>新股上市</span>
                    </div>
                    <table class="table" style="margin-bottom: 0px">
                        <%--<caption>新股上市</caption>--%>
                        <thead>
                        <tr>
                            <th scope="col">代码</th>
                            <th scope="col">名称</th>
                            <th scope="col">发行日期</th>
                            <th scope="col">发行量</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td data-label="代码">603538</td>
                            <td data-label="名称">美诺华</td>
                            <td data-label="发行日期">2017-03-24</td>
                            <td data-label="发行量">3000</td>
                        </tr>
                        <tr>
                            <td data-label="代码">300633</td>
                            <td data-label="名称">开立医疗</td>
                            <td data-label="发行日期">2017-03-24</td>
                            <td data-label="发行量">4001</td>
                        </tr>
                        <tr>
                            <td data-label="代码">300632</td>
                            <td data-label="名称">光莆股份</td>
                            <td data-label="发行日期">2017-03-24</td>
                            <td data-label="发行量">2895</td>
                        </tr>
                        <tr>
                            <td data-label="代码">603906</td>
                            <td data-label="名称">龙蟠科技</td>
                            <td data-label="发行日期">2017-03-24</td>
                            <td data-label="发行量">5200</td>
                        </tr>
                        <tr>
                            <td data-label="代码">603586</td>
                            <td data-label="名称">金麒麟</td>
                            <td data-label="发行日期">2017-03-23</td>
                            <td data-label="发行量">5250</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-6" style="padding:0px;">
                <div class="haltstock_Container" style="padding:15px;">
                    <div class="title">
                        <span>停盘信息</span>
                    </div>
                    <table class="table" style="margin-bottom: 0px">
                        <%--<caption>停盘</caption>--%>
                        <thead>
                        <tr>
                            <th scope="col">代码</th>
                            <th scope="col">名称</th>
                            <th scope="col">上市日期</th>
                            <th scope="col">暂停日期</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td data-label="代码">600710</td>
                            <td data-label="名称">*ST常林</td>
                            <td data-label="上市日期">1996-07-01</td>
                            <td data-label="暂停上市日期">-</td>
                        </tr>
                        <tr>
                            <td data-label="代码">600732</td>
                            <td data-label="名称">*ST新梅</td>
                            <td data-label="上市日期">1996-08-16</td>
                            <td data-label="暂停上市日期">-</td>
                        </tr>
                        <tr>
                            <td data-label="代码">601268</td>
                            <td data-label="名称">*ST二重</td>
                            <td data-label="上市日期">2010-02-02</td>
                            <td data-label="暂停上市日期">-</td>
                        </tr>
                        <tr>
                            <td data-label="代码">000155</td>
                            <td data-label="名称">*ST川化</td>
                            <td data-label="上市日期">2000-09-26</td>
                            <td data-label="暂停上市日期">-</td>
                        </tr>
                        <tr>
                            <td data-label="代码">601018</td>
                            <td data-label="名称">宁波港</td>
                            <td data-label="上市日期">2010-09-28</td>
                            <td data-label="暂停上市日期">-</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%--全部股票--%>
        <div class="row list-row">
            <div class="title">
                <span style="padding:7px;">全部股票</span>
            </div>
            <div id="pricing_chart" style="margin_top:5px;padding:5px;align-content: center">
                <!--   <div id="cycles">
                  </div> -->
                <div id="plans">
                    <div id="monthly_plans" class="columns">
                        <%--<div class="column" >--%>
                            <%--<a href="https://www.baidu.com"><p class="plan_name">603999</p></a>--%>
                            <%--<p class="feature">读者传媒</p>--%>
                            <%--<p class="feature">2017/03/04</p>--%>
                            <%--<p class="feature">开盘: 35.05</p>--%>
                            <%--<p class="feature">收盘: 35.16</p>--%>
                            <%--<p class="feature small">+ 1.138%</p>--%>
                        <%--</div>--%>
                        <%--<div class="col_line"></div>--%>
                        <%--<div class="column">--%>
                            <%--<p class="plan_name">603999</p>--%>
                            <%--<p class="feature">Up to 30 hours</p>--%>
                            <%--<p class="feature">1-2 days</p>--%>
                            <%--<p class="feature">2 hours</p>--%>
                            <%--<p class="feature small">603999</p>--%>
                        <%--</div>--%>
                        <%--<div class="col_line"></div>--%>
                        <%--<div class="column">--%>
                            <%--<p class="plan_name">603999</p>--%>
                            <%--<p class="feature">Up to 30 hours</p>--%>
                            <%--<p class="feature">1-2 days</p>--%>
                            <%--<p class="feature">2 hours</p>--%>
                            <%--<p class="feature small">603999</p>--%>
                        <%--</div>--%>
                        <%--<div class="col_line"></div>--%>
                        <%--<div class="column">--%>
                            <%--<p class="plan_name">603999</p>--%>
                            <%--<p class="feature">Up to 40 hours</p>--%>
                            <%--<p class="feature">1-2 days</p>--%>
                            <%--<p class="feature">2 hours</p>--%>
                            <%--<p class="feature small">603999</p>--%>
                        <%--</div>--%>
                        <%--<div class="col_line"></div>--%>
                        <%--<div class="column">--%>
                            <%--<p class="plan_name">603999</p>--%>
                            <%--<p class="feature">Up to 30 hours</p>--%>
                            <%--<p class="feature">1-2 days</p>--%>
                            <%--<p class="feature">2 hours</p>--%>
                            <%--<p class="feature small">603999</p>--%>
                        <%--</div>--%>
                    </div>
                    <div id="showcase">
                        <!--     <div id="monthly_showcase"> -->
                        <div class="item" style="margin:0px;padding:0px;width:100%;text-align: center;">
                            <%--<span style="cursor:pointer">here</span>--%>
                            <%--<span>here</span>--%>
                                <div class="pageTest" style="text-align: center;">
                                    <div class="data-pagination" style="text-align: center">
                        </div>
                    </div>
                    </div>
                </div>
        </div>

    </div>
</div>



<%--<div class="container-fluid" style="padding:0;margin:7%;margin-top:80px;">--%>
    <%--<div class="row-fluid" >--%>
    <%--<div class="col-md-1"></div>--%>
        <%--&lt;%&ndash;三个大盘指数信息&ndash;%&gt;--%>
    <%--<div class="col-md-10">--%>
        <%--<div class="row-fluid">--%>
            <%--<div id="accordion" class="panel-group">--%>
                <%--<div class="panel panel-default">--%>
                    <%--<div class="panel-heading" style="border-bottom: 0px">--%>
                        <%--<h4 class="panel-title" style="text-align:center;">--%>
                            <%--<a data-toggle="collapse" data-parent="#accordion1"--%>
                               <%--href="#collapseOne">--%>
                                <%--沪深股市--%>
                            <%--</a>--%>
                        <%--</h4>--%>
                    <%--</div>--%>
                    <%--<div id="collapseOne" class="panel-collapse collapse in">--%>
                        <%--<div class="panel-body">--%>
                                <%--<div class="container-fluid">--%>
                                    <%--<div class="row-fluid">--%>
                                        <%--&lt;%&ndash;<div class="col-md-4">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<p style="text-align: center;color:gray;font-size: 18px;margin:0px auto">上证指数(000001)</p>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<p style="text-align: center;color:#49b697;font-size: 24px;margin:0px auto">￥2942.46</p>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<p style="text-align: center;color:#49b697;font-size: 16px;margin:0px auto">-80.96(-2.68%)</p>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<div class="cavsBox cavsBox1" style="width: 100%;">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;<canvas id="line_000001" height="300" style="border:1px solid #909090;"></canvas>&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                        <%--</div>--%>
                                        <%--<div class="col-md-4">--%>
                                            <%--<p style="text-align: center;color:gray;font-size: 18px;margin:0px auto">深证成指(399001)</p>--%>
                                            <%--<p style="text-align: center;color:#49b697;font-size: 24px;margin:0px auto">￥14400.16</p>--%>
                                            <%--<p style="text-align: center;color:#49b697;font-size: 16px;margin:0px auto">-130.78(-0.96%)</p>--%>
                                            <%--<div class="cavsBox cavsBox1" style="width: 100%;">--%>
                                                <%--<canvas id="line_399001" height="300" style="border:1px solid #909090;"></canvas>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="col-md-4">--%>
                                            <%--<p style="text-align: center;color:gray;font-size: 18px;margin:0px auto">沪深300(000300)</p>--%>
                                            <%--<p style="text-align: center;color:#e76862;font-size: 24px;margin:0px auto">￥3130.35</p>--%>
                                            <%--<p style="text-align: center;color:#e76862;font-size: 16px;margin:0px auto">+83.57(+2.67%)</p>--%>
                                            <%--<div class="cavsBox cavsBox1" style="width: 100%;">--%>
                                                    <%--<canvas id="line_000300" height="300" style="border:1px solid #909090;"></canvas>--%>
                                                <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--新股和停盘股票的信息--%>
            <%--<div class="row-fluid">--%>
                <%--<div id="accordion2" class="panel-group">--%>
                    <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading" style="border-bottom: 0px">--%>
                            <%--<h4 class="panel-title" style="text-align:center;">--%>
                                <%--<a data-toggle="collapse" data-parent="#accordion"--%>
                                   <%--href="#collapseTwo">--%>
                                    <%--股市资讯--%>
                                <%--</a>--%>
                            <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="collapseTwo" class="panel-collapse collapse in">--%>
                            <%--<div class="panel-body">--%>
                                <%--<div class="col-md-12" >--%>
                                    <%--<div class="row-fluid">--%>
                                        <%--&lt;%&ndash;新股&ndash;%&gt;--%>
                                        <%--<div class="col-md-6">--%>
                                            <%--&lt;%&ndash;<HR width="100%" color=#909090 SIZE=5px /><!-- color颜色，size大小 -->&ndash;%&gt;--%>
                                            <%--<p style="font-size: 24px;color:#303030;text-align: center;margin:0px auto;">新股上市</p>--%>
                                            <%--<p style="text-align:right;margin:0px auto;cursor: pointer; text-decoration: underline;" >更多></p>--%>
                                            <%--<table class="table table-striped">--%>
                                                <%--&lt;%&ndash;<caption>新股上市</caption>&ndash;%&gt;--%>
                                                <%--<thead>--%>
                                                <%--<tr>--%>
                                                    <%--<th scope="col">代码</th>--%>
                                                    <%--<th scope="col">名称</th>--%>
                                                    <%--<th scope="col">发行日期</th>--%>
                                                    <%--<th scope="col">发行量</th>--%>
                                                <%--</tr>--%>
                                                <%--</thead>--%>
                                                <%--<tbody>--%>
                                                <%--<tr>--%>
                                                    <%--<td data-label="代码">603538</td>--%>
                                                    <%--<td data-label="名称">美诺华</td>--%>
                                                    <%--<td data-label="发行日期">2017-03-24</td>--%>
                                                    <%--<td data-label="发行量">3000</td>--%>
                                                <%--</tr>--%>
                                                <%--<tr>--%>
                                                    <%--<td data-label="代码">300633</td>--%>
                                                    <%--<td data-label="名称">开立医疗</td>--%>
                                                    <%--<td data-label="发行日期">2017-03-24</td>--%>
                                                    <%--<td data-label="发行量">4001</td>--%>
                                                <%--</tr>--%>
                                                <%--<tr>--%>
                                                    <%--<td data-label="代码">300632</td>--%>
                                                    <%--<td data-label="名称">光莆股份</td>--%>
                                                    <%--<td data-label="发行日期">2017-03-24</td>--%>
                                                    <%--<td data-label="发行量">2895</td>--%>
                                                <%--</tr>--%>
                                                <%--<tr>--%>
                                                    <%--<td data-label="代码">603906</td>--%>
                                                    <%--<td data-label="名称">龙蟠科技</td>--%>
                                                    <%--<td data-label="发行日期">2017-03-24</td>--%>
                                                    <%--<td data-label="发行量">5200</td>--%>
                                                <%--</tr>--%>
                                                <%--<tr>--%>
                                                    <%--<td data-label="代码">603586</td>--%>
                                                    <%--<td data-label="名称">金麒麟</td>--%>
                                                    <%--<td data-label="发行日期">2017-03-23</td>--%>
                                                    <%--<td data-label="发行量">5250</td>--%>
                                                <%--</tr>--%>
                                                <%--</tbody>--%>
                                            <%--</table>--%>
                                        <%--</div>--%>
                                            <%--&lt;%&ndash;停盘&ndash;%&gt;--%>
                                        <%--<div class="col-md-6">--%>
                                            <%--&lt;%&ndash;<HR width="100%" color=#909090 SIZE=5px /><!-- color颜色，size大小 -->&ndash;%&gt;--%>
                                            <%--<p style="font-size: 24px;color:#303030;text-align: center;margin:0px auto">停盘股票</p>--%>
                                            <%--<p style="text-align:right;margin:0px auto;cursor: pointer; text-decoration: underline;" >更多></p>--%>
                                            <%--<table class="table2">--%>
                                                <%--&lt;%&ndash;<caption>停盘</caption>&ndash;%&gt;--%>
                                                <%--<thead>--%>
                                                <%--<tr>--%>
                                                    <%--<th scope="col">代码</th>--%>
                                                    <%--<th scope="col">名称</th>--%>
                                                    <%--<th scope="col">上市日期</th>--%>
                                                    <%--<th scope="col">暂停日期</th>--%>
                                                <%--</tr>--%>
                                                <%--</thead>--%>
                                                <%--<tbody>--%>
                                                <%--<tr>--%>
                                                    <%--<td data-label="代码">600710</td>--%>
                                                    <%--<td data-label="名称">*ST常林</td>--%>
                                                    <%--<td data-label="上市日期">1996-07-01</td>--%>
                                                    <%--<td data-label="暂停上市日期">-</td>--%>
                                                <%--</tr>--%>
                                                <%--<tr>--%>
                                                    <%--<td data-label="代码">600732</td>--%>
                                                    <%--<td data-label="名称">*ST新梅</td>--%>
                                                    <%--<td data-label="上市日期">1996-08-16</td>--%>
                                                    <%--<td data-label="暂停上市日期">-</td>--%>
                                                <%--</tr>--%>
                                                <%--<tr>--%>
                                                    <%--<td data-label="代码">601268</td>--%>
                                                    <%--<td data-label="名称">*ST二重</td>--%>
                                                    <%--<td data-label="上市日期">2010-02-02</td>--%>
                                                    <%--<td data-label="暂停上市日期">-</td>--%>
                                                <%--</tr>--%>
                                                <%--<tr>--%>
                                                    <%--<td data-label="代码">000155</td>--%>
                                                    <%--<td data-label="名称">*ST川化</td>--%>
                                                    <%--<td data-label="上市日期">2000-09-26</td>--%>
                                                    <%--<td data-label="暂停上市日期">-</td>--%>
                                                <%--</tr>--%>
                                                <%--<tr>--%>
                                                    <%--<td data-label="代码">601018</td>--%>
                                                    <%--<td data-label="名称">宁波港</td>--%>
                                                    <%--<td data-label="上市日期">2010-09-28</td>--%>
                                                    <%--<td data-label="暂停上市日期">-</td>--%>
                                                <%--</tr>--%>
                                                <%--</tbody>--%>
                                            <%--</table>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="row-fluid">--%>
                <%--<div class="col-md-12">--%>
                    <%--<div class="StockListTable">--%>
                        <%--<table id="stockList" class="table1">--%>
                        <%--<caption>全部股票</caption>--%>
                            <%--<tr>--%>
                                <%--<th>代码</th>--%>
                                <%--<th>名称</th>--%>
                                <%--<th>日期</th>--%>
                                <%--<th>收盘价</th>--%>
                                <%--<th>开盘价</th>--%>
                                <%--<th>涨跌幅</th>--%>
                                <%--<th>最低价</th>--%>
                                <%--<th>最高价</th>--%>
                                <%--<th>成交量</th>--%>
                                <%--<th>换手率</th>--%>
                            <%--</tr>--%>
                        <%--</table>--%>
                        <%--<div class="pageTest">--%>
                            <%--<div class="data-pagination">--%>
                                <%--<a href=# disabled><i class="icon ion-chevron-left"></i></a>--%>
                                <%--<ul>--%>
                                    <%--&lt;%&ndash;<li><a href=#<><</a>&ndash;%&gt;--%>
                                    <%--<li class=current><a href=#1>1</a>--%>
                                    <%--<li><a href=#2>2</a>--%>
                                    <%--<li><a href=#3>3</a>--%>
                                    <%--<li><a href=#4>4</a>--%>
                                    <%--<li><a href=#5>5</a>--%>
                                    <%--<li><a href=#6>6</a>--%>
                                    <%--<li><a href=#7>7</a>--%>
                                    <%--<li><a href=#8>8</a>--%>
                                    <%--<li><a href=#9>9</a>--%>
                                    <%--<li><a href=#10>…</a>--%>
                                    <%--<li><a href=#299>299</a>--%>
                                    <%--<li><a href=#>></a>--%>
                                <%--</ul>--%>
                                <%--<a href=#2><i class="icon ion-chevron-right"></i></a>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--<div class="col-md-1"></div>--%>


    </div>
</div>


<script src="../../js/jquery-3.1.1.min.js"></script>
<script src="../../js/bootstrap.js"></script>
<script type="text/javascript" src="../../js/stockdata/echarts.js"></script>
<%--<script src="../../js/echarts.min.js"></script>--%>
<script src="../../js/stockdata/Chart.js"></script>
<%--<script src="../../js/stockdata/linechart_000001.js"></script>--%>
<%--<script src="../../js/stockdata/linechart_399001.js"></script>--%>
<%--<script src="../../js/stockdata/linechart_000300.js"></script>--%>
<%--<script type="text/javascript" src="../../js/stockdata/stock_list_table.js"></script>--%>
<script type="text/javascript" src="../../js/stockdata/page.js"></script>
<%--<script type="text/javascript" src="../../js/stockdata/table.js"></script>--%>
<%--<script type="text/javascript" src="../../js/stockdata/bar.js"></script>--%>
<%--<script type="text/javascript" src="../../js/stockdata/Line.js"></script>--%>
<%--<script src="../js/info.js"></script>--%>
<script type="text/javascript" src="../../js/stockdata/szline.js"></script>
<script type="text/javascript" src="../../js/stockdata/scline.js"></script>
<script type="text/javascript" src="../../js/stockdata/hsline.js"></script>
<script type="text/javascript">try{Typekit.load();}catch(e){}</script>



<script type="text/javascript">
    var tableAttrs=['stockId', 'name','date', 'close','open', 'incrPer',
        'low', 'high', 'volume', 'turnover'];
    //记录当前页号
    var currentPage=1;

    //翻页
    $('.pageTest').page({
        leng: 290,//分页总数
        activeClass: 'activP' , //active 类样式定义
    });

//    $(".column").hover(function () {
//                $(this).toggleClass("highlight");
//            }
//    );




    $(function(){
        stockListTable(currentPage);
        $("#return").hide();
        paintsz('szline');
        paintsc('scline');
        painths('hsline');
    });



    //点击选页按钮触发的事件
    function choosePageNumber(a){
        currentPage=$(a).text();
        stockListTable(currentPage);
    }

    function lastPage(){
        currentPage=290;
        stockListTable(currentPage);
    }

    //刷新列表数据
    function stockListTable(pageNumber){
        //异步查詢
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/HCIQuant/getStockList',
            data:'pageNumber='+pageNumber,
            success:function(data){
//                alert("HHHHHH")
//                table(data,tableAttrs,'stockList');
//                selectStockListener(data,'stockId',"stockList");
//                $("table#"+idName+" tr#auto").remove();
//                document.getElementById("monthly_plans").remove();
                $("#monthly_plans").empty();
//                alert($("#monthly_plans").className);
                //遍历数组

                $.each(data,function(i,vo){

//                    htm="<tr id='auto'>";
//                    //遍历属性
//                    $.each(attrs,function(i,attr){
//                        htm+="<td>"+vo[attr]+"</td>";
//                    });
//                    htm+="</tr>";
//                    var tableAttrs=['stockId', 'name','date', 'close','open', 'incrPer',
//                        'low', 'high', 'volume', 'turnover'];
                    htm="<div class=\"column\" >";
                    htm+=("<a href=\"${pageContext.request.contextPath}/HCIQuant/stockInfo?id="+vo['stockId']+"\"><p class=\"plan_name\">"+vo['stockId']+"</p></a>");
                    htm+=("<p class=\"feature\">"+vo['name']+"</p>");
                    htm+=("<p class=\"feature\">"+vo['date']+"</p>");
                    htm+=("<p class=\"feature\">开盘"+vo['open']+"</p>");
                    htm+=("<p class=\"feature\">收盘"+vo['close']+"</p>");
                    htm+=("<p class=\"feature small\">"+vo['incrPer']+"</p></div>");
                    if(i!=4){
                        htm+=("<div class=\"col_line\"></div>");
                    }
//                    alert(htm);
                    <%--htm+=("</div>");--%>

<%--//                            <div class="column" >--%>
                                <%--<a href="https://www.baidu.com"><p class="plan_name">603999</p></a>--%>
                                <%--<p class="feature">读者传媒</p>--%>
                                <%--<p class="feature">2017/03/04</p>--%>
                                <%--<p class="feature">开盘: 35.05</p>--%>
                                <%--<p class="feature">收盘: 35.16</p>--%>
                                <%--<p class="feature small">+ 1.138%</p>--%>
                            <%--</div>--%>
                            <%--<div class="col_line"></div>--%>
                    $("#monthly_plans").append(htm);
//                    $("table#"+idName).append(htm);
                });
                $(".pageTest").show();
                $(".column").hover(function () {
                            $(this).toggleClass("highlight");
                        }
                );
            }
        });
    }
</script>


</body>
</html>
