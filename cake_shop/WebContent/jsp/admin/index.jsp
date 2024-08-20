<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>主页</title>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<link rel="stylesheet" href="bs/css/bootstrap.css">
	<script type="text/javascript" src="bs/js/jquery.min.js"></script>
	<script type="text/javascript" src="bs/js/bootstrap.js"></script>
	<link rel="stylesheet" href="css/admin/header.css">
	<style type="text/css">
		
	</style>
</head>
<body>
	<div class="header container-fluid" style="background:#333333;"> 
		<a class="title" href="jsp/admin/main.jsp" target="rFrame">BON CAKE后台管理系统</a>
		<div class="btn-group adminName">
			<a type="button" class="btn dropdown-toggle" style="color:#fff;">
				 <img class="icon" src="images/cake/login-icon.png" alt="">
			    ${adminUser.userName} <span class="caret"></span>
			</a>
			<ul class="dropdown-menu dropdown-menu-right">
			    <!-- <li><a href="LoginOutServlet" target="_top" onClick="return confirm('确定要退出系统了么？')">
			    	退 出 登 录</a></li> -->
			    <li><a href="jsp/cake/login.jsp" target="_top" onClick="return confirm('确定要退出系统了么？')">
			    	退 出 登 录</a></li>
			</ul>
		</div>
		
	</div>
	<div class="left">
		<iframe  src="jsp/admin/left.jsp" width="210px" height="100%" frameborder="0" name="left" marginwidth="0" marginheight="0"></iframe>
	</div>
	<div class="right">
		<iframe src="jsp/admin/main.jsp" width="100%" height="100%" frameborder="0" name="rFrame" marginwidth="0" marginheight="0"></iframe>
	</div>
	
</body>
<script type="text/javascript">
	$(".adminName").mouseover(function(){
		$(".dropdown-menu").css("display","inline-block");
	})
	$(".adminName").mouseout(function(){
		$(".dropdown-menu").css("display","none");
	})
</script>
</html>