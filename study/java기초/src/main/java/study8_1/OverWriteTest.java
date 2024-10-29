package study8_1;

class JavaView {
	public void projectName() {
		System.out.println("자바프로젝트");
	}
	
	public String projectLocSeoul() {
		return "강남";
	}
}

class OracleView extends JavaView { // 부모(suoer)클래스 :: 자식(this)클래스
	// 다형성 (오버로딩, 오버라이딩)
	// 오버라이딩 : 상속관계에서 상위 클래스의 메소드를 같은 이름으로 재구성 하는 작업
	public void projectName() {
		System.out.println("오라클프로젝트");
	}
	
	public String projectLocBusan() {
		return "해운대";
	}
	
	public String projectLocBusan(String name) { // 오버로딩
		return name;
	}
	
	// 모든 프로젝트 이름 출력
	public void allProject() {
		super.projectName(); // 부모(상위) 클래스 불러들이는 것
		this.projectName();
	}
}


public class OverWriteTest {

	public static void main(String[] args) {
		
		OracleView v1 = new OracleView();
		v1.allProject();
		System.out.println(v1.projectLocSeoul());
		System.out.println(v1.projectLocBusan());
		System.out.println(v1.projectLocBusan("광안리"));
	}

}
