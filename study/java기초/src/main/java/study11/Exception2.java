package study11;

public class Exception2 {

	public static void main(String[] args) {
		/*
		try {
			test1();
		} catch (Exception e) {
			// 메세지 출력 안할때도 있음 형식적으로만 남겨둠 (catch 메세지를 출력하지 않음)
		}		
		*/
		try {
			// System.out.println(10/0);
			throw new Exception("헐~~~~~~~");
		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println(e.getMessage()); // 시스템 제공 메세지
		}
	}
	
	// throws Exception :: 예외처리의 전가(떠넘김) 예방차원
	public static void test1() throws Exception {
		// DB 연결 , file 연결
		System.out.println(10/0);
		
	}
	

}
