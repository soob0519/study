package study7;

public class Books {
	
	String bookName = "JSP기초";
	
	public Books() {
		System.out.println("한빛미디어");
	}
	
	public Books(String name) {
		bookName = name;
	}
	
	public static void main(String[] args) {

		Books b1 = new Books();
		System.out.println(b1.bookName);
		
		Books b2 = new Books("JAVA교재");
		System.out.println(b2.bookName);
		
		// Books b3 = new Books(1000); // error

	}

}
