package study14;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;

public class FileCopy2 {
	
	public static boolean fileExists(String filename) {
		
		String path = "c:\\sample\\"+filename;
		File file = new File(path);
		boolean result = file.exists(); // true , false
		return result;
	}
	
	// DB연결 클래스 :: 예외처리를 유도
	
	// throws Exception :: 메소드를 사용하는 곳에서 처리를 하도록 전가시킴
	public static void fileCopy1(String file1,String file2) 
															throws Exception {

		String path1 = "c:\\sample\\"+file1;	// 원본
		String path2 = "c:\\sample\\"+file2;	// 복사본
		if(fileExists(file1)==false) {
			throw new Exception();	// Exception 오류를 일부러 발생 >> 메소드를 사용할때 catch가 잡을 수 있게
		}
		
		// 원본파일을 읽어 들임
		//try {
			FileReader fr = new FileReader(path1);
			BufferedReader bf = new BufferedReader(fr);
		//} catch(Exception e) {
		//	System.out.println("Reader 클래스 오류");
		//}
		// 최종적으로 백업파일을 FileWriter에 적용한다.
		//try {
			FileWriter fw = new FileWriter(path2);
		//} catch (Exception e) {
		//	System.out.println("Writer 클래스 오류");
		//}
	}
	
	public static void main(String[] args) {
		
		
	}

}
