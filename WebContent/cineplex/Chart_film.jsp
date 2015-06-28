<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <title>Admin</title>
   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <link href="bootstrap/css/other.css" rel="stylesheet"/>
   <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
   <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.7.1/jquery.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
   
   <script src="js/highcharts.js"></script>
   <script src="js/modules/exporting.js"></script>
   
</head>
  <body style="background-color:#000000">
  
	<nav class="navbar navbar-inverse" role="navigation">
	  <div class="navbar-header">
      <a class="navbar-brand" href="managerHomePage.action">CineplexAdmin</a>
   </div>
   <div>
      <ul class="nav navbar-nav">
         <li class="active"><a href="managerHomePage.action">首页</a></li>
      </ul>
	  <ul class="nav navbar-nav navbar-right">
	  <li class="active"><a class="navbar-brand" href="#"><span class="glyphicon glyphicon-user"></span> Administrator</a></li>
	  <li><a href="#"><span class="glyphicon glyphicon-cog"></span></a><li>
	  <li><a href="adminLogout.action"><span class="glyphicon glyphicon-off"></span></a><li>
	  <li><a>&nbsp </a></li>
	  </ul>
	</div>
	</nav>
	<div   style="height:130px;background:url('images/bg.jpg')">
	</div>
	
	<div   style="height:20px">
	</div>
	
	<div class="container">
	<div class="row">
	<div class="col-xs-2"></div>
		<div class="col-xs-8">
			<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div> 
	
		</div>
	</div>
	</div>
	
<!--切换界面-->	
	<ul class="pager">
		<li><a href="businessChart.action">Previous</a></li>
		<li><a href="fullChart.action">Next</a></li>
	</ul>
<!--切换界面-->
	
<!--图表的js部分-->	
	
		<script type="text/javascript">
$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'bar'
            },
            title: {
                text: '各影片上座率'
            },
            xAxis: {
                categories: ['超能陆战队', '澳门风云2', '狼图腾', '有一个地方只有我们知道', '重返20岁'],
                title: {
                    text: null
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '上座率 (%)',
                    align: 'high'
                }
            },
            tooltip: {
                formatter: function() {
                    return ''+
                        this.x +': '+ this.y +' %';
                }
            },
            plotOptions: {
                bar: {
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -100,
                y: 100,
                floating: true,
                borderWidth: 1,
                backgroundColor: '#FFFFFF',
                shadow: true
            },
            credits: {
                enabled: false
            },
            series: [{
                name: 'Year 2015',
                data: [67.3, 67.4, 63.5, 59.4, 61.1]
            }]
        });
    });
    
});
		</script>

<!--图表部分结束-->

  </body>
</html>