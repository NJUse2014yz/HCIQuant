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
    <link href="../css/block/all_block.css" rel="stylesheet">
    
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="/HCIQuant/js/echarts.min.js"></script>
    <script src="/HCIQuant/js/compare/price.js"></script>
    <script src="/HCIQuant/js/compare/exchange.js"></script>
    <script src="/HCIQuant/js/compare/rsi.js"></script>
    <script src="/HCIQuant/js/compare/bias.js"></script>
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
	                  	<input class="stock" placeholder="${stock1 }"/>
	                </div>
					<div class="right">
						<input class="stock" placeholder="${stock2 }" />

					</div>
					
					
					<div  class="compare" >对比</div>
					
				</div>
                
                
                
            </div>
            
            <div class="row list-row">
            	<div class="title mt">
                    <span>今日数据对比</span>
                </div>
            	<div class="col-md-12" style="padding-left:0">
            		<div class="industry-table">
                    <ul>
                        <li>
                            <ul class="head-ul">
                                <li class="name" style="border-left: 1px solid #e9e9e9;border-top-left-radius: 5px;">股票代码</li>
                                <li class="num">名称</li>
                                <li class="status" >开盘价</li>
                                <li class="name" >收盘价</li>
                                <li class="num">涨幅</li>
                                
                                <li class="num"  style="border-right: 1px solid #e9e9e9;border-top-right-radius: 5px;">市盈率</li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;">sh600043</li>
                                <li><a>${stock1 }</a></li>
                                <li>10.3</li>
                                <li>11.9</li>
                                <li class="increase">+10.07%</li>
                                
                               
                                <li style="border-right: 1px solid #e9e9e9;">312%</li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-ul">
                                <li style="border-left: 1px solid #e9e9e9;">sh602378</li>
                                <li><a>${stock2}</a></li>
                                <li>7</li>
                                <li>6.4</li>
                                <li class="reduce">-7.4%</li>
                                
                               
                                <li style="border-right: 1px solid #e9e9e9;">125%</li>
                            </ul>
                        </li>
                       </ul>
                </div>
            </div>
            	</div>
            </div>
            
            <div class="row list-row">    
                <div class="title mt">
                    <span>七日数据对比</span>
                </div>
            	<div class="chart mt">
                	<div id="price" class="box"></div>
                	<div id="exchange" class="box"></div>    
                </div>
            </div>   
            <div class="row list-row">    
                <div class="title mt">
                    <span>指标对比</span>
                </div>
                <div class="chart mt">
            	<div id="rsi" class="box"></div>
                <div id="bias" class="box"></div>
                
                </div>
            </div> 
              
             
    	</div>
    </div>

    
    <script>
		$(function(){
			price();
			exchange();
			rsi();
			bias("${stock1}","${stock2}");
		})
	
		
	</script>
</body>


	
</html>
