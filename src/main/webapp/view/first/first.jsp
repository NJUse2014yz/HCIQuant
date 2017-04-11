<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="utf-8"%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/first/first.css" />
	<script src="../js/jquery-3.1.1.min.js"></script>
<title>首页</title>
</head>
<body>

	<div>
		<img alt="" src="${pageContext.request.contextPath}/img/first/top_banner.jpg">
	</div>
	<%@include file="navBar.jsp"%>
	
	<div class="slogan">
		<div class="title">AnyQuant，您的私人量化平台</div>
		<p>打破金融量化的壁垒，为量化研究者提供媲美华尔街专业机构的研究装备</p>
	</div>
	
	<div class="news-section">
		<div class="news">
			<div class="title">
				<h3>新闻</h3>
				
			</div>
			
			<div class="body">
				<div class="item">
					<span>2017-3-11</span>
					<p>首部境外投资条例有望年内出台</p>
				</div>
				
				<div class="item">
					<span>2017-3-11</span>
					<p>北京新规：不动产权证将对通道记载</p>
				</div>
				
				<div class="item">
					<span>2017-3-11</span>
					<p>沪指涨0.33%两连阳 国金:春季行情延续</p>
				</div>
				
				<div class="item">
					<span>2017-3-11</span>
					<p>市场钱紧再现！逾两万亿缺口待补 银行融资已受限</p>
				</div>
			</div>
		</div>
		
		<div class="news">
			<div class="title">
				<h3>股票推荐</h3>
				
			</div>
			
			<div class="body">
				<div class="item">
					<span>腾讯控股</span>
					<p>缩量攻第二日，新高区需防范急回杀</p>
				</div>
				
				<div class="item">
					<span>顺丰控股</span>
					<p>业绩超承诺利润,紧控成本提升盈利能力</p>
				</div>
				
				<div class="item">
					<span>百度</span>
					<p>人工智能是一个巨大机遇，为互联网和传统行业带来革命性的变化</p>
				</div>
				
				<div class="item">
					<span>中国联通</span>
					<p>移动数据业务增长的基础坚固潜力巨大,大数据和物联网已在快速发展且未来发展的空间巨大</p>
				</div>
			</div>
		</div>
	
	</div>

	<div class="introduction-section grey">
		<img alt="" src="${pageContext.request.contextPath}/img/first/img01.png" class="showimg1">
		<div class="intro">
			<h3>海量金融大数据</h3>
			<p>高质量的海量金融数据支撑，轻松实现大数据时代的交易策略</p>
		</div>
	</div>
	
	<div class="introduction-section">
		<img alt="" src="${pageContext.request.contextPath}/img/first/img02.png" class="showimg2">
		<div class="intro2">
			<h3>云端平台，极速回测</h3>
			<p>稳定、安全、高可扩展的云平台，零门槛获得华尔街专业级别量化研究装备</p>
		</div>
	</div>
	
	<div class="introduction-section grey">
		<img alt="" src="${pageContext.request.contextPath}/img/first/img03.png" class="showimg1">
		<div class="intro">
			<h3>模拟交易</h3>
			<p>一键实盘模拟 ，云端托管，更有机会赢取实盘资金管理收益</p>
		</div>
	</div>
</body>
</html>