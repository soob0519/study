package study11;

import java.util.Scanner;

public class ExceptionTest3 {

	public static void main(String[] args) {
		
		Scanner scn = new Scanner(System.in);
		while(true) {
			System.out.print("출생년도 입력(0 입력 시 멈춤)>>");
			try {
				int yy = scn.nextInt();
				if(yy == 0) {
					System.out.println("종료합니다.");
					break;
				}
				int age = 2024-yy;
				System.out.println(yy+"년 생은 "+age+"세 입니다.");
			} catch(Exception e) {
				System.out.println("숫자로 입력해주세요. \n 프로그램은 종료합니다.");
				 break;
			}
		}

	}

}
