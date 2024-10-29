package student;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class StudentInsert {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = DbConnect.oracleConnect();
		
		String userid = "st111";
		String username = "조수빈";
		int age = 15;
		String gender = "F";
		int grade = 2;
		
		// 널값 및 공백체크
		
		if(userid== null || 
			userid.equals("")||
			username == null ||
			username.equals(""))
		{
			System.out.println("데이터를 확인해주세요");
			return;
		}
			
		
		// 중복체크
		String sql2 = "select count(*) cnt from student where userid='"+userid+"'";
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
				+ "values (		'"+userid+"' \n"
						+ ", '"+username+"' \n"
						+ ", '"+age+"' \n"
						+ ", '"+gender+"' \n"
						+ ", '"+grade+"') \n";
		
		System.out.println(sql);
		
		int result = stmt.executeUpdate(sql);
		if(result == 1) {
			System.out.println("입력성공");
		} else {
			System.out.println("입력실패");
		}
		
		
		
	}

}
