function exchange() {
	var myChart = echarts.init(document.getElementById('exchange'));
	
	option = {
		    title: {
		        text: '换手率'
		    },
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['腾讯控股','百度']
		    },
		    toolbox: {
		        show: true,
		        feature: {
		            dataZoom: {
		                yAxisIndex: 'none'
		            },
		            dataView: {readOnly: false},
		            magicType: {type: ['line', 'bar']},
		            restore: {},
		            saveAsImage: {}
		        }
		    },
		    xAxis:  {
		        type: 'category',
		        boundaryGap: false,
		        data: ['周一','周二','周三','周四','周五','周六','周日']
		    },
		    yAxis: {
		        type: 'value',
		        axisLabel: {
		            formatter: '{value} %'
		        }
		    },
		    series: [
		        {
		            name:'腾讯控股',
		            type:'line',
		            data:[3, 5, 7, 4, 3, 2, 4],
		            markPoint: {
		                data: [
		                    {type: 'max', name: '最大值'},
		                    {type: 'min', name: '最小值'}
		                ]
		            },
		            
		        },
		        {
		            name:'百度',
		            type:'line',
		            data:[4, 3, 6, 5, 5, 4, 2],
		            markPoint: {
		                data: [
		                    {type: 'max', name: '最大值'},
		                    {type: 'min', name: '最小值'}
		                ]
		            },
		            
		        }
		    ]
		};
	
	myChart.setOption(option);
}
