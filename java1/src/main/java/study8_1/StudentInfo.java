package study8_1;

public class StudentInfo extends StudentVO {
	
	public int sum() {
		return getEng()+ getKor();
	}
	
	public int avg() {
		return (getEng()+ getKor())/2;
	}
	
	public static void main(String[] args) {
		StudentInfo s1 = new StudentInfo();
		
		s1.setName("김철수");
		s1.setYear(1);
		s1.setEng(90);
		s1.setKor(80);
		
		System.out.println(s1.getName());
		System.out.println(s1.getYear());
		System.out.println(s1.sum());
		System.out.println(s1.avg());
		
		
		
		
	}

}
