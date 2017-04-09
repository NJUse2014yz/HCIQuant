/**
 * Created by dell on 2017/3/19.
 */
var ctx1=document.getElementById("line_000001").getContext("2d");
//    alert("bbb");
var data1 = {
    labels: ["2017/03/06", "2017/03/07", "2017/03/08", "2017/03/09", "2017/03/10", "2017/03/13", "2017/03/14", "2017/03/15", "2017/03/16", "2017/03/17"],
    datasets: [
        {
            label: "指数",
            fill: false,
            lineTension: 0.1,
            //backgroundColor: "rgba(73,182,151,1)",
            BorderWidth:1,
            borderColor: "rgba(73,182,151,1)",
            borderCapStyle: 'butt',
            borderDash: [],
            borderDashOffset: 0.0,
            borderJoinStyle: 'miter',
            pointBorderColor: "rgba(73,182,151,1)",
            pointBackgroundColor: "#fff",
            pointBorderWidth: 1,
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(73,182,151,1)",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointHoverBorderWidth: 2,
            pointRadius: 1,
            pointHitRadius: 10,
            spanGaps: false,

            data: [3130.05,3109.35,2723.42,3234.32, 3123.33, 3012.56, 3234.24, 2993.77, 3023.42, 2942.46],
        },
        {

            label: "均值",
            fill: true,
            backgroundColor: "rgba(220,220,220,0.5)",
            borderColor: "rgba(220,220,220,1)",
            borderCapStyle: 'butt',
            borderDash: [],
            borderDashOffset: 0.0,
            borderJoinStyle: 'miter',
            pointBorderColor: "rgba(220,220,220,1)",
            pointBackgroundColor: "rgba(220,220,220,1)",
            pointBorderWidth: 1,
            pointHoverRadius: 1,
            pointHoverBackgroundColor: "rgba(220,220,220,1)",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointHoverBorderWidth: 1,
            pointRadius: 1,
            pointHitRadius: 10,
            spanGaps: false,
            lineTension:0.5,


            data: [3000.00,3000.00,3000.00,3000.00, 3000.00, 3000.00, 3000.00, 3000.00, 3000.00, 3000.00],
        }
    ]
};

//定义图表的参数
//var defaults1 = {
//    scaleStartValue :null,     // Y 轴的起始值
//    scaleLineColor : "rgba(0,0,0,.1)",    // Y/X轴的颜色
//    scaleLineWidth : 1,        // X,Y轴的宽度
//    scaleShowLabels : true,    // 刻度是否显示标签, 即Y轴上是否显示文字
//    scaleLabel : "<%=value%>", // Y轴上的刻度,即文字
//    scaleFontFamily : "'Arial'",  // 字体
//    scaleFontSize : 20,        // 文字大小
//    scaleFontStyle : "normal",  // 文字样式
//    scaleFontColor : "#666",    // 文字颜色
//    scaleShowGridLines : false,   // 是否显示网格
//    //scaleGridLineColor : "rgba(0,0,0,.05)",   // 网格颜色
//    //scaleGridLineWidth : 2,      // 网格宽度
//    bezierCurve : true,         // 是否使用贝塞尔曲线? 即:线条是否弯曲
//    pointDot : true,             // 是否显示点数
//    pointDotRadius : 4,          // 圆点的大小
//    pointDotStrokeWidth : 1,     // 圆点的笔触宽度, 即:圆点外层边框大小
//    datasetStroke : true,        // 数据集行程
//    datasetStrokeWidth : 1,      // 线条的宽度, 即:数据集
//    datasetFill : false,         // 是否填充数据集
//    animation : true,            // 是否执行动画
//    animationSteps : 60,          // 动画的时间
//    animationEasing : "easeOutQuart",    // 动画的特效
//    onAnimationComplete : null    // 动画完成时的执行函数
//};


var myLineChart1 = new Chart(ctx1, {
    type: 'line',

    //options:defaults1
    options: {
        //title: {
        //    display: true,
        //    text: '￥2942.46',
        //    fontColor: 'rgb(255, 99, 132)',
        //    fontSize: 18
        //},
        legend: {
            display: false,
        },
        scales: {
            xAxes: [{
                display: false
            }],
            yAxes: [{
                display: false
            }]
        },
        //elements:{
        //    arc:{
        //    borderWidth:1,
        //    backgroundColor: 'rgba(0,0,0,0.7)'}
        //}
    },
    data: data1,
});
