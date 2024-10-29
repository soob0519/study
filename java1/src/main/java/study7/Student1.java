package study7;

public class Student1 {

	public static void main(String[] args) {
		StudentInfo st1 = new StudentInfo();
		st1.name = "홍길동";
		st1.eng = 30;
		st1.kor = 80;
		
		System.out.println("이름: "+st1.name);
		System.out.println("영어: "+st1.eng);
		System.out.println("국어: "+st1.kor);
		System.out.println("합계: "+st1.hap());
		System.out.println("평균: "+st1.avg());
		
		System.out.println("-----------------");
		
		StudentInfo st2 = new StudentInfo();
		st2.name = "김철수";
		st2.eng = 55;
		st2.kor = 90;
		System.out.println("이름: "+st2.name);
		System.out.println("영어: "+st2.eng);
		System.out.println("국어: "+st2.kor);
		System.out.println("합계: "+st2.hap());
		System.out.println("평균: "+st2.avg());
		
		System.out.println("-----------------");
		
		System.out.println("홍길동 국어: "+st1.kor);
		System.out.println("김철수 국어: "+st2.kor);
		
		
		
		

	}

}
