<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <title>Warnning</title>
   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <link href="bootstrap/css/other.css" rel="stylesheet"/>
   <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
   <script src="jquery/jquery-2.1.3.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
  <body style="background-color:#000000">
    <jsp:useBean id="user" type="xmc.cineplex.model.User" scope="session"></jsp:useBean>
	<nav class="navbar navbar-inverse" role="navigation">
	  <div class="navbar-header">
      <a class="navbar-brand" href="memHomePage.action">Cineplex</a>
   </div>
   <div>
      <ul class="nav navbar-nav">
         <li class="active"><a href="memHomePage.action">首页</a></li>
         <li><a href="memberInfo.action">账号信息</a></li>
         <li><a href="enterAnswer.action">参与活动</a></li>
         <li><a href="enterRecharge.action">充值</a></li>
      </ul>
	  <ul class="nav navbar-nav navbar-right">
	  <li class="active"><a class="navbar-brand" href="personInfo.action"><span class="glyphicon glyphicon-user"></span><jsp:getProperty name="user" property="name"/></a></li>
	  <li><a href="userSet.action"><span class="glyphicon glyphicon-cog"></span></a><li>
	  <li><a href="logout.action"><span class="glyphicon glyphicon-off"></span></a><li>
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
	<div class="col-xs-2">
	</div>
	<div class="col-xs-8">
	<div class="alert alert-danger"><h3>账户余额不足！</h3></div>
	</div>
	</div>
	</div>
  </body>
</html>