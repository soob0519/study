package study14;

import java.io.File;
import java.text.SimpleDateFormat;

public class DirList2 {
	
	public static void dirList(String dirname) {
		
		String path = "C:\\"+dirname;
		
		File dir = new File(path);
		
		// 폴더 안 내용물의 정보들을 가져온다.
		File[] list = dir.listFiles();	// listFiles() :: 폴더 전용
		
		for(int i=0; i<list.length; i++) {
			String name = list[i].getName();
			long unix = list[i].lastModified();
			boolean isfile = list[i].isFile();
			String filetype = "[파일]";
			if(isfile == false)	filetype = "[폴더]"; 
			
			if(isfile == false) {
				SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-DD hh:mm:ss");
				String filedate = f.format(unix);
				
				System.out.print(filetype	+"\t");
				System.out.print(filedate	+"\t");
				System.out.print(name	+"\t");
				System.out.println();
				}
			}
		
		for(int i=0; i<list.length; i++) {
			String name = list[i].getName();
			long length = list[i].length();
			long unix = list[i].lastModified();
			boolean isfile = list[i].isFile();
			String filetype = "[파일]";
			if(isfile == false) filetype = "[폴더]";
			
			if(isfile == true) {
				// 123/(double)1024 -> 0.12 -> Math.ceil(0.12) -> (int)1.0 -> 1
				int length2 = (int)Math.ceil(length/(double)1024);
				SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-DD hh:mm:ss");
				String filedate = f.format(unix);
				
				System.out.print(filetype	+"\t");
				System.out.print(filedate	+"\t");
				System.out.print(name	+"\t");
				System.out.print(length2	+"KB \t");
				System.out.println();
			}
		}
		
	}
	
	public static void main(String[] args) {
		
		
		
	}

}
