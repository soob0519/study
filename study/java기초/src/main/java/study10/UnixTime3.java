package study10;

import java.util.Calendar;
import java.util.Random;
import java.util.Scanner;

public class UnixTime3 {

	public static void main(String[] args) {
		
		Calendar cal = Calendar.getInstance();
		Scanner scn = new Scanner(System.in);
		
		Random rn = new Random();
		int number = rn.nextInt(100)+1;
		
		System.out.println("랜덤숫자 맞추기 게임\n");
		
		long ux1 =  cal.getTimeInMillis();
		
		int cnt = 0;
		while (true) {
			cnt++;
			System.out.print(cnt+". ");
			System.out.print("숫자입력>>");
			int  a1 = scn.nextInt();
			if(a1 < number) {
				System.out.println(a1+"보다 큽니다.");
			} else if(a1 > number) {
				System.out.println(a1+"보다 작습니다.");
			} else if(a1 == number) {
				System.out.println("축하축하~ ");
				cal = Calendar.getInstance();
				long ux2 =  cal.getTimeInMillis();
				long ret1 = ux2-ux1;
				System.out.println(cnt+"회 "+ret1/(double)1000 + "초만에 맞추었습니다.");
				break;
			}
		}
		
		/*
		System.out.println(rn.nextInt());
		System.out.println(rn.nextBoolean());
		System.out.println(rn.nextLong());
		System.out.println(rn.nextDouble());
		*/

	}

}
