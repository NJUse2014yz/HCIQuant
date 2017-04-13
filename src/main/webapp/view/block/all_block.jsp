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
    <link href="../../css/block/new.css" rel="stylesheet">
    <link href="../../css/block/all_block.css" rel="stylesheet">
    <script src="../../js/jquery-3.1.1.min.js"></script>
    <script>
        function clickB() {
            window.location.href="block";
        };

        function clickA() {
            window.location.href="stockInfo?id=sh613467";
        }

    </script>
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
                    <div class="col-lg-4 col-md-4 top-show">今日热门行业板块：<a>房地产</a></div>
                    <div class="col-lg-4 col-md-4 top-show">今日热门概念板块：<a onclick="clickB()">雄安新区</a></div>
                    <div class="col-lg-4 col-md-4 top-show">今日热门地域板块：<a>河北板块</a></div>
                </div>
                <div class="row block-line block-line-last">
                    <div class="col-lg-4 col-md-4 top-show">今日遇冷行业板块：<a>次新股</a></div>
                    <div class="col-lg-4 col-md-4 top-show">今日遇冷概念板块：<a>信息安全</a></div>
                    <div class="col-lg-4 col-md-4 top-show">今日遇冷地域板块：<a>上海板块</a></div>
                </div>
            </div>
        </div>
        <div class="row list-row input-row"> 
            <div class="more">
                <span>更多 >></span>
            </div>
            <div class="title">
                <span>行业榜单</span>
            </div>
            <div class="row block-list-row">
                <div class="industry-table">
                    <ul>
                        <li>
                            <ul class="head-ul">
                                <li class="name" style="border-left: 1px solid #e9e9e9;border-top-left-radius: 5px;">行业</li>
                                <li class="num">涨幅</li>
                                <li class="status" style="border-right: 1px solid #e9e9e9">领涨股</li>
                                <li class="name" style="border-left: 1px solid #e9e9e9">行业</li>
                                <li class="num">跌幅</li>
                                <li class="status"  style="border-right: 1px solid #e9e9e9;border-top-right-radius: 5px;">领跌股</li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>房地产</a></li>
                                <li class="increase">+10.07%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a onclick="clickA()">万通地产</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>次新股</a></li>
                                <li class="reduce">-10%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a onclick="clickA()">N龙蟠</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul second-li">
                                <li style="border-left: 1px solid #e9e9e9;"><a>钢铁开采</a></li>
                                <li class="increase">+9.1%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a onclick="clickA()">冀中能源</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>计算机</a></li>
                                <li class="reduce">-9.1%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>数字政通</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>社会服务业</a></li>
                                <li class="increase">+8.2%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>廊坊发展</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>造纸印刷</a></li>
                                <li class="reduce">-8.2%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>博汇纸业</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul second-li">
                                <li style="border-left: 1px solid #e9e9e9;"><a>非银行金融</a></li>
                                <li class="increase">+7.3%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>陕国投A</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>通信</a></li>
                                <li class="reduce">-7.3%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>远 望 谷</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>传播与文化</a></li>
                                <li class="increase">+6.4%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>力盛赛车</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>建筑和工程</a></li>
                                <li class="reduce">-6.4%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>元成股份</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row list-row input-row"> 
            <div class="more">
                <span>更多 >></span>
            </div>
            <div class="title">
                <span>概念榜单</span>
            </div>
            <div class="row block-list-row">
                <div class="industry-table">
                    <ul>
                        <li>
                            <ul class="head-ul">
                                <li class="name" style="border-left: 1px solid #e9e9e9;border-top-left-radius: 5px;">概念</li>
                                <li class="num">涨幅</li>
                                <li class="status" style="border-right: 1px solid #e9e9e9">领涨股</li>
                                <li class="name" style="border-left: 1px solid #e9e9e9">概念</li>
                                <li class="num">跌幅</li>
                                <li class="status"  style="border-right: 1px solid #e9e9e9;border-top-right-radius: 5px;">领跌股</li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul second-li">
                                <li style="border-left: 1px solid #e9e9e9;"><a>雄安新区</a></li>
                                <li class="increase">+9.1%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>唐山港</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>智能穿戴</a></li>
                                <li class="reduce">-9.1%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>康耐特</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>国债逆回购</a></li>
                                <li class="increase">+10%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>Ｒ-003</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>信息安全</a></li>
                                <li class="reduce">-10%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>蓝盾股份</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>天津自贸</a></li>
                                <li class="increase">+8.2%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>天津港</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>智能家居</a></li>
                                <li class="reduce">-8.2%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>乐金健康</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul second-li">
                                <li style="border-left: 1px solid #e9e9e9;"><a>水利建设</a></li>
                                <li class="increase">+7.3%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>青龙管业</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>智能电网</a></li>
                                <li class="reduce">-7.3%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>特锐德</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>海上丝路</a></li>
                                <li class="increase">+6.4%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>厦门港务</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>电商概念</a></li>
                                <li class="reduce">-6.4%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>力源信息</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row list-row input-row"> 
            <div class="more">
                <span>更多 >></span>
            </div>
            <div class="title">
                <span>地域榜单</span>
            </div>
            <div class="row block-list-row">
                <div class="industry-table">
                    <ul>
                        <li>
                            <ul class="head-ul">
                                <li class="name" style="border-left: 1px solid #e9e9e9;border-top-left-radius: 5px;">地域</li>
                                <li class="num">涨幅</li>
                                <li class="status" style="border-right: 1px solid #e9e9e9">领涨股</li>
                                <li class="name" style="border-left: 1px solid #e9e9e9">地域</li>
                                <li class="num">跌幅</li>
                                <li class="status"  style="border-right: 1px solid #e9e9e9;border-top-right-radius: 5px;">领跌股</li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>河北板块</a></li>
                                <li class="increase">+10%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>唐山港</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>上海板块</a></li>
                                <li class="reduce">-10%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>力盛赛车</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul second-li">
                                <li style="border-left: 1px solid #e9e9e9;"><a>重庆板块</a></li>
                                <li class="increase">+9.1%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>天域生态</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>甘肃板块</a></li>
                                <li class="reduce">-9.1%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>ST亚太</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>宁夏板块</a></li>
                                <li class="increase">+8.2%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>青龙管业</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>福建板块</a></li>
                                <li class="reduce">-8.2%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>光莆股份</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul second-li">
                                <li style="border-left: 1px solid #e9e9e9;"><a>天津板块</a></li>
                                <li class="increase">+7.3%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>银龙股份</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>陕西板块</a></li>
                                <li class="reduce">-7.3%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>中环装备</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;"><a>河南板块</a></li>
                                <li class="increase">+6.4%</li>
                                <li style="border-right: 1px solid #e9e9e9"><a>三晖电气</a></li>
                                <li style="border-left: 1px solid #e9e9e9"><a>广东板块</a></li>
                                <li class="reduce">-6.4%</li>
                                <li style="border-right: 1px solid #e9e9e9;"><a>开立医疗</a></li>
                            </ul>
                        </li>
                    </ul>
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
