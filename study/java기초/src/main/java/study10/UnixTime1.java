package study10;

import java.util.Calendar;

public class UnixTime1 {

	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();
		
		String date="1726021332938";
		
		long ux1 = Long.parseLong(date);
		
		cal.setTimeInMillis(ux1);
		
		// (1) add 메소드 활용
		cal.add(Calendar.DATE,60);
		
		int yy = cal.get(Calendar.YEAR);
		int mm = cal.get(Calendar.MONTH)+1;
		int dd = cal.get(Calendar.DATE);
		System.out.println(yy+"-"+mm+"-"+dd);		
		
		// (2) 60일에 해당하는 초(시간)을 유닉스시간에 더하여 출력
		// 1초 -> 1000
		long ux2 = ux1+( 60*60*24*60*1000L );
		cal.setTimeInMillis(ux2);
		yy = cal.get(Calendar.YEAR);
		mm = cal.get(Calendar.MONTH)+1;
		dd = cal.get(Calendar.DATE);
		
		System.out.println(yy+"-"+mm+"-"+dd);
		// cal.set(2004,11,25);

		long a1 =  60*60*24*60*1000;
		long a2 =  60*60*24*60*1000L;
		System.out.println(a1);
		System.out.println(a2);
	}

}
