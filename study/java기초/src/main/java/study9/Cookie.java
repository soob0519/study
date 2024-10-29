package study9;

public interface Cookie {
	public void makeCookie();
	public void makeSalad();
	
	/* 일반 메소드 불가
	 public int hap() {
		 return 10;
	 }
	 */
	
	// static 없어도 static 취급을 한다.
	public int eng1 = 100;			// 맴버변수, 클래스변수(전역변수)
	public static int eng2 = 100;	// 멤버변수, 클래스변수(전역변수)
}
