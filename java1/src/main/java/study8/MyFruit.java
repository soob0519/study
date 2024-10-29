package study8;

class CherryInfo {
	static String name = "cherry";
	static int price = 5000;
	static void discount() {
		price = price -(price/10);
	}
}

class AppleInfo	{
	String name = "apple";
	int price = 3000;
	void discount() {
		price = price -(price/10);
	}
	
}

public class MyFruit extends AppleInfo {
			
	public static void main(String[] args) {
		/*
		System.out.println(CherryInfo.name);
		System.out.println(CherryInfo.price);
		CherryInfo.discount();
		System.out.println(CherryInfo.price);
		*/
		MyFruit mf = new MyFruit();
		System.out.println(mf.name);
		System.out.println(mf.price);
		mf.discount();
		System.out.println(mf.price);
	}

}
