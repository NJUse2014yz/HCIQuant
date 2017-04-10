/**
 * Created by dell on 2017/4/9.
 */
/**
 * Created by dell on 2017/4/9.
 */
function paintsc(id){
//图表渲染的容器对象
    var chartContainer = document.getElementById(id);
    //加载图表
    var myChart = echarts.init(chartContainer);
    var line_color='#24936e';
    myChart.setOption(option = {
        title: {
            text: '         深证成指（399001）',
            textStyle:{
                fontWeight:'lighter',
                fontSize:16,
                //color:'#777'
                color:line_color,
            },
            // textAlign:'left',
            //subtext:'￥2942.46(-2.68%)',
            //subtextStyle:{
            //    color:'#6a7985',
            //    fontSize:14
            //},
            padding:30
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
            data:'深证成指'
        },
        // toolbox: {
        //     feature: {
        //         saveAsImage: {}
        //     }
        // },
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
                show:false,
                data : ['2017/03/06','2017/03/07','2017/03/08','2017/03/09','2017/03/13','2017/03/14','2017/03/15']
            }
        ],
        yAxis : [
            {
                type : 'value',
                splitnumber:6,
                min:12900,
                //show:false,
                axisLine:{
                    lineStyle:{
                        color:'#eee'
                    }
                },
                 axisTick:{
                   show:false,
                //     color:'#777'
                     lineStyle:{
                         color:'#eee'
                     }
                 },
                axisLabel:{
                    //inside:true,
                    show:false,
                    textStyle:{
                        fontSize:6
                    }
                }
                // show:false
                // gridIndex:{
                //     show:false,
                // }
            }
        ],
        series : [

            {
                name:'深证成指',
                type:'line',
                itemStyle : {
                    normal : {
                        color:line_color,
                    },
                },
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        // position: 'top'
                    }
                },

                //areaStyle: {normal: {}},
                data: [14034.32, 13928.42, 13654.22, 13352.67, 14234.68, 14530.94, 14400.16],
                smooth:true,
            }
        ]
    });
}