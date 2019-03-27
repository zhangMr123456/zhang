package service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.DBConnection;

public class StuService {
	DBConnection db = new DBConnection();// 初始化静态代码块: 加载驱动
	// 添加

	public int add(String[] param) {
		String sql = "insert into t1(name,password,sex,age,address) values(?,?,?,?,?)";
		db.doSQL(sql, param);// 获得连接 创建执行SQL的对象 执行SQL命令
		int i = db.getUpCount();// 获得执行结果
		db.getClose();// 关闭资源
		return i;
	}

	// 修改
	public int edit(String[] param) {
		String sql = "update t1 set name=?,password=?,sex=?,age=?,address=? where id=?";
		db.doSQL(sql, param);// 获得连接 创建执行SQL的对象 执行SQL命令
		int i = db.getUpCount();// 获得执行结果
		db.getClose();// 关闭资源
		return i;
	}

	// 删除
	public int delete(String[] param) {
		String sql = "delete from t1 where id=?";
		db.doSQL(sql, param);// 获得连接 创建执行SQL的对象 执行SQL命令
		int i = db.getUpCount();// 获得执行结果
		db.getClose();// 关闭资源
		return i;
	}

	// 查询
	public List<Map<String, String>> list(String sql, String[] param) {
		List<Map<String, String>> list = null;
		try {
			db.doSQL(sql, param);// 获得连接 创建执行SQL的对象 执行SQL命令
			ResultSet rs = db.getRS();// 获得执行结果: 结果集
			if (rs != null) {// 查询执行正常: 含有数据的ResultSet,空 ResultSet
				// 将指针移动到结果集的最后1行
				rs.last();
				// 获得该行的行号
				int rowNum = rs.getRow();
				// 根据行号,判断是否含有数据
				if (rowNum > 0) {// 至少含有1条数据
					rs.beforeFirst();// 将指针移到第1行之前: 表头
					list = new ArrayList<Map<String, String>>();
					while (rs.next()) {// 将结果集的指针向下移动1行
						/*
						 * String id = rs.getString("id"); String name =
						 * rs.getString("name"); //getString() getInt()以指定数据类型
						 * 获得指定字段的值 String sex = rs.getString("sex"); String age
						 * = rs.getString("age"); String address =
						 * rs.getString("address"); System.out.println(id + ","
						 * + name + "," + sex + "," + age + "," + address);
						 */
						Map<String, String> map = new HashMap<String, String>();
						map.put("id", rs.getString("id"));
						map.put("name", rs.getString("name"));
						map.put("password", rs.getString("password"));
						map.put("sex", rs.getString("sex"));
						map.put("age", rs.getString("age"));
						map.put("address", rs.getString("address"));
						list.add(map);
					}
				} else {
					System.out.println("对不起,没有您要查询的数据!");
				}

			} else {// 查询执行失败: 不会有ResultSet

			}
			db.getClose();// 关闭资源
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public int selectSum() {
		String sql="select count(id) as sum from t1;";
		int sum=0;
		try {
			db.doSQL(sql, new String[0]);// 获得连接 创建执行SQL的对象 执行SQL命令
			ResultSet rs = db.getRS();// 获得执行结果: 结果集
			if (rs != null) {// 查询执行正常: 含有数据的ResultSet,空 ResultSet
				// 将指针移动到结果集的最后1行
				rs.next();
				// 根据行号,判断是否含有数据
				String id=rs.getString("sum");
				sum=Integer.valueOf(id);
			}
			db.getClose();// 关闭资源
		} catch (Exception e) {
		}
		return sum;
	}
}
