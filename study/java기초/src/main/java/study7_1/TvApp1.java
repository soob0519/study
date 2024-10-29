package study7_1;

public class TvApp1 {

	public static void main(String[] args) {
		
		TvInfo tv1 = new TvInfo();
		
		tv1.model = "M01TV";
		tv1.color = "Red";
		tv1.size = 50;
		tv1.price = 150;
		
		TvInfo tv2 = new TvInfo();
		
		tv2.model = "M02TV";
		tv2.color = "Blue";
		tv2.size = 55;
		tv2.price = 200;

		System.out.println("모델명: "+tv1.model+", 색상: "+tv1.color+", 크기: "+tv1.size+"인치, 가격: "+tv1.price+"만원");
		System.out.println("모델명: "+tv2.model+", 색상: "+tv2.color+", 크기: "+tv2.size+"인치, 가격: "+tv2.price+"만원");
	}

}
