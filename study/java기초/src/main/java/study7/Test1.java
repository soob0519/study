package study7;

public class Test1 {
	
	int eng = 0;			// 멤버변수 인스턴스(객체)변수
	int kor = 0;			// 멤버변수 인스턴스(객체)변수
	static int year = 2024;	// 멤버변수 클래스(전역)변수
	
	public void setEng(int a) {
		if (a >=0 && a<=100) eng = a;
	}
	
	
	public int hap() {
		return eng+kor;
	}	
	
	/*
	public static int hap1() {
		return eng+kor;	// error
	}
	*/
	
	public static int yearAdd() {
		return year + 10;
	}

	public static void main(String[] args) {
		// 참조클래스 참조변수 = new 생성자(); 
		Test1 kim = new Test1();	// 인스턴스(객체)처리
		Test1 hong = new Test1();
		
		kim.kor = 90;
		kim.eng = 80;
		
		hong.kor = 70;
		hong.setEng(10);
		
		Test1.year = 2025;
		
		int math = 100;
		System.out.println(math);
		
		math = 90;
		System.out.println(math);
		
		System.out.println("이번년도1: "+Test1.year);
		System.out.println("이번년도2: "+Test1.yearAdd());
		
		// System.out.println(eng); // X
		System.out.println("kim eng: "+kim.eng);
		System.out.println("kim kor: "+kim.kor);
		
		System.out.println("hong eng: "+hong.eng);
		System.out.println("hong kor: "+hong.kor);

	}

}
