<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <title>ModifyPlan</title>
   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <link href="bootstrap/css/other.css" rel="stylesheet"/>
   <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
   <script src="jquery/jquery-2.1.3.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
  <body style="background-color:#000000">
  
  <jsp:useBean id="planList" type="xmc.cineplex.model.list.PlanList" scope="session"></jsp:useBean>
  <jsp:useBean id="plan" class="xmc.cineplex.model.Plan" scope="page"></jsp:useBean>
  
	<nav class="navbar navbar-inverse" role="navigation">
	  <div class="navbar-header">
      <a class="navbar-brand" href="adminHomePage.action">CineplexAdmin</a>
   </div>
   <div>
      <ul class="nav navbar-nav">
         <li class="active"><a href="#">首页</a></li>
      </ul>
	  <ul class="nav navbar-nav navbar-right">
	  <li class="active"><a class="navbar-brand" href="#"><span class="glyphicon glyphicon-user"></span>Administrator</a></li>
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
	<div class="col-xs-2">
	</div>
	<!--结束-->
	
	<!--右边部分-->
	<div class="col-xs-10">	
		<div class="page-header">
		<h1>未通过审核的上映计划
		<small>（2015）</small>
		</h1>
		</div>
	<br/>
<%
	for(int i=0;i<planList.getPlanList().size();i++){
		pageContext.setAttribute("plan", planList.getPlanList(i));
%>
	<div class="row" >
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title"><jsp:getProperty name="plan" property="title"/></h3>
			</div>
			<div class="panel-body">
				<div class="col-xs-4">
				<img src='<jsp:getProperty name="plan" property="posturl"/>' alt="post" style="width:320px;height:450px">
				</div>
				<div class="col-xs-8">
				<ul>
					<li class="list-group-item">影片名：<jsp:getProperty name="plan" property="title"/></li>
					<li class="list-group-item">导演：<jsp:getProperty name="plan" property="director"/></li>
					<li class="list-group-item">语言：<jsp:getProperty name="plan" property="language"/></li>
					<li class="list-group-item">类型：<jsp:getProperty name="plan" property="type"/></li>
					<li class="list-group-item">时长：<jsp:getProperty name="plan" property="duration"/></li>
					<li class="list-group-item">首映日期：<jsp:getProperty name="plan" property="firstRunTime"/></li>
					<li class="list-group-item">放映厅：<jsp:getProperty name="plan" property="hallNumber"/>号厅</li>
					<li class="list-group-item">上映时间:<jsp:getProperty name="plan" property="airTime"/></li>
					<li class="list-group-item">结束时间:<jsp:getProperty name="plan" property="endTime"/></li>
					<li class="list-group-item">价格：<jsp:getProperty name="plan" property="price"/> RMB</li>
				</ul>
				<br/>
				<form class="form-horizontal" role="form" name="form_" action="modifyPlan.action" method="post">
					<div class="form-group">
						<div class="col-xs-offset-3 col-xs-6">
							<input type="hidden" class="form-control" name="planId" value='<jsp:getProperty name="plan" property="id"/>'/>
							<input type="hidden" class="form-control" name="sub" value=1 />
							<button type="submit" class="btn btn-success btn-bg btn-block" onclick="pass()">修改该计划</button>
						</div>
					</div>
				</form>
				<form class="form-horizontal" role="form" name="form_" action="modifyPlan.action" method="post">
					<div class="form-group">
						<div class="col-xs-offset-3 col-xs-6">
							<input type="hidden" class="form-control" name="planId" value='<jsp:getProperty name="plan" property="id"/>'/>
							<input type="hidden" class="form-control" name="sub" value=0 />
							<button type="submit" class="btn btn-danger btn-bg btn-block" onclick="unpass()">删除该计划</button>
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

	<script type="text/javascript">
		function unpass(){
			alert("该计划已删除！");
		}

		function pass(){

		}
	</script>
  </body>
</html>