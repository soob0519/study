package study10;

import java.util.Calendar;

public class Calendar3 {

	public static void main(String[] args) {
		
		String yy ="2023";
		
		for(int m=1; m<=12; m++) {
			calendarView(yy+"-"+m);
		}
	}
	

	public static void calendarView(String Date) {
		String[] str = Date.split("-");
		
		int yy = Integer.parseInt(str[0]);
		int mm = Integer.parseInt(str[1]);

		Calendar cal = Calendar.getInstance();
		
		cal.set(yy,mm-1,1);
		
		int week = cal.get(Calendar.DAY_OF_WEEK);
		int num = 0;
		System.out.println(yy+"년 "+mm+"월 달력\n");
		
		for(int i=1; i<week; i++) {
			System.out.print("   ");
			num++;
		}
		
		int lastday = cal.getActualMaximum(Calendar.DATE);
		
		for(int d=1; d<=lastday; d++) {
			num++;
			
			if(d<10) {
				System.out.print("0"+d+" ");
			} else {
				System.out.print(d+" ");
			}
			if(num%7 == 0) {
				System.out.println("\n");
			}
		}
		System.out.println("\n");
		
		
	}
}
