package study7;
/*
* 객체지향의 4대요소인 다형성(오버로딩-단일클래스에서 같은 이름의 메소드 생성을 의미)
*/
public class SampleSum {
	
	// 보이지 않지만 디폴트로 가지고 있음
	// 생성자
	// 클래스명과 동일한 이름의 메소드
	// 객체생성(new)시 자동 실행
	// 일반 메소드처럼 호출해서 사용 불가
	SampleSum(){
		System.out.println("= 객체처리 진행 111=");
	}
	
	SampleSum(String a){
		System.out.println("= 객체처리 진행 222=");
	}
	
	public void sum() {	}
	
	/*
	public void sum() { -- 동일한 이름으로 생성불가
		System.out.println(30+50);
	}
	public int sum() { -- 리턴타입과 무관하게 동일한 이름으로 생성불가
		return a+b;
	}
	public void sum(int y) { // 매개변수 타입이 다른 경우만 동일한 이름 가능
		System.out.println(a+b+x);
	}
	*/
	public void sum(int a) { // 매개변수가 다른 경우 동일한 이름 가능
		System.out.println(a);
	}
	public void sum(int a, int b) { // 매개변수의 갯수가 다른 경우 동일한 이름 가능
		System.out.println(a+b);
	}
	public void sum(int a, int b, int c) { // 매개변수의 갯수가 다른 경우 동일한 이름 가능
		System.out.println(a+b+c);
	}
	
	public void sum(double a) {
		System.out.println(a);
	}
	public void sum(double a, double b) { 
		System.out.println(a+b);
	}
	public void sum(double a, double b, double c) {
		System.out.println(a+b+c);
	}
	
	public void sum(String a) {
		System.out.println(a);
	}
	public void sum(String a, String b) { 
		System.out.println(a+b);
	}
	
	public void sum(int[] a) {
		int sum = 0;
		for(int i=0; i<a.length; i++) {
			sum += a[i];
		}
		
		System.out.println("배열의 합계:"+sum);
	}
	
	
	
	
	
	
}
