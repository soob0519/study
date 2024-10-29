package study9;

public class MyCook implements Cookie {
	
	public int kor = 90; // 맴버변수, 인스턴스(객체)변수
	
	@Override
	public void makeCookie() {
		System.out.println("쿠키");	
	}

	@Override
	public void makeSalad() {
		System.out.println("샐러드");
	}

	public static void main(String[] args) {
		MyCook cook = new MyCook();
		cook.makeCookie();
		cook.makeSalad();
		System.out.println(cook.eng1);
	}
	
	
}
