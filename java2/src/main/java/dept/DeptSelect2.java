package dept;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class DeptSelect2 {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		String sql1 = "select count(*) total from dept";
		ResultSet rs1 = stmt.executeQuery(sql1);
		int total = 0;
		if (rs1.next()) {	// true 결과값이 잘 내려갔으면
			total = rs1.getInt("total");
		} else {	// false 시스템 장애가 발생
			System.out.println("시스템 장애가 발생했습니다. \n관리자에게 연락바랍니다.");
			return;
		}
		
		int number = 0;	// 출력행번호
		
		String sql = "select deptno,dname,loc from dept";
		ResultSet rs = stmt.executeQuery(sql);
		
		
		System.out.println("total : "+total);
		System.out.println("------------------------------");
		while(rs.next()) {
			number++;
			
			String deptno = rs.getString("deptno");
			String dname = rs.getString("dname");
			String loc = rs.getString("loc");
			System.out.print(number+" ");
			System.out.println(deptno+","+dname+","+loc);
		}
				
			

	}

}
