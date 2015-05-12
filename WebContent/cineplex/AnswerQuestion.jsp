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
  
  <jsp:useBean id="questionList" type="xmc.cineplex.model.list.QuestionList" scope="session"></jsp:useBean>
  <jsp:useBean id="question" class="xmc.cineplex.model.Question" scope="page"></jsp:useBean> 
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
	  <li class="active"><a class="navbar-brand" href="#"><span class="glyphicon glyphicon-log-in"></span><jsp:getProperty name="user" property="name"/></a></li>
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
	<div class="col-xs-2">
	</div>
	<div class="col-xs-8" style="background-color:#FFFFFF">
	
	
	<p></p>
	<form role="form" method="post" action="answer.action">
	<legend><strong>活动问题</strong></legend>
<%
if(questionList.getQuestionList().size()==0){

%>
	 <h3>暂无可以参加的活动！</h3>
<%
}
	for(int i=0;i<questionList.getQuestionList().size();i++){
		pageContext.setAttribute("question", questionList.getQuestionList(i));
	
%>
	<!-- 开始展示第一个问题 -->
		<div class="form-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><jsp:getProperty name="question" property="content"/></h3>
				</div>
				<div class="panel-body">
					<label class="checkbox-inline">
						<input type="radio" name='<jsp:getProperty name="question" property="id"/>' value=1><jsp:getProperty name="question" property="option1"/>
					</label>
					<label class="checkbox-inline">
						<input type="radio" name='<jsp:getProperty name="question" property="id"/>' value=2><jsp:getProperty name="question" property="option2"/>
					</label>
					<label class="checkbox-inline">
						<input type="radio" name='<jsp:getProperty name="question" property="id"/>' value=3><jsp:getProperty name="question" property="option3"/>
					</label>
				</div>
			</div>
		</div>
		<br>
		<!--结束展示第一个问题-->

<%
	}
%>	

		<hr/>
		<div class="col-xs-offset-2 col-xs-8">
<%
if(questionList.getQuestionList().size()!=0){
%>
		<button class="btn-block btn-lg btn-success" type="submit" onclick='sub()' >提交</button>
<%
}
%>
		</div>
		</form>
		<p></p>
		<br/>
		
		
		
	</div>
	<div class="col-xs-2">
	</div>
	</div>
	</div>
	
  </body>
	<script>
	function sub(){
		alert("成功参加活动！电影下线时您将获得相应积分");
		}
	</script>
  <!--body-->
</html>
