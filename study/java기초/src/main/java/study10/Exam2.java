package study10;

import java.io.PrintStream;
import java.util.Arrays;

/*
 *  Exam1을 상속받아 진행하기
 */
public class Exam2 extends Exam1{

	public Exam2(String title) {
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
		patternJumin("121212-3333333");
		System.out.println("---------\n");
		
		// 10번 출력
		ascList();
		System.out.println("---------\n");
		
	}
	
	/** 문제 1번 */
	public static void namesPrint() {
		Exam2 ex = new Exam2("1번 문제 출력");
		
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
		Exam2 ex = new Exam2("2번 문제 출력");
		
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
		Exam2 ex = new Exam2("3번 문제 출력");
		
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
		Exam2 ex = new Exam2("4번 문제 출력");
		
		String[] name  = ex.name;
		String[] jumin = ex.jumin;
		String[] addr  = ex.addr;
		
		int len = name.length;
		int m = 0;
		int f = 0;
		
		for(int i=0; i<len; i++) {
			String a1 = jumin[i].substring(7,8);
			int a2 = Integer.parseInt(a1);
			if (a2 == 1 || a2 == 3) {
				m+=1;
			} else if (a2 == 2 || a2 == 4){
				f+=1;
			}
		}
		
		System.out.println("남학생:" +m+"명");
		System.out.println("여학생:" +f+"명");
		
	}
	
	/** 문제 5번 */
	public static void studentDetail(String name1) {
		Exam2 ex = new Exam2("5번 문제 출력");
		
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
		Exam2 ex = new Exam2("6번 문제 출력");

		String[] name  = ex.name;
		String[] jumin = ex.jumin;
		String[] addr  = ex.addr;
		
		int len = name.length;
		String b = "";
		for(int i=0; i<len; i++) {
			boolean a = addr[i].contains(addr1);
			if(a == true) {
				b = (name[i]+","+jumin[i]+","+addr[i]);
				System.out.println(b);
			}
		}
		if(b == "") System.out.println("결과가 없음");
	}
	
	/** 문제 7번 */
	public static void oldestYoungest() {
		Exam2 ex = new Exam2("7번 문제 출력");
		
		String[] name  = ex.name;
		String[] jumin = ex.jumin;
		String[] addr  = ex.addr;
		
		int len = jumin.length;
		String max = "";
		String min = "";
		int max1 = 0;
		int min1 = 0;
		
		for(int i=0; i<len; i++) {
			
			String[] array = jumin[i].split("-");
			String a1 = array[0].substring(0,2);
			String a2 = array[1].substring(0,1);
			String year = "";
			
			if (a2.equals("1") || a2.equals("2")) {
				year = "19"+a1;
			} else {
				year = "20"+a1;
			}
			
			if(i == 0) {
				max = year;
				min = year;
				max1 = i;
				min1 = i;
			} else {
				if(Integer.parseInt(max)<Integer.parseInt(year)) {
					max = year;
					max1 = i;
				}
				if(Integer.parseInt(min)>Integer.parseInt(year)) {
					min = year;
					min1 = i;
				}	
			}
		}

		int min2 = Integer.parseInt(min);
		int max2 = Integer.parseInt(max);
		
		System.out.println("제일 많은 나이: "+name[min1]+"("+(2024-min2)+")");
		System.out.println("제일 어린 나이: "+name[max1]+"("+(2024-max2)+")");
	}
	
	/** 문제 8번 */
	public static void birthdayList(String mm) {
		Exam2 ex = new Exam2("8번 문제 출력");
		
		String[] name  = ex.name;
		String[] jumin = ex.jumin;
		String[] addr  = ex.addr;
		
		int len = jumin.length;
		String b = "";
		for(int i=0; i<len; i++) {
			String[] array = jumin[i].split("-");
			String a1 = array[0].substring(2,4);
			boolean a = a1.contains(mm); // 1월과 2월이 문제 1을 입력하면 11도 나오고 12도 나오고 등등
			if(a == true) {
				b = (name[i]+"("+array[0].substring(2,4)+"월"+array[0].substring(4)+"일)");
				System.out.println(b);
			}
		}
		
	}
	
	/** 문제 9번 */
	public static boolean patternJumin(String jumin1) {
		Exam2 ex = new Exam2("9번 문제 출력");
		
		String pattern = "[0-9]{6}-(1|2|3|4)[0-9]{6}";
		boolean result = jumin1.matches(pattern);
		System.out.println(result);
		return result;
	}
	
	/** 문제 10번 */
	public static void ascList() {
		Exam2 ex = new Exam2("10번 문제 출력");

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

