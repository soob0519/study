package study1;

public class Test5 {

	public static void main(String[] args) {
		
		// 메모리 낭비를 피하고자 여러종류의 타입이 존재
		// 모든 프로그램은 실행 즉시 메모리에 올라감
		/*
		byte a1 = 100;		//(o)
		byte a2 = -100;		//(o)
		byte a3 = 127;		//(o)
		byte a4 = -128;		//(o)
		byte a5 = 128;		//(x)
		byte a6 = -129		//(x)
		short b1 = 128;		//(o)
		short b2 = -129		//(o)
		short b3 = 32000;	//(o)
		short b3 = 33000;	//(x)
		int c1 = 33000;		//(o)
		int	c2 = 2100000000;//(o)
		int c3 = 2200000000;//(x)
		long d1 = 2200000000L;//(o)
		long d2 = 922400000000000000L;//(o)
		long d3 = 100;
		
		byte eng = 100;
		int kor = 100;
		// 기술이 발달해서 타입구별을 하지 않음 (int로 고정)
		int avg = 88.5;	//(x)
		*/
		float f1 = 88.5f;
		double d4 = 88.5;
		
		float f2 = 0.123456789123f;
		double d5 = 0.123456789123;
		
		System.out.println(f2);
		System.out.println(d5);
		
		//char 타입은 1개의 문자만 저장하는 타입
		// 쌍따옴표 표기의 값 설정 불가
		char e1 = 'a';		//97
		char e2 = 'A';
		//char e3 = 'ab';	//(x)
		//char e4 = "b";	//(x)
		char e5 = '가';
		
		String s1 = "a";	// a
		//String s2 = 'a';	//(x)
		String s3 = "ab";
		
		System.out.println("e1 : " + e1 );	//a
		e1++;
		System.out.println("e1 : " + e1 );	//b 문자 증가 가능
		e1++;
		System.out.println("e1 : " + e1 );	//c
		//s1++;
		
		// 유니코드 값 - 모든 문자의 숫자화
		System.out.println("----------" );
		
		//int i = "a";	(x)
		int i1 = 'a';	//(o)
		System.out.println("i1 : "+ i1);	// 97
		i1++;
		System.out.println("i1 : "+ i1);	// 98
		int i2 = 'z';
		System.out.println("i2 : "+ i2);	// 122
		System.out.println("----------" );
		
		boolean j1 = true;	//(o)
		boolean j2 = false;	//(o)
		// boolean j3 = 'a';	//(x)
		// boolean j4 = 33;	//(x)
		String j5 = "true";
		boolean j6 = 10 < 20;
		// 연산이 들어올수도 있음
		
		System.out.println("j1 : "+ j1); // ture
		System.out.println("j5 : "+ j5); // ture
		System.out.println("j6 : "+ j6); // ture
		
		int hap = 10+10*100;
	}

}
