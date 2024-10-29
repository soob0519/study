package pension;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class Pension3Update2 {

	public static void main(String[] args) throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		
		String userid = "TEST64";
		String pass = "3333";
		String name = "알라딘";
		String mobile = "010-9999-9999";
		String gender = "M";
		
		// 아이디 존재여부
		String sql2 ="select count(*) cnt from pension3 "
				+ "		where userid = '"+userid+"' and pass ='"+pass+"' ";
		ResultSet rs = stmt.executeQuery(sql2);
		rs.next();
		int nn = rs.getInt("cnt");
		if(nn == 0) {
			System.out.println("잘못된 정보 입니다.");
			return;
		}
		
		
		String sql ="UPDATE PENSION3 SET "
				+ "PASS = '"+pass+"',"
				+ "NAME = '"+name+"',"
				+ "MOBILE = '"+mobile+"',"
				+ "GENDER = '"+gender+"' "
				+ "WHERE "
				+ "USERID='"+userid+"'";
		
		int result = stmt.executeUpdate(sql);
		
		if(result == 1) {
			System.out.println("수정완료");
		} else {
			System.out.println("수정실패");
		}

	}

}
