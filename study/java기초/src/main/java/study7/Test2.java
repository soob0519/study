package study7;

public class Test2 {

	public static void main(String[] args) {
		// 참조클래스 참조변수 = new 생성자;
		SampleSum ss = new SampleSum();
		SampleSum ss2 = new SampleSum("abc");
		
		// ss.SampleSum(); 생성자 호출불가
		
		int a = 12121212;
		int b = 3434343;
		ss.sum(a, b);
		
		double d1 = 1.23;
		double d2 = 0.65514;
		double d3 = 8.6112;
		ss.sum(d1, d2, d3);
		
		int[] ar1 = {77,88,99,66,11,22,33,44};
		ss.sum(ar1);
		

	}

}
