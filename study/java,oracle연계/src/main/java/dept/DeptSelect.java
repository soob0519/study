package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DeptSelect {

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
			
			String sql = "select deptno,dname,loc from dept";
			ResultSet rs = stmt.executeQuery(sql);
			// executeQuery(sql); : SQL실행 (출력메소드)
			// ResultSet rs = stmt.executeQuery(sql); >> 실제로는 메모리에 올려놓는 작접
			// ResultSet :: SQL 결과를 담는 클래스
			
			while(rs.next()) {
				String deptno = rs.getString("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				System.out.println(deptno+","+dname+","+loc);
			}
			// while문으로 메모리에서 내용을 가져오는거고
			// rs.next() : 메모리 안에 존재유무(포인트커서이동)
			// 존재하면 나오고(다음포인트로 커서가 넘어가고) 존재하지 않으면 안나오고 (다음포인트로 커서가 넘어가고)
			
		} catch (Exception e) {
			System.out.println("연결안됨");
			
		}	

	}

}
