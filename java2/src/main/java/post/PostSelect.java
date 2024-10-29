package post;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class PostSelect {

	public static void main(String[] args)  throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		
		int page = 2;
		int unit = 10;
		int sno = (page-1)*unit + 1;
		int eno = sno + (unit-1);
		
		
		
		String sql1 = "select count(*) total  from post1";
		ResultSet rs1 = stmt.executeQuery(sql1);
		rs1.next();
		int total = rs1.getInt("total");
		
		String sql2 ="select b.* from \r\n"
				+ "		(select rownum rn, a.* from \r\n"
				+ "			(select p1||' '||p2||' '||p3||' '||p4||' '||p5||' '||p6||' '||p7||' '||p8 addr from post1) a ) b \r\n"
				+ "	where\r\n"
				+ "		rn >="+sno+" and rn <="+eno;
		
		ResultSet rs2 = stmt.executeQuery(sql2);
				
		System.out.println("TOTAL : "+total);
		System.out.println("--------------------------------------------");
		while(rs2.next()) {
			int rn = rs2.getInt("rn");
			String addr = rs2.getString("addr");
			System.out.println(rn+". "+addr);
			
		}
		
	}

}
