package study6;
/*
 *	형변환 관련 모음 
 */
public class TypeChange {

	public static void main(String[] args) {
		
		// 숫자 -> 문자
		byte	a0 = 100;
		int		a1 = 100;
		double	b1 = 1.123445;
		float	c1 = 1.1234f;
		
		// (1) 메소드
		String a00 = Byte.toString(a0);		// Integer.toString(a0); 가능	
		String a11 = Integer.toString(a1);	// Byte.toString(a1); 불가능 byte < int
		String b11 = Double.toString(b1);	// Float.toString(b1); 불가능 double < float
		String c11 = Float.toString(c1);	// double.toString(c1); 가능
		
		// (2) 편법
		String a12 = a1+"";
		String b12 = b1+"";
		
		/*
		 *  문자 -> 숫자
		*/
		
		String s1 = "101";
		int s11 = Integer.parseInt(s1);
		double s12 = Double.parseDouble(s1);
		System.out.println(s11);
		System.out.println(s12);
		
		String s2 = "101.234";
		// int s21 = Integer.parseInt(s2); // error
		double s22 = Double.parseDouble(s2);
		// System.out.println(s21); // 101
		System.out.println(s22); //101.234
		System.out.println("-----------------");
		
		
		// 숫자(정수) -> 숫자(실수)
		byte j0 = 100;
		int j1 = 100;
		double j2 = 100.0;
		
		int j3 = j0;		// byte -> int (o)
		byte j4 = (byte)j1;	// int -> byte (x)
		int j5 = (int)j2;	// double -> int(x)
		System.out.println("-----------------");
		
		int k1 = 10;
		int k2 = 15;
		int avg1 = (k1+k2)/2;
		double avg2 = (k1+k2)/2;	
		double avg3 = ((double)k1+k2)/2;
		System.out.println(avg1);	// 12
		System.out.println(avg2);	// 12.0
		System.out.println(avg3);	// 12.5
		
		
	}

}
