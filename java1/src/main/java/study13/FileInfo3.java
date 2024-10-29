package study13;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class FileInfo3 {

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		/*
		 *  파일정보 출력 후 삭제 여부
		 */
		
		String filePath = "C:\\eclipse2024\\eclipse\\name.txt";
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
		System.out.println();
		System.out.println("1.이름변경");
		System.out.println("2.파일삭제");
		System.out.println("3.새파일생성");
		System.out.println("4.새폴더생성");
		System.out.println("---------------");
		
		System.out.print("번호>>");
		int number = scn.nextInt();
		if(number == 1) {
			System.out.print("새이름입력>>");
			String rename = scn.next();
			
			filePath = "C:\\eclipse2024\\eclipse\\"+rename;
			File file2 = new File(filePath);
			boolean result = file.renameTo(file2);	// true false
			
			if(result == true) System.out.println("**새이름 변경 성공");
			else System.out.println("**새이름 변경 실패");
			
		} else  if(number == 2) {
			// 삭제
			System.out.print("삭제하시겠습니까? (y 또는 n)>>");
			String yn = scn.next();
			
			if(yn.equals("y")) {
				boolean result = file.delete();
				if(result == true) {
					System.out.println("삭제 성공");
				} else {
					System.out.println("삭제 실패");
				}
			} else {
				System.out.println("유지");
			}
			
		} else  if(number == 3) {
			// 새 파일 생성
			System.out.print("새로운 파일 이름입력>>");
			String name = scn.next(); // 새파일명 입력
			
			filePath = "C:\\eclipse2024\\eclipse\\"+name;
			File file3 = new File(filePath);
			try {
				file3.createNewFile(); //주요 메소드
				System.out.println("**새파일 생성 완료");
			} catch(IOException e) {
				System.out.println("**새파일 생성 실패");
			}
			
		} else  if(number == 4) {
			// 새 폴더 생성
			System.out.print("새로운 폴더 이름입력>>");
			String name = scn.next(); // 새폴더명 입력
			
			filePath = "C:\\eclipse2024\\eclipse\\"+name;
			File file4 = new File(filePath);
			
			boolean result = file4.mkdir(); // 폴더 생성 메소드
			if(result == true) System.out.println("**새폴더 생성 완료");
			else System.out.println("**새폴더 생성 실패");
		}

	}

}
