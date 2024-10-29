package study12;

import java.util.ArrayList;
import java.util.List;

public class ArrayListTest1 {

	public static void main(String[] args) {
	// 참조클래스<저장타입> 참조변수 = new 생성자 <저장타입>();
		List<Integer> list1 = new ArrayList<Integer>();	// 인스턴스(객체)처리
		
		// add 라는 메소드를 통해 메모리에 데이터를 삽입
		list1.add(50);
		list1.add(100);
		list1.add(80);
		// list1.add("10");	error : int 타입에 String 타입을 넣어서
		System.out.println(list1);
		System.out.println(list1.get(0));	// (index번호)
		System.out.println(list1.get(1));
		System.out.println(list1.get(2));
		// System.out.println(list1.get(3)); error : 없는 배열번호
		
		// 요소개수
		System.out.println(list1.size());	// length 는 존재하지 않음
		
		// 값 변경
		list1.set(0,70);
		System.out.println(list1);
		
		// 값 삭제
		list1.remove(0);
		System.out.println(list1);
		
		System.out.println(list1.get(0));
		System.out.println("------------");
		
		for(int i = 0; i<list1.size(); i++) {
			System.out.println(list1.get(i));
		}
		System.out.println("------------");
		
		List<String> list2 = new ArrayList<String>();
		list2.add("html");
		list2.add("css");
		list2.add("java");
		// list2.add(100);	(x)
		// list2.add('d');	(x)
		
		for(int i=0; i<list2.size(); i++) {
			System.out.println(list2.get(i));
		}
		
		// 정수 :: byte(127) < short < int < long
		List<Byte> list3 = new ArrayList<Byte>();
		list3.add((byte)90);	// (o)
		list3.add((byte)300);	// (x) 정상 저장 되지 않음 
		for(int i=0; i<list3.size(); i++) {
			System.out.println(list3.get(i));
		}
		
		// 실수 :: Double, float
		// List<Double> list4 = new ArrayList<Integer>();
		List<Double> list4 = new ArrayList<Double>();
		list4.add(1.123);
		list4.add(1.123456789);
		for(int i=0; i<list4.size(); i++) {
			System.out.println(list4.get(i));
		}
		
		
	}

}
