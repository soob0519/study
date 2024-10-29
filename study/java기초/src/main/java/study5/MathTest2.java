package study5;

public class MathTest2 {

	public static void main(String[] args) {
		
		// 풀어보기1
		int n1 = 150;
		int n2 = 700;
		int n3 = 300;
		
		int max = Math.max(n1,Math.max(n2,n3));
		int min = Math.min(n1,Math.min(n2,n3));
		System.out.println("최대값 : "+max+", 최소값 : "+min);
		
		// 풀어보기2
		int[] a1 = {90,80,-40,98,72,54};
		int a2 = 0;
		for(int i=0; i<a1.length; i++) {
			a1[i] = Math.abs(a1[i]);
			a2 += a1[i];
		}
		int a3 = a2/a1.length;
		System.out.println("총합 : "+a2+", 평균 : "+a3);
		
		// 풀어보기3
		// Math.max( a1[0], Math.max( a1[1],Math.max(a1[2],Math.max(a1[3],Math.max(a1[4],a1[5]))) ) );
		int max1 = 0;
		int min1 = 0; //만약 100 최대값일 경우 라는 조건이 있을때 100을 넣으면 ~
		for(int i=0; i<a1.length; i++) {
			// 배열 값에 접근
			int score = Math.abs(a1[i]);
			// max() 메소드에 적용
			max1 = Math.max(score,max1);
			min1 = Math.min(score,min1);
			if(i==0) min1 = score; // ~ if문은 굳이 필요하지 않음
		}
		System.out.println("최고득점 : "+max1+", 최저득점 : "+min1);
		
		
		
		
		

	}

}
