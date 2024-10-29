package study2;

public class Test4 {

	public static void main(String[] args) {
		int p1 = 26;
		int p2 = 30;
		int p3 = 39;
		
		System.out.println("합계 : "+(p1+p2+p3));
		System.out.println("합계 : "+(p1+p2+p3)/3); // 31.66666~~ -> 31
		System.out.println("p1 : "+ (p1%10) +" , p2 : "+ (p2%10) +" , p3 : "+ (p3%10));
		System.out.println("-------------");
		
		// 예제2
		String cmp1 = "에스케이";
		String cmp2 = "다우기술";
		String cmp3 = "아이티센";
		String cmp1_sales = "98조";
		String cmp2_sales = "6조";
		String cmp3_sales = "3천2백억";
		
		System.out.println("- 2021년 SI기업 매출 순위 -");
		System.out.println("1위 - "+cmp1+"("+cmp1_sales+")");
		System.out.println("·");
		System.out.println("·");
		System.out.println("6위 - "+cmp2+"("+cmp2_sales+")");
		System.out.println("·");
		System.out.println("·");
		System.out.println("10위 - "+cmp3+"("+cmp3_sales+")");
		System.out.println("-------------");
		
		// 예제3
		String fruit = "사과";
		int price = 500;
		System.out.println(fruit +"의 가격은 "+price+"원 입니다.");
		System.out.println("-------------");
		
		// 예제4
		int eng = 90;
		int math = 100;
		System.out.println("영어(" + eng + ") 수학(" + math + ") 평균(" + (eng+math)/2 + ")");
		System.out.println("-------------");
		
		// 대입연산자
		
		// 예제3
		int myMoney = 1000;
		System.out.println("내 돈 현황 : "+myMoney);
		myMoney += 100 ;
		System.out.println("내 돈 현황 : "+myMoney);
		myMoney += 50 ;
		System.out.println("내 돈 현황 : "+myMoney);
		myMoney -= 30 ;
		System.out.println("내 돈 현황 : "+myMoney);
		int fMoney = 500;
		myMoney += fMoney ;
		System.out.println("내 돈 현황 : "+myMoney);
		System.out.println("-------------");
		
		// 예제4
		int Tom = 100;
		int day1 = 20;
		Tom += day1;
		int day2 = 30;
		Tom += day2;
		int day3 = -10;
		Tom += day3;
		int sum = day1+day2+day3;
		int avg = sum/3;
		System.out.println("Tom의 총금액은 "+Tom+"만원입니다.");
		System.out.println("평균수입은 "+avg+"만원입니다.");
		System.out.println("-------------");
		
		int number =20;
		number += 1;	// 21
		System.out.println(number);
		number += 5;	// 26
		System.out.println(number);
		
		// number =+ 5;	// 5 (연산처리 안됨)
		// System.out.println(number);
		
		number -= 6;	// 20
		System.out.println(number);
		
		number *= 3;	// 60
		System.out.println(number);
		
		number++;	// 1증가 , 61
		System.out.println(number);
		++number;	// 1증가 , 62
		System.out.println(number);
		
		number--;	// 1감소 , 61
		System.out.println(number);
		--number;	// 1감소 , 60
		System.out.println(number);
		
		int a = 1;
		int b = ++a; // 전위연산
		System.out.println(a+" , "+b);
		int c = 1;
		int d = c++; // 후위연산
		System.out.println(c+" , "+d);
		
	}

}
