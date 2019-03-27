package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.Test;


public class DBConnection {
	private static final String DriverClass = "com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/mydb";//主协议:子协议://主机名或IP地址:端口号/仓库名
	private String user="root";
	private String password="123456";
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	//加载驱动
	//static{}称为静态代码块,在整个生命周期中运行1次,且会在创建对象之前执行.
	static{
		try {
			Class.forName(DriverClass);//使用反射机制找到驱动器的入口: Driver.class
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//获得连接
	@Test
	public void getConnnet() {
		try {
			conn=DriverManager.getConnection(url, user, password);
			if (conn!=null) {
				System.out.println("连接成功!");
			} else {
				System.out.println("连接失败!");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//创建执行方法: 添加,修改,删除,查询
	public void doSQL(String sql,String[] param) {
		/*
		 * Statement: 只能执行静态SQL[不含有占位符]
		 * PreparedStatement: 属于Statement子类,因此该类可以执行静态SQL和动态SQL
		 */
		try {
			getConnnet();//获得连接
			//PreparedStatement-->Statement
			pstmt=conn.prepareStatement(sql);//创建执行SQL的对象
			for (int i = 0; i < param.length; i++) {
				pstmt.setString(i+1, param[i]);//占位符索引,值
			}
			pstmt.execute();//执行SQL命令
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//获得执行结果: 添加 修改 删除
	public int getUpCount() {
		int i=-1;
		try {
			i=pstmt.getUpdateCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  i;
	}
	//获得结果集
	public ResultSet getRS() {
		try {
			rs=pstmt.getResultSet();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	//关闭资源: 连接对象 执行SQL对象 结果集 [先开启的后关闭]
	public void getClose() {
		try {
			if (rs!=null) {
				rs.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			try {
				if (pstmt!=null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}finally{
				try {
					if (conn!=null) {
						conn.close();
					}
				} catch (Exception e3) {
					// TODO: handle exception
				}
			}
		}
	}
}
