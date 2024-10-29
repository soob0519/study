package dept;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Statement;

import comm.DbConnect;

public class DeptImport1 {

	public static void main(String[] args) throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		
		String filepath="c:\\sample\\dept3.txt";
		FileReader fr = new FileReader(filepath);
		BufferedReader br = new BufferedReader(fr);
		while(true) {
			String data = br.readLine(); // 한줄 read
			if(data == null) {
				// 반복문 종료
				break;
			}
			// 10,ACCOUNTING,NEW YORK
			String[] datas = data.split(",");
			String d1 = datas[0];
			String d2 = datas[1];
			String d3 = "";
			// 예외처리
			try {
				d3 = datas[2];
			} catch (Exception e) {	}
			
			String sql = "INSERT INTO dept20(DEPTNO,DNAME,LOC) "
					+ "		VALUES('"+d1+"','"+d2+"','"+d3+"')";
			stmt.executeUpdate(sql);
			System.out.println(data);
		}
		
	}

}
