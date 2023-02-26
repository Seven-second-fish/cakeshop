<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();  //返回当前页面所在的应用的名字
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//request.getSchema() 可以返回当前页面使用的协议，http 或是 https;
	//request.getServerName() 可以返回当前页面所在的服务器的名字;
	//request.getServerPort() 可以返回当前页面所在的服务器使用的端口,就是80;
	pageContext.setAttribute("basePath", basePath);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<base href="${basePath}"><!-- 设置基础路径为basePash,依此延伸 -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>BON CAKE</title>
	<link rel="stylesheet" href="bs/css/bootstrap.css">
	<script type="text/javascript" src="bs/js/jquery.min.js"></script>
	<script type="text/javascript" src="bs/js/bootstrap.js"></script> 

	<link rel="stylesheet" type="text/css" href="bs/validform/style.css">
	<script type="text/javascript" src="bs/validform/Validform_v5.3.2_min.js"></script> 
	<script type="text/javascript" src="js/cake/user_reg_login.js"></script> 
	<script type="text/javascript" src="js/cake/landing.js"></script>
	<link href="css/cake/head_footer.css" rel="stylesheet" type="text/css">
	<link href="css/cake/user_reg_login.css" rel="stylesheet" type="text/css">
	
</head>
<body>
<c:if test="${!empty infoList}">
	<c:forEach items="${infoList}" var="i">
		<script type="text/javascript">
			alert("${i}")
		</script>
	</c:forEach>
</c:if>
	<div>
		<%@include file="header.jsp" %>
		<div class="wrapper" style="margin-top:-20px;background-repeat:no-repeat;background-size:cover;">
			<!-- main start -->
			<div class="main container">
					<!-- 登录表单 -->
					<div id="tab_login" >
						<h4>用户登录</h4>
						<form id="loginForm" action="UserServlet?action=login" method="post" class="form-horizontal">
							<div class="form-group">
								<label for="l_userName" class="col-md-3 control-label">用户名：</label>
								<div class="col-md-7">
									<input name="userName" id="l_userName" type="text" class="form-control" >
									<span class="Validform_checktip">&nbsp;</span>
								</div>
								
							</div> 
							<div class="form-group">
								<label for="l_passWord" class="col-md-3  control-label">密&nbsp;&nbsp;&nbsp;码：</label>
								<div class="col-md-7">
									<input type="password" name="passWord" id="l_passWord" class="form-control">
									<span class="Validform_checktip">&nbsp;</span>
								</div>
								
							</div>
							
							<div class="form-group">
								<label for="ck_code" class="col-md-3  control-label">验证码：</label>
								<div class="col-md-4" >
									<input class="form-control" type="text" name="code" id="ck_code" >
									<span class="Validform_checktip">&nbsp;</span>
								</div>
								
								<div class="col-md-5" style="padding:0;">
									<img class="col-md-6" id="imgCode" src="CodeServlet?action=code" alt="" style="padding:0;width:100px;height:38px;" />
									<span onclick="reCode()" class="col-md-2 glyphicon glyphicon-refresh " aria-hidden="true" style="padding:0 0 0 5px;font-size: 24px;"></span>
								</div>
							</div>
							
							<!-- <div class="radioGroup">
								<div class="radio-box">
									<input type="radio" id="radio-2" name="type" checked value="2" />
									<label for="radio-2">用户</label>
								</div>
								
								<div class="radio-box">
									<input type="radio" id="radio-1" name="type" value="1" />
									<label for="radio-1">管理员</label>
								</div>
							</div> -->
							<div class="form-group">
								<label class="col-md-2 control-label " style="magin-left:20px;float:right;'">
									<!-- <a href="/cake_shop/WebContent/jsp/admin/login2.jsp" style="background:#d3b145;color:#fff;;" class="btn btn-sm">管理员</a> -->
									<input type="button" onclick='location.href=("login2.jsp")' value="管理员" style="background:#d3b145;color:#fff;;" class="btn btn-sm"/>
								</label>
								<label class="col-md-2 control-label col-md-offset-4">
									<input class="btn btn-sm" style="background:#d3b145;color:#fff" type="submit" value="登录">
								</label>
								<label class="col-md-2 control-label">
									<input class="btn btn-sm"  style="background:#333333;color:#fff" type="reset" value="重置">
								</label>
								
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<%@include file="footer.jsp" %>
	</div>
	
		
<script type="text/javascript">
/* tab标签显示控制通过url参数 */
	var ur=location.href;
	var para=ur.split('?')[1];
	var type="login";//默认
	if(para!=null){
		type=para.split("type=")[1];
	}
	switch (type){
	   case 'reg':
	       $('#myTab a[href="#tab_reg"]').tab('show')
	       break;
	   case 'login':
	       $('#myTab a[href="#tab_login"]').tab('show')
	       break;
	}   
	
	//验证码 
	function reCode(){
		$("#imgCode").prop("src","CodeServlet?action=code&"+new Date().getTime());
	}
	
		
		
</script>
</body>
</html>