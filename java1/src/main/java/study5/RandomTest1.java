package study5;

public class RandomTest1 {

	public static void main(String[] args) {
		
		double a1 = Math.random();
		
		// random() - double타입의 결과
		// 0.0보다 크고 1.0보다 작은 수치
		// 0.00000000001 ~ 0.9999999999
		System.out.println( a1 );
		System.out.println( "---------------" );
		
		// 0 ~ 99
		// 자리를 두자리 당겨오다
		System.out.println( (int)(a1*100) );
		System.out.println( "---------------" );
		// 1 ~ 100
		System.out.println( (int)(a1*100)+1 );
		System.out.println( "---------------" );
		
		// 1 ~ 45
		System.out.println( (int)(a1*45)+1 );
		System.out.println( "---------------" );
		
		System.out.println( "[로또번호 예상]" );
		for(int i=0; i<6; i++) {
			System.out.print( (int)(Math.random()*45)+1 );
			System.out.print( " " );
		}
		
		/*
		// 형변환 (double -> int)
		// 98.0 -> 98
		double d1 = 98.123;
		System.out.println( d1 );
		double d2 = 0.0123;
		System.out.println( d2 );
		// 변환
		System.out.println( (int)d1 );
		System.out.println( (int)d2 );
		*/
	}

}
