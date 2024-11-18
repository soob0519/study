package jsp_project1;

public class TEST1 {

	public static void main(String[] args) {
		
		int hap = 0;
		int cnt2 = 0;
		
		double avg = (double)hap/cnt2;
		
		System.out.println(avg);
		
		String[] s1 = (avg+"").split("\\.");
		System.out.println(s1);
		// int s2 = Integer.parseInt(s1[0]);
		// boolean s3 = s1[1].equals("0");
		

	}

}
