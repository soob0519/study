package study9;

public class VolController {

	public static void main(String[] args) {
		VolMake tv = new VolMake();
		VolMake radio = new VolMake();
		
		System.out.println("tv vol : "+tv.getVolLevel());
		System.out.println("radio vol : "+radio.getVolLevel());
		
		tv.volUp(10);		// 11
		radio.volUp(30);	// 31
		System.out.println("tv vol : "+tv.getVolLevel());
		System.out.println("radio vol : "+radio.getVolLevel());
		
		tv.volDown(5);		// 6
		radio.volDown(20);	// 11
		System.out.println("tv vol : "+tv.getVolLevel());
		System.out.println("radio vol : "+radio.getVolLevel());
	}

}
