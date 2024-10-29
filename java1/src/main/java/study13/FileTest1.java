package study13;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class FileTest1 {
	
	public static String PATH = "c:\\sample";
	
	public static void fileInfo(String filename) {
	
		String path = PATH+"\\"+filename;
		File file = new File(path);	
		if(!file.exists()) {	// 존재하지 않음
			System.out.println("없는 파일입니다.");
			return;	// stop
		}
		
		long unix = file.lastModified();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = f.format(unix);
		
		System.out.println(file.getName());
		System.out.println(file.length());
		System.out.println(date);
		
		System.out.println(file.isFile());
		System.out.println(file.isDirectory());
	}
	
	public static void createFile() {
		Scanner scn = new Scanner(System.in);
		System.out.print("파일명입력>>");
		String name = scn.next();
		
		String path = PATH+"\\"+name;
		File file = new File(path);
		try {
			file.createNewFile();
			System.out.println("파일생성완료~");
		} catch (IOException e) {
			System.out.println("파일생성실패~");
		}
	}

	public static void main(String[] args) {
		
	}

}
