<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>板块统计</title>
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <link href="../../css/common/navbar.css" rel="stylesheet">
    <link href="../../css/common/common.css" rel="stylesheet">
    <link href="../../css/block/all_block.css" rel="stylesheet">
</head>
<body>
<%@include file="../first/navBar.jsp"%>

<div class="container-fluid main-content">
    <div class="row content-row">
        <div class="row list-row input-row"> 
            <div class="title">
                <span>板块总览</span>
            </div>
            <div class="row block-row">
                <div class="row block-line">
                    <div class="col-lg-4 col-md-4 top-show">今日热门行业板块：<a>采矿业</a></div>
                    <div class="col-lg-4 col-md-4 top-show">今日热门概念板块：概念版</div>
                    <div class="col-lg-4 col-md-4 top-show">今日热门地域板块：北京</div>
                </div>
                <div class="row block-line">
                    <div class="col-lg-4 col-md-4">今日遇冷行业板块：新闻业</div>
                    <div class="col-lg-4 col-md-4">今日遇冷概念板块：概念福</div>
                    <div class="col-lg-4 col-md-4">今日遇冷地域板块：天津</div>
                </div>
            </div>
        </div>
        <div class="row list-row input-row"> 
            <div class="title">
                <span>行业榜单</span>
            </div>
            <div class="row block-row">
                <div class="row block-line">
                    <div class="col-lg-4 col-md-4">今日热门行业板块：</div>
                    <div class="col-lg-4 col-md-4">今日热门概念板块：</div>
                    <div class="col-lg-4 col-md-4">今日热门地域板块：</div>
                </div>
                <div class="row block-line">
                    <div class="col-lg-4 col-md-4">今日遇冷行业板块：</div>
                    <div class="col-lg-4 col-md-4">今日遇冷概念板块：</div>
                    <div class="col-lg-4 col-md-4">今日遇冷地域板块：</div>
                </div>
            </div>
        </div>
        <div class="row list-row input-row"> 
            <div class="title">
                <span>行业资讯</span>
            </div>
            <div class="row block-row">
                <div class="row block-line">
                    <div class="col-lg-4 col-md-4">今日热门行业板块：</div>
                    <div class="col-lg-4 col-md-4">今日热门概念板块：</div>
                    <div class="col-lg-4 col-md-4">今日热门地域板块：</div>
                </div>
                <div class="row block-line">
                    <div class="col-lg-4 col-md-4">今日遇冷行业板块：</div>
                    <div class="col-lg-4 col-md-4">今日遇冷概念板块：</div>
                    <div class="col-lg-4 col-md-4">今日遇冷地域板块：</div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
