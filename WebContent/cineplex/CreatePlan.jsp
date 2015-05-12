<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--head-->
   <title>放映计划</title>
   
   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
   <script src="jquery/jquery-2.1.3.min.js" charset="UTF-8"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
   
   <link href="bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
   

<!--head-->
</head>
<!--body-->
  <body style="background-color:#000000">
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
	<form role="form" action="createPlan.action" method="post" enctype="multipart/form-data">
		<legend><strong>放映计划</strong></legend>
		
		<div class="form-group">
		<label>影片名：</label>
		<input type="text" class="form-control" name="plan.title" placeholder="film name"/>
		</div>

		<div class="form-group">
        <label>上映时间</label>
        <div class="input-group date form_datetime" data-date="2015-04-01T05:25:07Z" data-date-format="dd MM yyyy - HH:ii 00" data-link-field="dtp_input1">
        <input class="form-control" name="airTime" size="16" type="text" value="" readonly>
        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
        </div>
        </div>
		
		<div class="form-group">
        <label>结束时间</label>
        <div class="input-group date form_datetime" data-date="2015-04-01T05:25:07Z" data-date-format="dd MM yyyy - HH:ii 00" data-link-field="dtp_input1">
        <input class="form-control" name="endTime" size="16" type="text" value="" readonly>
        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
        </div>
        </div>
		
		<div class="form-group">
		<label>导演：</label>
		<input type="text" class="form-control" name="plan.director" placeholder="director"/>
		</div>
		
		<div class="form-group">
		<label>类型：</label>
		<input type="text" class="form-control" name="plan.type" placeholder="type"/>
		</div>
		
		<div class="form-group">
		<label>语言：</label>
		<input type="text" class="form-control" name="plan.language" placeholder="language"/>
		</div>
		
		<div class="form-group">
		<label>时长：</label>
		<input type="text" class="form-control" name="plan.duration" placeholder="duration"/>
		</div>
		
		<div class="form-group">
		<label>首映时间：</label>
		<input type="text" class="form-control" name="plan.firstRunTime" placeholder="first run time"/>
		</div>		

		<div class="form-group">
		<label>放映厅：</label>
		<select class="form-control" name="hall">
		<option value="1">1号厅</option>
		<option value="2">2号厅</option>
		<option value="3">3号厅</option>
		<option value="4">4号厅</option>
		<option value="5">5号厅</option>
		<option value="6">6号厅</option>
		</select>
		</div>
		
		<div class="form-group">
		<label>价格：</label>
		<div class="input-group">
		<span class="input-group-addon"><span class="glyphicon glyphicon-yen"></span></span>
		<input type="text" name="price" class="form-control" id="password" placeholder="price"/>
		</div>
		</div>
		
		<div class="form-group">
		<label>上传电影海报：</label>
		<input type="file" class="form-control" name="uploadFile" />
		</div>	
		
		<button class="btn-block btn-lg btn-success" type="submit" onclick='sub()' >确认</button>
	</form>
		<p></p>
		<br/>
	</div>
	<div class="col-xs-3">
	</div>
	</div>
	</div>
	
	<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		format:'yyyy-mm-dd HH:ii:00',
		forceParse: 0
    });
	</script>
	<script>
	function sub(){
		alert("发布放映计划成功！");
		}
	</script>
  </body>
  <!--body-->
</html>