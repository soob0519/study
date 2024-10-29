package study14;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class DirList3 {
	
	public static String path = "C:\\";
	
	public static void dirList(String dirname) {
		
		path = "C:\\"+dirname;
		
		File dir = new File(path);
		File[] list = dir.listFiles();
		
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
		Scanner scn = new Scanner(System.in);
		dirList("");
		String name = scn.next();
		dirList(name);
		
	}

}
