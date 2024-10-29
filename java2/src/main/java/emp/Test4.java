package emp;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class Test4 {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		Statement stmt2 = DbConnect.oracleConnect();
		String sql1 ="select "
				+ "		EMPNO"
				+ "		,ENAME"
				+ "		,JOB"
				+ "		,to_char(HIREDATE,'yyyy-mm-dd') hiredate"
				+ "		,DEPTNO"
				+ "		,MGR"
				+ "		,SAL"
				+ "		,COMM "
				+ "	from emp";
		
		ResultSet rs1 = stmt.executeQuery(sql1);
		while(rs1.next()) {
			String empno = rs1.getString("empno");
			String ename = rs1.getString("ename");
			String rank = rs1.getString("hiredate").substring(0,4);
			String hiredate = rs1.getString("hiredate");
			String deptno = rs1.getString("deptno");
			String mgr = rs1.getString("mgr");
			String job = rs1.getString("job");
			int sal = rs1.getInt("sal");
			int bonus = (rs1.getInt("sal"))*2/10;
			int comm = rs1.getInt("comm");
			
			String sql3 = "insert into emp_sal values ('"+empno+"','"+sal+"','"+bonus+"','"+comm+"')";
			
			stmt2.executeUpdate(sql3);
			System.out.println(sql3);
		}
		

	}
}
