package dept;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class DeptAdmin {
	
	public static void delete(String deptno) throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		// 널값 및 공백체크
		if(deptno== null || 
				deptno.equals("") )
			{
				System.out.println("데이터를 확인해주세요");
				return;
			}
		
		// 아이디 존재유무
		String sql2 = "select count(*) cnt from dept "
				+ "	where"
				+ "		 deptno = '"+deptno+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if(cnt == 0) {
			System.out.println("존재하지 않는 부서번호 입니다.");
			return;
		}
		String sql = "delete from dept where deptno='"+deptno+"'";
		
		int result = stmt.executeUpdate(sql);
		if(result == 1) {
			System.out.println("삭제성공");
		} else {
			System.out.println("삭제실패");
		}
	}
	public static void update(String[] datas) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		// 널값 및 공백체크
		if(datas[0]== null || 
			datas[0].equals(""))
		{
			System.out.println("데이터를 확인해주세요");
			return;
		}
		
		// 아이디 존재유무
		String sql2 = "select count(*) cnt from dept "
				+ "	where"
				+ "		 deptno = '"+datas[0]+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if(cnt == 0) {
			System.out.println("존재하지 않는 부서번호 입니다.");
			return;
		}

		String sql = "update dept set dname='"+datas[1]+"'"
				+ ", 	loc='"+datas[2]+"' "
				+ "	where deptno='"+datas[0]+"'";
		
		int result = stmt.executeUpdate(sql);
		if(result == 1) {
			System.out.println("수정성공");
		} else {
			System.out.println("수정실패");
		}
		
	}
	
	public static void insert(String[] datas) throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		if(datas[0] == null || 
			datas[1] == null || 
			datas[0].equals("") || 
			datas[1].equals("") )
		{
			System.out.println("데이터를 다시 확인해주세요.");
			return;
		}
		
		String sql1 = "select count(*) cnt from dept where deptno ='"+datas[0]+"'";
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
		
		String sql2 = "select count(*) cnt from dept where dname ='"+datas[1]+"'";
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
				+ "values('"+datas[0]+"','"+datas[1]+"','"+datas[2]+"')";
		
		int result = stmt.executeUpdate(sql);
		if(result == 1) {
			System.out.println("입력성공");
		} else {
			System.out.println("입력실패");
		}
	}
	
	public static void selectList() throws Exception {
		
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
		
		
		System.out.println("\ntotal : "+total);
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
	
	
	public static void main(String[] args) throws Exception {
		Scanner scn = new Scanner(System.in);
		
		System.out.println("[부서관리시스템]");
		System.out.println("1.출력	2.입력	3.수정	4.삭제");
		System.out.print("*번호선택 >>");
		int n = scn.nextInt();
		
		switch(n) {
		case 1 : selectList();
			break;
		case 2 : 
			String[] datas1 = new String[3];
			System.out.print("*(1)부서번호 >>");
			datas1[0] = scn.next();
			System.out.print("*(2)부서이름 >>");
			datas1[1] = scn.next();
			System.out.print("*(3)부서지역 >>");
			datas1[2] = scn.next();
			insert(datas1);
			break;
		case 3 :
			String[] datas2 = new String[3];
			System.out.print("*(1)부서번호 >>");
			datas2[0] = scn.next();
			System.out.print("*(2)부서이름 >>");
			datas2[1] = scn.next();
			System.out.print("*(3)부서지역 >>");
			datas2[2] = scn.next();
			update(datas2);
			break;
		case 4 : 
			System.out.print("*삭제 처리할 부서번호 입력 >>");
			String deptno = scn.next();
			delete(deptno);
			break;
		}

	}

}
