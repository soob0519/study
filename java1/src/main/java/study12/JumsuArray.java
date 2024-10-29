package study12;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class JumsuArray {

	public static void main(String[] args) {
		
		List<Map> list = new ArrayList<Map>();
		
		Map<String,String> map = new HashMap<String,String>(); 		
		
		map.put("id", "test1");
		map.put("eng", "80");
		map.put("kor", "70");
		map.put("math", "88");
		
		list.add(map);
		
		// System.out.println(	list.get(0)	);
		// System.out.println(	list.get(0).get("eng")	);
		
		Iterator<String> keys = list.get(0).keySet().iterator();
		// Iterator<Integer> keys = map.keySet().iterator();
		
		while(keys.hasNext()) {
			String key = keys.next();
			String data = map.get(key);
			System.out.println(data);
		}
		
		
	}

}
