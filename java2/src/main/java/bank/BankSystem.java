package bank;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class BankSystem {
	public static void clientInsert() throws Exception {
		Statement stmt = DbConnect.oracleConnect();
		String filepath = "c:\\sample\\data.txt";
		FileReader fr = new FileReader(filepath);
		BufferedReader br = new BufferedReader(fr);
		while(true) {
			String data = br.readLine();
			if(data == null) break;
			String[] datas = data.split(",");
			String sql1 = "INSERT INTO BANKCLIENTINFO(a1,a2,a3,a4) "
					+ "VALUES((select nvl(max(a1),10000)+1 from BANKCLIENTINFO),'"+datas[0]+"','"+datas[1]+"','"+datas[2]+"')";
			stmt.executeUpdate(sql1);
		}
		System.out.println("일괄등록 처리되었습니다.");
	}
	
	public static void main(String[] args) throws Exception {
		
		Scanner scn = new Scanner(System.in);
		
		System.out.println("[은행입출력 시스템]");
		System.out.println("1.고객등록 2.입금 3.출금 4.잔액조회 5.고객목록");
		System.out.print("서비스번호>>");
		int n = scn.nextInt();
		
		switch(n) {
		case 1 :	clientInsert();
			break;
		case 2 :
			break;
		case 3 :
			break;
		case 4 :
			break;
		case 5 :
			break;
		}
		
		
	}

}
