package study2;

public class Test1 {

	public static void main(String[] args) {
		
		// 상수 :: final 키워드 사용 :: 재정의 불가 >> 남이 건드리면 안되는 항목에 적용
		final String MyColor = "white";
		// String MyColor = "blue";	//(x)
		// MyColor = "blue";	//(o)
		
		// 배열
		// byte[] score1 = {90,80,1000};
		byte[] score1 = {90,80,100};
		int [] score2 = {90,80,70};
		boolean[] b1 = {true,false,false};
		char[] c1 = {'a','b','c'};
		String[] name = {"홍길동","이만수","김갑수"};
		
		// 배열은 혼합설정 불가
		// int[] aa = {10,"abc",true}; (x)
		System.out.println(score2[0]);
		System.out.println(score2[1]);
		System.out.println(score2[2]);
		
		// int [] score2 = {90,80,70};
		int sum = 0;
		sum += score2[0];
		sum += score2[1];
		sum += score2[2];
		System.out.println("합계1 : "+sum);
		
		int hap = score2[0]+score2[1]+score2[2];
		System.out.println("합계2 : "+hap);
		
		int sum2 = 0;
		for (int i=0; i<3; i++) {
			sum2 += score2[i];
		}
		System.out.println("합계3 : "+sum2);
		
	}

}
