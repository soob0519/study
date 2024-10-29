package study5;

import java.util.Random;

public class MathTest3 {

	public static void main(String[] args) {
		
		// 일별 매출
		int[] w1 = {150,230,220,170,180,260,80};
		int sum = 0;
		for(int i=0; i<w1.length; i++) {
			sum += w1[i];
		}		
		int avg = sum/w1.length;
		System.out.println("[주별매출]");
		System.out.println("합계:"+sum);
		System.out.println("평균:"+avg);
		
		// 로또번호 출력 (중복방지)
		Random rn = new Random();
		String roto = "";
		while(true) {
			int n = rn.nextInt(45)+1;
			boolean bn = roto.contains(n+" ");
			if (bn == false) {
				roto += n +" ";
			}
			String[] r1 = roto.split(" ");
			if(r1.length >= 6) {
				break;
			}
		}
		System.out.println(roto);
		
		// (1) 랜덤으로 숫자 받기
		// (2) 받은 숫자의 존제여부 확인
		// (3) 비존재의 경우 값 배치 (연결)
		// (4) 배치된 숫자가 6개입지 확인 후 break 설정

	}

}
