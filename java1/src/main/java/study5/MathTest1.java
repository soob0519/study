package study5;

public class MathTest1 {

	public static void main(String[] args) {
		
		double a1 = 98.2;		
		// ceil() 올림 메소드 (double)
		System.out.println(Math.ceil(a1));	// 99.0
		System.out.println("---------------------");
		
		// floor() 내림 메소드 (double)
		System.out.println(Math.floor(a1));	// 98.0; 98(X)
		System.out.println("---------------------");
		
		// round() 반올림 메소드 (int) - 기준치(0.5) 이상만 올림/ 기준치 이하는 내림
		System.out.println(Math.round(a1));		// 98
		System.out.println(Math.round(98.4));	// 98
		System.out.println(Math.round(98.49999));	// 98
		System.out.println(Math.round(98.5));	// 99
		System.out.println(Math.round(98.6));	// 99
		System.out.println("---------------------");
		
		// rint() 반올림 메소드 (double) - 기준치(0.6)
		System.out.println(Math.rint(a1));		// 98.0
		System.out.println(Math.rint(98.4));	// 98.0
		System.out.println(Math.rint(98.49999));	// 98.0
		System.out.println(Math.rint(98.5));	// 98.0
		System.out.println(Math.rint(98.6));	// 99.0
		System.out.println("---------------------");
		
		// abs() 절대값 반환 / 음수에만 적용
		System.out.println(Math.abs(-50));
		System.out.println(Math.abs(+50));
		System.out.println(Math.abs(50));
		System.out.println(Math.abs(-50.555));
		System.out.println(Math.abs(50.555));
		System.out.println("---------------------");
		
		// pow() 제곱
		System.out.println(Math.pow(10,2));	// 10*10
		System.out.println(Math.pow(10,3));	// 10*10*10
		System.out.println(Math.pow(5,3));	// 5*5*5
		System.out.println("---------------------");
		
		// sqrt() 루트
		System.out.println(Math.sqrt(100));
		System.out.println(Math.sqrt(25));
		System.out.println(Math.sqrt(10));
		System.out.println("---------------------");
		
		// max,min
		System.out.println(Math.max(100,20));
		System.out.println(Math.min(100,25));
		System.out.println(Math.min(10.5,10.6));
		System.out.println(Math.max(100,Math.max(125,20)));
		System.out.println("---------------------");
		// System.out.println(Math.max(100,20,60)); // error
		
		// sin cos tan (double)
		System.out.println(Math.sin(0.215));
		System.out.println(Math.cos(0.356));
		System.out.println(Math.tan(0.456));
		System.out.println("---------------------");
		
		

	}

}
