<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="${basePath}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>确认订单</title>
<link rel="stylesheet" href="bs/css/bootstrap.css">
<script type="text/javascript" src="bs/js/jquery.min.js"></script>
<script type="text/javascript" src="bs/js/bootstrap.js"></script>		
<script type="text/javascript" src="js/cake/landing.js"></script>
<link href="css/cake/head_footer.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/cake/addcart.js"></script>
<style type="text/css">
	.wrapper .main h3{
		border-bottom: 1px #ccc solid;
		padding:5px 0;
		text-align: center;
	}
	.wrapper .main .info,.wrapper .main .payMethod,.wrapper .main .pro,.wrapper .main .settle{
		margin:25px 0;
	}
	.wrapper .main .row>h4{
		font-size: 22px;
		font-weight: bold;
	}
	.wrapper .main .info .default {
		border:1px #ccc solid;
	}
	.wrapper .main .pro .prolist td{
		height:50px;
		line-height: 50px;
	}
	.wrapper .main .settle .settle-info{
		border:1px #ccc solid;
		padding:20px ;
		font-size:16px;
		margin:0;
	}
	.wrapper .main .settle .settle-info .settle-li>div{
		line-height: 40px;
	}
	.wrapper .main .settle .settle-info span{
		display:inline-block;
		width:120px;
		text-align:right;
	}
	.wrapper .main .settle .settle-info .totprice {
		padding:10px 0;
		font-size: 28px;
		
	}
	.wrapper .main .settle .settle-info .totprice b{
		color:red;
	}
	
}
</style>

</head>
<body>
	<div class="container-fullid">
		<%@include file="header.jsp" %>
		<div class="wrapper">
			<div class="main container">
				<h3>
					<span>确认订单</span>
				</h3>
				<div class="container">
					<div class="info row">
						<h4 class="col-md-12">收货信息:</h4>
						<div class="col-md-3 default">
							<b>${landing.name }</b>
							<p>${landing.address }</p>
							<p>${landing.tell }</p>
						</div>
					</div>
					<!-- <div class="payMethod row">
						<h4 class="col-md-12">支付方式:</h4>
						<label class="radio-inline">
							<input type="radio" name="paymeth" name="inlineRadio" checked="checked" value="option1">货到付款<br/>   
							<input type="radio" name="paymeth" name="inlineRadio" checked="checked" value="option2">线上支付
						</label>
					
					</div> -->
					
					<div class="pro row">
						<h4 class="col-md-12">商品信息</h4>
						<table class="table table-bordered">
							<tr class="info">
								<th style="background:#fff;" class="col-md-6">&nbsp;</th>
								<th style="background:#fff;" class="col-md-2">单价</th>
								<th style="background:#fff;" class="col-md-2">数量</th>
								<th style="background:#fff;" class="col-md-2">小计</th>
							</tr>
							<c:forEach items="${shopCart.map}" var="i">
								<tr class="pro-list">
									<td><img width="50px" class="img-responsive col-md-2"
										src="${i.value.cake.upLoadImg.imgSrc }" alt="" />
										<div class="col-md-8">
											<a href="cakedetail?cakeId=${i.key}">${i.value.cake.cakeName}</a>
											
										</div>
									</td>
									<td>￥<i>${i.value.cake.price}</i></td>
									<td>${i.value.quantity}</td>
									<td style="color:red;">￥<i>${i.value.subtotal}</i></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<div class="row settle">
						<h4 class="">结算信息</h4>
						<div class=" settle-info row">
							<div class="col-md-4 col-md-offset-8 settle-li">
								<div class="">
									<span>${shopCart.totQuan}件商品总价:</span>
									<span>￥<i>${shopCart.totPrice}</i></span>
								</div>
								<div>
									<span>运费:</span>
									<span>￥0.00</span>
								</div>
								<div>
									<span>优惠:</span>
									<span>-￥0.00</span>
								</div>
								<div class="totprice">
									<span>应付金额:</span>
									<span style="color:red;">￥<i>${shopCart.totPrice}</i></span>
								</div>
								<div>
								<a href="payJsp/native.jsp" class="btn btn-md pull-left" style="background:#333333;color:#fff;margin-right:130px;">扫码支付</a>
								<a href="OrderServlet?action=subOrder" onclick="subOrder()" class="btn btn-md pull-right" style="background:#333333;color:#fff;margin-right:80px;">货到付款</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<%@include file="footer.jsp" %>
	</div>


</body>
</html>