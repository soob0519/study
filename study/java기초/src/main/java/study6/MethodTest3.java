package study6;

public class MethodTest3 {

	public static void main(String[] args) {
		// MethodTest2.lotto();
		System.out.println(" = 멍멍이 정보 = ");
		AnimalCry.dog();
		System.out.println();
		AnimalSpeed.dog();
		System.out.println();
		
		System.out.println(" = 냥냥이 정보 = ");
		AnimalCry.cat();
		System.out.println();
		AnimalSpeed.cat();
		System.out.println();
		
		System.out.println("= 멍멍이와 냥냥이의  스피드차이=");
		
		int cat_speed = AnimalSpeed.catspeed();
		int dog_speed = AnimalSpeed.dogspeed();
		
		System.out.println("차이는 "+(dog_speed-cat_speed)+"입니다.");
		
		System.out.println(Math.random());
		
		
		
		
	}

}
