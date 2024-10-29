package study12;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class HashMapTest5 {

	public static void main(String[] args) {
		Map <String,String> map = new HashMap<String,String>();
		map.put("userid", "test1");
		map.put("pass", "1212");
		map.put("name", "홍길동");
		map.put("birth", "1990-12-25");
		
		Iterator<String> keys = map.keySet().iterator();
		int age = 0;
		
		while(keys.hasNext()) {
			String key = keys.next();
			String data = map.get(key);
			System.out.println(key+":"+data);
			
			if (key.equals("birth")) {
				String[] arr = data.split("-");
				int year = Integer.parseInt(arr[0]);
				age = 2024 - year;
			}
		}
		System.out.println("age:"+age);
		
	}

}
