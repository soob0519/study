package study4;

import java.util.Scanner;

public class StringTest2 {

	public static void main(String[] args) {
		// 풀어보기1
		String addr = "경기 구리시 건원대로 44 태성빌딩 305~307호 (우)11921";
		
		// (1)
		System.out.println("주소길이 : "+addr.length());
		
		String txt = "";
		String a1 ="태영빌딩";
		// (2)
		if (addr.contains(a1) == true) {
			txt ="존재합니다.";
		} else if (addr.contains(a1) == false)  {
			txt ="없습니다.";
		}
		System.out.println( "찾는 단어 \""+a1+"\"은 " + txt );
		
		// (3)
		addr = addr.replace("태성빌딩","태영빌딩");
		System.out.println(addr);
		
		// (4)
		int a2 = addr.indexOf(a1); // -1, 0이상
		if (a2 > -1) {
			System.out.println( "찾는 단어 \"태영빌딩\"은 "+a2+"위치에 있습니다.");
		} else {
			System.out.println( "찾는 단어 \"태영빌딩\"은 없습니다.");
		}
				
		// (5)
		String[] a3 = addr.split("\\(우\\)"); 
		System.out.println("우편번호 : "+a3[1]);
		System.out.println("주소 : "+a3[0]);
		
		// (6)
		String[] a4 = addr.split(" ");
		String[] a6 = {"경기","구리시","건원대로","44","태성빌딩","305~307호","(우)11921"};
		int a5 = a4.length;
		System.out.println(a5+"단어");
		
		// (7)
		System.out.println(addr.replace(" ",""));
		
		System.out.println("---------------------");
		
		// 풀어보기2
		
		Scanner scn = new Scanner(System.in);
		
		String title = "자바프로그래밍 입문";
		String content = "자바를 이용하여 기초부터 중급까지 완성한다.";
		
		while(true) {
			System.out.print("검색단어(q 입력시 종료)>>");
			String str3 = scn.next();
			str3 = str3.toLowerCase();
			
			if (str3.equals("q")) {
				System.out.println("검색이 종료됩니다.");
				break;
			}
			
			boolean b1 = title.contains(str3);
			boolean b2 = content.contains(str3);
			String txt1 = "";
			
			if(b1 && b2) {
				 txt1 = "모두 존재";
			} else if (b1 && !b2) {
				txt1 = "제목에게만 존재";
			} else if (!b1 && b2) {
				txt1 = "내용에게만 존재";
			} else {
				txt1 = "모두 검색 안됨";
			}
			
			System.out.println(txt1);
		}
		
	}

}
