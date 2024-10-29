package study11;

public class PattenTest2 {

	public static void main(String[] args) {
		// 아이디	:: 영문+숫자+(_-) : 첫글자 영문 : 4자리 ~ 12자리
		// 암호	:: 영문+숫자+(_-) :: 6자리 ~ 20자리
		// 이름	:: 한글 or 영문 :: 2자리 이상
		// 성별	:: M or F :: 둘중 하나
		// 생일	:: 숫자(4)-숫자(1,2)-숫자(1,2)
		// 핸드폰	:: ~
		// 이메일	:: 영문+숫자+(_-) (2개이상) @ 영문+숫자.영문
		// 홈페이지 :: http:// 또는 https://
		
		
		/*
		 *  아이디 패턴 체크
		 */
		String pattern1 = "[a-zA-Z]{1}[a-zA-Z0-9_-]{3,11}";
		String userid = "abc123";	// o
		userid = "abc_123";			// o
		// userid = "8abc_123";		// o
		userid = "a23456789112";	// o
		System.out.println("아이디 : "+userid.matches(pattern1));
		
		/*
		 *  암호 체크
		 */
		String pattern2 = "[a-zA-Z0-9_#@-]{6,20}";
		String pass = "abc123#_@#";	// o
		pass = "abc123#_@#^^^&&&";	// x
		System.out.println("암호 : "+pass.matches(pattern2));
		
		/*
		 *  이름 체크
		 */
		String pattern3 = "[a-zA-Z가-힣]{2,30}";
		String name = "홍길동";	// o
		name = "t";		// x
		name = "hong";	// o
		System.out.println("이름 : "+name.matches(pattern3));
		
		/*
		 *  성별 체크
		 */
		String pattern4 = "(M|F)";
		String gender = "M";	// o
		gender = "a";	// x
		gender = " M";	// x
		System.out.println("성별 : "+gender.matches(pattern4));
		
		/*
		 *  이메일 체크
		 *	이스케이프문자 :  의미 없음으로 만드는 표현식 \\
		 */
		String pattern5 = "[a-zA-Z]{1}[a-zA-Z0-9_-]+@[a-zA-Z0-9]+\\.[a-zA-Z\\.]+";
		String email = "email@naver.com";	// o
		email = "email@naver.co.kr";		// o
		email = "email@nav_er.co#kr";		// x
		email = "email@naver.";				// x
		System.out.println("이메일 : "+email.matches(pattern5));
		
		/*
		 *  주민번호 체크
		 *  6자리, 7자리(첫째번호 1,2,3,4) 
		 */
		String pattern6 = "[0-9]{6}-(1|2|3|4)[0-9]{6}";
		String jumin = "123456-1234567";	// o
		System.out.println("주민번호 : "+jumin.matches(pattern6));
		
		/*
		 *  홈페이지 체크
		 *  http:// 또는 https:// (https는 http보다 보안 세팅이 된 도메인임)
		 */
		String pattern7 = "(http|https)://.+";
		String url = "http://naver.com";	// o
		url = "http:/naver.com";	 		// x
		System.out.println("홈페이지 : "+url.matches(pattern7));
		
		
	}

}
