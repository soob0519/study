package study6;

public class MethodTest2 {

	public static void main(String[] args) {
		// 다른 class의 method를 빌려올때는 class.method()로 빌려온다.
		// 같은 class에서는 class 이름 생략 가능
		// MethodTest1.subject1();
		// MethodTest1.riceMenu();
		count100();
		System.out.println();
		count200();
	}
	
	public static void count100() {
		for(int i=1; i<=100; i++) {
			System.out.print(i+" ");
		}
	}
	
	public static void count200() {
		for(int i=1; i<=200; i++) {
			System.out.print(i+" ");
		}
	}
	
	public static void lotto() {
		System.out.println( "[로또번호 예상]" );
		for(int i=0; i<6; i++) {
			System.out.print( (int)(Math.random()*45)+1 );
			System.out.print( " " );
		}
	}

}
