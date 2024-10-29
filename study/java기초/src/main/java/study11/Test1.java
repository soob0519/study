package study11;

public class Test1 {
	
	public static void main(String[] args) {
		
		// 예외처리 :: 자바코딩(문법) 오류가 아닌 예외상황에 대한 대비
		// 예외상황 :: 데이터베이스 연결, file 연결
		int [] a1 = {11,22};
		
		try {
			System.out.println(a1[1]);	// 오류발생시 이하의 내용 실행 중지
			// System.out.println(10/0);	// 실행안됨
		} catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("배열번호가 잘못되었습니다.");
		} catch (ArithmeticException e) {
			System.out.println("0으로 나누기를 시도했습니다.");
		} catch (Exception e) {
			System.out.println(e.toString());	// 시스템에서 주는 오류 정보
		} finally {
			// 예외상황과 관계없이 무조건 실행	// 필수요소는 아님
			System.out.println("예외처리가 실행됨");
		}
		
		System.out.println("-----------------");
		
	}

}
