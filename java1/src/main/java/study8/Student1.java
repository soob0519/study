package study8;

class Person1{
	private int age;			// 멤버변수, 인스턴스(객체)변수
	private String name;
	private int height;
	private int weight;
	
	public static int year; // 멤버변수, 클래스(전역)변수
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getHeight() {
		return height;
	}
	
	public void setHeight(int height) {
		this.height = height;
	}
	
	public int getWeight() {
		return weight;
	}
	
	public void setWeight(int weight) { // 변수에 값을 세팅하는 메소드 // 매개변수
		if(weight <0 || weight > 300) weight = 0;
		// 실행중인 개체 this >> 객체변수
		this.weight = weight;
	}
	
	
}


public class Student1 {

	public static void main(String[] args) {
		
	//참조클래스 참조변수 = 객체키워드 생성자; 
		Person1 s1 = new Person1(); // 생성자가 들어간 클래스를 객체처리 한다
		// 참조변수 (s1) >> 메모리의 위치 정보
		// 참조클래스 (Person1) >> 실제로 변수( s1.name, s1.height )가 존재하는지 확인 하기 위한 참조 클래스
		// 참조클래스에 변수가 존재하지 않으면 메모리의 위치로 가지 않는다.
		
		s1.setName("홍길동");
		s1.setAge(30);
		s1.setHeight(170);
		// s1.weight = 70;
		s1.setWeight(70);
		System.out.println(s1.getName());
		// System.out.println(s1.weight);
		System.out.println(s1.getAge()+"세");
		System.out.println(s1.getWeight()+"kg");
		
		

	}

}
