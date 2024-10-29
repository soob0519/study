package study4;

public class StringText3 {

	public static void main(String[] args) {

		// 풀어보기3
		String jumsu = "eng:70,kor:90,math:88";
		// 구분자를 통해 배열의 결과를 얻어내는 메소드
		String[] array = jumsu.split(",");
		
		for(int i=0; i<array.length; i++) {
			System.out.println(array[i]);
		}
		System.out.println("----------------------");
		
		// 풀어보기4 //{ "eng","70" , "kor","90" , "math","88"}
		
		for(int i=0; i<array.length; i++) {
			System.out.println(array[i].split(":")[1]);
		}
		System.out.println("----------------------");
		
		// 풀어보기5
		String birth = "1990/05/06";
		String[] bday = birth.split("/");
		
		System.out.print(bday[0].substring(2)+"년 ");
		
		if(bday[1].indexOf("0") == 0) {
			System.out.print(bday[1].replace("0","")+"월 ");
		} else{
			System.out.print(bday[1]+"월 ");
		}
		
		if(bday[2].indexOf("0") == 0) {
			System.out.print(bday[2].replace("0","")+"일 생");
		} else{
			System.out.print(bday[2]+"일 생");
		}
		
		
		System.out.println();
		System.out.println("----------------------");
		
		// 풀어보기5 선생님
		String birthday = "1990/05/07";
		String[] a3 = birthday.split("/");
		String yy	= a3[0].substring(2,4);
		int mm		= Integer.parseInt(a3[1]); //문자타입 > 숫자타입 ("05"->5)
		int dd		= Integer.parseInt(a3[2]);
		
		System.out.println(yy+"년 "+mm+"월 "+dd+"일 생");
		System.out.println("----------------------");
		
		// 풀어보기6
		String str = "java";
		String str1 = "";
		
		for(int i=0; i<str.length(); i++) {
			str1 ="";
			for(int j=1; j<=i; j++) {
				str1 +=" ";
			}
			System.out.println(str1+str.charAt(i));
		}	
		System.out.println("----------------------");
		
		// 풀어보기6 선생님
		
		for(int i=0; i<str.length(); i++) {
			for(int j=1;j<=i; j++) {
				System.out.print(" ");
			}
			System.out.println(str.substring(i,i+1));
		}
		
		
		/*
		System.out.println(""+str.substring(0,1));		// j
		System.out.println(" "+str.substring(1,2));		// a
		System.out.println("  "+str.substring(2,3));	// v
		System.out.println("   "+str.substring(3,4));	// a
		*/
		
		
		
		
		
		
		
		
		
		
		
	}
	
}
