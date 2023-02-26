<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("basePath", basePath);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<base href="${basePath}">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>BON CAKE</title>
	<link rel="stylesheet" href="bs/css/bootstrap.css">
	<script type="text/javascript" src="bs/js/jquery.min.js"></script>
	<script type="text/javascript" src="bs/js/bootstrap.js"></script> 
	<script type="text/javascript" src="js/cake/getCatalog.js"></script> 
	<script type="text/javascript" src="js/cake/index.js"></script> 
	<script type="text/javascript" src="js/cake/landing.js"></script>
	<link href="css/cake/head_footer.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/cake/index.css" /> 
	<script type="text/javascript" src="js/cake/addcart.js"></script>
	
	<style type="text/css">
		.dropdown-menu{
			margin:0;
		}
	</style>
	
</head>
<body>

	<div class="container-fullid">
		<%@include file="header.jsp" %>
		<div class="wrapper">
			<!-- banner start -->
			<div class="banner" style="margin-top:-19px;">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="images/cake/4.jpg" alt="...">
						</div>
						<div class="item">
							<img src="images/cake/5.jpg" alt="...">
						</div>
						<div class="item">
							<img src="images/cake/6.jpg" alt="...">
						</div>
						
					</div>
				
				    <!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					</a>
				</div>
			</div>
			<!-- main start -->
			<div class="main container">
				<div class="row" style="margin:40px 0px 40px 90px;">
					<!-- <div class="col-md-2 main-left">
						<h3>商品分类</h3>
						<ul id="catalog-list">
							<li><a href="CakeList">所有商品</a></li>
							
						</ul>
					</div> -->
					
					<div style="float:left; margin-top:20px;" >
						<div class="all-pro">
							<span class="all-home"><a href="index.html">全部商品</a></span>
						</div>
						<div class="all-series">
							<span type="display: block;line-height: 1;" onclick="showFormBox()" class="text">所有系列</span>
							<img class="icon" src="images/cake/filter-icon.png" onclick="showFormBox()" alt="">
							<div style="display:none;" class="show-all">
								<ul id="catalog-list" >
									<li><a href="CakeList"></a></li>
							
								</ul>
							</div>
						</div>
					</div>
						<div class="search col-md-4 col-md-offset-6" style="margin-top:20px;float:right;margin-left:0px">
							<div class="input-group">
								<form action="CakeList2" method="get">
			     	 				<input style="float: left;width: 160px;border-radius:12px;" type="text" class="form-control" name="seachname" placeholder="输入要搜索商品">
			       					&nbsp;&nbsp;&nbsp;
			       					<span type="submit" style="float: left;width: 40px;border:none;" class="btn btn-default"  ><img class="icon" src="images/cake/search-icon.png" alt=""></span>
								</form>
	   						</div>
						</div> 
					
				   </div>	
					<div class="col-md-10 main-right"" style="margin-left:80px;">
						<div class="pro col-md-12">
							<h3>推荐商品</h3>
							<div id="recCakes" class="pro-list">
								<ul> 
								
									
								</ul>
							</div>
								
						</div>
						<div class="pro col-md-12">
							<h3>新品上市</h3>
							<div id="newCakes" class="pro-list">
								<ul > 
									
								</ul>
							</div>
						</div>
					</div>
				</div>	
			</div>
		<br/><br/>
		<%@include file="footer.jsp" %>
	</div>
	<!--弹窗盒子start -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	  	<div class="modal-dialog modal-sm">
	    	<div class="modal-content" style="margin-top:300px;">
	    		<div class="modal-body" style="color:green;font-size:20px;">
	    		  	<img class="icon" src="images/cake/success-icon.png" alt="">
				  	 已成功加入购物车
				</div>
	    			
	      		<div class="modal-footer">
	      			<a href="javascript:void(0)" type="button" class="btn btn-md btn-default" data-dismiss="modal">返回继续购物</a>
			        <a href="jsp/cake/cart.jsp" type="button" class="btn btn-md btn-success">立即去结算</a>
			    </div>
	    	</div>
	  	</div>
	</div>
	<!--弹窗盒子end -->
	<script type="text/javascript">
		function showFormBox() {
			if($(".show-all").is(":hidden")){
				$(".show-all").css("display","block")
			}else{
				$(".show-all").css("display","none")
			}
			
		}
	</script>
</body>
</html>