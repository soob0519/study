package study8_1;

public class Mouse2 extends Product {
	
	public void blue() {
		setName("파란마우스");
		setPrice(5000);
		setMaker("미국");
	}
	
	public void black() {
		setName("검정마우스");
		setPrice(6000);
		setMaker("미국");
	}
	
	public void print() {
		System.out.println(getName()+": "+getPrice()+", 제조: "+getMaker());
	}
	
	public static void main(String[] args) {
		Mouse2 m = new Mouse2();
		m.blue();
		m.print();
		
		m.black();
		m.print();

	}

}
