package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class DeptInsert {

	public static void main(String[] args) {
		/*
		 * localhost : 오라클의 위치정보: 도메인개념 : 웹에서 자신의 위치를 알림
		 * 오라클데이터베이스의 위치 >> 지금은 내자리에서만 하지만 다같이 할때는 다른 사람의 도메인이 들어감
		 * localhost >> 오라클데이터베이스가 내자리에 있다.
		 */
		
		/* DB연결 */	
		String url = "jdbc:oracle:thin:@//localhost:1522/orcl";
		// jdbc:mysql:thin:@//localhost:1522/orcl 만약 mysql을 사용했다면
		// :thin:@//~의미모름 localhost 이전은 항상 같아서 외워야함~
		// localhost : 오라클 베이스 위치
		// 1522 : 오라클 포트번호
		// orcl : 오라클 서비스 이름 tnsnames.ora 파일에 상위 정보 있음
		String username = "c##java";
		String userpass = "1234";
		try {
			/*
			 *  오라클드라이버 연결
			 *  Class.forname();
			 */
			Class.forName("oracle.jdbc.OracleDriver");
			// 안에 있는걸 잘 써야함. 대소문자 꼭 잘 쓰기
			// 드라이버의 고유이름
			Connection con = DriverManager.getConnection(url,username,userpass);
			// getConnection(위치정보,접속이름,접속암호); : 접속메소드 를 통한 접근
			Statement stmt = con.createStatement();
			// createStatement(); : 접속정보의 객체처리 >> 사용하기 위한 메모리에 내용을 다 올려놓는 것.
			// 작업공간의 객체화 : 메모리에서의 작업공간 확보
			Scanner scn = new Scanner(System.in);
			
			System.out.print("부서번호>>");
			String no = scn.next();
			System.out.print("부서이름>>");
			String nm = scn.next();
			System.out.print("부서위치>>");
			String lo = scn.next();	
			
			String sql = "insert into dept(deptno,dname,loc)"
					+ "values('"+no+"','"+nm+"','"+lo+"')";
			// executeUpdate() :: insert, update,delete
			// executeUpdate() :: 실행결과를 return :: 건수 0,1 
			int result = stmt.executeUpdate(sql);
			if(result == 1) {
				System.out.println("입력성공");
			} else {
				System.out.println("입력실패");
			}
			
		} catch (Exception e) {
			System.out.println("연결안됨");
			
		}
		

	}

}
