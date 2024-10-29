package emp;

import java.util.Scanner;
import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class EmpAdmin {
	
	public static void empInsert(EmpVO vo) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		String ename = vo.getEname();
		String job= vo.getJob();
		int mgr = vo.getMgr();
		String hiredate = vo.getHiredate();
		int sal = vo.getSal();
		int comm = 0;
		int deptno = vo.getDeptno();
		
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
	
	public static void empUpdate(EmpVO vo) throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		int empno = vo.getEmpno();
		
		// 특정 사원의 상세정보를 얻는 메소드
		vo = empSelectDetail(vo);		
		
		String ename = vo.getEname();
		String job= vo.getJob();
		int mgr = vo.getMgr();
		String hiredate = vo.getHiredate();
		int sal = vo.getSal();
		int comm = 0;
		int deptno = vo.getDeptno();
		
		if(ename.equals("")) {
			System.out.println("없는 사원번호 입니다.");
			return;
		}
		
		System.out.println("1.사원번호 : " + vo.getEmpno());
		System.out.println("2.사원명 : " + ename);
		System.out.println("3.업무명 : " + job);
		System.out.println("4.매니저 : " + mgr);
		System.out.println("5.입사일 : " + hiredate);
		System.out.println("6.기본급 : " + sal);
		System.out.println("7.커미션 : " + comm);
		System.out.println("8.부서번호 : " + deptno);
		
		vo = empVOInput();
		
		String sql = "UPDATE emp SET ENAME='"+vo.getEname()+"'"
					+ "				,JOB='"+vo.getJob()+"'"
					+ "				,MGR='"+vo.getMgr()+"'"
					+ "				,HIREDATE='"+vo.getHiredate()+"'"
					+ "				,SAL='"+vo.getSal()+"'"
					+ "				,COMM='"+vo.getComm()+"'"
					+ "				,DEPTNO='"+vo.getDeptno()+"'"
					+ "WHERE"
					+ "		EMPNO='"+vo.getEmpno()+"' ";
		
		int result = stmt.executeUpdate(sql);
		if(result ==1 ) {
			System.out.println("수정완료");
		} else {
			System.out.println("수정실패");
		}
	}
	
	public static void empDelete(EmpVO vo) throws Exception {
		
	}
	
	public static void empSelectList(EmpVO vo) throws Exception {
			
	}
	
	public static EmpVO empSelectDetail(EmpVO vo) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		String sql="SELECT EMPNO"
				+ "		,ENAME"
				+ "		,JOB"
				+ "		,MGR"
				+ "		,HIREDATE"
				+ "		,SAL"
				+ "		,COMM"
				+ "		,DEPTNO "
				+ "	FROM EMP	"
				+ "	WHERE empno='"+vo.getEmpno()+"'	";
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
			vo.setEmpno(rs.getInt("empno"));
			vo.setEname(rs.getString("ename"));
			vo.setJob(rs.getString("job"));
			vo.setMgr(rs.getInt("mgr"));
			vo.setHiredate(rs.getString("hiredate"));
			vo.setSal(rs.getInt("sal"));
			vo.setComm(rs.getInt("comm"));
			vo.setDeptno(rs.getInt("deptno"));
		} else {
			vo.setEname("");
		}
		return vo;
		
	}
	
	public static void empSelectTotal(EmpVO vo) throws Exception {
		
	}	
	
	public static EmpVO empVOInput() {
		EmpVO vo = new EmpVO();
		Scanner scn = new Scanner(System.in);
		System.out.print("*사원명 >>");
		String ename = scn.next();
		
		System.out.print("*업무명 >>");
		String job = scn.next();
		
		System.out.print("*매니저 >>");
		int mgr = -1;
		try {
			mgr = scn.nextInt();
		} catch(Exception e) {	}
		
		System.out.print("*입사일 >>");
		String hiredate = scn.next();
		
		System.out.print("*기본급 >>");
		int sal = -1;
		try {
			sal = scn.nextInt();
		} catch(Exception e) {	}
		
		System.out.print("*부서번호 >>");
		int deptno = -1;
		try {
			deptno = scn.nextInt();
		} catch(Exception e) {	}
		
		vo.setEname(ename);			// 홍길동 or.
		vo.setJob(job);				// 업무 or.
		vo.setMgr(mgr);				// 매니저번호 or. 대신 "-1"
		vo.setHiredate(hiredate);	// 입사일 or.
		vo.setSal(sal);				// 기본급 or. 대신 "-1"
		vo.setDeptno(deptno);		// 부서번호 or. 대신 "-1"
		
		return vo;
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
			
			break;
		case 2 :
			
			break;
		case 3 :	// 스캐너 기능을 이용하여 사원정보를 받아서 EmpVO에 넣는 역할
					vo = empVOInput();
					// EmpVO의 내용을 받아 저장처리
					empInsert(vo);
			break;
		case 4 :	System.out.print("*사원 번호 >>");
					int empno = scn.nextInt();
					vo.setEmpno(empno);
					empUpdate(vo);
			break;
		case 5 :
			
			break;
			
		}

	}

}
