/**
 * Created by dell on 2017/4/11.
 */
function paintTab(id,name){
//图表渲染的容器对象
    var chartContainer = document.getElementById(id);
    //加载图表
    var myChart = echarts.init(chartContainer);
    //var line_color='#24936e';
    myChart.setOption(option = {
        title: {
            text: 'BIAS图'
        },
        tooltip : {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                label: {
                    backgroundColor: '#6a7985'
                }
            }
        },
        legend: {
            data:['BIAS1','BIAS2','BIAS3']
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                data : ['2017/03/12','2017/03/13','2017/03/14','2017/03/15','2017/03/16','2017/03/17','2017/03/18']
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'BIAS1',
                type:'line',
                // stack: '总量',
                // areaStyle: {normal: {}},
                data:[2.5, 3.76, -3.34, -5.23, 10.51, 0.3, -2.23]
            },
            {
                name:'BIAS2',
                type:'line',
                // stack: '总量',
                // areaStyle: {normal: {}},
                data:[-2.5, -3.76, 4.34, -8.23, 6.51, 2.3, -4.23]
            },
            {
                name:'BIAS3',
                type:'line',
                // stack: '总量',
                // areaStyle: {normal: {}},
                data:[7.74, -2.46, -3.97, 5.43, 2.51, -0.35, -4.23]
            }

        ]

    });



}