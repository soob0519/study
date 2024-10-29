package study12;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class HashMapTest3 {

	public static void main(String[] args) {
		
		// 풀어보기1
		Map <String,Integer> map = new HashMap<String,Integer>();
		
		map.put("영어",80);
		map.put("국어",90);
		map.put("수학",70);
		int sum = 0;
		int avg = 0;
		String title = "";
		
		// 키값을 한번에 가져옴
		Iterator<String> keys = map.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next();
			int data = map.get(key);
			
			// if(key.equals("국어")) {
				System.out.println(key+":"+data);	
			// }
				sum += data;
				
				if(data < 60) {
					title += key+",";
				}
				
		}
		avg = sum/map.size();
		if(title.length() > 0 ) {
			title = title.substring(0,(title.length()-1));
		} else {
			title= "없음";
		}
		System.out.println("------------");
		System.out.println("총점:"+sum);
		System.out.println("평균:"+avg);
		System.out.println("낙제과목:"+title);
		
		
		
		
		
		
	}

}
