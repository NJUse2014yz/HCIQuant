<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>我的股票</title>
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <link href="../../css/common/navbar.css" rel="stylesheet">
    <link href="../../css/common/common.css" rel="stylesheet">
    <link href="../../css/block/new.css" rel="stylesheet">
    <link href="../../css/block/all_block.css" rel="stylesheet">
    <link href="../../css/block/my_thing.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script>
        function clickA() {
            window.location.href="stockInfo?id=sh613467";
        }
        function del(n) {
            $('#'+n).css("display","none");
        }
    </script>
</head>
<body>
<%@include file="../first/navBar.jsp"%>

<div class="container-fluid main-content">
    <div class="row content-row">
        <div class="row list-row input-row"> 
            <div class="more">
                <span>更多 >></span>
            </div>
            <div class="title">
                <span>关注的股票</span>
            </div>
            <div class="row block-list-row">
                <div class="industry-table">
                    <ul id="in-ul">
                        <li>
                            <ul class="head-ul">
                                <li style="border-left: 1px solid #e9e9e9;border-top-left-radius: 5px;">股票代码</li>
                                <li>股票名称</li>
                                <li>当前价</li>
                                <li>涨跌额</li>
                                <li>涨跌幅</li>
                                <li>换手率</li>
                                <li style="border-right: 1px solid #e9e9e9;">
                                    操作
                                </li>
                            </ul>
                        </li>
                        <li id="1">
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a onclick="clickA()">SH600246</a></li>
                                <li><a>万通地产</a></li>
                                <li>6.12</li>
                                <li class="increase">+0.56</li>
                                <li class="increase">+10.07%</li>
                                <li>6.22%</li>
                                <li  style="border-right: 1px solid #e9e9e9;">
                                    <span class="border-btn operate-btn" onclick="del(1)">取关</span>
                                </li>
                            </ul>
                        </li>
                        <li id="2">
                            <ul class="list-ul second-li">
                                <li style="border-left: 1px solid #e9e9e9;"><a onclick="clickA()">SH002342</a></li>
                                <li><a>巨力索具</a></li>
                                <li>11.40</li>
                                <li class="increase">+1.04</li>
                                <li class="increase">+10.04%</li>
                                <li>0.40%</li>
                                <li  style="border-right: 1px solid #e9e9e9;">
                                    <span class="border-btn operate-btn" onclick="del(2)">取关</span>
                                </li>
                            </ul>
                        </li>
                        <li id="3">
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a onclick="clickA()">SH000600</a></li>
                                <li><a>建投能源</a></li>
                                <li>13.15</li>
                                <li class="increase">+1.20</li>
                                <li class="increase">+10.03%</li>
                                <li>3.69%</li>
                                <li  style="border-right: 1px solid #e9e9e9;">
                                    <span class="border-btn operate-btn" onclick="del(3)">取关</span>
                                </li>
                            </ul>
                        </li>
                        <li id="4">
                            <ul class="list-ul second-li">
                                <li style="border-left: 1px solid #e9e9e9;"><a onclick="clickA()">SH600008</a></li>
                                <li><a>首创股份</a></li>
                                <li>6.25</li>
                                <li class="increase">+0.27</li>
                                <li class="increase">+5.12%</li>
                                <li>6.22%</li>
                                <li  style="border-right: 1px solid #e9e9e9;">
                                    <span class="border-btn operate-btn" onclick="del(4)">取关</span>
                                </li>
                            </ul>
                        </li>
                        <li id="5">
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>SH600135</a></li>
                                <li><a>乐凯胶片</a></li>
                                <li>18.08</li>
                                <li class="increase">+0.80</li>
                                <li class="increase">+4.63%</li>
                                <li>6.22%</li>
                                <li  style="border-right: 1px solid #e9e9e9;">
                                    <span class="border-btn operate-btn" onclick="del(5)">取关</span>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
