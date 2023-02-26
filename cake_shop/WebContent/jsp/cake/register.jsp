
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
    	#userlogin {
    		width: 600px;
    		height: 300px;
    		margin: 50px auto;
    		text-align: center;
    		background-color: white;
    		padding-top: 80px;
    	}
    	
    	table {
    		margin-left: 140px;
    		margin-bottom: 20px;
    	}
    	
    	body {
    		background-color: #CAF0D3;
    	}
    	
    	#head {
    	height: 100px;
    	}
    </style>
    
   <script type="text/javascript">
    function checklogin()                       
    {
       
        
        if((myform.username.value!=""))
        {
            if((myform.password.value!=""))
            {
                return true
            }
            else
            {
                alert("用户名或密码不能为空");
                return false
                }
            }
        else
        {
            alert("用户名或密码不能为空");
            return false
            
        }
    }
    </script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/login.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
		
		<script type="text/javascript">
		$(function(){
		    $('#username').change(function(){
		         $.ajax({
		             type: "POST",
		             url: "${pageContext.request.contextPath }/checkUsernameServlet",
		             data: {username:$("#username").val()},
		             dataType: "json",
		             success: function(data){
		                         $('#username').empty(); 
		                         $('#username').focus();
		                         $('#usernamemsg').empty();
		                         $('#usernamemsg').html(data.msg);
		                      }
		         });
		    });
		});
		</script>
</head>
<body>
<div id="head">
	<img alt="" src="${pageContext.request.contextPath }/images/logo.jpg" width="500px" height="100px">
</div>
<div id="userlogin">
    <h3>用户注册</h3>

    <form action="${pageContext.request.contextPath }/registerServlet" method="post" name="myform" onSubmit="return checklogin()">
    <table>
    <tr>
 <td width="">用户名:</td>
<td><input type="text" name="username" id="username" /> <span id="usernamemsg" style="color: red"></span></td>                    
 </tr>
 <tr> 
<td>密码:</td>
<td><input type="password" name="password" id="password"/></td>
</tr>
 <tr> 
<td>性别:</td>
<td><select name="sex">
		<option value="男">男</option>
		<option value="女">女</option>
	</select>
</td>
</tr>
<tr> 
<td>联系方式:</td>
<td><input type="phone" name="phone" id="phone"/></td>
</tr>
<tr> 
<td>地址:</td>
<td><input type="address" name="address" id="address"/></td>
</tr>
</table> 
        <input type="submit" value="注册"/><br/>
    </form>
</div>
</body>
</html>
