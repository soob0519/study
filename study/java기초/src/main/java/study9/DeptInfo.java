package study9;

public class DeptInfo extends ComInfo {
	private String deptName;
	private String deptLoc;
	
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptLoc() {
		return deptLoc;
	}
	public void setDeptLoc(String deptLoc) {
		this.deptLoc = deptLoc;
	}
	
	public void input(String[] empAr) {
		this.setDeptName(empAr[0]);
		this.setDeptLoc(empAr[1]);
		
	}
	
	
}
