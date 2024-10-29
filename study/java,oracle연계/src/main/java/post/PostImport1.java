package post;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Statement;
import java.util.Calendar;

import comm.DbConnect;

public class PostImport1 {

	public static void main(String[] args) throws Exception {
		
		Calendar cal1 = Calendar.getInstance();
		long t1 = cal1.getTimeInMillis();
		
		Statement stmt = DbConnect.oracleConnect();
		String filepath = "C:\\sample\\post11.txt";
		FileReader fr = new FileReader(filepath);
		BufferedReader br = new BufferedReader(fr);
		
		while(true) {
			String data = br.readLine();
			if(data == null) {
				break;
			}
			
			String[] datas = data.split(",");
			
			String d1 = datas[0];
			String d2 = datas[1];
			String d3 = datas[2];
			String d4 = "";
			String d5 = "";
			String d6 = "";
			String d7 = "";
			String d8 = "";
			try { d4 = datas[3]; } catch(Exception e) { }
			try { d5 = datas[4]; } catch(Exception e) { }
			try { d6 = datas[5]; } catch(Exception e) { }
			try { d7 = datas[6]; } catch(Exception e) { }
			
			// 이스케이프 문자 : '(홑따옴표) :: 의미없는 기호를 만듬
			try { 
				d8 = datas[7];
				d8 = d8.replace("'","''");
			} catch(Exception e) { }			
			
			String sql="INSERT INTO post20(P1,P2,P3,P4,P5,P6,P7,P8) "
					+ "	VALUES('"+d1+"','"+d2+"','"+d3+"','"+d4
					+"','"+d5+"','"+d6+"','"+d7+"','"+d8+"')";
			stmt.executeUpdate(sql);
			
			System.out.println(data);			
		}
		Calendar cal2 = Calendar.getInstance();
		long t2 = cal2.getTimeInMillis();
		
		double r1 = (t2-t1)/(double)1000;
		
		System.out.println("진행시간:"+r1+"초");
	}
	
}
