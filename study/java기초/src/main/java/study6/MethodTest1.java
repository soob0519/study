package study6;

public class MethodTest1 {

	public static void main(String[] args) {
		System.out.println("= 메소드 =");
		MethodTest1.subject1();	// (o)
		subject2();	// (o)
		noodleMenu();
		riceMenu();
	}
	
	public static void subject1() {
		System.out.println("html/css");
		System.out.println("javascript/jquery");
	}
	
	public static void subject2() {
		System.out.println(Math.random());
		System.out.println("oracle");
	}
	
	public static void noodleMenu() {
		System.out.println("1. 짜장면 - 5000원");
		System.out.println("2. 짬짜면 - 6000원");
		
	}
	
	public static void riceMenu() {
		System.out.println("1. 볶음밥 - 7000원");
		System.out.println("2. 비빔밥 - 8000원");
	}
	
	
	

}
