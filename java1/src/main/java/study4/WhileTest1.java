package study4;

import java.util.Scanner;

public class WhileTest1 {

	public static void main(String[] args) {
		
		int a = 1;
		while( a<=100 ) { // true를 넣으면 무한루프가 됨
			System.out.print(a+" "); // 1
			++a;
		}
		// a = 101 내부적으로 101까지 증가 > 조건문을 통과하지 못함
		System.out.println(" ");
		System.out.println(a);
		System.out.println("-------------------");
		
		
		while( a>=1 ) {
			System.out.print(a+" "); // 101
			--a; // 101 ~ 0까지 가감 > 조건문을 통과하지 못함
		}
		System.out.println(" ");
		System.out.println(a);
		System.out.println("-------------------");
		
		// 무한루프에 제동걸기 - break;
		
		Scanner scn = new Scanner(System.in);
		
		int cnt = 1;
		while(true) {
			System.out.println(cnt);
			if (cnt%10==0) {
				System.out.print("종료? (0입력)>>");
				int ss = scn.nextInt();
				if (ss == 0) break;
			}
			cnt++;
		}
		
		
		
		
		
		
		
	}

}
