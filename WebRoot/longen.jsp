<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
body {
	background: url("img/20150502_60110e97958b59b841b8eB3E360zJnEX.jpg")
		no-repeat;
	background-size: 100% 600px;
}

#div {
	width: 100%;
	display: inline-block;
	text-align: center;
	padding-top: 200px;
}
</style>
<script type="text/javascript">
		var a = function (){
			//location.reload();
			if((${requestScope.i})==1){
					alert("${requestScope.i==1?'注册成功!':''}");
			}
		}();
	</script>
	<script type="text/javascript">
	function text1(){
			var passwrod=document.getElementById("password");
			if(password.type=="password"){
				alert("password.type=text;")
				password.type="text";
			}else{
				alert("password.type=password;")
				password.type="password";
			}
			
		}
	</script>
</head>
<body>
	<div id="div">
	<h1 style="text-align: center;">用户登录</h1>
		<form action="StuServlet?actionType=login" method="post">
			账号:<input type="text" name="name" style="width: 150px;"
				value="${requestScope.name }"><br /> 密码:<input
				type="password" name="password" style="width: 150px;" value="${requestScope.password }" id="password"><input type="button" onclick="text1()"><br />
			<input type="submit" value="提交"> <input type="button"
				value="注册"
				onclick="location.href='zhuce.jsp'">
		</form>
	</div>
	<!-- onclick="window.open('zhuce.jsp','注册','width:300,height:500')" -->
</body>
</html>
