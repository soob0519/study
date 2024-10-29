package study12;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class HashMapTest2 {

	public static void main(String[] args) {
		
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("title","첫글입니다.");
		map1.put("pass", "1212");
		map1.put("name", "홍길동");
		map1.put("content","aaabbbccc");
		
		
		// String title = map1.get("title");
		System.out.println(map1);		
		// System.out.println("제목"+title);
		
		// 키값을 모두 얻어냄
		Iterator<String> keys = map1.keySet().iterator();
		
		while(keys.hasNext()) {			// hasNext() :: 다음내용의 존재유무 파악
			String key = keys.next();	// next() :: 커서를 (다음내용이)존재하는 곳에 위치시키고 데이터 가져옴
			System.out.println(map1.get(key));
		}
		
		
		/*
		for(int i=0; i<map1.size(); i++) {
			String key = keys.next();
			// 키값(컬럼명)의 무조건적인 세팅
			System.out.println(map1.get(key));
		}
		*/
		
		
		
	}

}
