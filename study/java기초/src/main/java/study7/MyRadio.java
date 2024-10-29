package study7;

public class MyRadio {

	public static void main(String[] args) {
		MyRemocon radio = new MyRemocon();
		
		radio.power();
		System.out.println("전원 (누름) : "+radio.power);
		
		radio.channelUp();
		radio.channelUp();
		radio.channelUp();
		System.out.println("채널 : "+radio.channel);
		
		radio.channelDown();
		System.out.println("채널 : "+radio.channel);
		
		radio.channel = 91;
		System.out.println("채널 : "+radio.channel);
		
		radio.power();
		System.out.println("전원 (누름) : "+radio.power);
		

	}

}
