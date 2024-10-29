package study9;

public class EmpInfo extends DeptInfo {
	
	// 생성자
	public EmpInfo(){
		System.out.println("= 사원정보 입력/출력 =");
	}
	
	private String job;
	private String empName;
	private String hiredate;
	private int pay;
	
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	
	// 다형성(오버라이딩)
	public void input(String[] empAr) {
		this.setDeptName(empAr[0]);
		this.setDeptLoc(empAr[1]);
		this.setJob(empAr[2]);
		this.setEmpName(empAr[3]);
		this.setHiredate(empAr[4]);
		this.setPay(Integer.parseInt(empAr[5]));
	}
	
	public static void main(String[] args) {
		
	// 참조클래스 참조변수 = new 생성자;
		EmpInfo emp = new EmpInfo();
		String[] empAr = new String[6]; // 배열개수
		
		empAr[0] = "개발부";
		empAr[1] = "서울 강남부";
		empAr[2] = "개발자";
		empAr[3] = "홍길동";
		empAr[4] = "2015-01-05";
		empAr[5] = "6000";
		
		emp.input(empAr);	
	}
	
}
