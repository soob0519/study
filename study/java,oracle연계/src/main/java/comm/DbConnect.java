package comm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DbConnect {
	// static :: 클래스(전역)메소드
	public static Statement oracleConnect() throws Exception {
		String url = "jdbc:oracle:thin:@//localhost:1522/orcl";
		String username = "c##java";
		String userpass = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url,username,userpass);
		// 참조클래스 참조변수
		Statement stmt = con.createStatement();
		return stmt;
	}
}
