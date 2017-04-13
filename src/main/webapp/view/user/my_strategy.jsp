<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>我的策略</title>
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <link href="../../css/common/navbar.css" rel="stylesheet">
    <link href="../../css/common/common.css" rel="stylesheet">
    <link href="../../css/block/new.css" rel="stylesheet">
    <link href="../../css/block/all_block.css" rel="stylesheet">
    <link href="../../css/block/my_thing.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script>
        function clickA() {
            window.location.href="scan";
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
                <span>我的策略</span>
            </div>
            <div class="row block-list-row">
                <div class="industry-table">
                    <ul>
                        <li>
                            <ul class="head-ul">
                                <li style="border-left: 1px solid #e9e9e9;border-top-left-radius: 5px;">名称</li>
                                <li>当日收益率</li>
                                <li>累计收益率</li>
                                <li>开始日期</li>
                                <li>停止日期</li>
                                <li>状态</li>
                                <li style="border-right: 1px solid #e9e9e9;">
                                    操作
                                </li>
                            </ul>
                        </li>
                        <li id="1">
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a onclick="clickA()">策略1</a></li>
                                <li>2.03%</li>
                                <li>16.12%</li>
                                <li>2017/04/11</li>
                                <li>2017/04/14</li>
                                <li>开盘中</li>
                                <li  style="border-right: 1px solid #e9e9e9;">
                                    <span class="border-btn operate-btn" onclick="del(1)">删除</span>
                                </li>
                            </ul>
                        </li>
                        <li id="2">
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a  onclick="clickA()">策略2</a></li>
                                <li>0.03%</li>
                                <li>7.12%</li>
                                <li>2017/04/11</li>
                                <li>2017/04/14</li>
                                <li>开盘中</li>
                                <li  style="border-right: 1px solid #e9e9e9;">
                                    <span class="border-btn operate-btn" onclick="del(2)">删除</span>
                                </li>
                            </ul>
                        </li>
                        <li id="3">
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a onclick="clickA()">策略3</a></li>
                                <li>3.13%</li>
                                <li>19.12%</li>
                                <li>2017/04/11</li>
                                <li>2017/04/14</li>
                                <li>开盘中</li>
                                <li  style="border-right: 1px solid #e9e9e9;">
                                    <span class="border-btn operate-btn" onclick="del(3)">删除</span>
                                </li>
                            </ul>
                        </li>
                        <li id="4">
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a onclick="clickA()">策略4</a></li>
                                <li>1.78%</li>
                                <li>12.12%</li>
                                <li>2017/04/11</li>
                                <li>2017/04/14</li>
                                <li>开盘中</li>
                                <li  style="border-right: 1px solid #e9e9e9;">
                                    <span class="border-btn operate-btn" onclick="del(4)">删除</span>
                                </li>
                            </ul>
                        </li>
                        <li id="5">
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a onclick="clickA()">策略5</a></li>
                                <li>3.03%</li>
                                <li>9.12%</li>
                                <li>2017/04/11</li>
                                <li>2017/04/14</li>
                                <li>开盘中</li>
                                <li  style="border-right: 1px solid #e9e9e9;">
                                    <span class="border-btn operate-btn" onclick="del(5)">删除</span>
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
