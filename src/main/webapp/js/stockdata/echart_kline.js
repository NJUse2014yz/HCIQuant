/**
 * Created by dell on 2017/4/8.
 */
function paintKLine(id, stockId) {

    $.getJSON('/HCIQuant/getKLineData?id=' + stockId, function (rawData) {

        var data = splitData(rawData);
        //alert("here is :"+data.categoryData[0]+data.values[0]);

        //图表渲染的容器对象
        var chartContainer = document.getElementById(id);
        //加载图表
        var myChart = echarts.init(chartContainer);
        //var myChart = echarts.init(document.getElementById(id));
        //alert(myChart.toString);
        myChart.setOption(option = {
            backgroundColor: '#eee',
            animation: false,
            title:{
                show:true,
                text:"k线图",
                padding:15,
                //textAlign:left,
                textStyle:{
                    color:'#333',
                    fontSize:24,
                    fontWeight:'lighter'
                },
                //borderColor:'#666'
            },
            legend: {
                bottom: 10,
                left: 'center',
                data: ['Dow-Jones index', 'MA5', 'MA10', 'MA20', 'MA30']
            },
            tooltip: {
                show:true,
                trigger: 'axis',
                axisPointer: {
                    type: 'cross'
                },
                backgroundColor: 'rgba(245, 245, 245, 0.8)',
                borderWidth: 1,
                borderColor: '#ccc',
                padding: 10,
                textStyle: {
                    color: '#000'
                },
                position: function (pos, params, el, elRect, size) {
                    var obj = {top: 10};
                    obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30;
                    return obj;
                },
                //position: function (pos, params, dom, rect, size) {
                //    // 鼠标在左侧时 tooltip 显示到右侧，鼠标在右侧时 tooltip 显示到左侧。
                //    var obj = {top: 60};
                //    obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 5;
                //    return obj;
                //},
                extraCssText: 'width: 170px'
            },
            axisPointer: {
                link: {xAxisIndex: 'all'},
                label: {
                    backgroundColor: '#777'
                }
            },
            toolbox: {
                feature: {
                    dataZoom: {
                        yAxisIndex: false
                    },
                    brush: {
                        type: ['lineX', 'clear']
                    }
                }
            },
            brush: {
                xAxisIndex: 'all',
                brushLink: 'all',
                outOfBrush: {
                    colorAlpha: 0.1
                }
            },
            grid: [
                {
                    left: '10%',
                    right: '8%',
                    height: '50%'
                },
                {
                    left: '10%',
                    right: '8%',
                    top: '63%',
                    height: '16%'
                }
            ],
            xAxis: [
                {
                    type: 'category',
                    data: data.categoryData,
                    scale: true,
                    boundaryGap: false,
                    axisLine: {onZero: false},
                    splitLine: {show: false},
                    splitNumber: 20,
                    min: 'dataMin',
                    max: 'dataMax',
                    axisPointer: {
                        z: 100
                    }
                },
                {
                    type: 'category',
                    gridIndex: 1,
                    data: data.categoryData,
                    scale: true,
                    boundaryGap: false,
                    axisLine: {onZero: false},
                    axisTick: {show: false},
                    splitLine: {show: false},
                    axisLabel: {show: false},
                    splitNumber: 20,
                    min: 'dataMin',
                    max: 'dataMax',
                    axisPointer: {
                        label: {
                            formatter: function (params) {
                                var seriesValue = (params.seriesData[0] || {}).value;
                                return params.value
                                    + (seriesValue != null
                                            ? '\n' + echarts.format.addCommas(seriesValue)
                                            : ''
                                    );
                            }
                        }
                    }
                }
            ],
            yAxis: [
                {
                    scale: true,
                    splitArea: {
                        show: true
                    }
                },
                {
                    scale: true,
                    gridIndex: 1,
                    splitNumber: 2,
                    axisLabel: {show: false},
                    axisLine: {show: false},
                    axisTick: {show: false},
                    splitLine: {show: false}
                }
            ],
            dataZoom: [
                {
                    type: 'inside',
                    xAxisIndex: [0, 1],
                    start: 98,
                    end: 100
                },
                {
                    show: true,
                    xAxisIndex: [0, 1],
                    type: 'slider',
                    top: '85%',
                    start: 98,
                    end: 100
                }
            ],
            series: [
                {
                    name: '上证股票',
                    type: 'candlestick',
                    data: data.values,
                    itemStyle: {
                        normal: {
                            borderColor: null,
                            borderColor0: null
                        }
                    },
                    tooltip: {
                        formatter: function (param) {
                            param = param[0];
                            return [
                                'Date: ' + param.name + '<hr size=1 style="margin: 3px 0">',
                                'Open: ' + param.data[0] + '<br/>',
                                'Close: ' + param.data[1] + '<br/>',
                                'Lowest: ' + param.data[2] + '<br/>',
                                'Highest: ' + param.data[3] + '<br/>'
                            ].join('');
                        }
                    }
                },
                {
                    name: 'MA5',
                    type: 'line',
                    data: calculateMA(5, data),
                    smooth: true,
                    lineStyle: {
                        normal: {opacity: 0.5}
                    }
                },
                {
                    name: 'MA10',
                    type: 'line',
                    data: calculateMA(10, data),
                    smooth: true,
                    lineStyle: {
                        normal: {opacity: 0.5}
                    }
                },
                {
                    name: 'MA20',
                    type: 'line',
                    data: calculateMA(20, data),
                    smooth: true,
                    lineStyle: {
                        normal: {opacity: 0.5}
                    }
                },
                {
                    name: 'MA30',
                    type: 'line',
                    data: calculateMA(30, data),
                    smooth: true,
                    lineStyle: {
                        normal: {opacity: 0.5}
                    }
                },
                {
                    name: 'Volumn',
                    type: 'bar',
                    xAxisIndex: 1,
                    yAxisIndex: 1,
                    data: data.volumns
                }
            ]
        }, true);

        // myChart.on('brushSelected', renderBrushed);

        // function renderBrushed(params) {
        //     var sum = 0;
        //     var min = Infinity;
        //     var max = -Infinity;
        //     var countBySeries = [];
        //     var brushComponent = params.brushComponents[0];

        //     var rawIndices = brushComponent.series[0].rawIndices;
        //     for (var i = 0; i < rawIndices.length; i++) {
        //         var val = data.values[rawIndices[i]][1];
        //         sum += val;
        //         min = Math.min(val, min);
        //         max = Math.max(val, max);
        //     }

        //     panel.innerHTML = [
        //         '<h3>STATISTICS:</h3>',
        //         'SUM of open: ' + (sum / rawIndices.length).toFixed(4) + '<br>',
        //         'MIN of open: ' + min.toFixed(4) + '<br>',
        //         'MAX of open: ' + max.toFixed(4) + '<br>'
        //     ].join(' ');
        // }

        myChart.dispatchAction({
            type: 'brush',
            areas: [
                {
                    brushType: 'lineX',
                    coordRange: ['2017-02-23', '2017-03-07'],
                    xAxisIndex: 0
                }
            ]
        });
    });
    myChart.showLoading("加载中。。。");

}

function splitData(rawData) {
    var categoryData = [];
    var values = [];
    var volumns = [];
    for (var i = 0; i < rawData.length; i++) {
        //categoryData.push(rawData[i].splice(0, 1)[0]);
        categoryData.push(rawData[i]["date"]);
        //values.push(rawData[i]);
        values.push([
                //rawData[i]["date"],
            parseFloat(rawData[i]["openPrice"]), // open
            parseFloat(rawData[i]["closePrice"]), // high
            parseFloat(rawData[i]["lowPrice"]), // low
            parseFloat(rawData[i]["highPrice"]), // close
            parseInt(rawData[i]["volume"])
            ]
        );
        volumns.push(parseInt(rawData[i]["volume"]));
    }
    return {
        categoryData: categoryData,
        values: values,
        volumns: volumns
    };
}

function calculateMA(dayCount, data) {
    var result = [];
    for (var i = 0, len = data.values.length; i < len; i++) {
        if (i < dayCount) {
            result.push('-');
            continue;
        }
        var sum = 0;
        for (var j = 0; j < dayCount; j++) {
            sum += data.values[i - j][1];
        }
        result.push(+(sum / dayCount).toFixed(3));
    }
    return result;
}