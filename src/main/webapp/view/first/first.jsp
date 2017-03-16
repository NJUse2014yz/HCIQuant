<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/first/first.css" />
<title>首页</title>
</head>
<body>

	<div>
		<img alt="" src="${pageContext.request.contextPath}/img/first/top_banner.jpg">
	</div>
	<%@include file="navBar.jsp"%>
	
	<div class="slogan">
		<div class="title">优矿，您的私人量化平台</div>
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
					<p>专业版新增事件研究功能、自定义因子的信号分析功能，详见专业版客户端。</p>
				</div>
				
				<div class="item">
					<span>2017-3-11</span>
					<p>专业版新增事件研究功能</p>
				</div>
				
				<div class="item">
					<span>2017-3-11</span>
					<p>专业版新增事件研究功能、自定义因子的信号分析功能。</p>
				</div>
				
				<div class="item">
					<span>2017-3-11</span>
					<p>专业版新增事件研究功能、自定义因子的信号分析功能。</p>
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
					<p>专业版新增事件研究功能、自定义因子的信号分析功能，详见专业版客户端。</p>
				</div>
				
				<div class="item">
					<span>顺丰快递</span>
					<p>专业版新增事件研究功能</p>
				</div>
				
				<div class="item">
					<span>中国石油</span>
					<p>专业版新增事件研究功能、自定义因子的信号分析功能。</p>
				</div>
				
				<div class="item">
					<span>中国石油</span>
					<p>专业版新增事件研究功能、自定义因子的信号分析功能。</p>
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