package study6;

public class Test11 {

	public static void main(String[] args) {
		
		/*
		double a1 = 77;
		System.out.println(a1); // 77.0
		*/
		
		int eng = 77;
		int kor = 70;
		
		double	avg1 = ((double)eng+kor)/2; // (77.0+70)/2
		double	avg2 = (eng+kor)/2;
		int		avg3 = (eng+kor)/2;
		
		System.out.println(avg1);	// 73.5
		System.out.println(avg2);	// 73.0
		System.out.println(avg3);	// 73
	}

}
