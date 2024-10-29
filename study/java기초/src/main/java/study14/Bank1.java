package study14;

import java.util.Scanner;

public class Bank1 {
	
	public static int money = 0;
	
	public static void input() {
		Scanner scn = new Scanner(System.in);
		System.out.print("입금금액 >>");
		try{
			int cash = scn.nextInt();
				money += cash;
				System.out.println("입금완료");
				System.out.println("잔액: "+money+"원");
		} catch (Exception e) {
			System.out.println("입금액오류");
		}
	}
	
	public static void output() {
		Scanner scn = new Scanner(System.in);
		System.out.print("출금금액 >>");
		try{
			int cash = scn.nextInt();
			if(money<cash) {
				System.out.println("잔액부족");
			} else {
				money-= cash;
				System.out.println("출금완료");
				System.out.println("잔액: "+money+"원");
			}
		} catch (Exception e) {
			System.out.println("금액오류");
		}
	}
	
	public static void money() {
		System.out.println("잔액: "+money+"원");
	}
	
	public static void main(String[] args) {
		
		Scanner scn = new Scanner(System.in);
		System.out.println("{ 은행입출력 관리}");
		System.out.println("1.입금");
		System.out.println("2.출금");
		System.out.println("3.잔액");
		try {
			while(true) {
				System.out.print("\n메뉴번호 >>");
				int number = scn.nextInt();		
				if(number == 1) {
					input();
				} else if(number == 2) {
					output();
				} else if(number == 3) {
					money();
				}
			}
		} catch(Exception e) {
			System.out.println("번호오류");
		}
	}

}
