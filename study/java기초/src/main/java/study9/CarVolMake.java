package study9;

public class CarVolMake implements CarVolService{
	
	public final int maxVolSize = 100;
	public final int minVolSize = 0;
	public int volSize = 0;
	public int volTemp = 0;
	public boolean power = false;
	
	public void onoff() {
		power = !power;
		
		if(power == true) {
			volSize = 3;
		} else {
			volSize = 0;
		}
		
		/*
		 if(power == false) {
			volSize = 3;
			power = true;
		} else if (power == true) {
			volSize = 0;
			power = false;
		}
		*/
	}
	
	@Override
	public void volUp(int size) {
		volSize += size;
		if(volSize > maxVolSize) volSize = 100;
		/*
		 int maxSize = volSize + size;
		 if(maxVolsize < maxSize) {
		 	volSize = maxVolSize;
		  } else {
		  	volSize = maxSize;
		  }
		 */
	}

	@Override
	public void volDown(int size) {
		volSize -= size;
		if(volSize < minVolSize) volSize = minVolSize;
		/*
		 int minSize = volSize - size;
		 if(minVolsize > minSize) {
		 	volSize = minVolSize;
		  } else {
		  	volSize = minSize;
		  }
		 */
	}

	@Override
	public void volOff() {	// 볼륨 | 중단(off)
		volSize = 0;
	}

	@Override
	public void volPause() { // 볼륨 잠시 중단
		volTemp = volSize;
		volSize = 0;
	}

	@Override
	public void volResume() { // 볼륨 다시 재생
		volSize = volTemp;
	}

}
