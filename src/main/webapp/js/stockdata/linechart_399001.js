/**
 * Created by dell on 2017/3/19.
 */
var ctx2=document.getElementById("line_399001").getContext("2d");
//    alert("bbb");
var data2 = {
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

            data: [14532.91,14037.42,14123.42,14034.32, 13928.42, 13654.22, 13352.67, 14234.68, 14530.94, 14400.16],
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


            data: [14052.00,14052.00,14052.00,14052.00, 14052.00, 14052.00, 14052.00, 14052.00, 14052.00, 14052.00],
        }
    ]
};
var myLineChart = new Chart(ctx2, {
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
    data: data2
});