<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <title>BindBankCard</title>
   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
   <script src="jquery/jquery-2.1.3.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
   
   	<script type="text/javascript">
	$(document).ready(function(){
		alert("尚未绑定银行卡！请先绑定银行卡");
	});
	</script>
	
</head>
  <body style="background-color:#000000">
  <jsp:useBean id="user" type="xmc.cineplex.model.User" scope="session"></jsp:useBean>
	<nav class="navbar navbar-inverse" role="navigation">
	  <div class="navbar-header">
      <a class="navbar-brand" href="">Cineplex</a>
   </div>
   <div>
      <ul class="nav navbar-nav">
         <li class="active"><a href="#">首页</a></li>
      </ul>
	  <ul class="nav navbar-nav navbar-right">
	  <li class="active"><a class="navbar-brand" href="#"><span class="glyphicon glyphicon-user"></span><jsp:getProperty name="user" property="name"/></a></li>
	  <li><a href="#"><span class="glyphicon glyphicon-cog"></span></a><li>
	  <li><a href="#"><span class="glyphicon glyphicon-envelope"></span></a><li>
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
	<div class="col-xs-4">
	</div>
	<div class="col-xs-4" style="background-color:#FFFFFF">
	<p></p>
	<form role="form" action="bindBankCard.action" method="post">
		<legend><strong>绑定银行卡</strong></legend>
		<div class="form-group">
		<label>输入银行卡卡号：</label>
		<input type="text" class="form-control" name="cardNumber" placeholder="card number"/>
		</div>
		<div class="form-group">
		<label>输入银行卡密码：</label>
		<input type="password" class="form-control" name="password" placeholder="password"/>
		</div>
		<div class="form-group">
		<label>输入手机号码：</label>
		<input type="text" class="form-control" name="phoneNumber" placeholder="phone number"/>
		</div>
		<button class="btn-block btn-lg btn-success" >确认</button>
	</form>
		<p></p>
		<br/>
	</div>
	<div class="col-xs-4">
	</div>
	</div>
	</div>
  </body>
</html>