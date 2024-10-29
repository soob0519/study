package student;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class StudentAdmin {
	
	public static void delete(String userid) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		// 널값 및 공백체크
		if(userid== null || 
				userid.equals("") )
			{
				System.out.println("데이터를 확인해주세요");
				return;
			}
		
		// 아이디 존재유무
		String sql2 = "select count(*) cnt from student "
				+ "	where"
				+ "		 userid = '"+userid+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if(cnt == 0) {
			System.out.println("존재하지 않는 아이디 입니다.");
			return;
		}		
		
		String sql ="delete from student where userid= '"+userid+"' ";
		
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
				datas[0].equals("")||
				datas[1] == null ||
				datas[1].equals(""))
			{
				System.out.println("데이터를 확인해주세요");
				return;
			}
		
		// 아이디 존재유무
		String sql2 = "select count(*) cnt from student "
				+ "	where"
				+ "		 userid = '"+datas[0]+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if(cnt == 0) {
			System.out.println("잘못된 정보 입니다.");
			return;
		}
		
		String sql ="update student set \n"
				+ "		username='"+datas[1]+"', \n"
				+ " 	age='"+datas[2]+"', \n"
				+ "		gender='"+datas[3]+"', \n"
				+ "		grade='"+datas[4]+"' \n"
				+ "	where \n"
				+ "		userid='"+datas[0]+"' \n";
		
		int result = stmt.executeUpdate(sql);
		if(result == 1) {
			System.out.println("수정성공");
		} else {
			System.out.println("수정실패");
		}
		
	}
	
	public static void insert(String[] datas) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		// 널값 및 공백체크
		if(datas[0]== null || 
				datas[0].equals("")||
				datas[1] == null ||
				datas[1].equals(""))
			{
				System.out.println("데이터를 확인해주세요");
				return;
			}
		
		// 중복체크
		String sql2 = "select count(*) cnt from student where userid='"+datas[0]+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		int cnt = 0;
		if(rs2.next()) {
			cnt = rs2.getInt("cnt");
			if(cnt > 0) {
				System.out.println("이미 사용되고 있는 아이디 입니다.");
				return;
			}
		} else {
			System.out.println("1번 시스템 오류입니다.");
			return;
		}
		
		// 입력처리
		String sql ="insert into student \n"
				+ "(	userid \n"
				+ ", 	username \n"
				+ ", 	age \n"
				+ ", 	gender \n"
				+ ", 	grade) \n"
				+ "values (		'"+datas[0]+"' \n"
						+ ", '"+datas[1]+"' \n"
						+ ", '"+datas[2]+"' \n"
						+ ", '"+datas[3]+"' \n"
						+ ", '"+datas[4]+"') \n";
		
		System.out.println(sql);
		
		int result = stmt.executeUpdate(sql);
		if(result == 1) {
			System.out.println("입력성공");
		} else {
			System.out.println("입력실패");
		}
		
	}
	
	public static void selectList() throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		
		// 총 개수 체크
		String sql2 = "select count(*) total from student";
		ResultSet rs2 = stmt.executeQuery(sql2);
		int total = 0;
		if(rs2.next()) {
			total = rs2.getInt("total");
		} else {
			System.out.println("문제발생");
			return;
		}
		
		// 출력
		String sql ="select "
				+ "		userid, "
				+ "		username, "
				+ "		age, "
				+ "		decode(gender,'M','남','F','여','없음') gender, "
				+ "		nvl(grade||'학년','미설정') grade "
				+ "	from "
				+ "		student";
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("총 데이터 개수 : "+total);
		System.out.println("---------------------------");
		while(rs.next()) {
			String userid = rs.getString("userid");
			String username = rs.getString("username");
			String age = rs.getString("age");
			String gender = rs.getString("gender");
			String grade = rs.getString("grade");
			System.out.println(userid+" "+username+" "+age+" "+gender+" "+grade);
		}
	}

	
	public static void main(String[] args) throws Exception {
		
		Scanner scn = new Scanner(System.in);
		
		System.out.println("[학생관리시스템]");
		System.out.println("1.출력	2.입력	3.수정	4.삭제");
		System.out.print("*번호선택 >>");
		
		int n = scn.nextInt();
		switch(n) {
		case 1 : selectList();
			break;
		case 2 : 
			String[] datas1 = {"st122","aa","14","M","1"};
			insert(datas1);
			break;
		case 3 :
			String[] datas2 = {"st122","aa","14","M","1"};
			update(datas2);
			break;
		case 4 : 
			System.out.print("*삭제 처리할 아이디 입력 >>");
			String id = scn.next();
			delete(id);
			break;
		}
		
		
		
	}

}
