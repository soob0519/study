package study1;

import study6.JuminTest2;

public class Test7 {

	public static void main(String[] args) {
		
		String jm = "980105-2123456";
		int age = JuminTest2.info2(jm);
		String gender = JuminTest2.info3(jm);
		System.out.println("나이 : "+age);
		System.out.println("성별 : "+gender);
		System.out.println("-------------------");
		
		char c1 = '1';	// 유니코드 값 (시스템이 인식하는 값)
		int c2 = '1';	// 유니코드 값
		
		System.out.println(c1); // 1 (49)
		System.out.println(c2); // 49
		
		System.out.println("-------------------");
		if(c1 == 49) System.out.println("같음");
		else System.out.println("다름");
		
		
		
	}

}
