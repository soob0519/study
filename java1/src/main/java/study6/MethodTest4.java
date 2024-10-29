package study6;

public class MethodTest4 {

	public static void main(String[] args) {
		System.out.println("이름 : "+name());
		System.out.println("영어 : "+eng());
		System.out.println("국어 : "+kor());
		System.out.println("수학 : "+math());
		System.out.println("합계 : "+hap());
		System.out.println("평균 : "+avg());
		
		System.out.println(	"결과 : "+ ( (pass()==true)?"합격":"불합격") );
		
		
		
		/*
		 if( pass() ) {
		 
			System.out.println("결과 : 합격");
		} else {
			System.out.println("결과 : 불합격");
		}
		*/
	}
	
	public static void message() {
		System.out.println("= 학생 점수 및 합격 여부 =");
	}
	
	public static String name() {
		String nm = "홍길동";
		return nm;
	}
	
	public static int eng() {
		int eng = 60;
		return eng;		// return 98;
	}
	
	public static short kor() {
		short kor = 65;
		return kor;
	}
	
	public static byte math() {
		byte math = 10;
		return math;
	}
	
	public static long hap() {
		long hap = eng()+kor()+math();
		return hap;
	}
	
	public static double avg() {
		double avg = (double)hap()/3;
		return avg;
	}
	
	// true false
	
	public static boolean pass() {
		boolean result = avg() >= 60;
		return result;				
	}
	
	
	
	
	
	
}
