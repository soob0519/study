package study11;

public class Exception1 {

	public static void main(String[] args) {
		
		String[] pgName = {"java","php","asp"};
		int i = 0;
		while(i<5) {
			try {
				if(i == 4) System.out.println(i/0);
				else System.out.println(pgName[i]);
			} catch(ArrayIndexOutOfBoundsException a) {
				System.out.println("잘못된 배열번호");
			} catch(Exception e) {
				System.out.println(e.toString());
			} finally {
				System.out.println(i+"번 실행");
			}
			i++;
		}
		
		String str = "abc";
		
		try {
			System.out.println(str.charAt(3));
		} catch (StringIndexOutOfBoundsException e) {
			System.out.println("잘못된 인덱스 번호입니다.");
		}

		

	}

}
