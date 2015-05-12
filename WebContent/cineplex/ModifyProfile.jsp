<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <title>修改个人资料</title>
   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
   <script src="jquery/jquery-2.1.3.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
   
   <link href="bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
  <body style="background-color:#000000">
  
   <jsp:useBean id="user" type="xmc.cineplex.model.User" scope="session"></jsp:useBean>
  
	<nav class="navbar navbar-inverse" role="navigation">
	  <div class="navbar-header">
      <a class="navbar-brand" href="memHomePage.action">Cineplex</a>
   </div>
   <div>
      <ul class="nav navbar-nav">
         <li class="active"><a href="#">首页</a></li>
         <li><a href="memberInfo.action">个人信息</a></li>
         <li><a href="enterAnswer.action">参与活动</a></li>
         <li><a href="enterRecharge.action">充值</a></li>
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
	<form role="form" action="modifyProfile.action" method="post">
		<legend><strong>输入注册信息</strong></legend>
		<div class="form-group">
		<label>用户名：</label>
		<input type="text" class="form-control" name="user.name" value='<jsp:getProperty name="user" property="name"/>' disabled/>
		</div>
		
		<div class="form-group">
		<label>性别：</label>
		<select class="form-control" name="user.gendar" value='<jsp:getProperty name="user" property="gendar"/>'>
		<option value=0>男</option>
		<option value=1>女</option>
		</select>
		</div>
		
		<div class="form-group">
		<label>所在城市：</label>
		<input type="text" class="form-control" name="user.city" value='<jsp:getProperty name="user" property="city"/>'/>
		</div>
		<div class="form-group">
        <label>出生日期</label>
        <div class="input-group date form_date"  data-date="" data-date-format="dd M yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
        <input class="form-control" size="16"  name="birthday" type="text" value='<jsp:getProperty name="user" property="birthday"/>' readonly>
        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>
        </div>
		<div class="form-group">
		<label>Email：</label>
		<input type="text" class="form-control" name="user.email" value='<jsp:getProperty name="user" property="email"/>'/>
		</div>  
		<button class="btn-block btn-lg btn-success" >确认修改</button>
	</form>
		<p></p>
		<br/>
	</div>
	<div class="col-xs-4">
	</div>
	</div>
	</div>
	
	<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<script type="text/javascript">
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		format:'yyyy-mm-dd',
		forceParse: 0
    });
</script>
  </body>
</html>