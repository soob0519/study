package study7;

public class CoffeeInfo {
	String name = "";			// 인스턴스(객체)변수, 맴버변수
	int price = 0;
	// 인스턴스 변수 > 객체로 만들어 주고 (new) 나서 변수 사용 가능
	static String maker = "";	// 클래스(전역)변수, 맴버변수 
	// 클래스 변수 > 클래스 이름으로 접근할수있는 변수
	// static <<공유영역으로 들어가게 되어 독립적으로 취하는게 아니라 같이 취하게 되어 덮어쓰기 됨
	
	public void setName(String a) {
		name = a;
	}
	
	public void setPrice(int a) {
		if (a>=1000 && a<=10000) price = a;
	}
	
	public static void setMaker(String a) {
		maker = a;
	}
	
	
}
