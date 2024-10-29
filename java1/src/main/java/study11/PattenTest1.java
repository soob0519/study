package study11;

public class PattenTest1 {

	public static void main(String[] args) {
		// 1개의 문자만 허용하는 세팅
		String title = "1212";
		String pattern1 = ".";	// (임의의 문자) 반드시 한개
		// matches() :: 정규표현식을 확인해주는 메소드
		System.out.println("1번패턴 "+title.matches(pattern1)); // true,false
		
		// (2) 문자 한개 이상을 허용
		String pattern2 = ".+";	// (임의의 문자) 반드시 한개 이상
		System.out.println("2번패턴 "+title.matches(pattern2));	// true
		
		// (2) -1
		title = "aaaaaa";
		String pattern3 = "a+";	// a 글자가 한개이상 이고 a 글자만 허용 a12aaxa << 비허용
		System.out.println("3번패턴 "+title.matches(pattern3));
		
		// (3) 특정 문자(열)로 시작했는지 체크
		// ^ : 기호를 기준으로 뒤의 단어로 시작함을 의미
		// . : 문자한개
		// * : 앞의 문자가 0개 이상 >> 이후에 문자가 올수도 있고 안올수도 있음
		String pattern4 = "^정보처리.*";
		title = "정보처리 산업기사";	// (o)
		title = "산업기사 정보처리";	// (x)
		title = "정보처리"; 			// (o)
		title = "정보"; 				// (x)
		System.out.println("4번패턴 "+title.matches(pattern4));
		
		// (4) 또는 >> 올 수 있는 단어의 나열
		String pattern5 = "^(r|y|b).*";
		title = "yellow";	// (o)
		title = "red";		// (o)
		title = "abc";		// (x)
		title = "y";		// (o)
		System.out.println("5번패턴 "+title.matches(pattern5));
		
		// + :: 임의의 문자가 한개 이상
		String pattern6 = "^(r|y|b).+";
		title = "yellow";	// (o)
		title = "red";		// (o)
		title = "abc";		// (x)
		title = "y";		// (x)
		System.out.println("6번패턴 "+title.matches(pattern6));
		
		// (5)
		String pattern7 = "^(html|css).*";
		title = "html java";	// (o)
		title = "java html";	// (x)
		title = "html";	// (o)
		System.out.println("7번패턴 "+title.matches(pattern7));
		
		/*
		 *  다양한 패턴
		 */
		
		// (1) 날짜를 체크하는 패턴
		// 2023-12.25 >> 불가 : 패턴은 정해져있다. 2023.12.25 , 2023-12-25 , 2023/12/25
		// [ ] :: 범위 집합 설정, {} :: 개수(범위) 설정
		// 2023-12-44 실제로 있는 날짜인지 없는 날짜 인지는 패턴으로는 확인할수 없음
		String pattern8 = "[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}";
		String date1 = "2024-09-24";	// (o)
		date1 = "2024-2-2";		// (o)
		date1 = "2024년8월7일";	// (x)
		date1 = "2024_8-7";		// (x)
		System.out.println("8번패턴 "+date1.matches(pattern8));
		
		String pattern9 = "[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}";
		date1 = "2024-09-24";	// (x)
		date1 = "2024_8-7";		// (x)
		date1 = "2024/8/7";		// (o)
		date1 = "2024/8/ 7";	// (x) 공백 허용 안됨
		System.out.println("9번패턴 "+date1.matches(pattern9));
		
		
		// 특정 문자 체크
		String pattern10 = ".*게시판.*";
		title = "공지 게시판 목록";	// (o)
		title = "게시판";			// (o)
		title = "공지 게시 목록";	// (x)
		System.out.println("10번패턴 "+title.matches(pattern10));
		
		// 숫자 포함 체크
		String pattern11 = ".*[0-9].*";
		title = "나이 29세";	// (o)
		title = "29";		// (o)
		title = "나이 마흔";	// (x)
		System.out.println("11번패턴 "+title.matches(pattern11));
		
		// 숫자만 (개수 제한 없음)
		String pattern12 = "^[0-9]+";
		title = "2024";		// (o)
		title = "7";		// (o)
		title = "2 12";		// (x)
		System.out.println("12번패턴 "+title.matches(pattern12));
		
		// 반드시 한글만 허용
		String pattern13 = "^[가-힣]+";
		title = "홍길동";		// (o)
		title = "홍길동 ";	// (x)
		title = "a홍길동";	// (x)
		System.out.println("13번패턴 "+title.matches(pattern13));	
		
		// 핸드폰 번호 체크
		// 010, 011, 016, 017, 018, 019
		String pattern14 = "01(0|1|6|7|8|9)-[0-9]{3,4}-[0-9]{4}";
		String phone = "010-1234-1234";	// (o)
		phone = "017-1234-1234";		// (o)
		phone = "013-1234-1234";		// (x)
		phone = "011111-1234-1234";		// (x)
		System.out.println("14번패턴 "+phone.matches(pattern14));	
		
		
		
	}
	

}
