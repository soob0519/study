package study10;

import java.util.Calendar;

public class Test2 {

	public static void main(String[] args) {
		// 86400(초) --> 86400000(자바)
		Calendar cal = Calendar.getInstance();
		long ux1 = cal.getTimeInMillis()/1000; // 세팅 시점의 유닉스 시간
		
		String date = "2024-12-25";
		String[] str = date.split("-");		
		int y1 = Integer.parseInt(str[0]);
		int m1 = Integer.parseInt(str[0]);
		int d1 = Integer.parseInt(str[0]);
		
		cal.set(y1,m1-1,d1);
		long ux2 = cal.getTimeInMillis()/1000;
		
		int a1 = (int)(ux2-ux1); // 초
		int a2 = a1/(60*60*24);
		// double a3 = (double)a1/(60*60*24);
		
		System.out.println(a2);
	}

}
