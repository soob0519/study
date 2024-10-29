package study8_1;

public class Season1 {
	String name;
	int firstMonth;
	int lastMonth;
	int avgTemp;
	
	public void spring() {
		name ="봄";
		firstMonth = 3;
		lastMonth = 5;
		avgTemp = 20;
	}
	
	public void summer() {
		name ="여름";
		firstMonth = 6;
		lastMonth = 8;
		avgTemp = 30;
	}
	
	public void seasonPrint() {
		System.out.println("계절명: "+name);
		System.out.println("계절기간: "+firstMonth+"월 ~ "+lastMonth+"월");
		System.out.println("평균온도: "+avgTemp);
	}
	
	
	
}
