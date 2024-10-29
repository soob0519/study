package study9;

public class CarVol1 {

	public static void main(String[] args) {
		CarVolMake c1 = new CarVolMake();
		
		c1.volUp(20);
		System.out.println(c1.volSize);
		c1.volPause();
		System.out.println(c1.volSize);
		c1.volResume();
		System.out.println(c1.volSize);
	}

}
