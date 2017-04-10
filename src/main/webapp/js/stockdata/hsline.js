/**
 * Created by dell on 2017/4/9.
 */
/**
 * Created by dell on 2017/4/9.
 */
/**
 * Created by dell on 2017/4/9.
 */
function painths(id){
//图表渲染的容器对象
    var chartContainer = document.getElementById(id);
    //加载图表
    var myChart = echarts.init(chartContainer);
    myChart.setOption(option = {
        //backgroundColor:'#f9f9f9',
        title: {
            text: '         沪深300（000300）',
            textStyle:{
                fontWeight:'lighter',
                fontSize:16,
                //color:'#777'
                color:'#d48265',
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
            data:'沪深300'
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
                min:2700,
                // axisTick:{
                //   show:false,
                // },
                // show:false
                // gridIndex:{
                //     show:false,
                // }
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
            }
        ],
        series : [

            {
                name:'沪深300',
                type:'line',
                itemStyle : {
                    normal : {
                        color:'#d48265',
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
                data: [3234.32, 3123.33, 3012.56, 3234.24, 2993.77, 2858.89, 2942.46],
                smooth:true,
            }
        ]
    });
}