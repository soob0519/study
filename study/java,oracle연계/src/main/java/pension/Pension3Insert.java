package pension;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class Pension3Insert {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		String userid = "TEST6";
		String pass = "1111";
		String name = "조수빈";
		String mobile = "010-1111-1111";
		String gender = "F";
		
		//아이디 중복체크
		String sql = "select count(*) cnt from pension3 where userid = '"+userid+"'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		int cnt = rs.getInt("cnt");
		if(cnt>0) {
			System.out.println("이미 사용중인 아이디 입니다.");
			return;
		}
		
		String sql1 = "INSERT INTO PENSION3("
				+ "	USERID,"
				+ "	PASS,"
				+ "	NAME,"
				+ "	MOBILE,"
				+ "	GENDER)"
				+ " 	VALUES("
				+ "'"+userid+"',"
				+ "'"+pass+"',"
				+ "'"+name+"',"
				+ "'"+mobile+"',"
				+ "'"+gender+"')";
		
		int result = stmt.executeUpdate(sql1);
		
		if(result == 1) {
			System.out.println("입력완료");
		} else {
			System.out.println("입력실패");
		}
		
		
		

	}

}
