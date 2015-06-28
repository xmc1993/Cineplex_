<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <title>MEMBER</title>
   <link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
   <link href="bootstrap/css/other.css" rel="stylesheet"/>
   <script src="jquery/jquery-2.1.3.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
  <body style="background-color:#000000"> 
   <jsp:useBean id="user" type="xmc.cineplex.model.User" scope="session"></jsp:useBean>
   <jsp:useBean id="account" type="xmc.cineplex.model.Account" scope="session"></jsp:useBean>
    
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
	<!-- Tab的使用范围-->
	
	<div class="col-xs-8">
	
    <div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">基本信息</h3>
	</div>
	<div class="panel-body">
		<div class="well well-sm">
		<p>昵称：&nbsp&nbsp&nbsp&nbsp&nbsp<jsp:getProperty name="user" property="name"/></p>
		</div>
		<div class="well well-sm">
		<p>ID：&nbsp&nbsp&nbsp&nbsp&nbsp00000<jsp:getProperty name="user" property="id"/></p>
		</div>
<% 
	int sex=user.getGendar();
	String info="男";
	if(sex==1){
		info="女";
	}
	session.putValue("sex", info);
%>
		<div class="well well-sm">
		<p>性别：&nbsp&nbsp&nbsp&nbsp&nbsp<%= session.getAttribute("sex")%></p>
		</div>
		<div class="well well-sm">
		<p>所在地区：&nbsp&nbsp&nbsp&nbsp&nbsp<jsp:getProperty name="user" property="city"/></p>
		</div>
		<div class="well well-sm">
		<p>出生日期：&nbsp&nbsp&nbsp&nbsp&nbsp<jsp:getProperty name="user" property="birthday"/></p>
		</div>
		<div class="well well-sm">
		<p>Email：&nbsp&nbsp&nbsp&nbsp&nbsp<jsp:getProperty name="user" property="email"/></p>
		</div>
		<div class="well well-sm">
		<p>账户余额：&nbsp&nbsp&nbsp&nbsp&nbsp<jsp:getProperty name="account" property="balance"/></p>
		</div>
		<div class="well well-sm">
		<p>账户积分：&nbsp&nbsp&nbsp&nbsp&nbsp<jsp:getProperty name="account" property="integration"/>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="exchange.action">将积分转为账户余额</a></p>
		</div>
		<form action="enterModifyProfile.action">
		<button class="btn-block btn-lg btn-success" type="submit" >修改个人资料</button>
		</form>

	</div>
   </div>   

	</div>
	<!-- Tab的结束范围。 -->
	</div>
	</div>
  </body>
</html>