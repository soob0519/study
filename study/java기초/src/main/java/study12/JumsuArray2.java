package study12;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class JumsuArray2 {
	
	public static void sumAvg(List<Map> list) {
		for(int i=0;i<list.size();i++) {
			int sum = 0;
			int avg = 0;
			int cnt = 0;
			Iterator<String> keys = list.get(i).keySet().iterator();
			while(keys.hasNext()) {
				String key = keys.next();
				String data = (String)list.get(i).get(key);
				// (String)을 붙이는 이유 :: Map자체가 다양한 값을 받을 수 있기 때문에 확실히 결정해줘야함.
				if(!key.equals("id")) { // 키값이 "id"가 아닌 데이터에게만 적용
					sum += Integer.parseInt(data);
					cnt++;
				}else {
					System.out.print(data+"  ");
				}
			}
			avg = sum/3;
			System.out.print("합계:"+sum+", 평균:"+avg);
			System.out.println();
		}
	}
	
	public static void jumsuList2 (List<Map> list) {
		
		for(int i=0;i<list.size();i++) {
			Iterator<String> keys = list.get(i).keySet().iterator();
			while(keys.hasNext()) {
				String key = keys.next();
				String data = (String)list.get(i).get(key);
				System.out.print(data+" ");
			}
			System.out.println();
		}
		
	}
	
	
	public static void jumsuList(List<Map> list) {
		for(int i=0;i<list.size();i++) {
			Iterator<String> keys = list.get(i).keySet().iterator();
			while(keys.hasNext()) {
				String key = keys.next();
				String data = (String)list.get(i).get(key);
				System.out.println(key+":"+data);
			}
		}		
	}
	
	public static void ArrayListPrint(List<Map> mylist) {
		for(int i=0;i<mylist.size();i++) {
			System.out.println((i+1)+"행 "+ mylist.get(i));
		}
	}
	
	public static void main(String[] args) {

		List<Map> list = new ArrayList<Map>();
		
		Map<String,String> map = new HashMap<String,String>(); 		
		map.put("id", "test1");
		map.put("eng", "80");
		map.put("kor", "70");
		map.put("math", "88");
		list.add(map);
		
		map = new HashMap<String,String>(); 		
		map.put("id", "test2");
		map.put("eng", "55");
		map.put("kor", "44");
		map.put("math", "66");
		list.add(map);
		
		//ArrayListPrint(list);
		System.out.println("----------");
		//jumsuList(list);
		System.out.println("----------");
		jumsuList2 (list);
		System.out.println("----------");
		sumAvg(list);
		/*
		System.out.println(list);
		System.out.println("---------------------");
		System.out.println(list.get(0));
		System.out.println("---------------------");
		System.out.println(list.get(1));
		*/
		
		
	}

}
