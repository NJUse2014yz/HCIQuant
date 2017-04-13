<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
    <%--<title>choose stock</title>--%>
    <%--<link rel="stylesheet" href="../../css/bootstrap.css">--%>
    <%--<link rel="stylesheet" href="../../css/stockchooser.css">--%>
    <%--<script src="../../js/jquery-3.1.1.min.js"></script>--%>
    <%--<script src="../../js/bootstrap.js"></script>--%>
    <%--<script src="../../js/bootstrap-paginator.min.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<!-- 按钮触发模态框 -->
<%--<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#stockModal" onclick="JavaScript:start_choose();">--%>
    <%--开始演示模态框--%>
<%--</button>--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="stockModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    选择股票
                </h4>
            </div>
            <div class="modal-body">
                <div id="searcher" class="input-group">
                    <input id="searcher_input" type="text" class="form-control input-lg">
                    <span id="searcher_span" class="input-group-addon btn btn-primary" onclick="JavaScript:search();">搜索</span>
                </div>
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne">
                                    搜索的股票
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="panel-body">
                                    <div class ="tableContainer">
                                        <input id ="currentPage1" type ="hidden" value ="1"/>
                                        <input id ="totalPages1" type ="hidden" value ="3" />
                                        <table class ="table table-hover table-striped">
                                            <thead>
                                            <tr>
                                                <th> 代码 </th >
                                                <th> 名称 </th >
                                                <th> 涨跌幅 </th >
                                                <th> 成交量 </th >
                                            </tr>
                                            </thead>
                                            <tbody id="search_table">

                                            </tbody>
                                        </table>
                                        <ul id ="example1"></ul>
                                    </div >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseTwo">
                                    关注的股票
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class ="tableContainer">
                                    <input id ="currentPage2" type ="hidden" value ="1"/>
                                    <input id ="totalPages2" type ="hidden" value ="3" />
                                    <table class ="table table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th> 代码 </th >
                                            <th> 名称 </th >
                                            <th> 涨跌幅 </th >
                                            <th> 成交量 </th >
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr onclick="JavaScipt:select_stock('sh600000');">
                                            <td> sh600000 </td>
                                            <td> 平安银行 </td>
                                            <td> 2.13% </td>
                                            <td> 436593.31 </td>
                                        </tr>
                                        <tr onclick="JavaScipt:select_stock('sh600001');">
                                            <td> sh600001 </td>
                                            <td> 民生银行 </td>
                                            <td> -1.27% </td>
                                            <td> 828524.72 </td>
                                        </tr>
                                        <tr onclick="JavaScipt:select_stock('sh600002');">
                                            <td> sh600002 </td>
                                            <td> 招商银行 </td>
                                            <td> 0.06% </td>
                                            <td> 683364.73 </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <ul id ="example2"></ul>
                                </div >
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseThree">
                                    推荐的股票
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class ="tableContainer">
                                <input id ="currentPage3" type ="hidden" value ="1"/>
                                <input id ="totalPages3" type ="hidden" value ="3" />
                                <table class ="table table-hover table-striped">
                                    <thead>
                                    <tr>
                                        <th> 代码 </th >
                                        <th> 名称 </th >
                                        <th> 涨跌幅 </th >
                                        <th> 成交量 </th >
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr onclick="JavaScipt:select_stock('sh600000');">
                                        <td> sh600000 </td>
                                        <td> 平安银行 </td>
                                        <td> 2.13% </td>
                                        <td> 436593.31 </td>
                                    </tr>
                                    <tr onclick="JavaScipt:select_stock('sh600001');">
                                        <td> sh600001 </td>
                                        <td> 民生银行 </td>
                                        <td> -1.27% </td>
                                        <td> 828524.72 </td>
                                    </tr>
                                    <tr onclick="JavaScipt:select_stock('sh600002');">
                                        <td> sh600002 </td>
                                        <td> 招商银行 </td>
                                        <td> 0.06% </td>
                                        <td> 683364.73 </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <ul id ="example3"></ul>
                            </div >
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="JavaSctipt:final_quit();">
                    关闭
                </button>
                <%--<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="JavaSctipt:final_add();">--%>
                    <%--添加--%>
                <%--</button>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script type ="text/javascript">
    function search()
    {
        document.getElementById('search_table').innerHTML="";
        var input=$('#searcher_input').val();
        var tr=document.createElement("tr");
//        tr.onclick=select_stock(input);
        var td_code=document.createElement("td");
        td_code.innerHTML=input;
        var td_name=document.createElement("td");
        td_name.innerHTML="中国石油";
        var td_rate=document.createElement("td");
        td_rate.innerHTML="3.27%";
        var td_volumn=document.createElement("td");
        td_volumn.innerHTML="358984.62";
        tr.appendChild(td_code);
        tr.appendChild(td_name);
        tr.appendChild(td_rate);
        tr.appendChild(td_volumn);
        tr.onclick=function()
        {
            for(i=0;i<select_stock_list.length;i++)
            {
                if(input==select_stock_list[i])
                {
                    return;
                }
            }
            select_stock(input);
            final_add();
        }

        document.getElementById('search_table').appendChild(tr);
    }
    $( '#example1' ).bootstrapPaginator({
        currentPage: $( '#currentPage1' ).val(),   //当前页
        totalPages: $( '#totalPages1' ).val(),     //总页数
        bootstrapMajorVersion: 3,               //兼容Bootstrap3.x版本
        tooltipTitles: function (type, page) {
            switch (type) {
                case "first" :
                    return "第一页" ;
                case "prev" :
                    return "上一页" ;
                case "next" :
                    return "下一页" ;
                case "last" :
                    return "最后一页" ;
                case "page" :
                    return page;
            }
            return "" ;
        },
        onPageClicked: function () {

        }
    });
    $( '#example2' ).bootstrapPaginator({
        currentPage: $( '#currentPage2' ).val(),   //当前页
        totalPages: $( '#totalPages2' ).val(),     //总页数
        bootstrapMajorVersion: 3,               //兼容Bootstrap3.x版本
        tooltipTitles: function (type, page) {
            switch (type) {
                case "first" :
                    return "第一页" ;
                case "prev" :
                    return "上一页" ;
                case "next" :
                    return "下一页" ;
                case "last" :
                    return "最后一页" ;
                case "page" :
                    return page;
            }
            return "" ;
        },
        onPageClicked: function () {

        }
    });
    $( '#example3' ).bootstrapPaginator({
        currentPage: $( '#currentPage3' ).val(),   //当前页
        totalPages: $( '#totalPages3' ).val(),     //总页数
        bootstrapMajorVersion: 3,               //兼容Bootstrap3.x版本
        tooltipTitles: function (type, page) {
            switch (type) {
            case "first" :
                return "第一页" ;
            case "prev" :
                return "上一页" ;
            case "next" :
                return "下一页" ;
            case "last" :
                return "最后一页" ;
            case "page" :
                return page;
            }
            return "" ;
        },
        onPageClicked: function () {

        }
    });
    var select_stock_list=[];
    function select_stock($stock_code)
    {
        console.log($stock_code);
        select_stock_list.push($stock_code);
    }
//    function final_add()
//    {
//        console.log(select_stock_list);
//    }
    function final_quit()
    {
        select_stock_list=[];
        console.log(select_stock_list);
    }
    function start_choose()
    {
        select_stock_list=[];
    }
</script >

<%--</html>--%>
