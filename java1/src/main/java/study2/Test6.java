package study2;
/*
 * IF문 관련 학습 예제 
 */
public class Test6 {

	public static void main(String[] args) {
		
		// 풀어보기1
		int spring = 250;
		int oracle = 200;
		
		if (spring > oracle) {
			System.out.println("spring이 더 고가이다.");
		} else if (spring < oracle) {
			System.out.println("oracle이 더 고가이다.");
		} else if (spring == oracle)  {
			System.out.println("둘 가격이 똑같다.");
		}
		System.out.println("------------------");
		
		// 풀어보기2
		
		int year = 12;
		String name = "홍길동";
		String level = "";
		if (year >= 16) {
			level = "특급";
		} else if (year >= 12 && year < 16) {
			level = "고급";
		} else if (year >= 6 && year < 12) {
			level = "중급";
		} else if (year >= 3 && year < 6) {
			level = "초급";
		} else if (year < 3) {
			level = "신입";
		}
		System.out.println(name+"님의 년차는 "+year+"년으로 "+level+"입니다.");
		System.out.println("------------------");
		
		// 풀어보기3
		
		String gen = "M";
		// String gender = (gen == "M")?"남성":"여성";
		String loca = "구리시";
		
		System.out.println(name+"님의 위치는 "+loca+"로 "+((gen == "M")?"남성":"여성")+"입니다.");
		System.out.println("------------------");
		
		
	}

}
