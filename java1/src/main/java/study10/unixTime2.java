package study10;

import java.util.Calendar;

public class unixTime2 {

	public static void main(String[] args) {
		
		Calendar cal = Calendar.getInstance();	// 인스턴스처리 (현시점)
		long ux1 =  cal.getTimeInMillis();		// 유닉스시간
		
		long sum = 0;
		for(int i=0; i<2100000000; i++) {
			if(i%10 == 0) sum += i;
			if(i%100 == 0) sum += i;
			if(i%1000 == 0) sum += i;
		}
		
		cal = Calendar.getInstance();			// 인스턴스처리 (현시점 재정의)
		long ux2 =  cal.getTimeInMillis();		// 유닉스시간
		long ret1 = ux2-ux1;
		
		System.out.println(ret1/(double)1000 + "초");
		
		cal = Calendar.getInstance();
		long ux3 =  cal.getTimeInMillis();
		
		sum = 0;
		int j = 0;
		while(j<2100000000) {
			if(j%10 == 0) sum += j;
			if(j%100 == 0) sum += j;
			if(j%1000 == 0) sum += j;
			j++;
		}
		
		cal = Calendar.getInstance();
		long ux4 =  cal.getTimeInMillis();
		long ret2 = ux4-ux3;
		System.out.println(ret2/(double)1000 + "초");
		
	}

}
