package post;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class PostSelectSearch {

	public static void main(String[] args)  throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		Scanner scn = new Scanner(System.in);

		int page = 1;	// 출력페이지 개수
		int unit = 10;	// 출력 단위(개수)
		
		// 검색종류 선택
		System.out.println("1. 우편번호 2. 시군구 3. 읍면동리 4. 건물명");
		System.out.print("* 번호선택 >>");
		String gubun = scn.next();
		
		// 검색단어 작성
		System.out.print("* 검색단어 >>");
		String sWord = scn.next();
		
		// 검색 종류에 따른 조건문 작성
		String search = "";
		if(gubun.equals("1")) {
			search = " p1 = '"+sWord+"' ";
		} else if(gubun.equals("2")) {
			search = " p2 like '%"+sWord+"%' or p3 like '%"+sWord+"%'";
		} else if(gubun.equals("3")) {
			search = " p4 like '%"+sWord+"%' or p5 like '%"+sWord+"%' or "
					+ " p6 like '%"+sWord+"%' or p7 like '%"+sWord+"%'";
		} else {
			search = " p8 like '%"+sWord+"%'";
		}
		
		// total 조건문을 통한 총 검색 개수를 얻는 SQL 
		String sql1 = "select count(*) total from post1 where"+search;
		ResultSet rs1 = stmt.executeQuery(sql1);
		rs1.next();
		
		// 총 검색 개수
		int total = rs1.getInt("total");
		// 총 페이지 수
		/*
		12 -> 2	:: 12/10 -> 1.2 -> 올림 -> 2
		23 -> 3	:: 23/10 -> 2.3 -> 올림 -> 3
		132 -> 14	:: 12/10 -> 13.2 -> 올림 ->14
		int tPage = Math.ceil(total/10); -> 13
		int tPage = Math.ceil((double)total/10); -> 14.0 
		int tPage = (int)Math.ceil((double)total/10); -> 14
		*/
		int tPage = (int)Math.ceil((double)total/10);

		System.out.println(" \n총 검색 개수 : "+total);
		System.out.println(" \n총 페이지 개수 : "+tPage);
		System.out.print("* 출력페이지 번호 >>");		
		page = scn.nextInt();
		
		// 출력페이지의 SQL 시작번호
		int sno = (page-1)*unit + 1;
		// 출력페이지의 SQL 마지막번호
		int eno = sno + (unit-1);
		
		String sql2 ="select b.* from \r\n"
				+ "		(select rownum rn, a.* from \r\n"
				+ "			(select p1||' '||p2||' '||p3||' '||p4||' '||p5||' '||p6||' '||p7||' '||p8 addr "
				+ "				from post1 "
				+ "				where "+search+") a ) b \r\n"
				+ "	where\r\n"
				+ "		rn >="+sno+" and rn <="+eno;
		
		ResultSet rs2 = stmt.executeQuery(sql2);
		
		System.out.println("--------------------------------------------");
		while(rs2.next()) {
			int rn = rs2.getInt("rn");
			String addr = rs2.getString("addr");
			System.out.println(rn+". "+addr);
			
		}
		
	}

}
