package study7;

public class CoffeeMake {

	public static void main(String[] args) {
		
		CoffeeInfo c1 = new CoffeeInfo();
		// c1.name = "아메리카노";
		c1.setName("아메리카노");
		// c1.price = 3000;
		c1.setPrice(3000);
		// CoffeeInfo.maker = "가나";
		CoffeeInfo.setMaker("가나");
		
		CoffeeInfo c2 = new CoffeeInfo();
		// c2.name = "바닐라라떼";
		c2.setName("바닐라라뗴");
		// c2.price = 4500;
		c2.setPrice(4500);
		// CoffeeInfo.maker = "홍콩";
		CoffeeInfo.setMaker("홍콩");
		
		
		System.out.println("이름 :"+c1.name);
		System.out.println("가격 :"+c1.price);
		System.out.println("원산지 :"+c1.maker);
		
		System.out.println("이름 :"+c2.name);
		System.out.println("가격 :"+c2.price);
		System.out.println("원산지 :"+c2.maker);
		
	}

}
