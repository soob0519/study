package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class DeptInsert2 {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		Scanner scn = new Scanner(System.in);
		
		String deptno = "21";
		String dname = "판매원";
		String loc = "충주";
		
		if(deptno == null || 
			dname == null || 
			deptno.equals("") || 
			dname.equals("") )
		{
			System.out.println("데이터를 다시 확인해주세요.");
			return;
		}
		
		String sql1 = "select count(*) cnt from dept10 where deptno ='"+deptno+"'";
		ResultSet rs1 = stmt.executeQuery(sql1);
		int cnt = 0;
		if(rs1.next()) {
			cnt = rs1.getInt("cnt");
			if(cnt>0) {
				System.out.println("이미 사용중인 부서번호입니다.");
				return;
			}
		} else {
			System.out.println("1시스템장애 발생");
			return;
		}
		
		String sql2 = "select count(*) cnt from dept where dname ='"+dname+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		int cnt2 = 0;
		if(rs2.next()) {
			cnt2 = rs2.getInt("cnt");
			if(cnt2>0) {
				System.out.println("이미 사용중인 부서이름입니다.");
				return;
			}
		} else {
			System.out.println("2시스템장애 발생");
			return;
		}
		
		String sql = "insert into dept(deptno,dname,loc)"
				+ "values('"+deptno+"','"+dname+"','"+loc+"')";
		
		int result = stmt.executeUpdate(sql);
		if(result == 1) {
			System.out.println("입력성공");
		} else {
			System.out.println("입력실패");
		}
			
	}

}
