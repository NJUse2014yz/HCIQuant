function price(stock1,stock2) {
	var myChart = echarts.init(document.getElementById('price'));
	option = {
		title : {
			text : '股价',

		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ stock1, stock2 ]
		},
		
		calculable : true,
		xAxis : [ {
			type : 'category',
			boundaryGap : false,
			data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
		} ],
		yAxis : [ {
			type : 'value',
			axisLabel : {
				formatter : '{value} 元'
			}
		} ],
		series : [ {
			name : stock1,
			type : 'line',
			data : [ 11, 11, 15, 13, 10, 12, 13 ],
			markPoint : {
				data : [ {
					type : 'max',
					name : '最大值'
				}, {
					type : 'min',
					name : '最小值'
				} ]
			},
			markLine : {
				data : [ {
					type : 'average',
					name : '平均值'
				} ]
			}
		}, {
			name : stock2,
			type : 'line',
			data : [ 6, 3, 5, 7, 6, 8, 7 ],
			markPoint : {
				data : [ {
					type : 'max',
					name : '最大值'
				}, {
					type : 'min',
					name : '最小值'
				} ]
			},
			markLine : {
				data : [ {
					type : 'average',
					name : '平均值'
				} ]
			}
		} ]
	};
	myChart.setOption(option);
}
