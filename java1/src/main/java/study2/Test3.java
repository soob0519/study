package study2;

public class Test3 {

	public static void main(String[] args) {
		
		// 예) 2개의 반
		int[] jumsu1 = {98,30,50};
		int[] jumsu2 = {56,80,100};
		
		//2차원 배열
		int[][] ban1 = { {98,30,50},{56,80,100},{86,78,98} };
		int[][] ban2 = { {44,55,33},{66,60,40},{88,77,99} };
		
		System.out.println( ban1[0][0] ); // 98
		System.out.println( ban1[0][1] ); // 30
		System.out.println( ban1[0][2] ); // 50
		
		System.out.println( ban1[1][0] ); // 56
		System.out.println( ban1[1][1] ); // 80
		System.out.println( ban1[1][2] ); // 100
		
		System.out.println( ban1[2][0] ); // 86
		System.out.println( ban1[2][1] ); // 78
		System.out.println( ban1[2][2] ); // 98
		
		System.out.println( "----------------" );
		
		//3차원 배열
		
		int[][][] school = {	{ {98,30,50},{56,80,90},{86,78,98} },
								{ {44,55,33},{66,60,40},{88,77,99} }	};
		
		System.out.println( school[0][0][0] ); // 98
		System.out.println( school[0][1][1] ); // 80
		System.out.println( school[1][2][0] ); // 88
		
		// 회사에서 남성사원/여성사원의 급여 세팅
		
		int[][] com = { {1000,300,400},{800,200,500} };
		System.out.println( com[0][0] ); // 1000
		System.out.println( com[0][1] ); // 300
		System.out.println( com[1][2] ); // 500
		
	}

}
