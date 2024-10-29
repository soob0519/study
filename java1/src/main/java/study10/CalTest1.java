package study10;

import java.util.Calendar;

public class CalTest1 {

	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance(); // Calendar 클래스의 인스턴스(객체)처리
		
		// cal.set(2001, 0, 7); // 년 월 일
		// cal.add(Calendar.DATE, -100);
		// cal.add(Calendar.MONTH, 2);
		
		
		
		int yy = cal.get(1);	// 년도 :: 변수로 들어가보면 연도를 구해주는 수 1
		int mm = cal.get(2)+1;	// 월
		int dd = cal.get(5);	// 일
		int hh = cal.get(Calendar.HOUR_OF_DAY);
		int mi = cal.get(Calendar.MINUTE);
		int ss = cal.get(Calendar.SECOND);
		
		System.out.println(yy+"-"+mm+"-"+dd+" "+hh+":"+mi+":"+ss);
		
		int week = cal.get(Calendar.DAY_OF_WEEK);		// 요일
		int year_day = cal.get(Calendar.DAY_OF_YEAR);	// 올해의 날 수
		int yearWeek = cal.get(Calendar.WEEK_OF_YEAR);
		int lastDay = cal.getActualMaximum(Calendar.DATE);
		
		System.out.println("요일: "+week);
		System.out.println("날수: "+year_day);
		System.out.println("주차: "+yearWeek);
		System.out.println("막날: "+lastDay);

		
		
	}

}
