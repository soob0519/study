package donghwa.service;

public class ScheduleVO {
	
	private int unq;		// 맴버변수 인스턴스 객체변수
	private String schdt;
	private String title;
	private String cont;
	private String userid;
	private String regdt;
	private String upddt;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getUnq() {
		return unq;
	}
	public void setUnq(int unq) {
		this.unq = unq;
	}
	public String getSchdt() {
		return schdt;
	}
	public void setSchdt(String schdt) {
		this.schdt = schdt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	
	public String getRegdt() {
		return regdt;
	}
	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}
	public String getUpddt() {
		return upddt;
	}
	public void setUpddt(String upddt) {
		this.upddt = upddt;
	}
	
}