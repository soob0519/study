package study11;

public class ExceptionTest1 {

	public static void main(String[] args) {
		System.out.println("= 예외 처리 예제 =");
		
		try {
			System.out.println(3/0);
		} catch (Exception e) {
			System.out.println("0 나누기 오류");
		}
	
		int[] score = {90,80,70,60}; // 0 ~ 3
		
		try {
			System.out.println(score[0]);	// 90
			System.out.println(score[4]);	// 에외상황
			System.out.println(score[1]);	// 80 -- 실행안됨
		} catch(Exception e) {
			System.out.println("없는 배열 번호");
		}
		
		System.out.println(10/2);
		System.out.println(10/3);
		System.out.println(10/4);
		
		
		
		
	}

}
