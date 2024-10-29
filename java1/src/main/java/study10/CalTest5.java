package study10;

import java.util.Calendar;

	public class CalTest5 {
	
	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();
		cal.set(2023,11,20);
		long ux1 = cal.getTimeInMillis()/1000;
		cal.set(2024,0,2);
		long ux2 = cal.getTimeInMillis()/1000;
		int ret1 = (int)(ux2-ux1);
		int ret2 = ret1/(60*60*24);
		
		System.out.println("2023-12-20과 2024-01-02는 "+ret2+"일 차이가 납니다.");
	}

}
