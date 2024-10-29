package study8_1;

public class Mouse extends Product {
	
	public void input(String name, int price, String maker) {
		setName(name);
		setPrice(price);
		setMaker(maker);
	}

	public void print() {
		System.out.println(getName()+": "+getPrice()+", 제조: "+getMaker());
	}
	
	public static void main(String[] args) {
		Mouse m1 = new Mouse();
		Mouse m2 = new Mouse();
		
		m1.print();
		m2.print();
		System.out.println("---------------------");
		
		m1.input("파란마우스", 5000, "미국");
		m2.input("검정마우스", 6000, "미국");
		m1.print();
		m2.print();
		
	}

}
