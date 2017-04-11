function rsi() {
	var myChart = echarts.init(document.getElementById('rsi'));
	
	option = {
		    title: {
		        text: 'rsi'
		    },
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['腾讯控股','百度']
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
		            name:'腾讯控股',
		            type:'line',
		            data:[65, 75, 77, 74, 68, 62, 74],
		            
		            
		        },
		        {
		            name:'百度',
		            type:'line',
		            data:[44, 46,53, 45, 45, 44, 52],
		            
		            
		        }
		    ]
		};
	
	myChart.setOption(option);
}
