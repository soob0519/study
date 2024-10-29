package study6;

import java.util.Calendar;

public class MemberTest1 {

	public static void main(String[] args) {
		
		System.out.println("이름 : " + memberName());
		System.out.println("성별 : " + memberGender());
		System.out.println("생일 : " + memberBirth());
		System.out.println("---------------");
		
		String gender = memberGender();
		if (gender.equals("M")) {
			System.out.println("성별 : 남");
		} else {
			System.out.println("성별 : 여");
		}
		System.out.println("-----------------");		
		
		String birth = memberBirth();				// 1998-12-25
		String[] ar1 = birth.split("-");			// String[] ar1 = {"1998","12","25"}
		String year = ar1[0];						// "1998"
		int age = 2024 - Integer.parseInt(year);	// "1998" -> 1998 형변환
		
		System.out.println(memberName()+"님은 "+year+"년 생으로 "+age+"세 입니다.");
		
		System.out.println("-----------------");
		System.out.println("오늘 날짜 : " + myToday());
	}
	
	public static String memberName() {
		return "홍길동";
	}
	
	public static String memberGender() {
		return "M";
	}
	
	public static String memberBirth() {
		return "1998-12-25";
	}
	
	public static String myToday() {
		Calendar cal = Calendar.getInstance();
		int yy = cal.get(Calendar.YEAR);
		int mm = cal.get(Calendar.MONTH)+1;
		int dd = cal.get(Calendar.DATE);
		
		String date = yy+"/"+mm+"/"+dd;
		return date;
	}

}
