package pension;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class Pension3Delete {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		String userid ="TEST6";
		// 아이디 존재여부
		String sql2 ="select count(*) cnt from pension3 where userid = '"+userid+"'";
		ResultSet rs = stmt.executeQuery(sql2);
		rs.next();
		int nn = rs.getInt("cnt");
		if(nn == 0) {
			System.out.println("존재하지 않는 아이디 입니다.");
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
