package study12;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HashMapTest1 {

	public static void main(String[] args) {
		Map<Integer,Integer> map1 = new HashMap<Integer,Integer>();
		
		// 데이터값 세팅
		map1.put(11, 90);	// (인덱스값 Key값 , 데이터값 date값)
		map1.put(12, 98);
		map1.put(13, 62);
		
		for(int i=11; i<14; i++) {
			System.out.println(map1.get(i));
		}
		System.out.println("------------");
		
		// 데이터값 변경
		map1.put(0, 100);
		
		for(int i=0; i<map1.size(); i++) {
			System.out.println(map1.get(i));
		}
		
		// 데이터값 삭제 (인덱스 값을 이용한 삭제)-> 자리번호가 자동으로 채워지지 않음
		map1.remove(0);
		System.out.println("------------");
		
		for(int i=0; i<3; i++) {
			System.out.println(map1.get(i));
		}
		System.out.println("------------");
		
		
		Map<String,String> map2 = new HashMap<String,String>();
		
		map2.put("1교시","영어");
		map2.put("2교시","국어");
		map2.put("3교시","수학");
		// System.out.println(map2.get(0));
		// 인덱스 값을 기준으로 가지는 값이기 때문에 정확히 인덱스 값을 써줘야 함
		System.out.println(map2.get("1교시"));
		System.out.println(map2.get("2교시"));
		System.out.println(map2.get("3교시"));
		System.out.println("------------");
		
		
		Map<String,String> map3 = new HashMap<String,String>();
		map3.put("수업자료","aaaaaa");
		map3.put("친구파일","bbbbbb");
		System.out.println(map3.get("수업자료"));
		System.out.println(map3.get("친구파일"));
		System.out.println("------------");
		
		List<String> list1 = new ArrayList<String>();
		// List<String,String> list1 = new ArrayList<String,String>(); (x)
		// 인덱스번호(값) 세팅 불가
		list1.add(0,"90"); // 세팅 된것처럼 보이지만 세팅된것이 아님.
		list1.add(1,"20");
		list1.add(2,"70");
		
		for(int i=0; i<3; i++) {
			System.out.println(list1.get(i));
		}	
	}

}
