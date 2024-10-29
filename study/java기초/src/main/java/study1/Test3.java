package study1;

public class Test3 {
	// 메소드 (함수)
	public static void main(String[] arg) {
		String apple = "사과";  // 변수 초기 세팅
		String banana = "바나나";
		System.out.println(apple);
		System.out.println(banana);
		
		apple = "꿀사과";
		System.out.println(apple);
		
		int price = 2000;
		System.out.println(price);
		System.out.println("-----------------------------------");
		
		String name ="김철수";
		int eng = 70;
		int kor = 90;
		
		System.out.println(name+" 영어점수:"+eng+" 국어점수:"+kor);
		
		System.out.println("-----------------------------------");
		System.out.print(name);
		System.out.print(" 영어점수:");
		System.out.print(eng);
		System.out.print(" 국어점수:");
		System.out.print(kor);
	}
}