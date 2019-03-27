<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>添加信息</title>
    
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
		window.close();
	}
</script>
  </head>
  <body>
    添加学生<br>
    <!-- 表单数据提交时,浏览器将表单组件的name属性值作为 请求参数的名称,表单组件的值作为参数的值 -->
    <form action="StuServlet?actionType=add" method="post">
    账号:<input type="text" name="name"><br>
    密码:<input type="password" name="password"><br>
    性别:<input type="radio" name="sex" checked="checked" value="男">男<input type="radio" name="sex" value="女">女<br>
    年龄:<input type="text" name="age"><br>
    地址:<select name="address">
    <option>上海</option>
    <option>深圳</option>
    <option>北京</option>
    <option>南京</option>
    <option selected="selected">--请选择器--</option>
    </select><br>
    <input type="submit" value="添加" onclick="text()">
    <input type="reset" value="重置">
    </form>
  </body>
</html>
