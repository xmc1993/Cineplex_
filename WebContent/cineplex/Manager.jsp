<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <title>Admin</title>
   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <link href="bootstrap/css/other.css" rel="stylesheet"/>
   <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
   <script src="jquery/jquery-2.1.3.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
  <body style="background-color:#000000">
	<nav class="navbar navbar-inverse" role="navigation">
	  <div class="navbar-header">
      <a class="navbar-brand" href="managerHomePage.action">CineplexAdmin</a>
   </div>
   <div>
      <ul class="nav navbar-nav">
         <li class="active"><a href="#">首页</a></li>
      </ul>
	  <ul class="nav navbar-nav navbar-right">
	  <li class="active"><a class="navbar-brand" href="#"><span class="glyphicon glyphicon-user"></span> Manager</a></li>
	  <li><a href="#"><span class="glyphicon glyphicon-cog"></span></a><li>
	  <li><a href="adminLogout.action"><span class="glyphicon glyphicon-off"></span></a><li>
	  <li><a>&nbsp </a></li>
	  </ul>
	</div>
	</nav>
	<div   style="height:130px;background:url('images/bg.jpg')">
	</div>
	<div class="container">
	<div class="row" style="height:40px">
	</div >
	<div class="row">
	<!--开始-->
	<div class="col-xs-4">
		<div class="page-header">
			<h1>
			Manager
			</h1>
		</div>
	<!--导航开始-->
	<ul class="nav nav-pills nav-stacked">
		<li><a href="enterCheck.action">审核放映计划</a></li>
		<li><a href="ageRatio.action">会员信息统计情况</a></li>
		<li><a href="monthChart.action">影院使用情况统计情况</a></li>
		<li><a href="seatChart.action">会员喜好分析</li>
	</ul>
	<!--导航结束-->
	
	</div>
	<!--结束-->
	<!--右边部分-->
	<div class="col-xs-6">	

	
	<img src="images/admin2.jpg" alt="post"/>

	
	</div>
	<!--右边部分-->
	</div>
  </body>
</html>