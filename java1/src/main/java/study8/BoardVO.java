package study8;

public class BoardVO {
	//제목 암호 이름 내용 등록일 조회수
	
	private String title;
	private String pass;
	private String name;
	private String content;
	private String rdate;
	private int hits;
	
	// GET :: 값을 전달하는 목적
	// Set :: 객체변수에게 값을 저장
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getPass() {
		return pass;
	}
	
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getRdate() {
		return rdate;
	}
	
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	public int getHits() {
		return hits;
	}
	
	public void setHits(int hits) {
		this.hits = hits;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
