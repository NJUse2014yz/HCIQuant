<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	<title>导航栏</title>
	<link href="${pageContext.request.contextPath}/css/first/navBar.css" type="text/css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/first/search.css" />
	
	<%--<script src="../js/jquery-3.1.1.min.js"></script>--%>
	<script src="${pageContext.request.contextPath}/js/cookie.js"></script>
	</head>
	
	<body>
	
		<div class="top">
		
		<div class="logo">
			<img alt="" src="../../img/common/logo.png">
		</div>	
	
		<div class="stock-search">
			<div id="sb-search" class="search">
				<input id="stock-search"  placeholder="股票代码或名称">
				<button onclick="search()"></button>
			</div>
		</div>
		
		<div class="container">
			<ul class="menu">
				<li><a href="first">首页</a></li>
				<li><a href="#">股票数据</a>
					<ul class="submenu">
						<li><a href="allstock">全部</a></li>
						<li><a href="indexInfo?id=sh000001">上证指数</a></li>
						<li><a href="indexInfo?id=sz399001">深证成指</a></li>
						<li><a href="compare">股票对比</a></li>
						<li><a href="learn">股票学堂</a></li>
					</ul>
				</li>
				<li class="active"><a href="#s2">指标策略</a>
					<ul class="submenu">
						<li><a href="anlysis">指标分析</a></li>
						<li><a href="make">策略分析</a></li>
					</ul>
				</li>
				<li><a href="#">板块统计</a>
					<ul class="submenu">
						<li><a href="all_block">板块统计</a></li>
					</ul>
				</li>
				<li><a href="#">个人空间</a>
					<ul class="submenu">
						<li><a href="my_stock">我的股票</a></li>
						<li><a href="my_strategy">我的策略</a></li>
						<li><a href="person_zone">我的信息</a></li>
					</ul>
				</li>
			</ul>	
		</div>
		
		<div id="login-area">
			<!--未登陆的界面 -->
			
			
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
			
			function search(){
				var stock=$("input#stock-search").val();
				if(stock=="")
					return;
				window.location.href="/HCIQuant/stockInfo?id="+stock;
			}
			
			//判断是否已经登录
			function showUserInfo(){
				var userName=getCookie("userName");
				
				if(userName!='""'){
					//显示头像
					
					$("#login-area").append("<img class='user' src='../img/first/user.jpg' />");
				}
				else{
					//显示登录注册
					$("#login-area").append("<div class='unlogin'><div class='header-signup'><a href='${pageContext.request.contextPath}/askForRegister.action'>注册</a></div>	<div class='header-signin'><a class='login' href='${pageContext.request.contextPath}${pageContext.request.contextPath}/login'>登录</a></div>			</div>");
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


