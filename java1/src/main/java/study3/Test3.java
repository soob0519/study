package study3;

public class Test3 {

	public static void main(String[] args) {
		
		if(1<2) {
			System.out.println("11");
		} else {
			System.out.println("22");
		}
		
		// 처리속도가 빠름
		switch(true+"") {	// "true"
			case "1" : System.out.println("11");
			break;
			case "2" : System.out.println("22");
			break;
			default : System.out.println("33");
		}
		

	}

}
