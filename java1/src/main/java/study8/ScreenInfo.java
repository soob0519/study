package study8;

public class ScreenInfo {

	String movieTitle = "";
	int ticketPrice = 10000;
	
	public ScreenInfo(String a) {
		movieTitle = a;
	}
	
	public ScreenInfo(String a,int b) {
		movieTitle = a;
		ticketPrice = b;
	}
	
	
	public static void main(String[] args) {
		ScreenInfo info1 = new ScreenInfo("미이라");
		ScreenInfo info2 = new ScreenInfo("아마존",15000);
		
		System.out.println("screen 1의 영화제목은 "+info1.movieTitle);
		System.out.println("screen 2의 영화제목은 "+info2.movieTitle);
		System.out.println("screen 1의 가격은 "+info1.ticketPrice);
		System.out.println("screen 2의 가격은 "+info2.ticketPrice);
		

	}

}
