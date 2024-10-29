package emp;

import java.sql.Statement;
import comm.DbConnect;

public class EmpDelete {	
		
	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
				
		String empno = "8000";
		
		String sql = "DELETE FROM EMP WHERE EMPNO ='"+empno+"'";
		int result = stmt.executeUpdate(sql);
		
		if( result == 1 ) {
			System.out.println("삭제완료!");
		} else {
			System.out.println("삭제실패~");
		}

	}

}
