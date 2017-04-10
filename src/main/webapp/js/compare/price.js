function price() {
	var myChart = echarts.init(document.getElementById('price'));
	option = {
		title : {
			text : '股价',

		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ '腾讯控股', '百度' ]
		},
		toolbox : {
			show : true,
			feature : {
				mark : {
					show : true
				},
				dataView : {
					show : true,
					readOnly : false
				},
				magicType : {
					show : true,
					type : [ 'line', 'bar' ]
				},
				restore : {
					show : true
				},
				saveAsImage : {
					show : true
				}
			}
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
			name : '腾讯控股',
			type : 'line',
			data : [ 11, 11, 15, 13, 12, 13, 10 ],
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
			name : '百度',
			type : 'line',
			data : [ 6, 3, 5, 7, 6, 8, 7 ],
			markPoint : {
				data : [ {
					name : '周最低',
					value : 3,
					xAxis : 1,
					yAxis : 3
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
