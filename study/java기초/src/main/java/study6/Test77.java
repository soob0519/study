package study6;

public class Test77 {

	public static void main(String[] args) {
		int [] gg = {99,88,77,66,55,44,33,22,11};
		int hap = MethodTest5.hap4(gg);
		int avg = hap/gg.length;
		
		System.out.println("합계 : "+hap);
		System.out.println("평균 : "+avg);
		
	}

}
