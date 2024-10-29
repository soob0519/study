package study8;

class Person2 {
	private int age;
	private String name;
	private int height;
	private int weight;
	
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
	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	
}


public class Student2 extends Person2 {
	
	public void dateSet() {
		setHeight(170);
		setWeight(70);
	}
	
	public static void main(String[] args) {
		
		Student2 st2 = new Student2();
		
		st2.setAge(30);
		st2.setName("홍길동");
		
		st2.dateSet();
		System.out.println(st2.getName());
		System.out.println(st2.getHeight());
		
		

	}

}
