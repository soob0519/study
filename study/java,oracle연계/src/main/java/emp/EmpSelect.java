package emp;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class EmpSelect {
		
	public static void main(String[] args) throws Exception{
		
		Statement stmt = DbConnect.oracleConnect();
		
		String sql="select empno,"
				+ "ename,"
				+ "sal,"
				+ "to_char(hiredate,'yyyy-mm-dd') hiredate,"
				+ "deptno "
				+ "from emp";
		ResultSet rs = stmt.executeQuery(sql);
		
		// System.out.println(sql);
		
		while(rs.next()) {
			int empno = rs.getInt("empno");
			String ename = rs.getString("ename");
			int sal = rs.getInt("sal");
			String hiredate = rs.getString("hiredate");
			int deptno =rs.getInt("deptno");
			
			System.out.println(empno+","+
								ename+","+
								sal+","+
								hiredate+","+
								deptno );
		}
		
	}

}
