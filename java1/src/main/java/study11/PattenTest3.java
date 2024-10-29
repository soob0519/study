package study11;

public class PattenTest3 {

	public static void main(String[] args) {
		
		// ^ :: 의미가 두가지 1. 문자열의 시작 2. 부정(반대)의 의미
		String pattern1 = "^abc.*";
		String str = "abc";
		 str = "1abc";
		System.out.println(str.matches(pattern1));
		
		// 숫자로 시작해야하고 한개이상 세팅이 되어야함
		String pattern2 = "^[0-9]+";
		str = "123";
		// str = "1abc";
		System.out.println(str.matches(pattern2));
		
		// ^ :: 부정의 의미 숫자로 시작할수 없음 데이터가 한개이상 되어야함 (숫자가 없어야함)
		String pattern3 = "[^0-9]+";
		str = "123";
		// str = "abc";
		str = "ab7c";	// x
		System.out.println(str.matches(pattern3));
		
		// 공백이 아닌 문자열 (즉 공백이 포함되지 않은 문자열)
		String pattern4 = "\\S+";
		str = "abc";
		str = "abc ";	//x
		str = "    ";	//x
		System.out.println(str.matches(pattern4));
		
		
	}

}
