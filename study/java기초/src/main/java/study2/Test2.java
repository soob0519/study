package study2;

public class Test2 {

	public static void main(String[] args) {
		
			String[] t1 = {"java","jsp","oracle"};
			System.out.println( t1[0] +","+ t1[1]+","+t1[2] );
			t1[1] = "mysql";
			System.out.println( t1[0] +","+ t1[1]+","+t1[2] );
			
			
			// 배열 구조 생성
			String[] t2 = new String[3];
			t2[0] = "html";
			t2[1] = "css";
			t2[2] = "javascript";
			// t2[3] = "abc"; // (x) 실행오류
			System.out.println( t2[0] );
			// System.out.println( t2[3] ); // (x) 실행오류
			
			int[] t3 = {1,2,3,4,5,6,7,8,9,10};
			System.out.println( t3[0] );
			
			int[] t4 = new int[100];
			// t4[0] = 1;
			// t4[1] = 2;
			
			for(int i=0; i<100; i++) {
				
				t4[i] = i+1;
			}
			
			for(int i=0; i<100; i++) {
				System.out.print(t4[i]+ " ");
			}
			
	}

}
