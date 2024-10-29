package study3;

import java.util.Scanner;

/*
 * FOR문 실습 예제 
 */
public class Test2 {

	public static void main(String[] args) {
		
		// 예제1
		for (int i=1; i<=7; i++) {
			System.out.print("java ");
		}
		System.out.println(" ");
		System.out.println("------------------");
		
		// 예제2
		for (int i=11; i<=20; i++) {
			System.out.print(i+" ");
		}
		System.out.println(" ");
		System.out.println("------------------");
		
		// 예제3
		for (int i=1; i<=100; i++) {
			if (i%2 == 1) System.out.print(i+" ");
		}
		System.out.println(" ");
		System.out.println("------------------");
		
		// 예제4
		Scanner scn = new Scanner(System.in);
		System.out.print("단입력 : ");
		int dan = scn.nextInt(); // 콘솔에 입력상태 실제 제공해준 메소드
		int cnt = 1;
		for (int i=1; i<=5; i+=2) {
			System.out.println( "문항 "+ cnt +" : "+dan+" x "+i+" = "+(dan*i) );
			cnt++;
		}
		System.out.println("------------------");
		
		// 예제8
		System.out.print("별 출력 개수 입력 >>");
		int num = scn.nextInt();
		for(int i=0; i<num; i++) {
			System.out.print("* ");
		}
		
	}

}
