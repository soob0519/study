package study7_1;

public class Score {
	int kor = 0;
	int eng = 0;
	
	public void setKor (int a) { // 매개변수
		if (a>=0 && a<=100) kor = a;
	}
	
	public void setEng (int a) { // 매개변수
		if (a>=0 && a<=100) eng = a;
	}
	
	
	
	
}
