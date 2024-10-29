package emp;

import java.sql.Statement;
import comm.DbConnect;

public class EmpUpdate {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		String empno = "8000";
		String ename = "호돌이";
		String job = "CLERK";
		String mgr = "7788";
		String hiredate = "2020-05-05";
		String sal = "400";
		String comm = "20";
		String deptno = "30";	
		
		String sql="UPDATE EMP SET "
				+ "				ENAME ='"+ename+"',"
				+ "				JOB = '"+job+"',"
				+ "				MGR='"+mgr+"',"
				+ "				HIREDATE='"+hiredate+"',"
				+ "				SAL='"+sal+"',"
				+ "				COMM='"+comm+"',"
				+ "				DEPTNO='"+deptno+"'"
				+ "WHERE "
				+ "		EMPNO='"+empno+"'";
		int result = stmt.executeUpdate(sql);
		if(result == 1) {
			System.out.println("수정완료!");
		} else {
			System.out.println("수정실패~");
		}
		
		

	}

}
