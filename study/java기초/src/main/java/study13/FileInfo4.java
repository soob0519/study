package study13;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class FileInfo4 {
	
	public static String path = "C:\\sample";
	
	public static void fileInfo() {
		Scanner scn = new Scanner(System.in);
		System.out.print("폴더 또는 파일 이름입력>>");
		String name = scn.next();
		File file1 = new File(path+"\\"+name);
		String type = "";
		String len = file1.length()+"Byte";
		long time = file1.lastModified();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = fm.format(time);
		
		if(file1.exists() == false) {
			System.out.println("없는 파일입니다.");
			return;	//메소드 중지
		} else {
			if(file1.isFile() == true ) {
				type = "[파일]";
			} else {
				type = "[폴더]";
			}
			System.out.println(type+" "+name+" "+len+" "+date);
		}
	}
	
	public static void fileCreate() {
		Scanner scn = new Scanner(System.in);
		System.out.print("생성할 파일 이름입력>>");
		String name = scn.next();
		File file2 = new File(path+"\\"+name);
		if(file2.exists() == true) {
			System.out.println("이미 존재하는 파일이름입니다.");
		} else {
			try {
				file2.createNewFile();
				System.out.println("생성 완료");
			}catch(IOException e) {
				System.out.println("생성실패");
			}
		}
	}
	
	public static void dirCreate() {
		Scanner scn = new Scanner(System.in);
		System.out.print("생성할 폴더 이름입력>>");
		String name = scn.next();
		File file3 = new File(path+"\\"+name);
		if(file3.exists() == true) {
			System.out.println("이미 존재하는 폴더이름입니다.");
		} else {
				boolean result = file3.mkdir();
				if(result == true) System.out.println("생성 완료");
				else System.out.println("생성실패");
		}
	}
	
	
	
	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		
		System.out.println("[[ 폴더관리 ]]\n");
		System.out.println("1.정보보기");
		System.out.println("2.파일생성");
		System.out.println("3.폴더생성");
		System.out.println();
		System.out.print("번호선택>>");
		int number = scn.nextInt();
		
		if(number == 1) {
			fileInfo();
		} else if(number == 2) {
			fileCreate();
		} else if(number == 3) {
			dirCreate();
		}
	}

	
	
}
