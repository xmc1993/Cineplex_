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
	<div class="col-xs-1"></div>
		<div class="col-xs-10">
			<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
		</div>
	</div>
	</div>
		
<!--切换界面-->	
	<ul class="pager">
		<li><a href="monthChart.action">Previous</a></li>
		<li><a href="filmChart.action">Next</a></li>
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
                type: 'line',
                marginRight: 130,
                marginBottom: 25
            },
            title: {
                text: '各个月现金与会员卡消费情况',
                x: -20 //center
            },
            xAxis: {
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
            },
            yAxis: {
                title: {
                    text: '金额(k)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        this.x +': '+ this.y +'k';
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -10,
                y: 100,
                borderWidth: 0
            },
            series: [{
                name: '会员卡消费',
                data: [104.5, 124.4, 145.3]
            }, {
                name: '现金消费',
                data: [234.3, 280.6, 315.6]
            }
			]
        });
    });
    
});
		</script>

<!--图表部分结束-->

  </body>
</html>