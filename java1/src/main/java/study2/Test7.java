package study2;

import java.util.Calendar;

public class Test7 {

	public static void main(String[] args) {

		// 예제1
		int age = 15;
		
		if (age >= 20) {
			System.out.println("20세 이상으로 담배판매가 가능합니다.");
		} else {
			System.out.println("미성년자 이므로 담배를 판매할 수 없습니다.");
		}
		System.out.println("------------------");
		
		// 예제2
		Calendar cal = Calendar.getInstance();
		int yy = cal.get(Calendar.YEAR);
		
		int birthYear = 1999;
		int bYer = yy-birthYear;
		
		if (bYer >= 20) {
			System.out.println("20세 이상으로 담배판매가 가능합니다.");
		} else {
			System.out.println("미성년자 이므로 담배를 판매할 수 없습니다.");
		}
		System.out.println("------------------");

		// 예제3
		int myMoney = 500;
		int cookiePrice = 1500;
		int change = myMoney-cookiePrice;
		String cookieName = "과자";		
		
		if (myMoney < cookiePrice) {
			System.out.println((change*-1)+"원이 모자라 "+cookieName+"를 사지 못했습니다.");
		} else {
			System.out.println(cookieName+"를 사고 "+change+"원이 남았습니다." );
		}
		System.out.println("------------------");
		
		// 논리 연산자
		// 예제1
		int time1 = 11;
		int time2 = 12;
		if (time1 != time2) {
			System.out.println("지금은 점심시간이 아닙니다.");
		} else {
			System.out.println("점심시간 입니다. 지금부터 50분까지 입니다.");
		}
		System.out.println("------------------");
		
		// 예제2
		int kor = 65;
		int eng = 70;
		String txt = "";
		if ( kor>=60 && eng >= 60) txt ="합격";
		else txt ="불합격";
		System.out.println(txt+"입니다. (국어점수 "+kor+"점, 영어점수 "+eng+"점)");
		System.out.println("------------------");
		
		// 예제3
		int score = 88;
		String str = "";
		if ( score < 0 || score > 100 ) {
			str = "오류!! 0 ~ 100 값이 아닙니다.";
		} else {
			str = "정상입력입니다.";
		}
		System.out.println(str);
		System.out.println("------------------");
		
		// 풀어보기1
		byte t1 = 14; //시
		byte t2 = 0; //분
		byte t3 = 0; //초
		String t4 = "";
		if (t1<0 || t1 >23 || t2 <0 || t2 > 59 || t3 < 0 || t3 >59) {
			t4 ="잘못된";
		} else {
			t4 ="올바른";
		}
		System.out.println(t1+"시 "+t2+"분 "+t3+"초는 "+t4+" 시간입니다.");
		System.out.println("------------------");
		// 정상 먼저
		if (t1>=0 && t1<=23 && t2>=0 && t2 <= 59 && t3 >= 0 && t3 <=59) {
			t4 ="올바른";
		} else {
			t4 ="잘못된";
		}
		System.out.println(t1+"시 "+t2+"분 "+t3+"초는 "+t4+" 시간입니다.");
		System.out.println("------------------");
		
		// 풀어보기2
		String t5 = "";
		if ( t1 >= 14 ) {
			t5="결석";
		} else if (t1 < 14 && t1 > 9) {
			t5="지각";
		} else if (t1 == 9 && t2 >= 30 && t3 >=1) {
			t5="지각";
		} else {
			t5="출석";
		}
		System.out.println(t1+"시 "+t2+"분 "+t3+"초는 "+t5+"입니다.");
		System.out.println("------------------");
		// 출석 먼저
		if ( (t1>=6 && t1<=9) ||
			 (t1==9 && t2<30) ||
			 (t1==9 && t2==30 && t3==0)
			) {
			t5="출석";
		} else if ( (t1==9 && t2==30 && t3>0) ||
				(t1==9 && t2>30) ||
				(t1>10 && t1<14) ) {
			t5="지각";
		} else if (t1 >= 14) {
			t5="결석";
		} else {
			t5="무효";
		}
		System.out.println(t1+"시 "+t2+"분 "+t3+"초는 "+t5+"입니다.");
		System.out.println("------------------");
		
		
		// 풀어보기3
		// (1)
		int a1 = 56;
		String a2 = "";
		String a3 = "";
		if (a1%2 == 0) {
			a2 = "짝수";
		} else {
			a2 ="홀수";
		}
		if (a1%10 == 0) {
			a3 = "입니다.";
		} else {
			a3 ="가 아닙니다.";
		}
		System.out.println(a1+"은 "+a2+"이고 10의 배수"+a3);
		System.out.println("------------------");
		
		// (2)
		int b1 = 70;
		String pno = "";
		
		if (b1>=1 && b1<=10) {
			pno = "1";
		} else if (b1>=11 && b1<=20) {
			pno = "2";
		} else if (b1>=21 && b1<=30) {
			pno = "3";
		} else {
			pno = "잘못된 ";
		}
		System.out.println("입력된 값은 "+b1+"로 "+pno+"페이지 범위에 있습니다.");
		System.out.println("------------------");
		
		
	}

}
