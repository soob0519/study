package study12;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ArrayListTest2 {

	public static void main(String[] args) {
		
		String[] title1 = {"html","css","java"};
		String[] title2 = new String[3];
		String[] title3 = new String[3];
		
		// title2[0] = null; >> 0번을 설정하지 않아도 디폴트로 설정
		title2[1] = "html";
		title2[2] = "css";
		// title2[4] = "java";	// (x)
		
		// title3[] = "aa"; 자동번호 부여는 되지 않는다.
				
		System.out.println(title2[0]);
		for(int i=0; i<title2.length;i++) {
			System.out.println(title2[i]);
		}
		
		System.out.println("-------------");
		
		List<String> list = new ArrayList<String>();
		list.add("html");
		list.add("css");
		list.add("java");
		System.out.println(list.get(0));
		System.out.println("-------------");
		for(int i=0; i<list.size();i++) {
			System.out.println(list.get(i));
		}
		System.out.println("-------------");
		
		
		Map<Integer,String> map = new HashMap<Integer,String>();
		
		map.put(0,"html");
		map.put(99, "css");
		map.put(1004,"java");
		
		// System.out.println(map.get(99));
		
		Iterator<Integer> keys = map.keySet().iterator();
		
		while(keys.hasNext()) {
			int key = keys.next();
			String data = map.get(key);
			System.out.println(data);
		}
		
		
		
	}

}
