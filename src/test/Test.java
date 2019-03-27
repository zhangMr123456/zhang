package test;

import java.util.List;
import java.util.Map;

import service.StuService;

public class Test {
	StuService service=new StuService();
	public static void main(String[] args) {
		Test t=new Test();
		//测试添加
		String[] param={"BB","123","男","32","北京","16"};
		//t.add(param);
		//t.edit(param);
		//t.delete(new String[]{"16"});
		t.list(new String[0]);
	}

	public void add(String[] param) {
		int i=service.add(param);
		System.out.println(i!=-1?"操作成功":"操作失败");
	}
	public void edit(String[] param) {
		int i=service.edit(param);
		System.out.println(i!=-1?"操作成功":"操作失败");
	}
	public void delete(String[] param) {
		int i=service.delete(param);
		System.out.println(i!=-1?"操作成功":"操作失败");
	}
	public void list(String[] param) {
		List<Map<String, String>> list=service.list("select *  from t1", param);
		System.out.println("list: ");
		System.out.println(list);
	}
	
}
