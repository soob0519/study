package study4;

public class BreakTest1 {

	public static void main(String[] args) {

		// 1 ~ 50
		// 짝수만 출력
		
		for(int i=1; i<=100;i++) {
			
			if (i%2 == 1) {
				// 중간 종료 후 재실행
				continue;
			}
			System.out.print(i+" ");
			if (i == 20) break;
		}
		System.out.println("\n----------------\n");
		
		int j = 0;
		while(j<=100) {
			j++;			
			if (j%2 == 1) {
				continue;
			}
			System.out.print(j+" ");
			if (j == 20) break;
		}
		System.out.println("\n----------------\n");
		
		int a = 1;
		
		do {
			System.out.print(a + " ");
			a++;
		} while(a<=10);
		
		
	}

}
