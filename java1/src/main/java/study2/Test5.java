package study2;

public class Test5 {

	public static void main(String[] args) {
		
		// 삼항연산 :: IF문과 같은 결과를 얻어내는 연산
		// (조건식)?true:false;
		System.out.println( (1==1)?"맞음":"틀림" );
		System.out.println( (1==2)?"맞음":"틀림" );
		
		if (1==1) {
			System.out.println("맞음");
		} else {
			System.out.println("틀림");
		}
		
		// 변수 값이 홀수 또는 짝수인지를 구별한다.
		
		int a1 = 10;
		String result = (a1%2 == 0)?"짝수":"홀수";
		System.out.println(result);
		
		int apple = 88;
		String result1 = (apple >=80)?"A등급":(apple>=60)?"B등급":"C등급";
		System.out.println(result1);
		
		if (apple >= 80) {
			result1 = "A등급";
		} else {
			if (apple >= 60) {
				result1 = "B등급";
			} else {
				result1 = "c등급";
			}
		}
		
		int eng = 80;
		String result2 = (eng >= 80)?"우수":"양호";
		System.out.println(result2);
		
		int gen = 1;
		String gender = (gen == 1)?"남성":(gen == 2)?"여성":"오류";
		System.out.println(gender);
		
		int num	= 10;
		String number = (num>0)?num+"은 양수 입니다.":(num<0)?num+"은 음수 입니다.":num+"은 0입니다.";
		System.out.println(number);
		System.out.println(((num>0)?"양수":(num<0)?"음수":"0")+"입니다.");
		
		int score = 92;
		String level =	(score>=90)?"A학점":
						(score>=80)?"B학점":
						(score>=70)?"C학점":
						(score>=60)?"D학점": "F학점";
		System.out.println(level);
		
		
	}

}
