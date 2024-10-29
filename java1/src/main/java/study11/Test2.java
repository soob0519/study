package study11;

public class Test2 {
	
	/*
	 * 데이터가 공백으로만 되어있는지 체크
	 */
	
	public static boolean spaceAllCheck(String userid) {

		String pattern = "\s*"; // 공백 0개 이상
		boolean result = userid.matches(pattern);
		return result;
		
	}
	/*
	 *  데이터 안에 공백 문자가 포함 되어있는지 체크 -> 있으면 true
	 */
	public static void spaceEachCheck(String data) {
		String pattern = ".*\s.*";	// 임의의 문자열 가운데 공백이 있는지 체크
		boolean result = data.matches(pattern);
		
		if (result == true) {
			System.out.println("데이터 값에 공백문자가 포함되어 있습니다.");
		} else {
			System.out.println("데이터값에는 공백문자가 없습니다.");
		} 
		
	}
	
	
	
	
	public static void main(String[] args) {
		
		String userid = "test 12";
		if (spaceAllCheck(userid) == true) {
			System.out.println("데이터가 공백문자 입니다.");
		} else {
			System.out.println("데이터가 공백문자가 아닙니다.");
		}	
		
		spaceEachCheck(userid);
		
		
	}

}
