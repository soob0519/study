package study14;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Scanner;

public class FileReader3 {
	
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
	
	public static void main(String[] args) {
		
		Scanner scn = new Scanner(System.in);
		
		System.out.println("{{ 수업과목 목록처리 }}");
		System.out.println("1.입력 2.출력");
		System.out.print("번호>>");
		int number = scn.nextInt();
		
		if(number == 1)	{
			input();
		} else if(number == 2) {
			output();			
		}
		
	}

}
