<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>股票对比</title>
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/common/navbar.css" rel="stylesheet">
    <link href="../css/common/common.css" rel="stylesheet">
    <link href="../css/first/compare.css" rel="stylesheet">
</head>
<body>
    <%@include file="first/navBar.jsp"%>

    <div class="container-fluid main-content">
        <div class="row content-row">
            <div class="row list-row input-row"> 
           		<div class="title">
                    <span>股票选择</span>
                </div> 
	           <div class="input-stock">
	                <div class="left">
	                  	<input class="stock" placeholder="股票代码或名称"/>
	                </div>
					<div class="right">
						<input class="stock" placeholder="股票代码或名称" />

					</div>
					
					
					<div  class="compare" >对比</div>
					
				</div>
                
                <div class="title mt">
                    <span>今日数据对比</span>
                </div>
                
                
                
                
                
                
                <div class="title mt">
                    <span>七日数据对比</span>
                </div>
                
                <div class="chart mt">
                	<div id="price" class="box"></div>
                	<div id="exchange" class="box"></div>    
                </div>
                
                
                <div class="title mt">
                    <span>指标对比</span>
                </div>
                
            </div>
            
            
                
                
           
    	</div>
    </div>

    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="/HCIQuant/js/echarts.min.js"></script>
    <script src="/HCIQuant/js/compare/price.js"></script>
    <script src="/HCIQuant/js/compare/exchange.js"></script>
    <script>
		$(function(){
			price();
			exchange();
		})
	
		
	</script>
</body>


	
</html>
