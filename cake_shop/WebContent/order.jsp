<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>微信支付-商品订单确认页面</title>
<script src="js/jquery.1.8.3.min.js"></script>
<script type="text/javascript" src="js/cake/landing.js"></script>
</head>
<style type="text/css">
body {
	padding: 0px;
	margin: 0px auto;
}

body {
	background-color: #EEE;
}

.i-assets-container {
	border: 1px solid #E1E1E1;
	vertical-align: top;
	display: block;
	background-color: #FFF;
	margin: 5px 10px;
	color: #A1A1A1 !important;
}

#container.ui-container {
	color: #666;
}

.i-assets-content {
	margin: 10px 10px 10px 20px;
}

.fn-clear:after {
	visibility: hidden;
	display: block;
	font-size: 0px;
	content: " ";
	clear: both;
	height: 0px;
}

.i-assets-header h3 {
	font-size: 14px;
}

.fn-left {
	display: inline;
	float: left;
}

h3 {
	margin: 0px;
	padding: 0px;
	font: 12px/1.5 tahoma, arial, "Hiragino Sans GB", "Microsoft Yahei",
		"宋体";
}

.i-assets-balance-amount {
	line-height: 24px;
	margin-right: 20px;
}

.amount {
	font-size: 24px;
	font-weight: 400;
	color: #666;
	margin-left: 25px;
}

.amount .fen {
	font-size: 18px;
}

#wx_bottom {
	display: flex;
}

#wx_bottom {
	overflow: hidden;
	margin: 15px 0px;
}

#wx_bottom {
	display: box;
	display: -ms-box;
	display: -webkit-box;
	display: flex;
	display: -ms-flexbox;
	display: -webkit-flex;
}

#wx_bottom  .a {
	width: 100%;
	height: 40px;
	line-height: 40px;
	margin: 0px 10px;
	border: 1px solid #DDD;
	text-align: center;
	border-radius: 3px;
	color: #666;
	background: #fff;
	text-decoration: none;
}

.WX_search {
	background-color: #EFEFEF;
	height: 40px;
	line-height: 40px;
	position: relative;
	border-bottom: 1px solid #DDD;
	text-align: center;
}

.pay_buttom {
	margin: 15px 0px;
	width: 100%;
	display: box;
	display: -ms-box;
	display: -webkit-box;
	display: flex;
	display: -ms-flexbox;
	display: -webkit-flex;
	width: 100%;
}

.pay_buttom a {
	height: 40px;
	line-height: 40px;
	margin: 0px 10px;
	border: 1px solid #DDD;
	text-align: center;
	border-radius: 3px;
	color: #666;
	background: #fff;
	text-decoration: none;
	width: 100%;
	display: block;
	flex: 1;
	-ms-flex: 1;
	-webkit-flex: 1;
	box-flex: 1;
	-ms-box-flex: 1;
	-webkit-box-flex: 1;
}
</style>
<body>

	<div class="WX_search">
		<p>微信扫码支付-订单信息确认</p>
	</div>
	<form>
		<div class="i-assets-container ui-bookblock-item">
			<div class="i-assets-content">
				<div class="i-assets-header fn-clear">
					<h3 class="fn-left">入款账户</h3>
				</div>
				<div class="i-assets-body fn-clear">
					<div class="i-assets-balance-amount fn-left">
						<strong class="amount"><span style="font-size: 15px;">Bon Cake 蛋糕商店</span></strong>
					</div>
				</div>
			</div>
			<div class="i-assets-content">
				<div class="i-assets-header fn-clear">
					<h3 class="fn-left">商品名称</h3>
				</div>
				<div class="i-assets-body fn-clear">
					<div class="i-assets-balance-amount fn-left">
						<strong class="amount"><span style="font-size: 15px;"
							id="commodityName">蛋糕费用</span></strong>
					</div>
					<div class="i-assets-balance-amount fn-left" style="clear:left">
						<strong class="amount"><span style="font-size: 15px;"
							id="commodityName">(免除运费)</span></strong>
					</div>
				</div>
			</div>
			<div class="i-assets-content">
				<div class="i-assets-header fn-clear">
					<h3 class="fn-left">支付总金额</h3>
				</div>
				<div class="i-assets-body fn-clear">
					<div class="i-assets-balance-amount fn-left">
						<strong class="amount"><span id="total">${shopCart.totPrice}</span></strong>元
					</div>

				</div>
			</div>
		</div>

		<div class="i-assets-container ui-bookblock-item">
			<div class="i-assets-content">
				<div class="i-assets-header fn-clear">
					<h3 class="fn-left">您需要支付金额</h3>
				</div>
				<div class="i-assets-body fn-clear">
					<div class="i-assets-balance-amount fn-left"
						style="color: #F37800;">
						<strong class="amount" style="color: #F37800;" id="totalPrice">${shopCart.totPrice}</strong>元
					</div>
				</div>
			</div>
		</div>

		<div class='pay_buttom'>
			<a href="javascript:confirm('你确定要取消吗?你不喜欢我了吗?');" style="background: #06C; color: #fff;">取消订单</a>
			<a href="payJsp/native.jsp" style="background: #06C; color: #fff;">扫码支付</a>
		</div>
	</form>
</body>
</html>