package study8;

class Test7 {
	private int eng; // 같은 클래스에서만 접근 가능
	int kor;
	protected int math;
	public int scn;
	
	public void setEng(int a) {
		if(a >=0&& a <=100) eng = a;
	}
	
	public int getEng() {
		return eng;
	}
	
}

/* public class Test6 { --> error : 하나의 파일에는 하나의 public 만 세팅
	int a = 10;
	int b = 20;	
}
*/

public class Test5 {

	public static void main(String[] args) {
		Test7 t1 = new Test7();
		// System.out.println(t1.eng);	
		System.out.println(t1.kor);	
		System.out.println(t1.math);
		System.out.println(t1.scn);

	}

}
