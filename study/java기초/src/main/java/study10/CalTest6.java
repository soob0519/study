package study10;

public class CalTest6 {

	public static void main(String[] args) {
		
		String[] an = {"쥐","소","호랑이","토끼","용","뱀","말","양","원숭이","닭","개","돼지"};
		// String[] an1 = {"원숭이","닭","개","돼지","쥐","소","호랑이","토끼","용","뱀","말","양"};
		String date = "2020-8-12";
		
		String[] str = date.split("-");
		int year = Integer.parseInt(str[0]);
		
		int age = 2024-year;
		
		int index = (year+8)%12;
		
		System.out.println(age+"세");
		System.out.println(an[index]+"띠");
		
		
	}

}
