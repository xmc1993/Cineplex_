<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <title>CurrentPlan</title>
   <link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
   <script src="jquery/jquery-2.1.3.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
  <body style="background-color:#000000">
   <jsp:useBean id="filmList" type="xmc.cineplex.model.list.FilmList" scope="session"></jsp:useBean>
  <jsp:useBean id="film" class="xmc.cineplex.model.Film" scope="page"></jsp:useBean>
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
	<!--开始-->
	<div class="col-xs-1">
	</div>
	<!--结束-->
	
	<!--右边部分-->
	<div class="col-xs-9">	
		<div class="page-header">
		<h1 style="color:#f3f3f3;">最近上映的电影
		<small>（2015）</small>
		</h1>
		</div>
	<br/>
	
<%
	for(int i=0;i<filmList.getFilmList().size();i++){
		pageContext.setAttribute("film", filmList.getFilmList(i));
%>	
	<div class="row">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title"><jsp:getProperty name="film" property="title"/></h3>
			</div>
			<div class="panel-body">
				<div class="col-xs-3">
				<img src='<jsp:getProperty name="film" property="posturl"/>' alt="post" style="width:220px;height:305px">
				</div>
				<div class="col-xs-9">
				<ul>
					<li class="list-group-item">片名：<jsp:getProperty name="film" property="title"/></li>
					<li class="list-group-item">导演：<jsp:getProperty name="film" property="director"/></li>
					<li class="list-group-item">时长：<jsp:getProperty name="film" property="duration"/></li>
					<li class="list-group-item">语言：<jsp:getProperty name="film" property="language"/></li>
				</ul>
				<br/>
				<form class="form-horizontal" role="form" action="userFilmInfo.action" method="post">
					<div class="form-group">
						<div class="col-xs-offset-3 col-xs-6">
							<input type="hidden" class="form-control" name="filmName" value='<jsp:getProperty name="film" property="title"/>' />
							<button type="submit" class="btn btn-success btn-bg btn-block">详情场次</button>
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
	<br/>
<%
	}
%>
	
	</div>
	<!--结束右边部分-->
	</div>
  </body>
</html>