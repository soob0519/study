package study7;

public class MethodFinal1 {

	public static void main(String[] args) {
		//	main 실행 메소드
		//	void -> return 을 가지지 않음
	}
	
	public static void name() {
		// name 이란 이름을 가진 메소드		
	}
	
	public static void name(String a) { // 매개변수
		// 똑같은 이름을 가진 중복이름(name) 메소드는 만들수 없지만 매개변수가 들어가면 다른 메소드로 인식하여 가능 하다.
		// 매개 변수이름이(a) 다르게 세팅되어도 같은 것으로 인식하여 중복이름(name)이 불가능하다. 
	}
	
	public static void name(int a) { // 매개변수
		// 매개변수 타입이 같으면 중복되지만 타입이 달라지면 다른것으로 인식하여 중복이름(name)이 가능하다.
	}
	
	public static void name(String a, String b) { // 매개변수
		// 매개변수 갯수가 다르면 중복이름(name)이 가능하다.
		// 매개변수 이름이 달라져도 타입이 같기 때문에 중복이름은 불가능함.
		// 매개변수 타입이 하나라도 달라지면 중복이름 가능. name(int a, String b) 가능
	}
	
	public static String userid() {
		// return 이 필요함.
		return "";
	}
	
	public static String userid(String a) {
		// 매개변수가 있어서 중복 이름이 가능
		return "";
	}
	
	public static int age() {
		// int 라서 return 값이 숫자
		return 0;
	}
	
	public static double avg() {
		// double 라서 return 값이 실수값이여야함.
		return 0.0;
	}
	
	public static char mine() {
		// char 라서 return 값이 '값' 이여야함.
		return '1';
	}
	
	// 모든 변수타입에 맞는 리턴값이 와야한다.
	
	
	
	
	
	
	
	
	
	
	
	
	

}
