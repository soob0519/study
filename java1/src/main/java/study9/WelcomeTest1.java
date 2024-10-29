package study9;

/*
 * 추상클래스에게는 abstract 키워드가 붙음
 * 추상클래스의 목적은 명세처리
 */
abstract class WelcomeTest1 {
	String a1 = "abc";
	// 추상메소드 > 명세처리 되었다
	abstract public void welcome1();
	abstract public String welcome2();
	abstract public void welcome4();
	
	
	// 일반메소드
	// public String welcome3(); (x) // 사용불가능
	public String welcome3() { // 사용가능
		return "123545";
	}

}
