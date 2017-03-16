<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	<title>导航栏</title>
	<link href="${pageContext.request.contextPath}/css/first/navBar.css" type="text/css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/first/search.css" />
	
	
	<script src="/HCIQuant/js/cookie.js"></script>
	</head>
	
	<body>
	
		<div class="top">
		
		<div class="logo">
			<img alt="" src="${pageContext.request.contextPath}/img/common/logo.png">
		</div>	
	
		<div class="stock-search">
			<div id="sb-search" class="search">
				<input  placeholder="股票代码或名称">
				<button></button>
			</div>
		</div>
		
		<div class="container">
			<ul class="menu">
				<li><a href="${pageContext.request.contextPath}${pageContext.request.contextPath}/first">首页</a></li>
				<li><a href="#">股票数据</a>
					<ul class="submenu">
						<li><a href="/AnyQuant_web/stock.action">全部</a></li>
						<li><a href="/AnyQuant_web/stockInfo.action?id=sh000001">上证指数</a></li>
						<li><a href="/AnyQuant_web/stockInfo.action?id=sz399001">深证成指</a></li>
						<li><a href="/AnyQuant_web/compare.action">股票对比</a></li>
					</ul>
				</li>
				<li class="active"><a href="#s2">指标策略</a>
					<ul class="submenu">
						<li><a href="/AnyQuant_web/analysis.action?id=sh600000">指标分析</a></li>
						<li><a href="/AnyQuant_web/strategy.action?id=sh600000">单股策略</a></li>
						<li><a href="#">多股策略</a></li>
					</ul>
				</li>
				<li><a href="#">板块统计</a>
					<ul class="submenu">
						<li><a href="/AnyQuant_web/industry.action">板块分析</a></li>
					</ul>
				</li>
				<li><a href="#">个人空间</a>
					<ul class="submenu">
						<li><a href="/AnyQuant_web/personalStock.action">我的股票</a></li>
						<li><a href="#">我的策略</a></li>
						<li><a href="#">我的信息</a></li>
					</ul>
				</li>
			</ul>	
		</div>
		
		<div id="login-area">
			<!--未登陆的界面 -->
			<div class="unlogin">
				<div class="header-signup">
                    <a href="${pageContext.request.contextPath}/askForRegister.action">注册</a>
                </div>	
				<div class="header-signin">
                    <a class="login" href="${pageContext.request.contextPath}${pageContext.request.contextPath}/login">登录</a>
                </div>			
			</div>
			
			<!-- 已登录的界面 -->
			<!-- <ul class="logined">
				<li class="header-signup">
                    <a class="logout">注销</a>
                </li>	
				<li id="signined" class="header-signin">
                    <a>已登录</a>
                </li>	
			
			</ul> -->
		</div>
		</div>
		
		<script type="text/javascript">
			$(function(){
				showUserInfo();
			});
			//判断是否已经登录
			function showUserInfo(){
				var userName=getCookie("userName");

				if(userName!='""'){
					//显示头像
				}
				else{
					//显示登录注册
				}
					
			}
			//注销
			$(".logout").click(function(){
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/logout.action',
					data:'',
					success:function(data){
						showUserInfo();
					}
				});
			});
		</script>
		
		
		
	</body>
</html>


