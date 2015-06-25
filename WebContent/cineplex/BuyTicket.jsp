<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<title>在线选票</title>
<meta name="keywords" content="jQuery,选座">
   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <link href="bootstrap/css/other.css" rel="stylesheet"/>
   <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
   <script src="jquery/jquery-2.1.3.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<style type="text/css">
.demo{width:700px; margin:40px auto 0 auto; min-height:450px;}
@media screen and (max-width: 360px) {.demo {width:340px}}

.front{width: 300px;margin: 5px 32px 45px 32px;background-color: #FFFFFF;	color: #666;text-align: center;padding: 3px;border-radius: 5px;}
.booking-details {float: right;position: relative;width:200px;height: 450px; }
.booking-details h3 {margin: 5px 5px 0 0;font-size: 16px;}
.booking-details p{line-height:26px; font-size:16px; color:#999}
.booking-details p span{color:#666}
div.seatCharts-cell {color: #182C4E;height: 25px;width: 25px;line-height: 25px;margin: 3px;float: left;text-align: center;outline: none;font-size: 13px;}
div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}
div.seatCharts-row {height: 35px;}
div.seatCharts-seat.available {background-color: #3333FF;}
div.seatCharts-seat.focused {background-color: #66FF33;border: none;}
div.seatCharts-seat.selected {background-color: #00CC00;}
div.seatCharts-seat.unavailable {background-color: #FF0033;cursor: not-allowed;}
div.seatCharts-container {border-right: 1px dotted #adadad;width: 400px;padding: 20px;float: left;}
div.seatCharts-legend {padding-left: 0px;position: absolute;bottom: 16px;}
ul.seatCharts-legendList {padding-left: 0px;}
.seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}
span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}
.checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}
#selected-seats {max-height: 150px;overflow-y: auto;overflow-x: none;width: 200px;}
#selected-seats li{float:left; width:72px; height:26px; line-height:26px; border:1px solid #d3d3d3; background:#f7f7f7; margin:6px; font-size:14px; font-weight:bold; text-align:center}
</style>

</head>

<body style="background-color:#000000">

 <jsp:useBean id="plan" type="xmc.cineplex.model.Plan" scope="session"></jsp:useBean>
 <jsp:useBean id="user" type="xmc.cineplex.model.User" scope="session"></jsp:useBean>
 
	<nav class="navbar navbar-inverse" role="navigation" >
	  <div class="navbar-header">
      <a class="navbar-brand" href="memberHomePage.action">Cineplex</a>
   </div>
   <div>
      <ul class="nav navbar-nav">
         <li class="active"><a href="adminHomePage.action">首页</a></li>
         <li class="active"><a href="#">首页</a></li>
         <li><a href="memberInfo.action">个人信息</a></li>
         <li><a href="enterAnswer.action">参与活动</a></li>
         <li><a href="enterRecharge.action">充值</a></li>
      </ul>
	  <ul class="nav navbar-nav navbar-right">
	  <li class="active"><a class="navbar-brand" href="#"><span class="glyphicon glyphicon-user"></span> <jsp:getProperty name="user" property="name"/></a></li>
	  <li><a href="#"><span class="glyphicon glyphicon-cog"></span></a><li>
	  <li><a href="adminLogout.action"><span class="glyphicon glyphicon-off"></span></a><li>
	  <li><a>&nbsp </a></li>
	  </ul>
	</div>
	</nav>
	<div   style="height:130px;background:url('images/bg.jpg')" >
	</div>
	

<div id="main">
   <div class="demo">
   		<div id="seat-map">
			<div class="front">屏幕</div>					
		</div>
		<div class="booking-details">
			<p>影片：<span><jsp:getProperty name="plan" property="title"/></span></p>
			<p>时间：<span><jsp:getProperty name="plan" property="firstRunTime"/></span></p>
			<form method="post" action="buyTicket.action">
			<p>座位：</p>
			<ul id="selected-seats"></ul>
			<p>票数：<span id="counter">0</span></p>
			<p>总计：<b>￥<span id="total">0</span></b></p>
			<input type="hidden" id="amount" name="amount" value=0 />
			<input type="hidden" id="info" name="info" value="" />
			<button type="submit" class="btn-block btn-lg btn-info" onclick="return book();">确定购买</button>
			</form>		
			<div id="legend"></div>
		</div>
		<div style="clear:both"></div>
   </div>
	
  <br/>
</div>
<script type="text/javascript" src="js/jquery.seat-charts.min.js"></script>
<script type="text/javascript">
var price = '${session.price}';//票价
price=price*1;
$(document).ready(function() {
	var $cart = $('#selected-seats'), //座位区
	$counter = $('#counter'), //票数
	$total = $('#total'); //总计金额
	$amount=$('#amount');

//	var arr=new Array();
//	var seat="${session.seat}";
//	alert(seat);
//	arr=seat.split(',');
	
	
	var sc = $('#seat-map').seatCharts({
		map: [  //座位图
		        'aaaaaaaaaa',
		        'aaaaaaaaaa',
		        'aaaaaaaaaa',
		        'aaaaaaaaaa',
		        'aaaaaaaaaa',
		        'aaaaaaaaaa',
		        'aaaaaaaaaa',
		        'aaaaaaaaaa',
		        'aaaaaaaaaa',
		        'aaaaaaaaaa'
		],
		naming : {
			top : false,
			getLabel : function (character, row, column) {
				return column;
			}
		},
		legend : { //定义图例
			node : $('#legend'),
			items : [
				[ 'a', 'available',   '可选座' ],
				[ 'a', 'unavailable', '已售出']
			]					
		},
		click: function () { //点击事件
			if (this.status() == 'available') { //可选座
				$('<li>'+(this.settings.row+1)+'排'+this.settings.label+'座</li>')
					.attr('id', 'cart-item-'+this.settings.id)
					.data('seatId', this.settings.id)
					.appendTo($cart);

				$counter.text(sc.find('selected').length+1);
				
				$amount.val(sc.find('selected').length+1);
				
				
				$total.text(recalculateTotal(sc)+price);
							
				return 'selected';
			} else if (this.status() == 'selected') { //已选中
					//更新数量
					$counter.text(sc.find('selected').length-1);
					
					$amount.val(sc.find('selected').length-1);
					
					//更新总计
					$total.text(recalculateTotal(sc)-price);
						
					//删除已预订座位
					$('#cart-item-'+this.settings.id).remove();
					//可选座
					return 'available';
			} else if (this.status() == 'unavailable') { //已售出
				return 'unavailable';
			} else {
				return this.style();
			}
		}
	});

	//设置已经出售的座位
	var data="${session.book}";
	var dataset=eval("("+data+")");
	
	sc.get(dataset).status('unavailable');
		
});
//计算总金额
function recalculateTotal(sc) {
	var total = 0;
	sc.find('selected').each(function () {
		total += price;
	});
			
	return total;
}

function book(){
	var ch=$('#selected-seats').children();
	var count=ch.length;
	if(count==0){
		alert("您尚未选择任何电影票！");
		return false;
		}
	var s="";
	for(var i=0;i<ch.length;i++){
		s=s+ch[i].innerText+",";
	}
	$('#info').val(s);
	return true;
}

</script>

</body>
</html>