package study8_1;

public class SeasonView1 extends Season1 {
	
	// 오버라이딩 (상위클래스의 메소드를 재구성)
	public void summer() {
		name ="summer";
		firstMonth = 6;
		lastMonth = 8;
		avgTemp = 33;
	}
	
	public static void main(String[] args) {
		SeasonView1 s1 = new SeasonView1();
		
		s1.summer();
		s1.seasonPrint();
		
	}

}
