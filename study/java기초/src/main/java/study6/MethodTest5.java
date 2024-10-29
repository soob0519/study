package study6;

public class MethodTest5 {

	public static void main(String[] args) {
		System.out.println(  hap1(10, 20)  );
		System.out.println(  hap2(10, 20, 30)  );
		
		System.out.println(  hap3(10.5, 20.12)  );
		System.out.println(  message("홍길동")  );
		
		int[] jj = {60,50,70,80,90};
		System.out.println(  "점수합계 : "+ hap4(jj)  );
		
		// System.out.println(  hap1(10)  ); error
		// System.out.println(  hap1(10, 20,30)  ); error
		// System.out.println(  hap1(10.0, 20)  ); error
		// System.out.println(  hap1(100000000000, 2000000000)  ); error
		
	}
	
	public static int hap4(int[] a) {
		int hap = 0;
		for(int i=0; i<a.length; i++)	{	
			hap += a[i]; 
		}
		return hap;
	}	

	public static String message(String a) {
		String result = a+"님 안녕하세요.";
		return result;
	}
	
	public static int hap1(int a, int b) {
		int result = a+b;
		return result;
	}
	
	public static int hap2(int a, int b, int c) {
		int result = a+b+c;
		return result;
	}
	
	public static double hap3(double a, double b) {
		double result = a+b;
		return result;
	}
	
	

}
