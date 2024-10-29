package study7;

public class Test3 {
	
	int year = 2024;
	
	Test3(){
		
	}
	// 오버로딩된 생성자가 생겨난 경우 -> 디폴트인 기본 생성자는 생겨나지 않음
	
	Test3(int a){
		year = a;
	}
	
	public static void main(String[] args) {
		
		// Test3 t1 = new Test3();
		
		Test3 t3 = new Test3(2025);
		System.out.println(t3.year);

	}

}
