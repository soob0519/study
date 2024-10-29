package study7;

public class MyRemocon {
	
	boolean power = false;
	int channel = 0;
	int vol = 0;
	
	public void power() {
		power = !power;
	}
	
	public void channelUp() {
		channel += 1; //++
	}
	
	public void channelDown() {
		if(channel>0) channel -= 1; // --
	}
	
	public void volUp() {
		vol++;
	}
	
	public void volDown() {
		if(vol>0) vol--;
	}

}
