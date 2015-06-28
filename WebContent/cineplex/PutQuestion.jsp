<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--head-->
   <title>制定活动题目</title>

   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
   <script src="jquery/jquery-2.1.3.min.js" charset="UTF-8"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
   

<!--head-->
</head>
<!--body-->
  <body style="background-color:#000000">
   <jsp:useBean id="planIdList" type="xmc.cineplex.model.list.PlanIdList" scope="session"></jsp:useBean>
	<nav class="navbar navbar-inverse" role="navigation">
	  <div class="navbar-header">
      <a class="navbar-brand" href="adminHomePage.action">CineplexAdmin</a>
   </div>
   <div>
      <ul class="nav navbar-nav">
         <li class="active"><a href="adminHomePage.action">首页</a></li>
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
	<div class="container">
	<div class="row" style="height:40px">
	</div >
	<div class="row">
	<div class="col-xs-3">
	</div>
	<div class="col-xs-6" style="background-color:#FFFFFF">
	<p></p>
	<form role="form" action="putQuestion.action" method="post">
		<legend><strong>问题制定</strong></legend>
		<div class="form-group">
		<label>题目：</label>
		<textarea class="form-control" name="question.content" rows="3" placeholder="活动问题."></textarea>
		</div>
        <div class="form-group">
		<label>选项一：</label>
		<input type="text" class="form-control" name="question.option1" placeholder="选项一."/>
		</div>
		<div class="form-group">
		<label>选项二：</label>
		<input type="text" class="form-control" name="question.option2" placeholder="选项二."/>
		</div>
		<div class="form-group">
		<label>选项三：</label>
		<input type="text" class="form-control" name="question.option3" placeholder="选项三."/>
		</div>
		<div class="form-group">
		<p><label>匹配的放映计划：</label></p>
	
<%
	out.print("&nbsp");
	for(int i=0;i<planIdList.getPlanIdList().size();i++){
		int planId=planIdList.getPlanIdList(i);
		String s=String.valueOf(planId);
		if(planId<10)
			s="0"+s;
%>
			<label class="checkbox-inline">
			<input type="checkbox" name="plan" value='<%out.print(planId);%>'/>放映计划<%out.print(s);%>
			</label>
<%
	}
%>		
		</div>
		<br/>
		<button class="btn-block btn-lg btn-success" type="submit" onclick="sub()">确认</button>
		</form>
		<p></p>
		<br/>
	</div>
	<div class="col-xs-3">
	</div>
	</div>
	</div>
	
  </body>
  <script>
  function sub(){
	  alert("发布问题成功！");
	  }
  </script>
  <!--body-->
</html>