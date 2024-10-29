package study13;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class FileInfo5 {
	
	public static String path = "C:\\sample";
	
	public static void fileInfo() {
		Scanner scn = new Scanner(System.in);
		System.out.print("폴더 또는 파일 이름입력>>");
		String name = scn.next();
		
		File file = new File(path+"\\"+name);
		
		if(file.exists() == false) {	// 입력한 파일이 없는 경우
			System.out.println("찾는 파일이나 폴더가 없습니다.");
			return;	//메소드 중지
		}
		
		// 존재하는 경우 실행
		String filename	= file.getName();
		long lastdate	= file.lastModified();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = f.format(lastdate);
		long length		= file.length();
		boolean filetype= file.isFile();
		
		String type = "";
		if(filetype == true) type ="[파일]";
		else type ="[폴더]";
		
		System.out.println();
		System.out.println("파일명:"+filename);
		System.out.println("용량:"+length+"byte");
		System.out.println("수정날짜:"+date);
		System.out.println("파일종류:"+type);
		
	}
	
	public static void fileCreate() {
		Scanner scn = new Scanner(System.in);
		System.out.print("파일명>>");
		String name = scn.next();	// 생성을 원하는 폴더명 ex.html
		
		// filepath = "C:\\sample\\abc.txt";
		
		String filepath = path+"\\"+name;
		
		// 물리적인 인식
		File file = new File(filepath);
		
		// 존재유무
		if(file.exists() == true) {
			System.out.println("이미 존재합니다.");
			return; // 프로그램 중단
		}
		
		try{
			file.createNewFile();
			System.out.println(name+" 파일 생성 완료");
		} catch(Exception e) {
			System.out.println(name+" 파일 생성 실패");
		}
		
		
		
	}
	
	public static void dirCreate() {
		Scanner scn = new Scanner(System.in);
		System.out.print("폴더명>>");
		String name = scn.next();	// 생성을 원하는 폴더명 ex.html
		
		// dirpath =  "C:\\sample\\html";
		String dirpath = path+"\\"+name;
		
		// 물리적인 위치로 인정
		File dir = new File(dirpath);
		// 존재유무
		
		if(dir.exists() == true) {
			System.out.println("이미 존재합니다.");
			return;
		}
		boolean result = dir.mkdir();
		if(result == true) {
			System.out.println(name+" 폴더 생성 완료");
		}
		else {
			System.out.println(name+" 폴더 생성 실패");
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
