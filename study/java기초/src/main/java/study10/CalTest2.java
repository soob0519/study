package study10;

import java.util.Calendar;
/*
 * 유닉스시간 예제
 */
public class CalTest2 {

	public static void main(String[] args) {
		
		Calendar cal = Calendar.getInstance();
		
		long unix = cal.getTimeInMillis();
		
		// 유닉스 시간 : 1970-01-01 0:0:0 ~ 지금까지 흘러가고 있는 시간
		System.out.println(unix);
		// 500 -> 0.5초 :: 1000 -> 1초
		System.out.println(unix/1000 + "초");
		
		// 예) 1234567898
		// cal.setTimeInMillis(1652368441254L);
		System.out.println(cal.get(1));
		System.out.println(cal.get(2)+1);
		System.out.println(cal.get(5));
		
		System.out.println("---------------------------");
		
		// 풀어보기1 크리스마스 D-DAY
		
		long unix1 = cal.getTimeInMillis()/1000; // 현제 유닉스 시간
		cal.set(2024, 11, 25);
		long unix2 = cal.getTimeInMillis()/1000;
		System.out.println(unix1);
		System.out.println(unix2);
		
		int ret1 = (int)(unix2 - unix1);
		System.out.println(ret1);
		int ret2 = ret1/(60*60*24);
		System.out.println("크리스마스 D-DAY : "+ret2);
		
		
		
	}

}
