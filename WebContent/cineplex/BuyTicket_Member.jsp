<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <title>SaleTicket</title>
   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
   <script src="jquery/jquery-2.1.3.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
  <body style="background-color:#000000">

  <jsp:useBean id="plan" class="xmc.cineplex.model.Plan" scope="session"></jsp:useBean>
  <jsp:useBean id="user" class="xmc.cineplex.model.User" scope="session"></jsp:useBean>
   <jsp:useBean id="ticketManage" class="xmc.cineplex.model.TicketManage" scope="session"></jsp:useBean>

	<nav class="navbar navbar-inverse" role="navigation">
	  <div class="navbar-header">
      <a class="navbar-brand" href="adminHomePage.action">CineplexAdmin</a>
   </div>
   <div>
      <ul class="nav navbar-nav">
         <li class="active"><a href="adminHomePage.action">首页</a></li>
         <li><a href="#">电影</a></li>
      </ul>
	  <ul class="nav navbar-nav navbar-right">
	  <li class="active"><a class="navbar-brand" href="personInfo.action"><span class="glyphicon glyphicon-user"></span> Administrator</a></li>
	  <li><a href="#"><span class="glyphicon glyphicon-cog"></span></a><li>
	  <li><a href="#"><span class="glyphicon glyphicon-off"></span></a><li>
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
	<form role="form" method="post" action="afterCount.action">
		<legend><strong>电影票</strong></legend>
		<div class="well-sm well">
		<p><label>商品名：</label><jsp:getProperty name="plan" property="title"/></p>
		<p><label>场次：</label><jsp:getProperty name="plan" property="airTime"/></p>
		<p><label>单价：</label><span><jsp:getProperty name="plan" property="price"/>RMB</span></p>
		<p><label>购买张数：</label><%=session.getAttribute("amount") %>张</p>
		<p><label>总票价：</label><%=session.getAttribute("total")%>RMB</p>
		<p><label>会员昵称：</label><jsp:getProperty name="user" property="name"/></p>
		<p><label>享受折扣：</label><%=session.getAttribute("count")%>折</p>
		<p><label>折扣后价格：</label><%=session.getAttribute("afterCount")%>RMB</p>
		</div>
		
		<br/>
		<br/>
		<button class="btn-block btn-lg btn-success" type="submit" onclick="buy()" >确认提交</button>
	</form>
		<p></p>
		<br/>
	</div>
	<div class="col-xs-4">
	</div>
	</div>
	</div>
  </body>
  <script>
  function buy(){
	  alert("购票成功");
	  }
  </script>
</html>