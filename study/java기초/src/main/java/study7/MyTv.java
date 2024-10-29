package study7;

public class MyTv {

	public static void main(String[] args) {
		
		MyRemocon tv = new MyRemocon(); // 인스턴스(객체) 처리
		
		System.out.println("전원(초기) : "+tv.power);
		tv.power(); // true		
		System.out.println("전원 (누름) : "+tv.power);
		
		tv.channel = 2;
		System.out.println("채널 : "+tv.channel);
		
		tv.channelDown();
		System.out.println("채널 : "+tv.channel);
		
		tv.channelUp();
		tv.channelUp();
		System.out.println("채널 : "+tv.channel);
		
		tv.channelDown();
		tv.channelDown();
		System.out.println("채널 : "+tv.channel);
		tv.channelDown();
		tv.channelDown();
		System.out.println("채널 : "+tv.channel);
		tv.channelDown();
		tv.channelDown();
		System.out.println("채널 : "+tv.channel);
		System.out.println("-------------------");
		
		tv.power();	
		System.out.println("전원 (끝) : "+tv.power);
		
		tv.vol = 5;
		System.out.println("볼륨 : "+tv.vol);
		
		tv.volUp();
		System.out.println("볼륨 올리기 : "+tv.vol);
		tv.volDown();
		tv.volDown();
		tv.volDown();
		System.out.println("볼륨 올리기 : "+tv.vol);
		
	}

}
