package emp;

import java.util.Calendar;
import java.util.Scanner;
import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class EmpAdmin2 {
	
	public static void empInsert() throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		
		Scanner scn = new Scanner(System.in);
		System.out.print("*사원명 >>");
		String ename = scn.next();
		
		System.out.print("*업무명 >>");
		String job = scn.next();
		
		System.out.print("*매니저 >>");
		int mgr = scn.nextInt();
		
		System.out.print("*입사일 >>");
		String hiredate = scn.next();
		
		System.out.print("*기본급 >>");
		int sal = scn.nextInt();
		
		System.out.print("*부서번호 >>");
		int deptno = scn.nextInt();
		
		int comm = 0;
		
		String sql1 = "INSERT INTO emp("
				+ "		EMPNO"
				+ "		,ENAME"
				+ "		,JOB"
				+ "		,MGR"
				+ "		,HIREDATE"
				+ "		,SAL"
				+ "		,COMM"
				+ "		,DEPTNO)"
				+ "	 VALUES("
				+ "		(select nvl(max(empno),'1000')+1 from emp)"
				+ "		,'"+ename+"'"
				+ "		,'"+job+"'"
				+ "		,'"+mgr+"'"
				+ "		,'"+hiredate+"'"
				+ "		,'"+sal+"'"
				+ "		,'"+comm+"'"
				+ "		,'"+deptno+"'	)";
		
		int result = stmt.executeUpdate(sql1);
		if(result == 1) {
			System.out.println("저장성공");
		} else {
			System.out.println("저장실패");
		}
	}
	
	public static boolean dateCheck(String date) throws Exception {
		boolean result = true;
		String pattern = "[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}";
		boolean result2 = date.matches(pattern);
		int yy=0;
		int mm=0;
		int dd=0;
		
		if(result2 == false) {
			result = false;
		} else {
			String[] datas = date.split("-");
			yy = Integer.parseInt(datas[0]);
			mm = Integer.parseInt(datas[1]);
			dd = Integer.parseInt(datas[2]);
			if(yy<1930 || yy>2024) {
				result = false;
			} else if(mm<1 || mm>12) {
				result = false;
			} else if(dd<1 || dd>31) {
				result = false;
			} else {
				Calendar cal = Calendar.getInstance();
				cal.set(yy,mm-1,dd);
				int month = cal.get(Calendar.MONTH)+1;
					
				if( mm != month ) {
					result = false;
				}
			}
		}
		
		return result;
	}
	
	public static boolean deptCheck(String deptno) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		String sql2 = "select count(*) cnt from emp where deptno='"+deptno+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		
		boolean result = true;
		if(cnt == 0) {
			result = false;
		}
		return result;
	}
	
	public static boolean empnoCheck(String empno) throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		
		String sql2 = "SELECT COUNT(*) cnt FROM EMP WHERE EMPNO='"+empno+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		
		boolean result = true;
		if(cnt == 0) {
			result = false;
		}
		return result;
	}
	
	
	public static void empUpdate() throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		
		Scanner scn = new Scanner(System.in);
		
		System.out.print("*사원번호 >>");
		String empno = scn.next();
		if(empnoCheck(empno) == false) {
			System.out.println("존재하지 않는 사원번호입니다.");
			return;
		}
		
		System.out.print("*사원명 >>");
		String ename = scn.next();
		
		System.out.print("*업무명 >>");
		String job = scn.next();
		
		System.out.print("*매니저 >>");
		String mgr = scn.next();
		if(empnoCheck(mgr) == false) {
			System.out.println("존재하지 않는 매니저번호입니다.");
			return;
		}
		System.out.print("*입사일 >>");
		String hiredate = scn.next();
		if(dateCheck(hiredate) == false) {
			System.out.println("잘못된 날짜 입니다.");
			return;
		}
		System.out.print("*기본급 >>");
		int sal = scn.nextInt();
				
		System.out.print("*부서번호 >>");
		String deptno = scn.next();
		if(deptCheck(deptno) == false) {
			System.out.println("존재하지 않는 부서번호입니다.");
			return;
		}
		
		String sql = "UPDATE emp SET "
				+ "				ENAME='"+ename+"'"
				+ "				,JOB='"+job+"'"
				+ "				,MGR='"+mgr+"'"
				+ "				,HIREDATE='"+hiredate+"'"
				+ "				,SAL='"+sal+"'"
				+ "				,DEPTNO='"+deptno+"'"
				+ " WHERE "
				+ "		EMPNO='"+empno+"' ";
	
		int result = stmt.executeUpdate(sql);
		if(result ==1 ) {
			System.out.println("수정완료");
		} else {
			System.out.println("수정실패");
		}
	}
	
	public static void empDelete() throws Exception {
		Statement stmt = DbConnect.oracleConnect();

		Scanner scn = new Scanner(System.in);
		
		System.out.print("*사원번호 >>");
		String empno = scn.next();
		
		String sql2 = "select count(*) cnt from emp where empno='"+empno+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if(cnt == 0) {
			System.out.println("존재하지 않는 사원번호입니다.");
			return;
		}
		
		String sql ="DELETE FROM emp "
				+ "	WHERE	"
				+ "		EMPNO = '"+empno+"'";
		
		int result = stmt.executeUpdate(sql);
		if(result ==1 ) {
			System.out.println("삭제완료");
		} else {
			System.out.println("삭제실패");
		}
		
	}
	
	public static void empSelectList() throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		Scanner scn = new Scanner(System.in);
		
		int page = 1;
		int unit = 10;
		
		String sql1 = "select count(*) total from emp";
		ResultSet rs1 = stmt.executeQuery(sql1);
		rs1.next();
		
		// 총 데이터 개수
		int total = rs1.getInt("total");
		// 총 페이지 개수
		int tpage = (int)Math.ceil((double)total/unit);
		
		System.out.println("총 사원 수 : "+total+"명");
		System.out.println("총 페이지 수 : "+tpage+"페이지");
		
		System.out.print("출력화면 번호>>");
		
		page = scn.nextInt();		 
		
		if(page>tpage) {
			System.out.println("없는 페이지 번호입니다.");
			return;
		}
		
		// SQL에 적용할 시작번호
		int sno = (page-1)*unit+1;
		int eno = sno+(unit-1);
		
		String sql2="select b.* from(	"
				+ "	select rownum rn,a.* from (	"
				+ "		select empno,ename,deptno,mgr,to_char(hiredate,'yyyy-mm-dd') hiredate	"
				+ "			 from emp "
				+ "			 order by ename) a ) b	"
				+ "	where	"
				+ "	rn>="+sno+" and rn<="+eno;
		
		ResultSet rs2 = stmt.executeQuery(sql2);
		while(rs2.next()) {
			String empno = rs2.getString("empno");
			String ename = rs2.getString("ename");
			String deptno = rs2.getString("deptno");
			String mgr = rs2.getString("mgr");
			String hiredate = rs2.getString("hiredate");
			
			System.out.println(empno+" "+ename+" "+deptno+" "+mgr+" "+hiredate);
		}
		
	}
	
	public static void empSelectDetail() throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		Scanner scn = new Scanner(System.in);
		System.out.print("*사원번호 >>");
		String empno = scn.next();
		if(empnoCheck(empno) == false) {
			System.out.println("존재하지 않는 사원번호입니다.");
			return;
		}

		String sql = "SELECT "
				+ "		EMPNO"
				+ "		,ENAME"
				+ "		,JOB"
				+ "		,decode(MGR,null,'지정안됨',mgr) mgr"
				+ "		,to_char(HIREDATE,'yyyy-mm-dd') hiredate"
				+ "		,to_char(SAL,'FM999,999') sal"
				+ "		,nvl(COMM,0) comm"
				+ "		,DEPTNO "
				+ "	FROM EMP "
				+ "		WHERE EMPNO ='"+empno+"'";
		
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
			String ename = rs.getString("ename");
			String job = rs.getString("job");
			String mgr = rs.getString("mgr");
			String hiredate = rs.getString("hiredate");
			String sal = rs.getString("sal");
			String comm = rs.getString("comm");
			String deptno = rs.getString("deptno");
			
			System.out.println("사원번호 : "+empno);
			System.out.println("사원명 : "+ename);
			System.out.println("업무명 : "+job);
			System.out.println("매니저 : "+mgr);
			System.out.println("입사일 : "+hiredate);
			System.out.println("기본급 : "+sal);
			System.out.println("성과급 : "+comm);
			System.out.println("부서번호 : "+deptno);
		}
		
		
	}
	
	public static void main(String[] args) throws Exception {
		
		EmpVO vo = new EmpVO();
		
		Scanner scn = new Scanner(System.in);
		System.out.println("[사원관리 시스템]");
		System.out.println("1.목록	2.상세	3.등록	4.수정	5.삭제");
		System.out.print("*서비스 번호 >>");
		int n = scn.nextInt();
		
		switch(n) {
		case 1 :	
					empSelectList();			
			break;
		case 2 :	
					empSelectDetail();			
			break;
		case 3 :	
					empInsert();
			break;
		case 4 :	
					empUpdate();
			break;
		case 5 :
					empDelete();
			break;
			
		}

	}

}
