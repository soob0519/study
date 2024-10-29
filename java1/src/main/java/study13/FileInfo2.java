package study13;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class FileInfo2 {

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		/*
		 *  파일정보 출력 후 삭제 여부
		 */
		
		String filePath = "C:\\eclipse2024\\eclipse\\soobin.txt";
		File file = new File(filePath);
		
		if(file.exists() == false) {
			System.out.println("없는 파일입니다.");
			return;	//메소드 중지
			
		}
		
		String filename = file.getName();
		long length = file.length();
		boolean isfile = file.isFile();
		
		String filetype = "";
		if(isfile == true)  filetype = "[파일]";
		else  filetype = "[폴더]";
		
		long time = file.lastModified();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = f.format(time);
		
		
		String info = filetype+" "+filename+" "+length+"byte "+date;
		System.out.println(info);
		System.out.println("-------------------------");
		
		System.out.print("삭제하시겠습니까? (y 또는 n)>>");
		
		String yn = scn.next();
		
		if(yn.equals("y")) {
			boolean result = file.delete();	// 성공 : true 실패: false
			if(result == true) {
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패");
			}
		} else {
			System.out.println("유지시켰습니다.");
		}
		
	}

}
