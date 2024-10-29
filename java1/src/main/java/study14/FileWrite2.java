package study14;

import java.io.FileWriter;
import java.util.Scanner;

public class FileWrite2 {

	public static void main(String[] args) throws Exception {
		
		Scanner scn = new Scanner(System.in);
		
		while(true) {
		System.out.print("내용입력>>");
		String scr = scn.next();
		
		if(scr.equals(".")) {
			System.out.println("종료합니다.");
			break;
		}
		
		scr += "\n";
		
		// 특정파일에 내용 입력
		String path = "c:\\sample\\a1.txt";
		// true : 이어쓰기 false : 덮어쓰기
		FileWriter fw = new FileWriter(path,true);
		fw.write(scr);
		fw.close();
		System.out.println("저장완");
		}
	}

}
