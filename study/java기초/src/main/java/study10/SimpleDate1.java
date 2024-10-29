package study10;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SimpleDate1 {

	public static void main(String[] args) throws Exception {
		
		String str = "20241110";
		
		Date today = new Date();	// 날짜클래스; 날짜타입의 용도로 많이 사용
		System.out.println(today);
		
		SimpleDateFormat df1 = new SimpleDateFormat("yyyyMMdd");
		Date date1 = df1.parse(str);
		System.out.println(date1);
		
		// yyyy-mm-dd
		// SimpleDateFormat df2 = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초 E요일");
		SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss E요일");
		System.out.println(df2.format(today));
		System.out.println(df2.format(date1));
		
		
	}

}
