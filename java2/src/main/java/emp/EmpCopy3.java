package emp;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class EmpCopy3 {
	
	public static String mgrCheck(String mgr) throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		
		String str = "";
		
		String sql = "select count(*) cnt from dual "
				+ "		where "
				+ "		'"+mgr+"' in ( select empno from emp where job='MANAGER' )";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		int cnt = rs.getInt("cnt");
		if(cnt == 0) {
			str = "7782";
		} else {
			str = mgr;
		}
		return str;
	}
	
	
	public static void main(String[] args) throws Exception {
		// 선생님과 함께 풀이
		
		Statement stmt = DbConnect.oracleConnect();
		Statement stmt2 = DbConnect.oracleConnect();
		Statement stmt3 = DbConnect.oracleConnect();
		
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
			String job = rs1.getString("job");
			String mgr = rs1.getString("mgr");
			String hiredate = rs1.getString("hiredate");
			String sal = rs1.getString("sal");
			String comm = rs1.getString("comm");
			String deptno = rs1.getString("deptno");
			
			String year = hiredate.substring(0,4);
			int yy = 2024 - Integer.parseInt(year);
			String rank = "";
			
			if(yy<2) {
				rank = "사원";
			} else if(yy<=4) {
				rank = "주임";
			} else if(yy<=10) {
				rank = "대리";
			} else if(yy<=15) {
				rank = "과장";
			} else if(yy<=20) {
				rank = "차장";
			} else if(yy>=21) {
				rank = "부장";
			}
			
			String mgr2 = "";
					
			if(job.equals("PRESIDENT")) {
				rank ="사장";
				mgr2 = "0";
			} else {
				mgr2 = mgrCheck(mgr);
			}
			
			String sql2 = "INSERT INTO emp_info("
					+ "		EMPNO"
					+ "		,ENAME"
					+ "		,RANK"
					+ "		,HIREDATE"
					+ "		,DEPTNO"
					+ "		,MGR) "
					+ "	VALUES('"+empno+"','"+ename+"','"+rank+"','"+hiredate+"','"+deptno+"','"+mgr2+"')";
			stmt2.executeUpdate(sql2);		
			
			}
		
		
	}

}
