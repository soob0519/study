package study9;

public class StudentControl {

	public static void main(String[] args) {
		int avg = 0;
		StudentImpl s1 = new StudentImpl();
		s1.setEng(80);
		s1.setKor(90);
	
		System.out.println("합계 : "+s1.sum());
		
	}

}
