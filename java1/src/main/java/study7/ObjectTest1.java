package study7;

public class ObjectTest1 {
	
	int a = 10;
	int b = 20;
	String c ="java";
	
	// System.out.println("1212"); error	
	public static void main(String[] args) {
	// 참조클래스  참조변수 = new(키워드) 생성자; 
		ObjectTest1 t1 = new ObjectTest1(); // class의 인스턴스 처리
		int d = 100;
		System.out.println(t1.a);
		// System.out.println(a); error << 외부 키워드는 바로 접근 불가능(보통 중요한 것들이 외부에 배치)
		System.out.println(t1.b);
		System.out.println(t1.c);
		System.out.println(d);
		
	}

}
