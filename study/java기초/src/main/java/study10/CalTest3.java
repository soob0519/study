package study10;

import java.util.Calendar;

public class CalTest3 {
	
	public static int myDiffday(String date1,String date2) {
		Calendar cal = Calendar.getInstance();
		
		String[] str1 = date1.split("-");
		String[] str2 = date2.split("-");
		
		int yy1 = Integer.parseInt(str1[0]);
		int mm1 = Integer.parseInt(str1[1]);
		int dd1 = Integer.parseInt(str1[2]);
		
		int yy2 = Integer.parseInt(str2[0]);
		int mm2 = Integer.parseInt(str2[1]);
		int dd2 = Integer.parseInt(str2[2]);
		
		cal.set(yy1,(mm1-1),dd1);
		long ux2 = cal.getTimeInMillis()/1000;
		cal.set(yy2,(mm2-1),dd2);
		long ux3 = cal.getTimeInMillis()/1000;
		
		int ret1 = (int)(ux3-ux2);
		int ret2 = ret1/(60*60*24);
		
		return ret2;
	}
	
	public static int myDday(String date) {
		Calendar cal = Calendar.getInstance();
		
		long ux1 = cal.getTimeInMillis()/1000; // 시점에 맞는 유닉스 시간
		
		String[] str = date.split("-");
		
		int a = Integer.parseInt(str[0]);
		int b = Integer.parseInt(str[1]);
		int c = Integer.parseInt(str[2]);
		
		cal.set(a,(b-1),c);
		
		long ux2 = cal.getTimeInMillis()/1000;
		int ret1 = (int)(ux2-ux1);
		int ret2 = ret1/(60*60*24);
		
		return ret2;
	}
	
	public static void main(String[] args) {
		
		System.out.println("디데이 : "+myDday("2024-11-12"));
		System.out.println("디데이 : "+myDiffday("2024-01-02","2024-01-03"));
				
		
	}

}
