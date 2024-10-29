package emp;

import java.sql.Statement;
import comm.DbConnect;

public class EmpInsert {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		String empno = "1010";
		String ename = "호돌이";
		String job = "CLERK";
		String mgr = "7788";
		String hiredate = "2020-05-05";
		String sal = "400";
		String comm = "20";
		String deptno = "30";		
		
		String sql="INSERT INTO EMP("
				+ "			EMPNO,"
				+ "			ENAME,"
				+ "			JOB,"
				+ "			MGR,"
				+ "			HIREDATE,"
				+ "			SAL,"
				+ "			COMM,"
				+ "			DEPTNO) "
				+ "VALUES("
				+ "			'"+empno+"',"
				+ "			'"+ename+"',"
				+ "			'"+job+"',"
				+ "			'"+mgr+"',"
				+ "			'"+hiredate+"',"
				+ "			'"+sal+"',"
				+ "			'"+comm+"',"
				+ "			'"+deptno+"'	)";
		
		// 입렵,수정,삭제 :: 성공횟수를 리턴해줌
		int result = stmt.executeUpdate(sql);
		if(result==1) {
			System.out.println("저장완료!");
		} else if (result==0){
			System.out.println("저장실패~");
		}
		
		
	}

}
