package study14;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class FileReader2 {
	
	public static String PATH="C:\\sample\\subject.txt";
	
	public static void input() {
		Scanner scn = new Scanner(System.in);
		System.out.print("과목명>>");
		String title = scn.next();
		title += "\n";
		try {
			FileWriter fw = new FileWriter(PATH,true);
			fw.write(title);	// 쓰기 실행
			fw.close();
			System.out.println("저장 완료!");
		} catch (Exception e) {
			System.out.println("작성 실패");
		}
	}
	
	public static void output() {
		try {
			FileReader file = new FileReader(PATH);
			BufferedReader bf = new BufferedReader(file);
			int cnt = 0;
			while(true) {
				String src = bf.readLine();
				if(src == null) break;
				System.out.println(src);
				cnt++;
			}
			if(cnt == 0) {
				System.out.println("내용이 없습니다.");
			} else {
				System.out.println("--------------");
			}
			bf.close();
		} catch (Exception e) {
			System.out.println("읽기 실패");
		}
	}	
	
	public static void deleteAll() {
			try {
				FileWriter fw = new FileWriter(PATH,false);
				fw.write("");
				fw.close();
				System.out.println("전체 삭제 완료");
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("삭제 실패");
			}
		
	}
	
	public static void deleteSubject() {
		Scanner scn = new Scanner(System.in);
		System.out.print("(삭제)과목명>>");
		String title = scn.next();
		try {
			FileReader file = new FileReader(PATH);
			BufferedReader bf = new BufferedReader(file);
			String content = "";
			int cnt = 0;
			while(true) {
				String src = bf.readLine(); // 한줄씩 읽힘
				if(src == null) break;
				if(!src.equals(title)) {	// 추출과목과 삭제과목이 일치하지 않은 경우
					content += src+"\n";
				} else {
					cnt++;	// 삭제대상인 경우
				}
			}
			bf.close();
			
			FileWriter fw = new FileWriter(PATH,false);
			fw.write(content);
			fw.close();
			
			if(cnt == 0) {
				System.out.println("선택 과목 삭제 실패");
			}else {
				System.out.println("선택 과목 삭제 완료");
			}
			
		} catch (Exception e) {

		}
		
		
		
	}
	public static void main(String[] args) {
		
		Scanner scn = new Scanner(System.in);
		
		System.out.println("{{ 수업과목 목록처리 }}");
		System.out.println("1.입력 2.출력 3.전체삭제 4.과목삭제");
		System.out.print("번호>>");
		try {
			int number = scn.nextInt();
			
			if(number == 1)	{
				input();
			} else if(number == 2) {
				output();			
			} else if(number == 3) {
				deleteAll();			
			} else if(number == 4) {
				deleteSubject();			
			} else {
				System.out.println("올바른 번호를 선택해주세요.");
			}
		} catch(InputMismatchException e){
			System.out.println(e.toString());
			System.out.println("올바른 번호를 선택해주세요.");
		}
		
	}

}
