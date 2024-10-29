package study10;

public class Test3 {

	public static void main(String[] args) {
		int a1 = 402;	// 1초 -> 자바시간 :: 1000 -> 1000 ->1000/1000 -> 1초
		System.out.println(a1/1000);	// 0.402 -> 0
		System.out.println(a1/1000.0);	// 0.402
		System.out.println(a1/(double)1000);	// 0.402
		System.out.println((double)a1/1000);	// 0.402
		System.out.println((double)(a1/1000));	// 0.0 -> 결과를 더블로 만드는거라 안됨
	}

}
