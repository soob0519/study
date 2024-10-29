package emp;

public class Test3 {

	public static void main(String[] args) {
		String rank = "2024";
		int rank2 = 2024-Integer.parseInt(rank);

				if(rank2<2){
					rank = "신입";
				} else if(rank2>=2 && rank2<=4 ) {
					rank = "주임";
				} else if(rank2>=5 && rank2<=10 ) {
					rank = "대리";
				} else if(rank2>=11 && rank2<=15 ) {
					rank = "과장";
				} else if(rank2>=16 && rank2<=20 ) {
					rank = "차장";
				} else if(rank2>=21) {
					rank = "부장";
				}
		System.out.println(rank);
	
		
	}

}
