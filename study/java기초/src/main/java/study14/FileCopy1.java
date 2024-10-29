package study14;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;

public class FileCopy1 {
	
	public static boolean fileExists(String filename) {
		
		String path = "c:\\sample\\"+filename;
		File file = new File(path);
		boolean result = file.exists(); // true , false
		return result;
	}
	
	
	public static void fileCopy1(String file1,String file2) throws Exception {

		String path1 = "c:\\sample\\"+file1;	// 원본
		String path2 = "c:\\sample\\"+file2;	// 복사본
		
		if(fileExists(file1)==false) {
			throw new Exception("aa");
		};
		
		// 원본파일을 읽어 들임
		FileReader fr = new FileReader(path1);
		BufferedReader bf = new BufferedReader(fr);
		String str = "";
		String content = "";
		
		while(true) {
			str = bf.readLine();
			if(str == null) break;
			// 한줄 한줄을 변수에 누적시킴
			content += str+"\n";
		}
		bf.close();
		fr.close();	
		// 최종적으로 백업파일을 FileWriter에 적용한다.
		FileWriter fw = new FileWriter(path2);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(content);
		bw.close();
		fw.close();
		System.out.println("카피완료");
	}
	
	public static void main(String[] args) {
		
		
	}

}
