package student;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class StudentDelete {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();

		String userid = "st111";
		
		// 아이디 존재유무
		String sql2 = "select count(*) cnt from student "
				+ "	where"
				+ "		 userid = '"+userid+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if(cnt == 0) {
			System.out.println("잘못된 정보 입니다.");
			return;
		}		
		
		String sql ="delete from student where userid= '"+userid+"' ";
		
		int result = stmt.executeUpdate(sql);
		if(result == 1) {
			System.out.println("삭제성공");
		} else {
			System.out.println("삭제실패");
		}
				
	}

}
