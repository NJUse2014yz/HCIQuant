function bias(stock1,stock2) {
	var myChart = echarts.init(document.getElementById('bias'));
	
	option = {
		    title: {
		        text: 'bias'
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
		            data:[23, 25, 22, 24, 28, 22, 24],
		            
		            
		        },
		        {
		            name:stock2,
		            type:'line',
		            data:[34, 36,33, 35, 35, 44, 42],
		            
		            
		        }
		    ]
		};
	
	myChart.setOption(option);
}
