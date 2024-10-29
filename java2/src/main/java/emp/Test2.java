package emp;

import java.util.Calendar;

public class Test2 {

	public static void main(String[] args) {
		
		String date ="2024-02-29";
		int yy=0;
		int mm=0;
		int dd=0;
		
		boolean result = true;
		String pattern = "[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}";
		boolean result2 = date.matches(pattern);
		if(result2 == false) {
			result = false;
		} else {
			/*
			String yy = date.substring(0,4);
			String mm = date.substring(5,7);
			String dd = date.substring(8,10);
			*/
			String[] datas = date.split("-");
			yy = Integer.parseInt(datas[0]);
			mm = Integer.parseInt(datas[1]);
			dd = Integer.parseInt(datas[2]);
			if(yy<1930 || yy>2024) {
				result = false;
			} else if(mm<1 || mm>12) {
				result = false;
			} else if(dd<1 || dd>31) {
				result = false;
			}
		}
		
		Calendar cal = Calendar.getInstance();
		//cal.set(2024,1,35);
		cal.set(yy,mm-1,dd);
		// int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		// int day = cal.get(Calendar.DATE);
		
		if( mm != month ) {
			result = false;
		}
		
		// System.out.println("세팅날짜 : "+year+"-"+month+"-"+day);
		System.out.println("결과 : "+result);

	}

}
