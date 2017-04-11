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
    <link href="../../css/block/block.css" rel="stylesheet">
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
                    <div class="col-lg-4 col-md-4 top-show" style="text-align:left; padding-left:43px;"><a>雄安新区</a></div>
                    <div class="col-lg-4 col-md-4 top-show" style="padding-left: 15px">涨股数：<span class="increase">&nbsp;&nbsp;&nbsp;68&nbsp;&nbsp;&nbsp;</span></div>
                    <div class="col-lg-4 col-md-4 top-show">跌股数：<span class="reduce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
                </div>
                <div class="row block-line block-line-last">
                    <div class="col-lg-4 col-md-4 top-show">今日板块领涨股：<a>万通地产</a></div>
                    <div class="col-lg-4 col-md-4 top-show">涨跌额：<span class="increase">+0.59</span></div>
                    <div class="col-lg-4 col-md-4 top-show">涨跌幅：<span class="increase">10.09%</span></div>
                </div>
                <div class="row block-line block-line-last">
                    <div class="col-lg-4 col-md-4 top-show">今日板块领跌股：<a>沧州明珠</a></div>
                    <div class="col-lg-4 col-md-4 top-show">涨跌额：<span class="reduce">-0.42</span></div>
                    <div class="col-lg-4 col-md-4 top-show">涨跌幅：<span class="reduce">-1.48%</span></div>
                </div>
            </div>
        </div>
        <div class="row list-row input-row"> 
            <div class="more">
                <span>更多 >></span>
            </div>
            <div class="title">
                <span>个股列表</span>
            </div>
            <div class="row block-list-row">
                <div class="industry-table">
                    <ul>
                        <li>
                            <ul class="head-ul">
                                <li style="border-left: 1px solid #e9e9e9;border-top-left-radius: 5px;">股票代码</li>
                                <li>股票名称</li>
                                <li>当前价</li>
                                <li>涨跌额</li>
                                <li>涨跌幅</li>
                                <li style="border-right: 1px solid #e9e9e9;">换手率</li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>SH600246</a></li>
                                <li><a>万通地产</a></li>
                                <li>6.12</li>
                                <li class="increase">+0.56</li>
                                <li class="increase">+10.07%</li>
                                <li>6.22%</li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul second-li">
                                <li style="border-left: 1px solid #e9e9e9;"><a>SH002342</a></li>
                                <li><a>巨力索具</a></li>
                                <li>11.40</li>
                                <li class="increase">+1.04</li>
                                <li class="increase">+10.04%</li>
                                <li>0.40%</li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>SH000600</a></li>
                                <li><a>建投能源</a></li>
                                <li>13.15</li>
                                <li class="increase">+1.20</li>
                                <li class="increase">+10.03%</li>
                                <li>3.69%</li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul second-li">
                                <li style="border-left: 1px solid #e9e9e9;"><a>SH600008</a></li>
                                <li><a>首创股份</a></li>
                                <li>6.25</li>
                                <li class="increase">+0.27</li>
                                <li class="increase">+5.12%</li>
                                <li>6.22%</li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>SH600135</a></li>
                                <li><a>乐凯胶片</a></li>
                                <li>18.08</li>
                                <li class="increase">+0.80</li>
                                <li class="increase">+4.63%</li>
                                <li>6.22%</li>
                            </ul>
                        </li>

                </div>
            </div>
        </div>
        <div class="row list-row input-row"> 
            <div class="more">
                <span>更多 >></span>
            </div>
            <div class="title">
                <span>板块资讯</span>
            </div>
            <div class="row block-row">
                <div class="row">
                    <ul>
                        <li>
                            <ul class="new-ul"><a>
                                <li class="new-li left">收评：沪指涨0.24%重回3100点收官 2016全年跌幅12.31%</li>
                                <li class="new-li right">2017/04/14</li>
                            </a></ul>
                        </li>
                        <li>
                            <ul class="new-ul"><a>
                                <li class="new-li left">开盘：沪指小幅低开失守3100 权重萎靡题材股乏力</li>
                                <li class="new-li right">2017/04/14</li>
                            </a></ul>
                        </li>
                        <li>
                            <ul class="new-ul"><a>
                                <li class="new-li left">收评：两市成交量萎缩明显 资金市场再现紧张局面</li>
                                <li class="new-li right">2017/04/13</li>
                            </a></ul>
                        </li>
                        <li>
                            <ul class="new-ul"><a>
                                <li class="new-li left">收评：沪指走弱再次靠近3100点 两市热点匮乏</li>
                                <li class="new-li right">2017/04/13</li>
                            </a></ul>
                        </li>
                        <li>
                            <ul class="new-ul"><a>
                                <li class="new-li left">午评：沪指缩量震荡下跌0.61% 强势股集体走弱</li>
                                <li class="new-li right">2017/04/12</li>
                            </a></ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
