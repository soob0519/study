package donghwa.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class test2 {

	public static void main(String[] args) {
		List<Map> list = new ArrayList<Map>();
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("title","a11111");
		map.put("pass","1234");
		map.put("name","홍길동");
		System.out.println(map);
		System.out.println("제목 : "+map.get("title"));
		
		list.add(map);
		System.out.println(list);
		
		map = new HashMap<String,String>();
		map.put("title","a2222");
		map.put("pass","44444");
		map.put("name","에디슨");
		
		list.add(map);
		System.out.println(list.get(1));
		
		System.out.println(list.get(0).get("pass"));
		
		System.out.println("=============================");
		System.out.println("제목	암호	이름");
		for(int i=0; i<list.size(); i++) {
			String title = (String) list.get(i).get("title");
			String pass = (String) list.get(i).get("pass");
			String name = (String) list.get(i).get("name");
			System.out.println(title+"	"+pass+"	"+name);
			
		}
	}

}
