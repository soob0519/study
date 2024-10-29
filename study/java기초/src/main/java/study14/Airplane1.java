package study14;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class Airplane1 {

	public static void main(String[] args) throws Exception {
		
		String path = "C:\\sample\\airplane";
		String path2 = "C:\\sample\\airplane.txt";
		
		File dir = new File(path);
		File[] list = dir.listFiles();
		String content = "";
		
		for(int i=0; i<list.length; i++) {
			String name = list[i].getName();
			String filepath = path+"\\"+name;
			
			FileReader fr = new FileReader(filepath);
			BufferedReader bf = new BufferedReader(fr);
			
			String str = "";
			int cnt = 0;
			
			while(true) {
				str = bf.readLine();
				cnt++;
				if(cnt == 5) {
					String[] array = str.split("\\/");
					content+= array[1]+"\n";
				}
				if(str == null) break;
			}
			bf.close();
			fr.close();
		}
		// 경로에 있는 파일을 생성해주고 파일을 오픈함
		FileWriter fw = new FileWriter(path2);
		// 오픈된 파일에 내용 입력
		fw.write(content);
		fw.close();
		
	}

}
