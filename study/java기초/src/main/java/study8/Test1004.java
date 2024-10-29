package study8;

public class Test1004 {
	
		private int eng; // 같은 클래스에서만 접근 가능
		int kor;
		protected int math;
		public int scn;
		
		public void setEng(int a) {
			if(a>=0 && a <=100) eng = a;
		}
		
		public int getEng() {
			return eng;
		}
		
		public int getKor() {
			return kor;
		}
		
		public int getMath() {
			return math;
		}
		

}
