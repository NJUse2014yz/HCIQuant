<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>量化学堂</title>
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <link href="../../css/common/navbar.css" rel="stylesheet">
    <link href="../../css/common/common.css" rel="stylesheet">
    <link href="../../css/block/learn.css" rel="stylesheet">
</head>
<body>
<%@include file="../first/navBar.jsp"%>

<div class="container-fluid main-content">
    <div class="study-home"><div class="hp-school-placard">
        <img src="../../img/study_board.png" alt="">
        <div class="title">
            <h2>股票量化学堂</h2>
            <p>帮你从量化小白进阶为高手</p>
        </div>
    </div>

        <div class="hp-school-step">
            <div class="hp-school-block" data-name="getting-started" onclick="get_start()">
                <img src="../../img/learn/new.png" alt="">
                <div>
                    <h3>新手上路</h3>
                    <p>介绍量化基础知识，<br>介绍优矿平台相关信息；<br>手把手教你如何在优矿写出量化策略。</p>
                </div>
            </div>
            <div class="hp-school-block" data-name="strategy-example">
                <img src="../../img/learn/strategy.png" alt="">
                <div>
                    <h3>指标概览</h3>
                    <p>常见的指标的入门分析，<br>MCDA、KSI、OBV等等，<br>无成本精通各种指标。</p>
                </div>
            </div>
        </div>
        <div class="hp-school-step" style="margin:35px auto 35px">
            <div class="hp-school-block" data-name="strategy-example" onclick="get_stratety()">
                <img src="../../img/learn/advance.png" alt="">
                <div>
                    <h3>策略样例</h3>
                    <p>常见的量化策略的入门样例，<br>均线、因子、择时等等，<br>帮助新手更便捷的打开应用之路。</p>
                </div>
            </div>

            <div class="hp-school-block comingsoon" data-name="">
                <img src="../../img/learn/advance.png" alt="">
                <div>
                    <h3>进阶之旅</h3>
                    <!-- <p>量化分析师的Python日记，<br/>优矿出品，必属精品；<br/>大神教你在优矿用Python玩转量化。</p> -->
                    <p>敬请期待...</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../../js/jquery-3.1.1.min.js"></script>
<script src="../../js/bootstrap.js"></script>
<script src="../../js/learn.js"></script>
</body>
</html>
