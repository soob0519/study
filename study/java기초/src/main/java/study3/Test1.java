package study3;

import java.util.Scanner;

/*
 * switch 문 
 */

public class Test1 {

	public static void main(String[] args) {
		
		String name = "홍길동";
		int pay = 100;
		int level = 1;
		switch( level ) {
			case 1 : pay += 30;
			break;
			case 2 : pay += 20;
			break;
			case 3 : pay += 10;
			break;
			default : pay += 5;
		}
		if (level == 1) {
			pay += 30;
		} else if (level == 2) {
			pay += 20;
		} else if (level == 3) {
			pay += 10;
		} else {
			pay += 5;
		}
		System.out.println(name+"의 최종급여는 "+pay+"만원 입니다.");
		System.out.println("-------------------------------");
		
		// Scanner : 콘솔창에 키보드 입력할 수 있는 상태를 제공해주는 클레스
		Scanner scn = new Scanner(System.in);
		int a = 10;
		int b = 20;
		int c = 0;
		System.out.print("연산기호입력:");
		// next()  메소드 : 입력을 받는 메소드
		String sign =scn.next(); //String sign = "+";
		switch (sign) {
			case "+" : c = a+b;
			break;
			case "-" : c = a-b;
			break;
			case "*" : c = a*b;
			break;
			case "/" : c = a/b;
			break;
		}
		System.out.println(a+sign+b+"="+c);
		System.out.println("-------------------------------");
		
		
		int age = 15;
		if (age >= 20) {
			System.out.println("20세 이상으로 담배판매가 가능합니다.");
		} else {
			System.out.println("미성년자 이므로 담배를 판매할 수 없습니다.");
		}
		System.out.println("------------------");
		
		
		switch ( (age<20)+"" ) {
			case true+"" : System.out.println("미성년자 이므로 담배를 판매할 수 없습니다.");
			break;
			default: System.out.println("20세 이상으로 담배판매가 가능합니다.");
		}
		System.out.println("------------------");
		
		// 생성 샘플
		// 예제1
		switch ("a1") {
			case "a1" : System.out.println("a111");
				break;
			case "a2" : System.out.println("a222");
				break;
			default : System.out.println("default");
		}
		// 예제2
		switch (7) {
		case 1 : System.out.println("111");
			break;
		case 2 : System.out.println("222");
			break;
		case 7 : System.out.println("777");
			break;
		default : System.out.println("default");
		}
		// switch 문장에는 boolean(true/false) 타입이 올수 없음.
		/*switch (true) {
		case true : System.out.println("true");
			break;
		case false : System.out.println("false");
			break;
		}*/
		
	}

}
