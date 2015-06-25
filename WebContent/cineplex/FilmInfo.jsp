<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <title>FILMInfo</title>
   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <link href="bootstrap/css/other.css" rel="stylesheet"/>
   <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
   <script src="jquery/jquery-2.1.3.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
  <body style="background-color:#000000">
  <jsp:useBean id="planList" type="xmc.cineplex.model.list.PlanList" scope="session"></jsp:useBean>
  <jsp:useBean id="plan" class="xmc.cineplex.model.Plan" scope="page"></jsp:useBean>
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
	  <li><a href="#"><span class="glyphicon glyphicon-cog"></span></a><li>
	  <li><a href="logout.action"><span class="glyphicon glyphicon-off"></span></a><li>
	  <li><a>&nbsp </a></li>
	  </ul>
	</div>
	</nav>
	<div   style="height:130px;background:url('images/bg.jpg')">
	</div>
	
<%
	pageContext.setAttribute("plan", planList.getPlanList(0));
%>	



	<div class="container">
	<div class="row" style="height:40px">
	</div >
	<div class="row">
	<!--开始-->
	<div class="col-xs-4">
		<div class="page-header">
   <h1>
   </h1>
	</div>
	<div class="panel panel-primary" >
	<div class="panel-heading">
	<h3 class="panel-title"><jsp:getProperty name="plan" property="title"/></h3>
	</div>
	<div class="panel-body">
	<img src='<jsp:getProperty name="plan" property="posturl"/>' alt="post" style="width:260px;height:300px">
	<br/>
	<br/>
	<p>上映：<jsp:getProperty name="plan" property="firstRunTime"/></p>
	<br/>
	<p>类型：<jsp:getProperty name="plan" property="type"/></p>
	<br/>
	<p>时长：<jsp:getProperty name="plan" property="duration"/></p>
	<br/>
	<p>导演：<jsp:getProperty name="plan" property="director"/></p>
	<br/>
	</div>
	<div class="panel-footer"></div>
	</div>
	</div>
	<!--结束-->
	<!--右边部分-->
	<div class="col-xs-6">	
	<div class="page-header">
   <h1><jsp:getProperty name="plan" property="title"/>
      <small>（2015）</small>
   </h1>
	</div>

<% 
	for(int i=0;i<planList.getPlanList().size();i++){
		pageContext.setAttribute("plan", planList.getPlanList(i));
%>
	<div class="well">
		<p>场次时间：<jsp:getProperty name="plan" property="airTime"/> 放映厅：<jsp:getProperty name="plan" property="hallNumber"/>号厅 价格：<jsp:getProperty name="plan" property="price"/> RMB</p>
		<form class="form-horizontal" role="form" action="enterBuy.action" method="post">
			<div class="form-group">
				<div class="col-xs-offset-9 col-xs-3">
					<input type="hidden" class="form-control" name="planId" value='<jsp:getProperty name="plan" property="id"/>'  />
					<button type="submit" class="btn btn-primary btn-bg btn-block">选票</button>
				</div>
			</div>
		</form>
	</div>
<%
	}
%>
	
	</div>
	<!--右边部分-->
	</div>
  </body>
</html>