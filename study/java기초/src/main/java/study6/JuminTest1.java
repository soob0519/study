package study6;

public class JuminTest1 {

	public static void main(String[] args) {
		
		String jumin = "001225-4234567";
		
		int year= info1(jumin);		// 2000
		int age	= info2(jumin);		//	25
		String gender = info3(jumin);	//남성,여성
		
		System.out.println(year+"년생으로 "+age+"세이며 "+gender+"입니다.");
	}

	public static int info1(String jumin) {
		
		String yy1 =jumin.substring(0,2);
		String yy2 =jumin.substring(7,8);
		int yy3 = Integer.parseInt(yy2);
		int year = 0;
		if( yy3 == 3 || yy3 == 4 ) {
			year = Integer.parseInt("20"+yy1);
		} else {
			year = Integer.parseInt("19"+yy1);
		}
		return year;
	}
	
	public static int info2(String jumin) {
		String yy1 =jumin.substring(0,2);
		String yy2 =jumin.substring(7,8);
		int yy3 = Integer.parseInt(yy2);
		int year = 0;
		if( yy3 == 3 || yy3 == 4 ) {
			year = 2024-Integer.parseInt("20"+yy1);
		} else {
			year = 2024-Integer.parseInt("19"+yy1);
		}
		return year;
	}
	
	public static String info3(String jumin) {
		String yy2 =jumin.substring(7,8);
		int yy3 = Integer.parseInt(yy2);
		String gen = "";
		if( yy3%2 == 1 ) {
			gen = "남성";
		} else {
			gen = "여성";
		}
		return gen;
	}
	
	
	
	
	
	
	
}
