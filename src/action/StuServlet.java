package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.StuService;

public class StuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StuService service = new StuService();

	public StuServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 编码处理
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 获得业务类型: 根据业务类型,调用不同的方法
		// actionType: add edit delete list
		String actionType = request.getParameter("actionType");
		if ("add".equals(actionType)) {
			addStu(request, response);
		} else if ("edit".equals(actionType)) {
			editStu(request, response);
		} else if ("delete".equals(actionType)) {
			deleteStu(request, response);
		} else if ("login".equals(actionType)) {
			checkLogin(request, response);
		} else if ("editID".equals(actionType)) {
			editID(request, response);
		} else if ("select".equals(actionType)) {
			select(request, response);
		} else if ("zhuce".equals(actionType)) {
			zhuce(request, response);
		} else if ("TuiChu".equals(actionType)) {
			TuiChu(request, response);
		} else {
			System.out.println("业务类型 匹配失败!");
		}

	}

	public void TuiChu(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().invalidate();// 清除并初始化Session容器
		response.sendRedirect("longen.jsp");
	}
	public void zhuce(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String address = request.getParameter("address");
		String[] param = { name, password, sex, age, address };
		int i = service.add(param);
		request.setAttribute("i", i);
		request.setAttribute("name", name);
		request.setAttribute("password", password);
		request.getRequestDispatcher("longen.jsp").forward(request, response);
	}
	public void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dangqianye=request.getParameter("i");//获取当前页页码
		int index = 5;// 每页显示5条数据
		int jishu = 0;//需要分多少页
		if(dangqianye!=null){
			jishu=Integer.valueOf(dangqianye);//获取当前页数并且赋值给jishu
			jishu=(jishu-1)*5;
		}
		int yeshu=0; 
		List<Map<String, String>> list1 = service.list("select *  from t1 limit " + jishu + "," + index, new String[0]);//查询从指定位置到指定位置的数据
		int sum=service.selectSum();//获得总行数
		if(sum%5==0){
			yeshu=sum/5;
		}else{
			yeshu=sum/5+1;
		}
		request.setAttribute("chaxun","chaxun");
		request.setAttribute("dangqianye",dangqianye);
		request.setAttribute("yeshu", yeshu);
		request.setAttribute("list1", list1);
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}

	public void editID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		// System.out.println(id);
		request.setAttribute("id", id);
		List<Map<String, String>> list1 = service.list("select *  from t1 where id=" + id, new String[0]);
		request.setAttribute("list", list1);
		request.getRequestDispatcher("edit.jsp").forward(request, response);
	}

	// 检验登陆
	public void checkLogin(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 获得用户数据
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		// 调用业务类,执行查询操作
		// 调用业务类,执行查询操作
		List<Map<String, String>> list = service.list("select *  from t1 where name=? and password=?",
				new String[] { name, password });
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (list != null) {
			// 将登陆者的姓名 存入session容器
			request.getSession().setAttribute("loginName", name);
			request.getRequestDispatcher("main.jsp").forward(request, response);
			;
		} else {
			out.print("账号或密码错误,3秒后自动跳转到登陆页面!");
			// response.sendRedirect("longen.jsp");
			response.setHeader("refresh", "3;url=longen.jsp");
		}
	}

	// 删除学习
	public void deleteStu(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 获得用户数据
		String id = request.getParameter("id");
		// 调用业务类,执行删除操作
		String[] param = { id };
		service.delete(param);
		select(request, response);
		response.setHeader("refresh", "0;url=main.jsp");
	}

	// 修改学生
	public void editStu(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// 获得用户数据
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String address = request.getParameter("address");
		// 调用业务类,执行修改操作
		String[] param = { name, password, sex, age, address, id };
		service.edit(param);
		// request.setAttribute("i", i==1?"成功":"失败");
		response.setHeader("refresh", "0;url=auto.jsp");
	}

	// 添加学生
	public void addStu(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// 获得页面数据
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String address = request.getParameter("address");
		// 调用业务类,执行添加操作
		String[] param = { name, password, sex, age, address };
		service.add(param);
		// response.getWriter().print("<script type=\"text/javascript\">var a=s
		// function
		// text(){window.opener.location.href=\"StuServlet?actionType=select\";window.opener.location.reload();window.close();</script>");
		// return window.confirm('确认修改吗?');
		response.setHeader("refresh", "0;url=auto.jsp");
	}

	public void init() throws ServletException {
		
	}
}
