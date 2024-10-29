package study14;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.Reader;

public class FileReader1 {

	public static void main(String[] args) throws Exception {
		
		// 엑셀 말고, 한글 말고 ~~ 일반 텍스트성 파일만 읽음
		String path = "C:\\workspace1004\\myproject\\src\\main\\java\\study1\\Test1.java";
		
		FileReader file = new FileReader(path);
		BufferedReader buffer = new BufferedReader(file);
		
		String src = "";
		while(true) {
			src = buffer.readLine();
			if(src == null) break;
			System.out.println(src);	// 내용이 없는 경우 null 값 리턴
		}
		
	}

}
