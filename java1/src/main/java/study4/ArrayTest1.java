package study4;

public class ArrayTest1 {

	public static void main(String[] args) {
		// 정수인 경우
		int [] score = {90,70,80};
		// int sum = score[0]+score[1]+score[2];
		int hap = 0;
		int len = score.length;
		for (int i=0; i<len; i++) {
			System.out.println(score[i]);
			hap += score[i];
		}
		int avg = hap/len;
		System.out.println("합계 : "+hap);
		System.out.println("평균 : "+avg);
		System.out.println("---------------");
		
		// 소수인 경우
		double [] score1 = {90.9,70.7,80.8};
		double hap1 = 0;
		int len1 = score1.length;
		
		for (int i=0; i<len1; i++) {
			System.out.println(score1[i]);
			hap1 += score1[i];
		}
		double avg1 = hap1/len1;
		
		System.out.println("합계 : "+hap1);
		System.out.println("평균 : "+avg1);
		System.out.println("---------------");
		
		// 배열 예제2
		
		String[] subject = {"java","javascript","linux"};
		/*for(int i=0; i<subject.length; i++) {
			System.out.println(subject[i]);
		}*/
		
		int j =0;
		while(j <subject.length) {
			System.out.println(subject[j]);
			j++;
		}
		System.out.println("---------------");
		
		// 풀어보기1
		
		for(int i=1; i<18; i++) {
			if (i%5==0) System.out.print(i+"** ");
			else System.out.print(i+" "); 
		}
		System.out.println();
		System.out.println("---------------");
		
		int f =0;
		while(f < 18) {
			if (f%5==0) System.out.print(f+"** ");
			else System.out.print(f+" ");
			f++;
		}
		System.out.println();
		System.out.println("---------------");
		
		// 풀어보기2
		int[] months = {1,3,10};
		for(int m=0; m<months.length; m++) {
			int mm =months[m];
			String txt = "";
				if (mm==12||mm<=2) txt = "겨울";
				else if (mm>=3 && mm<6) txt = "봄";
				else if (mm>=6 && mm<9) txt = "여름";
				else if (mm>=9 && mm<12) txt = "가을";
				
				if(mm<10) System.out.print("0");
				System.out.println(mm+"월 : "+txt);
		}
		System.out.println("---------------");
	}

}
