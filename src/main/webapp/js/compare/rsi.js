function rsi(stock1,stock2) {
	var myChart = echarts.init(document.getElementById('rsi'));
	
	option = {
		    title: {
		        text: 'rsi'
		    },
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		        data:[stock1,stock2]
		    },
		    
		    xAxis:  {
		        type: 'category',
		        boundaryGap: false,
		        data: ['周一','周二','周三','周四','周五','周六','周日']
		    },
		    yAxis: {
		        type: 'value',
		        axisLabel: {
		            formatter: '{value}%'
		        }
		    },
		    series: [
		        {
		            name:stock1,
		            type:'line',
		            data:[65, 75, 77, 74, 68, 62, 74],
		            
		            
		        },
		        {
		            name:stock2,
		            type:'line',
		            data:[44, 46,53, 45, 45, 44, 52],
		            
		            
		        }
		    ]
		};
	
	myChart.setOption(option);
}
