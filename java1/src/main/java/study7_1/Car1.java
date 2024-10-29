package study7_1;

public class Car1 {
	
	static int speed;
	static String carName;
	static int maxspeed = 300;
	
	public static void speedUp() {
		if(speed < maxspeed) speed++;
	}
	public static void speedDown() {
		if(speed > 0) speed--;
	}
	
	public static void stop() {
		speed = 0;
	}
	
	public static void main(String[] args) {
		
		// static int a; // error
		// static String b; // error
		
		// int a;
		// String b;
		// System.out.println(a);
		// System.out.println(b);
		
		
		Car1.carName = "소나타";
		Car1.speed = 100;
		
		Car1.speedUp();
		Car1.speedUp();
		
		System.out.println("차이름 : "+Car1.carName+" 현재속도 : "+Car1.speed);
		
		Car1.stop();
		System.out.println("차이름 : "+Car1.carName+" 현재속도 : "+Car1.speed);
		
		Car1.carName = "그랜저";
		Car1.speed = 80;
		System.out.println("차이름 : "+Car1.carName+" 현재속도 : "+Car1.speed);
		
		

	}

}
