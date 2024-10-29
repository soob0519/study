package study6;

import java.util.Calendar;

public class JuminTest2 {

	public static void main(String[] args) {

		String jumin = "001225-3234567";
		
		int year		= info1(jumin);		// 2000
		int age			= info2(jumin);		//	25
		String gender	= info3(jumin);		//남성,여성
		
		System.out.println(year+"년생으로 "+age+"세이며 "+gender+"입니다.");
	}

	public static int info1(String jumin) {
		
		String yy =jumin.substring(0,2);
		String gg =jumin.substring(7,8);
		
		if( gg.equals("1") || gg.equals("2") ) {
			yy = "19"+yy;
		} else {
			yy = "20"+yy;
		}
		return Integer.parseInt(yy);
	}
	
	public static int info2(String jumin) {
		int year = info1(jumin);
		
		Calendar cal = Calendar.getInstance();
		int yy = cal.get(Calendar.YEAR);
		int age = yy-year;
		return age;
		
	}
	
	public static String info3(String jumin) {
		// char gg = 'a'; // 97 -> 고유번호로 인식
		// gg++;
		
		char a1 = jumin.charAt(7); //1,2,3,4
		String a2 = a1+"";
		String gender = "";
		if (a2.equals("1") || a2.equals("3")) {
			gender = "남성";
		} else {
			gender = "여성";
		}
		
		return gender;
	}
	


}
