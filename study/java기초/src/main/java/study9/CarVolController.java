package study9;

public class CarVolController  {

	public static void main(String[] args) {
		CarVolMake car = new CarVolMake();
		
		car.onoff();
		System.out.println(car.volSize);
		car.volUp(60);
		System.out.println(car.volSize);
		car.volDown(40);
		System.out.println(car.volSize);
		car.onoff();
		System.out.println(car.volSize);
	}

}
