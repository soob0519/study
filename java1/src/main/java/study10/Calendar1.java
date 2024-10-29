package study10;

import java.util.Calendar;
import java.util.Scanner;

public class Calendar1 {

	public static void main(String[] args) {
		
		Scanner scn = new Scanner(System.in);
		System.out.println("{ 달력 출력 서비스 }");
		System.out.print("년도 입력 >> ");
		int yy = scn.nextInt();
		System.out.print("월 입력 >> ");
		int mm = scn.nextInt();

		Calendar cal = Calendar.getInstance();
		
		cal.set(yy,mm-1,1);
		// 요일
		int week = cal.get(Calendar.DAY_OF_WEEK);
		int num = 0;
		System.out.println("\n"+yy+"년 "+mm+"월 달력\n");
		
		for(int i=1; i<week; i++) {
			System.out.print("   ");
			num++;
		}
		
		// lastday는 날짜를 고려하지 않고, 년월만으로 값을 얻어냄
		int lastday = cal.getActualMaximum(Calendar.DATE);
		
		for(int d=1; d<=lastday; d++) {
			num++;
			// 10 안되는 값은 "0"을 붙임
			if(d<10) {
				System.out.print("0"+d+" ");
			} else {
				System.out.print(d+" ");
			}
			if(num%7 == 0) {
				System.out.println("\n");
			}
		}
		

	}

}
