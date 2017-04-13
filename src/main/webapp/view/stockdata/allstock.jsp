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
            height: 30px;
        }

        .activP {
            background-color: #5389d2 !important;
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
                            <div id="szline" style="height:320px;margin-top:0px;padding:0px"></div>
                            </div>
                </div>
                <div class="col-md-4" style="padding:0px;">
                    <div class="chart scContainer" style="padding:0px;">
                        <div id="scline" style="height:320px;margin-top:0px;padding:0px"></div>
                    </div>
                </div>
                <div class="col-md-4" style="padding:0px;">
                    <div class="chart hsContainer" style="padding:0px;">
                        <div id="hsline" style="height:320px;margin-top:0px;padding:0px"></div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <%--新股和停盘--%>
        <div class="row list-row" style="padding-bottom: 0">
            <div class="col-md-6" style="padding:0px;">
                <div class="newstock_Container" style="padding:15px;">
                    <div class="title">
                        <span>新股上市</span>
                    </div>
                    <table class="table" style="margin-bottom: 0px">
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
                            <td data-label="代码"><a>sh603538</a></td>
                            <td data-label="名称">美诺华</td>
                            <td data-label="发行日期">2017-03-24</td>
                            <td data-label="发行量">3000</td>
                        </tr>
                        <tr>
                            <td data-label="代码"><a>sh300633</a></td>
                            <td data-label="名称">开立医疗</td>
                            <td data-label="发行日期">2017-03-24</td>
                            <td data-label="发行量">4001</td>
                        </tr>
                        <tr>
                            <td data-label="代码"><a>sh300632</a></td>
                            <td data-label="名称">光莆股份</td>
                            <td data-label="发行日期">2017-03-24</td>
                            <td data-label="发行量">2895</td>
                        </tr>
                        <tr>
                            <td data-label="代码"><a>sh603906</a></td>
                            <td data-label="名称">龙蟠科技</td>
                            <td data-label="发行日期">2017-03-24</td>
                            <td data-label="发行量">5200</td>
                        </tr>
                        <tr>
                            <td data-label="代码"><a>sh603586</a></td>
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
                                <td data-label="代码"><a>sh600710</a></td>
                                <td data-label="名称">*ST常林</td>
                                <td data-label="上市日期">1996-07-01</td>
                                <td data-label="暂停上市日期">-</td>
                            </tr>
                            <tr>
                                <td data-label="代码"><a>sh600732</a></td>
                                <td data-label="名称">*ST新梅</td>
                                <td data-label="上市日期">1996-08-16</td>
                                <td data-label="暂停上市日期">-</td>
                            </tr>
                            <tr>
                                <td data-label="代码"><a>sh601268</a></td>
                                <td data-label="名称">*ST二重</td>
                                <td data-label="上市日期">2010-02-02</td>
                                <td data-label="暂停上市日期">-</td>
                            </tr>
                            <tr>
                                <td data-label="代码"><a>sh000155</a></td>
                                <td data-label="名称">*ST川化</td>
                                <td data-label="上市日期">2000-09-26</td>
                                <td data-label="暂停上市日期">-</td>
                            </tr>
                            <tr>
                                <td data-label="代码"><a>sh601018</a></td>
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
                <span style="padding:12px 0 9px">全部股票</span>
            </div>
            <div id="pricing_chart" style="margin-top:5px;padding:5px;align-content: center">
                <div id="plans">
                    <div id="monthly_plans" class="columns">
                    </div>
                    <div id="showcase">
                        <div class="item" style="margin:0px;padding:0px;width:100%;text-align: center;">
                            <div class="pageTest" style="text-align: center;">
                                <div class="data-pagination" style="text-align: center">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../../js/jquery-3.1.1.min.js"></script>
<script src="../../js/bootstrap.js"></script>
<script type="text/javascript" src="../../js/stockdata/echarts.js"></script>
<script src="../../js/stockdata/Chart.js"></script>
<script type="text/javascript" src="../../js/stockdata/page.js"></script>
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
        leng: 15,//分页总数
        activeClass: 'activP' , //active 类样式定义
    });

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
        currentPage=15;
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
                $("#monthly_plans").empty();

                $.each(data,function(i,vo){
                    htm="<div class=\"column\" >";
                    htm+=("<a href=\"${pageContext.request.contextPath}/HCIQuant/stockInfo?id="+vo['stockId']+"\"><p class=\"plan_name\">sh"+vo['stockId']+"</p></a>");
                    htm+=("<p class=\"feature\">"+vo['name']+"</p>");
                    htm+=("<p class=\"feature\">"+vo['date']+"</p>");
                    htm+=("<p class=\"feature\">开盘"+vo['open']+"</p>");
                    htm+=("<p class=\"feature\">收盘"+vo['close']+"</p>");
                    htm+=("<p class=\"feature small\">"+vo['incrPer']+"</p></div>");
                    if(i!=4){
                        htm+=("<div class=\"col_line\"></div>");
                    }
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
