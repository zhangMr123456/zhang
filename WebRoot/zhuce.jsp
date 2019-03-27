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
<title>My JSP 'zhuce.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<script type="text/javascript">
	function text(tag) {
		var name=document.getElementById("name");
		var password=document.getElementById("password");
		var age=document.getElementById("age");
		var namespan=document.getElementById("namespan");
		var passwordspan=document.getElementById("passwordspan");
		var agespan=document.getElementById("agespan");
		var namezz=/[0-9a-zA-Z]{6,12}/;
		var passwordzz=/[0-9]{6,12}/;
		var agezz=/[0-9]{1,2}/;
		switch(tag){
		//在传入值的时候一定要使用单引号包裹否则没有效果
		case 'name':
			if(namezz.test(name.value)){
				namespan.style.color="blue";
				namespan.innerHTML="通过";
			}else{
				namespan.style.color="red";
				namespan.innerHTML="不通过";
			}
			break;
		case 'password':
			if(passwordzz.test(password.value)){
				passwordspan.style.color="blue";
				passwordspan.innerHTML="通过";
			}else{
				passwordspan.style.color="red"
				passwordspan.innerHTML="不通过";
			}
			break;
		case 'age':
			if(agezz.test(age.value)){
				agespan.style.color="blue";
				agespan.innerHTML="通过";
			}else{
				agespan.style.color="red";
				agespan.innerHTML="不通过";
			}
			break;
		}
	}
</script>
<style type="text/css">
#div {
	width: 100%;
	margin: 0px 600px;
	padding-top: 100px;
}
body {
	background-image:url("img/0954fb27c1264934adbf4eb67c33ea97!600x600.jpeg");
}

div {
	padding-top: 20px;
}
</style>
</head>
<body>
	<div id="div">
		<h2>注册用户</h2>
		<!-- 表单数据提交时,浏览器将表单组件的name属性值作为 请求参数的名称,表单组件的值作为参数的值 -->
		<form action="StuServlet?actionType=zhuce" method="post">
			<div>
				账号:<input type="text" name="name" id="name" onblur="text('name')">
				<span id="namespan"></span>
			</div>
			<div>
				密码:<input type="password" name="password" id="password" onblur="text('password')">
				<span id="passwordspan"></span>
			</div>
			<div>
				性别:<input type="radio" name="sex" checked="checked" value="男">男<input
					type="radio" name="sex" value="女">女
			</div>
			<div>
				年龄:<input type="text" name="age" id="age" onblur="text('age')">
				<span id="agespan"></span>
			</div>
			<div>
				地址:<select name="address">
					<option>上海</option>
					<option>深圳</option>
					<option>北京</option>
					<option>南京</option>
					<option selected="selected">--请选择器--</option>
				</select>
			</div>
			<div>
				<input type="submit" value="注册"> <input type="reset" value="重置">
			</div>
		</form>
	</div>
</body>
</html>
