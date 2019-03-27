<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'main.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
body {
	background: url("img/zzpic16991.jpg") no-repeat;
	background-size: 100% 1000px;
}

table, tr, th, td {
	border: 1px #FF00FF solid;
	text-align: center;
}

table {
	width: 400px;
}

#div {
	width: 400px;
	margin: 150px 900px;
}

a {
	text-decoration: none;
}

a:HOVER {
	color: red;
}

a:LINK {
	color: blue;
}

#div1 {
	margin: 0px auto;
	text-align : center;
	width: 400px;
	text-align: center;
	width: 400px;
}
</style>
<script type="text/javascript">
	function text1(tag) {
		var openUrl = ""; //弹出窗口的url
		var iWidth = 300; //弹出窗口的宽度;
		var iHeight = 200; //弹出窗口的高度;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置;
		window.open('StuServlet?actionType=editID&id=' + tag, '修改信息', "height=" + iHeight + ", width=" + iWidth + ", top=" + iTop + ", left=" + iLeft);
	}
	function text2() {
		var openUrl = ""; //弹出窗口的url
		var iWidth = 300; //弹出窗口的宽度;
		var iHeight = 200; //弹出窗口的高度;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置;
		window.open('add.jsp', '添加用户', "height=" + iHeight + ", width=" + iWidth + ", top=" + iTop + ", left=" + iLeft);
	}
	function text3() {
		var div1 = document.getElementById("div1");
		div1.style.display.inline - block;
	}
	function text4(){
		var input=document.getElementById("input").value;
		if(${requestScope.yeshu }>=input&&input>=1){
		location.href='StuServlet?actionType=select&i='+input;//浏览器地址改为StuServlet?actionType=select&i='+input
		}else{
		alert("没有此页码!")
		}
	}
	var a = function () {
		var div1=document.getElementById("div1");
		if("${requestScope.chaxun}"==null){
			div1.style.display="block";
			//$("#div1").css("display","block");//修改display属性为block
		}else{
			div1.style.display="none";
		}
	}();
</script>
</head>
<body>
	<div id="div">
		<h2 style="text-align: center;">
			欢迎<%=request.getSession().getAttribute("loginName")%>,访问学生管理系统!
		</h2>
		<p style="text-align: center;">
			<a href="javascript:void(0)" onclick="text2()">添加学生</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="StuServlet?actionType=select&i=1">查询学生</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="StuServlet?actionType=TuiChu">退出系统</a>
		</p>
		<form action="" method="post">
			<table>
				<tr>
					<th>编号</th>
					<th>账号</th>
					<th>密码</th>
					<th>性别</th>
					<th>年龄</th>
					<th>地址</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				</tr>
				<c:forEach var="map" items="${requestScope.list1}">
					<tr>
						<td>${map.id }</td>
						<td>${map.name }</td>
						<td>${map.password }</td>
						<td>${map.sex }</td>
						<td>${map.age }</td>
						<td>${map.address }</td>
						<td><a href="javascript:void(0)" onclick="text1(${map.id })">修改</a><br />
							<a href="StuServlet?actionType=delete&id=${map.id }">删除</a></td>
					</tr>
				</c:forEach>
			</table>
			<div id="div1">
				<a href="StuServlet?actionType=select&i=1">首页</a>
				<c:if test="${requestScope.dangqianye>1 }">
					<a href="StuServlet?actionType=select&i=${requestScope.dangqianye-1  }">上一页</a>
				</c:if>
				<c:forEach begin="1" end="${requestScope.yeshu }" var="i">
					<a href="StuServlet?actionType=select&i=${i }">${i }</a>
				</c:forEach>
				<c:if test="${requestScope.dangqianye!=requestScope.yeshu  }">
						<a href="StuServlet?actionType=select&i=${requestScope.dangqianye+1 }">下一页</a>
					</c:if>
				<a href="StuServlet?actionType=select&i=${requestScope.yeshu }">尾页</a>
				
				跳转到<input type="text" style="width: 30px;" id="input"> <a href="javascript:void(0)" onclick="text4()">Go</a>
				<!-- <input TYPE="button" value="Go" onclick="text4()" style="height: 22px;"> -->
			</div>
		</form>
	</div>
</body>
</html>
