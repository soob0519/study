package study7_1;

public class VariableExam {

	public static void main(String[] args) {
		
		Score s1 = new Score();
		
		s1.setKor(100);
		s1.setEng(90);
		int avg = (s1.eng + s1.kor)/2;
		
		System.out.println("국어:"+s1.kor+", 영어:"+s1.eng+", 평균:"+avg);
		
	}

}
