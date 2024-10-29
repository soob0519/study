package dept;

public class Test1 {

	public static void main(String[] args) {
		String[] a1 = {"aa","bb","cc"};
		String[] b1 = new String[4];
		
		if(a1.length < 4) {
			b1[3] = "";
		} else {
			b1[3]=a1[3];
		}
		
		for(int i = 0; i<b1.length; i++) {
			if(a1.length < b1.length) {
				
			}
			b1[i] = a1[i];
		}
		
		a1[0] = "aa100";
		
		System.out.println(a1[3]);

	}

}
