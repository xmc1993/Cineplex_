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
   <jsp:useBean id="ticketManage" class="xmc.cineplex.model.TicketManage" scope="session"></jsp:useBean>

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
	<div class="col-xs-4">
	</div>
	<div class="col-xs-4" style="background-color:#FFFFFF">
	<p></p>
	<form role="form" method="post" action="saleTicket.action">
		<legend><strong>电影票</strong></legend>
		<div class="well-sm well">
		<p><label>商品名：</label><jsp:getProperty name="plan" property="title"/></p>
		<p><label>场次：</label><jsp:getProperty name="plan" property="airTime"/></p>
		<p><label>单价：</label><span><jsp:getProperty name="plan" property="price"/>RMB</span></p>
		<p><label>购买张数：</label><%=session.getAttribute("amount") %>张</p>
		</div>
		<input type="hidden"  name="planId" value='<jsp:getProperty name="plan" property="id"/>' />
		<input type="hidden" id="price" value='<jsp:getProperty name="plan" property="price"/>' />
		<input type="hidden" value=<%=session.getAttribute("amount") %> name="amount" />
		<div class="form-group">
		<label>选择支付方式：</label>
		<select id="select1" onchange="select(this)" class="form-control" name="mode">
		<option value="1">会员卡</option>
		<option value="2">现金</option>
		</select>
		</div>
		<div class="form-group">
		<label id="mlabel">请输入会员ID：</label>
		<input type="text" class="form-control" id="mid" placeholder="sum" name="uid"/>
		</div>
		

		
		<label id="sum">总金额：<%=session.getAttribute("total")%>RMB</label>
		
		<br/>
		<br/>
		<button class="btn-block btn-lg btn-success" >确认提交</button>
	</form>
		<p></p>
		<br/>
	</div>
	<div class="col-xs-4">
	</div>
	</div>
	</div>
	
	<script type="text/javascript">
		function select(obj){
			if(obj.value==1){
				$("#mid").show();
				$("#mlabel").show();
			}else{
				$("#mid").hide();
				$("#mlabel").hide();
				
			}
		}
	</script>
  </body>
</html>