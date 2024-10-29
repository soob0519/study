package study13;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

public class FileInfo1 {

	public static void main(String[] args) {
		
		Calendar cal = Calendar.getInstance();
		
		String filePath = "C:\\eclipse2024\\eclipse\\soobin.txt";
		// File 클래스는 파일 또는 폴더의 경로를 물리적으로 인식
		File file = new File(filePath);
		
		Long unix = file.lastModified();	// 생성일(유닉스시간:1970.1.1 0:0:0)
		cal.setTimeInMillis(unix);
		
		int yy = cal.get(Calendar.YEAR);
		int mm = cal.get(Calendar.MONTH)+1;
		int dd = cal.get(Calendar.DATE);
		int hh = cal.get(Calendar.HOUR);
		int mi = cal.get(Calendar.MINUTE);
		int ss = cal.get(Calendar.SECOND);
		
		String time = yy+"-"+mm+"-"+dd+" "+hh+":"+mi+":"+ss;
		String fileType = "";
		
		if(file.isFile() == true) {
			fileType = "[파일]";
		}else {
			fileType = "[폴더]";
		}
		
		// 1GB - 1024MB, 1MB - 1024KB, 1KB - 1024Byte,
		// 2000byte	-> 2000/1024 = 1.95	-> 2KB :: Math.ceil(0.29) -> (int) 2.0 -> 2
		// 300byte	-> 300/1024 = 0.29	-> 1KB :: Math.ceil(0.29) -> (int) 1.0 -> 1
		int length = (int)Math.ceil(file.length()/(double)1024);
		
		System.out.println(file.getName());			// 이름
		System.out.println(file.length());			// 길이(바이트)
		System.out.println(length + "KB");
		System.out.println(file.lastModified());	// 생성일(유닉스시간:1970.1.1 0:0:0)
		System.out.println(time);
		System.out.println(file.isFile());			// 파일여부 - true
		System.out.println(fileType);
		System.out.println(file.isDirectory());		// 폴더여부 - false
		System.out.println(file.exists());			// 존재유무 - true
		// System.out.println(file.delete());		// 파일삭제 - 결과 (true,false)
		
		/*
		try {
		System.out.println( file.createNewFile() );
		} catch(IOException e) {
			e.printStackTrace();
		}
		*/
	}

}
