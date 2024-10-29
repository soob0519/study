package study14;

import java.io.BufferedWriter;
import java.io.FileWriter;

public class BufferedWriter1 {

	public static void main(String[] args) throws Exception {
		
		String path = "c:\\sample\\test101.txt";
		// 경로인식 파일(없는경우)생성 오픈(이어쓰기,덮어쓰기)
		FileWriter fw = new FileWriter(path,true);
		
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write("aaaa");
		bw.newLine();	// 개행 메소드 (행을 여는 메소드)
		bw.close();
		fw.close();
		
		
		
	}

}
