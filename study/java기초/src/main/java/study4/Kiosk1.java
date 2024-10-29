package study4;

import java.util.Scanner;

public class Kiosk1 {

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		
		String[] coffee = {"아메리카노","카푸치노","카페라떼","오늘의커피"};
		int[] price = {3000,4000,5000,6000};
		
		while(true) {
			for(int i =0; i<coffee.length; i++) {
				System.out.print((i+1)+"."+coffee[i]+" ");
			}
			System.out.print(" 0.종료");
			System.out.println();
			System.out.print("메뉴번호 >>");
			int menu = scn.nextInt();
			
			if (menu>=1 && menu<=coffee.length) {
				if(menu == 0) {
					System.out.println("종료합니다.");
					break;
				}
			}			
			System.out.println(coffee[menu-1]+"를 선택했습니다.");
			System.out.println(price[menu-1]+"를 결제해주세요.");
			System.out.println();
			
			/*if (menu<0 && menu>coffee.length) {
				// 반복문의 다시 실행
				continue;
			}*/
		}

	}

}
