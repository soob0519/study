package study9;

public class VolMake implements VolService {
	private int volLevel;
	
	public int getVolLevel() {
		return volLevel;
	}
	
	public VolMake() {
		volLevel = 1;
	}
	@Override
	public void volUp(int level) {
		volLevel += level;
	}
	@Override
	public void volDown(int level) {
		volLevel -= level;
	}
}
