package study4;

import java.util.Scanner;

public class Equals {

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		String a = "java";
		System.out.print("변수값입력>>");
		String b = scn.next();
		
		// == << 숫자타입에만 가능하다. 문자타입에는 거의 쓰지 않는다.
		if (a.equals(b)) {
			System.out.println("같음");
		} else {
			System.out.println("다름");
		}

	}

}
