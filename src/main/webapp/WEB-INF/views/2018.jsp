<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>2018年报表</title>
    <%  pageContext.setAttribute("APP_PATH",request.getContextPath());%>
    <script type="text/javascript" src="${APP_PATH}/static/jquery-3.3.1/jquery-3.3.1.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <%--js--%>
    <%--<link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.highcharts.com.cn/highcharts/highcharts.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/modules/drilldown.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
</head>
<body>
<div class="container">
    <div class="row"></div>
    <br>
    <br>
    <br>
    <div class="row">
        <h3>2019年统计报表</h3>
        <hr>
    </div>
    <br>
    <br>
    <div class="row col-md-11" id="graph" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</div>


<script>
    Highcharts.chart('graph', {
        chart: {
            type: 'column'
        },
        title: {
            text: '2019年，各企业报警次数统计'
        },
        subtitle: {
            text: '点击可查看具体情况'
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: '整年报警次数'
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: '{point.y:.1f}'
                }
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
        },
        series: [{
            name: '各大企业',
            colorByPoint: true,
            data: [{
                name: '某污水处理有限责任公司',
                y: 15,
                drilldown: '百度'
            }, {
                name: '某生活供水股份有限公司',
                y: 75,
                drilldown: '阿里巴巴'
            }, {
                name: '某建筑污染处理公司',
                y: 34,
                drilldown: '哈巴河污水处理厂'
            }, {
                name: '某生活垃圾处理有限公司',
                y: 35,
                drilldown: '雅虎'
            }, {
                name: '某煤化工生产有限公司',
                y: 12,
                drilldown: '微软'
            }, {
                name: '某日用塑料处理厂',
                y: 64,
                drilldown: null
            }]
        }],
        drilldown: {
            series: [{
                name: '百度',
                id: '百度',
                data: [
                    [
                        '1-2月',
                        24.13
                    ],
                    [
                        '3-4月',
                        17.2
                    ],
                    [
                        '5-6月',
                        8.11
                    ],
                    [
                        '7-8月',
                        5.33
                    ],
                    [
                        '9-10月',
                        1.06
                    ],
                    [
                        '11-12月',
                        0.5
                    ]
                ]
            }, {
                name: '阿里巴巴',
                id: '阿里巴巴',
                data: [
                    [
                        '1月',
                        5
                    ],
                    [
                        '2月',
                        4.32
                    ],
                    [
                        '3月',
                        3.68
                    ],
                    [
                        '4月',
                        2.96
                    ],
                    [
                        '5月',
                        2.53
                    ],
                    [
                        '6月',
                        1.45
                    ],
                    [
                        '7月',
                        1.24
                    ],
                    [
                        '8月',
                        0.85
                    ],
                    [
                        '9月',
                        0.6
                    ],
                    [
                        '10月',
                        0.55
                    ],
                    [
                        '11月',
                        0.38
                    ],
                    [
                        '12月',
                        0.19
                    ]
                ]
            }, {
                name: '腾讯',
                id: '腾讯',
                data: [
                    [
                        '第一季度',
                        2.76
                    ],
                    [
                        '第二季度',
                        2.32
                    ],
                    [
                        '第三季度',
                        2.31
                    ],
                    [
                        'v第四季度',
                        1.27
                    ]
                ]
            }, {
                name: '雅虎',
                id: '雅虎',
                data: [
                    [
                        '第一季度',
                        2.56
                    ],
                    [
                        '第二季度',
                        0.77
                    ],
                    [
                        '第三季度',
                        0.42
                    ],
                    [
                        '第四季度',
                        0.3
                    ]
                ]
            }, {
                name: '微软',
                id: '微软',
                data: [
                    [
                        '第一季度',
                        0.34
                    ],
                    [
                        '第二季度',
                        0.24
                    ],
                    [
                        '第三季度',
                        0.17
                    ],
                    [
                        '第四季度',
                        0.16
                    ]
                ]
            }]
        }
    });
</script>
</body>
</html>