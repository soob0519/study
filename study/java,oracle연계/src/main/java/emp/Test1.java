package emp;

import java.util.Calendar;

public class Test1 {

	public static void main(String[] args) {
		String date ="1600-12-25";	
		
		Calendar cal = Calendar.getInstance();
		cal.set(2024,11,65);
		int yy = cal.get(Calendar.YEAR);
		int mm = cal.get(Calendar.MONTH)+1;
		int dd = cal.get(Calendar.DATE);
		
		System.out.println(yy+"/"+mm+"/"+dd);
		
		String pattern = "[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}";
		if(!date.matches(pattern)) {
			System.out.println("올바른 방식이 아닙니다.");
		}
		
		int year =Integer.parseInt(date.substring(0,4));
		if(year<1900 || year>2023) {
			System.out.println("잘못된 년도 입니다.");
		}
		
		
		
		
		
	}

}
