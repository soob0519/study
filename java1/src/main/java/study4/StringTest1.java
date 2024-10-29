package study4;

import java.util.Scanner;

public class StringTest1 {

	public static void main(String[] args) {
		
		String t1 = "oracle";
		int t1len = t1.length();
		System.out.println( t1len );
		System.out.println( "javascript".length() );		
		System.out.println( " java script  ".length() );
		
		// replace() 치환메소드
		System.out.println( "javascript".replace("java","oracle") );
		System.out.println( " java script  ".replace(" ","") );
		
		String t2 = "javas cr ipt ";
		t2=t2.replace(" ","");
		System.out.println(t2);
		
		// trim() 앞뒤공백제거
		
		String t3 = " javas cript ";
		System.out.println( t3.length() ); //13
		t3 = t3.trim();
		System.out.println( t3.length() ); //11
		System.out.println( t3 );
		
		// substring() 인덱스번호 설정으로 잘라내기
		String t4 = "javascript";
		System.out.println( t4 );
		System.out.println( t4.substring(0,4)); // 0 ~ 3
		System.out.println( t4.substring(4,6)); // 4 ~ 5
		System.out.println( t4.substring(4,10)); // 4 ~ 9
		System.out.println( t4.substring(4)); // 4 ~
		// System.out.println( t4.substring(-1)); // 음수설정 불가능
		
		// charAt() :: 인덱스번호의 세팅으로 1개의 문자를 얻는 메소드
		System.out.println(t4.substring(2,3)); // v
		System.out.println(t4.charAt(2)); // v
		// System.out.println(t4.charAt(0,4)); //error
		
		String a1 = t4.substring(2,3); // v
		// charAt 값을 변수로 둘때에는 무조건 char 타입으로 받아야만 한다.
		// String a2 = t4.charAt(2); >> 불가
		char a3 = t4.charAt(2); // v
		
		/* indexOf(), contains() :: 검색관련 메소드 */
		System.out.println(t4.indexOf("script"));	// 4
		System.out.println(t4.contains("script"));	// true
		
		System.out.println(t4.indexOf("oracle"));	// -1
		System.out.println(t4.contains("oracle"));	// false
		
		// startsWith() endsWith()
		String t5 = "html,css,java,oracle";
		System.out.println(t5.startsWith("html"));	// true
		System.out.println(t5.startsWith("java"));	// false
		
		System.out.println(t5.endsWith("oracle"));	// true
		System.out.println(t5.endsWith("java"));	// false
		
		// split() : 특정 구분자를 설정하여 분리해내는 메소드
		String[] array = t5.split(",");
		String[] array2 = {"html","css","java","oracle"};
		System.out.println(array[2]); // java
		System.out.println(array[3]); // oracle
		
		String t6 = "html css java oracle";
		String[] array6 = t6.split(" ");
		
		System.out.println(array6[2]);
		System.out.println(array6[3]);
		
		// 대/소문자 변환
		System.out.println("Linux".toLowerCase());
		System.out.println("Linux".toUpperCase());
		System.out.println("-------------------");
		
		
		// equals() 메소드
		// Scanner scn = new Scanner(System.in);
		// System.out.print("글자입력 >>");
		
		String b1 = "abc";
		String b2 = new String("abc");
		// String b2 = scn.next();
		
		if (b1.equals(b2)) {
			System.out.println("11");
		} else {
			System.out.println("22");
		}
		System.out.println("-------------------");
		
		
		
		
		
	}

}
