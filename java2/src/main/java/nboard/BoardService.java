package nboard;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class BoardService {
	
	public static void	boardInsert() throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		Scanner scn = new Scanner(System.in);
		
		System.out.println("[등록서비스]");
		
		System.out.print("제목>>");
		String title = scn.next();
		
		System.out.print("암호>>");
		String pass = scn.next();
		
		System.out.print("이름>>");
		String name = scn.next();
		
		System.out.print("내용>>");
		String content = scn.next();
		
		String sql="INSERT INTO NBOARD2(unq,title,pass,name,content,rdate) "
				+ "	VALUES(nboard2_seq.nextval,'"+title+"','"+pass+"','"+name+"','"+content+"',sysdate)";
		
		int result = stmt.executeUpdate(sql);
		if(result == 1) {
			System.out.println("등록성공");
		} else {
			System.out.println("등록실패");
			return;
		}
		
	}
	
	public static void	boardSelectList() throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		
		String sql2 = "select unq,title,name,to_char(rdate,'yyyy-mm-dd') rdate from nboard2";
		ResultSet rs2 = stmt.executeQuery(sql2);
		
		System.out.println("[목록서비스]");
		while(rs2.next()) {
		String unq = rs2.getString("unq");
		String title = rs2.getString("title");
		String name = rs2.getString("name");
		String rdate = rs2.getString("rdate");
		System.out.println(unq+" "+title+" "+name+" "+rdate);
		}
		
	}
	
	public static void	boardUpdate() throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		Scanner scn = new Scanner(System.in);
		
		System.out.println("[수정서비스]");
		System.out.print("수정할 게시물 번호>>");
		String unq = scn.next();
		if(unq== null || unq.equals("") ) {
				System.out.println("데이터를 확인해주세요");
				return;
		}
		
		String sql1 = "select count(*) cnt from nboard2 where unq = '"+unq+"'";
		ResultSet rs1 = stmt.executeQuery(sql1);
		rs1.next();
		int cnt = rs1.getInt("cnt");
		if(cnt == 0) {
			System.out.println("존재하지 않는 게시물번호 입니다.");
			return;
		}
		
		System.out.print("수정할 게시물의 암호>>");
		String pass = scn.next();
		String sql2 = "select count(*) cnt2 from nboard2 where unq = '"+unq+"' and pass = '"+pass+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt2 = rs2.getInt("cnt2");
		if(cnt2 == 0) {
			System.out.println("잘못된 암호입니다.");
			return;
		}
		
		String sql3 = "select title,name,pass,content from nboard2 where unq ='"+unq+"'";
		ResultSet rs3 = stmt.executeQuery(sql3);
		rs3.next();
		
		System.out.println("{수정내용 입력창에 온점(.)한개만 입력시 원본 유지}");
		System.out.print("수정할 제목>>");
		String title = scn.next();
		if(title.equals(".")) {
			title = rs3.getString("title");
		}
		System.out.print("수정할 암호>>");
		pass = scn.next();
		if(pass.equals(".")) {
			pass = rs3.getString("pass");
		}
		System.out.print("수정할 이름>>");
		String name = scn.next();
		if(name.equals(".")) {
			name = rs3.getString("name");
		}
		System.out.print("수정할 내용>>");
		String content = scn.next();
		if(content.equals(".")) {
			content = rs3.getString("content");
		}
		
		String sql4 = "UPDATE NBOARD2 SET TITLE='"+title+"',PASS='"+pass+"',NAME='"+name+"',CONTENT='"+content+"' "
				+ "		WHERE UNQ='"+unq+"'";
		int result4 = stmt.executeUpdate(sql4);
		if(result4 == 1) {
			System.out.println("수정성공");
		} else {
			System.out.println("수정실패");
		} 
		
	}
	
	public static void	boardDelete() throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		Scanner scn = new Scanner(System.in);
		
		System.out.println("[삭제서비스]");
		System.out.print("삭제할 게시물 번호>>");
		String unq = scn.next();
		if(unq== null || unq.equals("") ) {
			System.out.println("데이터를 확인해주세요");
			return;
		}
		
		String sql1 = "select count(*) cnt from nboard2 where unq = '"+unq+"'";
		ResultSet rs1 = stmt.executeQuery(sql1);
		rs1.next();
		int cnt = rs1.getInt("cnt");
		if(cnt == 0) {
			System.out.println("존재하지 않는 게시물번호 입니다.");
			return;
		}
		
		System.out.print("삭제할 게시물의 암호>>");
		String pass = scn.next();
		String sql2 = "select count(*) cnt2 from nboard2 where unq = '"+unq+"' and pass = '"+pass+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt2 = rs2.getInt("cnt2");
		if(cnt2 == 0) {
			System.out.println("잘못된 암호입니다.");
			return;
		}
		
		String sql3 = "delete from nboard2 where unq = '"+unq+"'";
		int result3 = stmt.executeUpdate(sql3);
		if(result3 == 1) {
			System.out.println("삭제성공");
		} else {
			System.out.println("삭제실패");
		}
		
	}
	
	public static void main(String[] args) throws Exception {
		
		Scanner scn = new Scanner(System.in);
		
		System.out.println("[일반게시판]");
		System.out.println("1.등록 2.목록 3.수정 4.삭제");
		System.out.print("서비스번호>>");
		int n = scn.nextInt();
		
		switch(n) {
		case 1 :	boardInsert();
			break;
		case 2 :	boardSelectList();
			break;
		case 3 :	boardUpdate();
			break;
		case 4 :	boardDelete();
			break;
		default :	System.out.println("서비스번호를 잘못 입력하였습니다.");
			break;
		}
		
		
		
		
	}

}
