package emp;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class EmpCopy2 {
	
	public static String mgrSet(String mgr) throws Exception {
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
	
	public static String rankSet(String rank,String empno) {
		
		int rank2 = 2024-Integer.parseInt(rank);
		if(empno.equals("7839") == true) {
			rank = "사장";
		} else {
			if(rank2<2){
				rank = "신입";
			} else if(rank2>=2 && rank2<=4 ) {
				rank = "주임";
			} else if(rank2>=5 && rank2<=10 ) {
				rank = "대리";
			} else if(rank2>=11 && rank2<=15 ) {
				rank = "과장";
			} else if(rank2>=16 && rank2<=20 ) {
				rank = "차장";
			} else if(rank2>=21) {
				rank = "부장";
			}
		}
		return rank;
	}
	
	public static void main(String[] args) throws Exception  {
		
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
			String rank = rs1.getString("hiredate").substring(0,4);
			String hiredate = rs1.getString("hiredate");
			String deptno = rs1.getString("deptno");
			String mgr = rs1.getString("mgr");
			String job = rs1.getString("job");
			int sal = rs1.getInt("sal");
			int bonus = (rs1.getInt("sal"))*2/10;
			int comm = rs1.getInt("comm");
			
			String mgr2 = "";
			
			if(job.equals("PRESIDENT")) {
				mgr2 = "0";
			} else {
				mgr2 = mgrSet(mgr);
			}
			
			String sql2 = "insert into emp_info values("
					+ "	'"+empno+"','"+ename+"','"+rankSet(rank,empno)
					+"','"+hiredate+"','"+deptno+"','"+mgr2+"')";
			
			String sql3 = "insert into emp_sal values ('"+empno+"','"+sal+"','"+bonus+"','"+comm+"')";
			
			stmt2.executeUpdate(sql2);
			stmt3.executeUpdate(sql3);
			
			System.out.println(sql2);
			System.out.println(sql3);
			
			
		}
		
		
	}

}
