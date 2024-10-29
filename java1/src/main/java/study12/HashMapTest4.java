package study12;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class HashMapTest4 {

	public static void main(String[] args) {
		Map <String,String> map = new HashMap<String,String>();
		map.put("이름","홍길동");
		map.put("영어","90");
		map.put("국어","10");
		map.put("수학","77");
	
		// 데이터변경
		map.put("국어","80");
		
		int sum = 0;
		double avg = 0;
		int cnt = 0;
		
		Iterator<String> keys = map.keySet().iterator();
		while(keys.hasNext()) {
			
			String key = keys.next();	// (키값 == 칼럼값)
			String data = map.get(key);
			
			if(!key.equals("이름")) {
				sum += Integer.parseInt(data);
				cnt++;
			}
			
		}
		avg = (double)sum/cnt;
		
		System.out.println("총점:"+sum);
		System.out.println("평균:"+avg);
		
		
		
	}

}
