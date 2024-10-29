package study9;

public class WelcomeTest2 extends WelcomeTest1 {
	// 다형성 (오버라이딩)
	 public void welcome1() {
		System.out.println("환영합니다.");
	 }
	 
	 public String welcome2() {
		return "어서오세요.";
	 }
	 
	 public void welcome4() {
		 System.out.println("방가방가");
	 }
	
	public static void main(String[] args) {
		// 추상클래스는 인스턴스(객체) 처리 불가
		// WelcomeTest1 test1 = new WelcomeTest1();
		
		WelcomeTest2 test2 = new WelcomeTest2();
		test2.welcome1();
		System.out.println(test2.welcome2());
		
		System.out.println(test2.a1);
		System.out.println(test2.welcome3());
		
	}
	
	
}
