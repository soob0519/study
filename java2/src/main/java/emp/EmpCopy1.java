package emp;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class EmpCopy1 {

	public static void main(String[] args) throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		Scanner scn = new Scanner(System.in);
		System.out.println("[사원테이블 복사관리]");
		System.out.print("*(new) 테이블명>>");
		String tname = scn.next();
		
		String sql1 = "select count(*) cnt from all_tables	"
				+ "	where table_name=UPPER('"+tname+"')";
		ResultSet rs1 = stmt.executeQuery(sql1);
		rs1.next();
		int cnt = rs1.getInt("cnt");
		if(cnt>=1) {
			System.out.println("이미 존재하는 테이블명입니다.");
			return;
		}
		
		String sql2 = "create table "+tname+" as select * from emp";
		stmt.executeUpdate(sql2);
		
	}

}
