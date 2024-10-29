package study5;

import java.util.Random;

public class RandomTest2 {

	public static void main(String[] args) {
		
		Random r1 = new Random();
		
		// int 타입의 랜덤값 (+-21억)
		System.out.println(r1.nextInt());
		System.out.println(r1.nextInt(100)); // 0~99		
		System.out.println(r1.nextInt(45)); // 0~44
		System.out.println("[로또 예상 번호]");
		
		for(int i=0; i<6; i++) {
			System.out.print( (r1.nextInt(45)+1) + " ");
		}
		
		System.out.println("----------------");
		System.out.println( r1.nextBoolean() );
		System.out.println( r1.nextDouble() );
		System.out.println( r1.nextFloat() );
		System.out.println( r1.nextLong() );
		
		
		
		
		
		
		
	}

}
