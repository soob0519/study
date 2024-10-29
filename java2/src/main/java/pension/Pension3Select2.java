package pension;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class Pension3Select2 {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		String sql1 = "SELECT COUNT(*) total FROM pension3";
		ResultSet rs1 = stmt.executeQuery(sql1);
		rs1.next();
		int total = rs1.getInt("total");
		
		String sql2 = "SELECT "
				+ "		USERID,"
				+ "		substr(PASS,1,2)||'**' pass,"
				+ "		NAME,"
				+ "		MOBILE,"
				+ "		decode(GENDER,'M','남','F','여') gender "
				+ "	FROM "
				+ "		PENSION3";
		
		ResultSet rs2 = stmt.executeQuery(sql2);
		
		System.out.println("TOTAL : "+total);
		System.out.println("------------------------------------------");
		System.out.println("아이디  암호  이름      연락처     성별");
		while(rs2.next()) {
			String userid = rs2.getString("userid");
			String pass = rs2.getString("pass");
			String name = rs2.getString("name");
			String mobile = rs2.getString("mobile");
			String gender =rs2.getString("gender");
			
			/*
			String ps1 = pass.substring(0,2); // 0 ~ 1번까지만
			pass = ps1+"**";
			
			if(gender.equals("M")) gender = "남";
			else if(gender.equals("F")) gender = "여";
			*/
			
			System.out.println(userid+","+
								pass+","+
								name+","+
								mobile+","+
								gender );
		}
		

	}

}
