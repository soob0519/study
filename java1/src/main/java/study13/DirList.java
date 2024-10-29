package study13;

import java.io.File;

/*
 *  특정 디렉토리 안의 목록 출력
 */
public class DirList {

	public static void main(String[] args) {
		// 특정 폴더 또는 파일의 물리적 인식
		File dir = new File("C:\\eclipse2024\\eclipse");
		
		String[] str = {"configuration","dropins"};
		int[] score = {10,50,20};
		double[] dd ={10.1,20.9,90.66};
		
		// 파일 배열로 목록 이름을 추출
		File[] names = dir.listFiles();
		// 이름(종류의 구별없이 이름값만),종류(파일 또는 폴더의 구분),생성일(유닉스시간),길이(byte 단위)
		for(int i=0; i<names.length; i++) {
			System.out.println( names[i].getName()
								+" ("+names[i].length()+")"			// 길이
								+" ("+names[i].lastModified()+")"	// 생성날짜
								+" ("+names[i].isFile()+")"			// 종류
								);
			
		}
		
	}

}
