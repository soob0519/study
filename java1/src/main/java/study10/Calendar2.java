package study10;

import java.util.Calendar;


public class Calendar2 {

	public static void main(String[] args) {
		
		calendarView("2024-05");

	}
	
	public static void calendarView(String Date) {
		
		
		String[] str = Date.split("-");
		
		int yy = Integer.parseInt(str[0]);
		int mm = Integer.parseInt(str[1]);

		Calendar cal = Calendar.getInstance();
		
		cal.set(yy,mm-1,1);
		// 요일
		int week = cal.get(Calendar.DAY_OF_WEEK);
		int num = 0;
		System.out.println(yy+"년 "+mm+"월 달력\n");
		
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
