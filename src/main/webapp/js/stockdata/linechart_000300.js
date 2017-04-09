/**
 * Created by dell on 2017/3/19.
 */
var ctx3=document.getElementById("line_000300").getContext("2d");
//    alert("bbb");
var data3 = {
    labels: ["2017/03/06", "2017/03/07", "2017/03/08", "2017/03/09", "2017/03/10", "2017/03/13", "2017/03/14", "2017/03/15", "2017/03/16", "2017/03/17"],
    datasets: [
        {
            label: "指数",
            fill: false,
            lineTension: 0.1,
            //backgroundColor: "rgba(73,182,151,1)",
            BorderWidth:1,
            borderColor: "rgba(231,104,98,1)",
            borderCapStyle: 'butt',
            borderDash: [],
            borderDashOffset: 0.0,
            borderJoinStyle: 'miter',
            pointBorderColor: "rgba(231,104,98,1)",
            pointBackgroundColor: "#fff",
            pointBorderWidth: 1,
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(231,104,98,1)",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointHoverBorderWidth: 2,
            pointRadius: 1,
            pointHitRadius: 10,
            spanGaps: false,

            data: [3130.05,3109.35,2723.42,3234.32, 3123.33, 3012.56, 3234.24, 2993.77, 2858.89, 2942.46],
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
var myLineChart = new Chart(ctx3, {
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
    data: data3,
});