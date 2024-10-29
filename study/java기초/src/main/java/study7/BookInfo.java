package study7;

public class BookInfo {

	int price = 10000;			// 인스턴스(객체)변수, 멤버변수
	String title = "java기초";	// 인스턴스(객체)변수, 멤버변수
	
	public static void abc1() {
		// 지역변수(외부에서 접근 불가)
		// 외부 :: 같은 클래스에서의 메소드나 다른 클래스
		String name="html"; 
	}
	
	public static void abc2() {
		String bbbb ="cccc"; // 지역변수(외부에서 접근 불가)
	}
	
	
}
