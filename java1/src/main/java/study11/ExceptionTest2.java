package study11;

public class ExceptionTest2 {

	public static void main(String[] args) {
		
		int [] ss = {10,20,30};
		
		try {
			System.out.println(ss[3]);
		} catch (ArithmeticException e) {
			System.out.println("나누기 오류");
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("없는 번호 실행함");
		} catch (Exception e) {
			System.out.println(e.toString());
		} 
		System.out.println("-------------");
		System.out.println(11);
		
	}

}
