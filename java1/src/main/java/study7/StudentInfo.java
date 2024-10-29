package study7;

public class StudentInfo {
	int eng = 0;
	int kor = 0;
	String name = "";
	
	public int hap() {
		return eng+kor;
	}
	
	public double avg() {
		
		return hap()/2;
	}
	
}
