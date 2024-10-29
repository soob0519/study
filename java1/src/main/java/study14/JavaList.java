package study14;

import java.io.File;
import java.text.SimpleDateFormat;

public class JavaList {

	public static void main(String[] args) {
		
		String path = "c:\\sample";
		File dir = new File(path);
		File[] list = dir.listFiles();
		
		for(int i=0; i<list.length; i++) {
			String name = list[i].getName();
			long unix = list[i].lastModified();
			boolean isfile = list[i].isFile();
			String filetype = "[파일]";
			if(isfile == false)	filetype = "[폴더]"; 
			
			// {"abc","java","txt"}
			String[] array = name.split("\\.");			
			String lastWord = array[array.length-1];
			
			// int index = name.indexOf(".java");
			//if(index > -1) {
			if(lastWord.equals("java")) {
				SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-DD hh:mm:ss");
				String filedate = f.format(unix);
				
				System.out.print(filetype	+"\t");
				System.out.print(name	+"\t");
				System.out.print(filedate	+"\t");
				System.out.println();
			}
		}

	}

}
