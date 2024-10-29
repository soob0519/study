package study11;

public class ExTest1 {

	public static void abc() throws MyException1 {
		System.out.println("11111");
	}
	
	public static void main(String[] args) {
		try {
			abc();	// 정상실행
			throw new MyException1();	// MyException1()가 잡음
			
		} catch(MyException1 e) {
			System.out.println(e.toTest());
			System.out.println(e.toString());
		} catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("잘못된 배열번호 입력");
		}

	}

}
