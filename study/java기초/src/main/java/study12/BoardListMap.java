package study12;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class BoardListMap {
	
	public static void print1(List<Map> list) {
		for(int i=0;i<list.size();i++) {
			Iterator<String> keys = list.get(i).keySet().iterator();
			while(keys.hasNext()) {
				String key = keys.next();
				String data = (String)list.get(i).get(key);
				System.out.println(key+" = "+data+" ");
			}
			System.out.println();
		}
	}	
	
	public static void print2(List<Map> list) {
		for(int i=0;i<list.size();i++) {
			Iterator<String> keys = list.get(i).keySet().iterator();
			while(keys.hasNext()) {
				String key = keys.next();
				String data = (String)list.get(i).get(key);
				if(key.equals("rdate")) {
					data = data.replace("-","/");
				}
				System.out.println(key+" = "+data+" ");
			}
			System.out.println();
		}
	}	
	
	public static void main(String[] args) {
		
		List<Map> list = new ArrayList<Map>();
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("no", "1");
		map.put("title","공지사항11");
		map.put("rdate", "2024-09-01");
		map.put("hits","32");
		list.add(map);
		
		map = new HashMap<String,String>();
		map.put("no", "2");
		map.put("title","공지사항22");
		map.put("rdate", "2024-09-20");
		map.put("hits","15");
		list.add(map);
		
		print1(list);
		System.out.println("----------");
		print2(list);
		
	}

}
