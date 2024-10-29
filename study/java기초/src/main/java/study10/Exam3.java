package study10;

import java.io.PrintStream;
import java.util.Arrays;

/*
 *  Exam1을 상속받아 진행하기
 */
public class Exam3 extends Exam1{

	public Exam3(String title) {
		System.out.println("◐ "+title+" ◑");
	}
	
	public static void main(String[] args) {
		
		// 학원명(학생명) 출력
		System.out.println("========================");
		System.out.println("▣ 하이미디어학원 (조수빈) ▣");
		System.out.println("========================");
		
		// 1번 출력
		namesPrint();
		System.out.println("---------\n");
		
		// 2번 출력
		juminFirstPrint();
		System.out.println("---------\n");
		
		// 3번 출력
		juminAgePrint();
		System.out.println("---------\n");
		
		// 4번 출력
		genderCount();
		System.out.println("---------\n");
		
		// 5번 출력
		studentDetail("프랑스");
		System.out.println("---------\n");
		
		// 6번 출력
		addrDetail("구리시");
		System.out.println("---------\n");
		
		// 7번 출력
		oldestYoungest();
		System.out.println("---------\n");
		
		// 8번 출력
		birthdayList("9");
		System.out.println("---------\n");
		
		// 9번 출력
		if(patternJumin("121212-3333333") == true) {
			System.out.println("올바른 주민번호 입니다.");
		} else {
			System.out.println("올바른 주민번호 아닙니다.");
		}
		System.out.println("---------\n");
		
		// 10번 출력
		ascList();
		System.out.println("---------\n");
		
	}
	
	/** 문제 1번 */
	public static void namesPrint() {
		Exam3 ex = new Exam3("1번 문제 출력");
		
		String[] name  = ex.name;
		String[] jumin = ex.jumin;
		String[] addr  = ex.addr;
		
		// 이하 문제 풀이
		int len = name.length;
		for(int i=0; i<len; i++) {
			System.out.print("("+(i+1)+")");
			System.out.println(name[i]);
		}
	}
	
	/** 문제 2번 */
	public static void juminFirstPrint() {
		Exam3 ex = new Exam3("2번 문제 출력");
		
		String[] name  = ex.name;
		String[] jumin = ex.jumin;
		String[] addr  = ex.addr;
		
		int len = name.length;
		for(int i=0; i<len; i++) {
			System.out.print("("+(i+1)+")");
			System.out.println(jumin[i].substring(0,6));
		}
			
	}
		
	
	/** 문제 3번 */
	public static void juminAgePrint() {
		Exam3 ex = new Exam3("3번 문제 출력");
		
		String[] name  = ex.name;
		String[] jumin = ex.jumin;
		String[] addr  = ex.addr;
		
		int len = jumin.length;
		for(int i=0; i<len; i++) {
			System.out.print("("+(i+1)+")");
			System.out.print(name[i]);
			String[] array = jumin[i].split("-");
			String a1 = array[0].substring(0,2);
			String a2 = array[1].substring(0,1);
			String year = ""; 
			if (a2.equals("1") || a2.equals("2")) {
				year = "19"+a1;
			} else {
				year = "20"+a1;
			}
			int age = 2024 - Integer.parseInt(year);
			System.out.println("("+age+"세)");
		}
		
	}
	
	/** 문제 4번 */
	public static void genderCount() {
		Exam3 ex = new Exam3("4번 문제 출력");
		
		String[] name  = ex.name;
		String[] jumin = ex.jumin;
		String[] addr  = ex.addr;
		
		int len = name.length;
		int cnt1 = 0;
		int cnt2 = 0;
		
		for(int i=0; i<len; i++) {
			String gender = jumin[i].charAt(7)+"";	// charAt(자리번호) :: char 타입
			if (gender.equals("1") || gender.equals("3")) {
				cnt1++;
			} else {
				cnt2++;
			}
		}
		
		System.out.println("남학생:" +cnt1+"명");
		System.out.println("여학생:" +cnt2+"명");
		
	}
	
	/** 문제 5번 */
	public static void studentDetail(String name1) {
		Exam3 ex = new Exam3("5번 문제 출력");
		
		String[] name  = ex.name;
		String[] jumin = ex.jumin;
		String[] addr  = ex.addr;
		
		int len = name.length;
		String b = "";
		for(int i=0; i<len; i++) {
			boolean a = name[i].equals(name1);
			if(a == true) {
				b = (name[i]+","+jumin[i]+","+addr[i]);
				System.out.println(b);
			}
		}
		if(b == "")	System.out.println("결과가 없음");
		
	}
	
	/** 문제 6번 */
	public static void addrDetail(String addr1) {
		Exam3 ex = new Exam3("6번 문제 출력");

		String[] name  = ex.name;
		String[] jumin = ex.jumin;
		String[] addr  = ex.addr;
		
		int len = name.length;
		String b = "";
		int cnt = 0;
		for(int i=0; i<len; i++) {
			if(addr[i].contains(addr1)) {	// 기본은 true를 물어봄, 그래서 생략함
				System.out.println(name[i]+","+jumin[i]+","+addr[i]);
				cnt = 1;
			}
		}
		if(cnt == 0) {
			System.out.println("결과가 없음");
		}
	}
	
	/** 문제 7번 */
	public static void oldestYoungest() {
		Exam3 ex = new Exam3("7번 문제 출력");
		
		String[] name  = ex.name;
		String[] jumin = ex.jumin;
		String[] addr  = ex.addr;
		
		int maxAge = 0;
		int minAge = 100;
		String maxName = "";
		String minName = "";
		
		for(int i=0; i<jumin.length; i++) {
			String y1 = jumin[i].substring(0,2);	// 0~1
			String g1 = jumin[i].charAt(7) + "";	// char -> String
			
			// 생년 4자리 탄생
			if (g1.equals("1") || g1.equals("2") ) {
				y1 = "19"+y1;
			}else {
				y1 = "20"+y1;
			}
			
			int age = 2024-Integer.parseInt(y1);
			
			if(maxAge < age) {
				maxName = name[i];
			}
			if(minAge > age) {
				minName = name[i];
			}
			maxAge = Math.max(maxAge, age);
			minAge = Math.min(minAge, age);
		}
		System.out.println("제일 많은 나이: "+maxName+"("+(maxAge)+")");
		System.out.println("제일 어린 나이: "+minName+"("+(minAge)+")");		
		
	}
	
	/** 문제 8번 */
	public static void birthdayList(String mm) {
		Exam3 ex = new Exam3("8번 문제 출력");
		
		String[] name  = ex.name;
		String[] jumin = ex.jumin;
		String[] addr  = ex.addr;
		int cnt = 0;
		int len = jumin.length;
		for(int i=0; i<len; i++) {
			String m1 = jumin[i].substring(2,4);
			String d1 = jumin[i].substring(4,6);
			if(Integer.parseInt(m1) == Integer.parseInt(mm)) {
				cnt++;
				System.out.println("("+cnt+")"+name[i]+"("+m1+"월"+d1+"일)");
				cnt = 1;
			}
		}
		if(cnt == 0) {
			System.out.println("결과가 없음");
		}
		
	}
	
	/** 문제 9번 */
	public static boolean patternJumin(String jumin) {
		Exam3 ex = new Exam3("9번 문제 출력");
		
		String pattern = "[0-9]{6}-[1-4]{1}[0-9]{6}";
		boolean result = jumin.matches(pattern);
		String mm = jumin.substring(2,4);
		String dd = jumin.substring(4,6);
		int mm1 = Integer.parseInt(mm);
		int dd1 = Integer.parseInt(dd);
		if(mm1<1 || mm1>12) result = false;
		if(dd1<1 || dd1>31) result = false;
		return result;
	}
	
	/** 문제 10번 */
	public static void ascList() {
		Exam3 ex = new Exam3("10번 문제 출력");

		String[] name  = ex.name;
		String[] jumin = ex.jumin;

		int len = jumin.length;
		String [] ages = new String[len];	// 배열의 틀 형성
		int nm = 0;
		
		for(int i=0; i<len; i++) {

			String yy = jumin[i].substring(0,2);	// 년생
			String gg = jumin[i].substring(7,8);	// 성별
			String year = "";

			if(gg.equals("1")||gg.equals("2")) {
				year = "19"+yy;
				nm = i;
			} else {
				year = "20"+yy;
				nm=i;
			}
			String age = (2024 - Integer.parseInt(year))+"/"+name[nm];
			ages[i] = age;	
		}

		Arrays.sort(ages);

		for(int i=0; i<ages.length; i++) {
			String[] array = ages[i].split("/");
			System.out.println(array[1]+"("+array[0]+"세)");
		}

	}
	
	
}

