<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>修改信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<script type="text/javascript">
	function text(){
	window.opener.location.href="StuServlet?actionType=select";
	window.opener.location.reload();
	//return window.confirm('确认修改吗?');
	window.close();
	}
</script>
  </head>
  
  <body>
   修改信息<br>
    <form action="StuServlet?actionType=edit&id=${requestScope.id }" method="post">
    账号:<input type="text" name="name" value="${requestScope.list[0].name }"><br>
    密码:<input type="password" name="password" value="${requestScope.list[0].password }"><br>
    性别:<input type="radio" name="sex" ${requestScope.list[0].sex =='男'?'checked=checked':''} value="男">男<input type="radio" name="sex" ${requestScope.list[0].sex =='女'?'checked=checked':''} value="女">女<br>
    年龄:<input type="text" name="age" value="${requestScope.list[0].age }"><br>
    地址:<select name="address">
    <option  ${requestScope.list[0].address =='上海'?'selected=selected':''}>上海</option>
    <option  ${requestScope.list[0].address =='深圳'?'selected=selected':''}>深圳</option>
    <option  ${requestScope.list[0].address =='北京'?'selected=selected':''}>北京</option>
    <option  ${requestScope.list[0].address =='南京'?'selected=selected':''}>南京</option>
    <option>--请选择器--</option>
    </select><br>
    <input type="submit" value="修改">
    <input type="reset" value="重置">
    </form>
  </body>
</html>
