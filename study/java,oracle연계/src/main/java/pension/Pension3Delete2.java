package pension;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class Pension3Delete2 {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		String userid ="TEST6";
		String pass ="1212";
		
		// 아이디 존재여부
		// 암호의 일치
		String sql3 ="select count(*) cnt from pension3 where userid = '"+userid+"' "
				+ "and pass = '"+pass+"'";
		ResultSet rs3 = stmt.executeQuery(sql3);
		rs3.next();
		int nn3 = rs3.getInt("cnt");
		if(nn3 == 0) {
			System.out.println("잘못된 정보입니다.");
			return;
		}
		
		
		String sql ="DELETE FROM PENSION3 WHERE USERID='"+userid+"'";
		
		int result = stmt.executeUpdate(sql);
		
		if( result == 1 ) {
			System.out.println("삭제완료!");
		} else {
			System.out.println("삭제실패~");
		}

	}

}
