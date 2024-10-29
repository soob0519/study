package study8;

public class MyCar {
	
	int maxSpeed; // 멤버변수 인스턴스변수(객체변수)
	String carName;
	String carColor;
	
	static int aa = 0; // 멤버변수 클래스변수(전역변수)
	
	// 생성자, 다형성(오버로딩-같은 이름의 메소드를 매개변수 차이만)
	MyCar(String a, int b) { // 매개변수
		String bb="11"; 	 // 지역변수
		carName = a;
		maxSpeed = b;
	}
	
	MyCar(String a, int b, String c) {
		carName = a;
		maxSpeed = b;
		carColor = c;
	}
	
	public void maxSpeedUpdate(int a) {
		maxSpeed = maxSpeed + a;
	}
	
	public static void main(String[] args) {
		MyCar car1 = new MyCar("소나타",230);
		MyCar car2 = new MyCar("그랜저",300,"white");
		
		System.out.println(car1.carName+" 최고속도: "+car1.maxSpeed);
		System.out.println(car2.carName+" 최고속도: "+car2.maxSpeed);
		car1.maxSpeedUpdate(-20); // 최고속도의 가감
		System.out.println(car1.carName+" 최고속도: "+car1.maxSpeed);
		
	}

}
