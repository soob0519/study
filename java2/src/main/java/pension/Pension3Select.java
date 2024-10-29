package pension;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class Pension3Select {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		String sql = "SELECT "
				+ "		USERID,"
				+ "		substr(PASS,1,2)||'**' pass,"
				+ "		NAME,"
				+ "		MOBILE,"
				+ "		decode(GENDER,'M','남','F','여') gender "
				+ "	FROM "
				+ "		PENSION3";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			String userid = rs.getString("userid");
			String pass = rs.getString("pass");
			String name = rs.getString("name");
			String mobile = rs.getString("mobile");
			String gender =rs.getString("gender");
			
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
