package study3;

public class Test4 {

	public static void main(String[] args) {
		
		// 별 5개씩 3줄
		/*for(int i=0; i<5; i++) {
			System.out.print("*");
		}
		System.out.println();
		
		for(int i=0; i<5; i++) {
			System.out.print("*");
		}
		System.out.println();
		
		for(int i=0; i<5; i++) {
			System.out.print("*");
		}*/
		for(int i=0; i<9; i++) {
			for(int j=0; j<5; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
		System.out.println("---------------------------");	
		
		for(int i=1; i<6; i++) {
			for(int j=0; j<i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println("---------------------------");
		
		for(int i=5; i>0; i--) {
			for(int j=0; j<i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println("---------------------------");
		
		// 구구단 (2중for문)
		// 1단 ~ 9단
		
		for(int i=1; i<10; i++) {
			for(int j=1; j<10; j++) {
				System.out.print(i+"X"+j+"="+(i*j));
				System.out.println(" ");
			}
			System.out.println(" ");
			System.out.println("----------");
		}
		
	}

}
