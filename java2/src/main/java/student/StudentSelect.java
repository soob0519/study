package student;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class StudentSelect {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		// 총 개수 체크
		String sql2 = "select count(*) total from student";
		ResultSet rs2 = stmt.executeQuery(sql2);
		int total = 0;
		if(rs2.next()) {
			total = rs2.getInt("total");
		} else {
			System.out.println("문제발생");
			return;
		}
		
		// 출력
		String sql ="select "
				+ "		userid, "
				+ "		username, "
				+ "		age, "
				+ "		decode(gender,'M','남','F','여','없음') gender, "
				+ "		nvl(grade||'학년','미설정') grade "
				+ "	from "
				+ "		student";
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("총 데이터 개수 : "+total);
		System.out.println("---------------------------");
		while(rs.next()) {
			String userid = rs.getString("userid");
			String username = rs.getString("username");
			String age = rs.getString("age");
			String gender = rs.getString("gender");
			String grade = rs.getString("grade");
			System.out.println(userid+" "+username+" "+age+" "+gender+" "+grade);
		}
		

		
		
	}

}
