package study10;

import java.util.Calendar;
import java.util.Random;
import java.util.Scanner;

public class UnixTime4 {

	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance(); // 객체화 :: 객체화가 진행이되는 시점(날짜/시간)
		long ux1 =  cal.getTimeInMillis();
		
		Scanner scn = new Scanner(System.in);
		Random rn = new Random();
		int number = rn.nextInt(100)+1;
		
		System.out.println("랜덤숫자 맞추기 게임\n");
		
		int cnt = 0;
		while (true) {
			cnt++;
			System.out.print(cnt+". ");
			System.out.print("숫자입력>>");
			int  a1 = scn.nextInt();
			if(number == a1) {
				break;
			} else if(number>a1) {
				System.out.println(">"+a1+"보다 큽니다.");
			} else {
				System.out.println(">"+a1+"보다 작습니다.");
			}			
		}
		cal = Calendar.getInstance();
		long ux2 =  cal.getTimeInMillis();
		int ret1 = (int)(ux2-ux1); // 1000초 단위
		double ret2 = ret1/(double)1000;
		System.out.println(cnt+"회 "+ret2+"초만에 맞추었습니다.");
		
	}

}
