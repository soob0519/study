package study8_1;

public class CustomerMng {

	public static void main(String[] args) {
		Customer2VO vo = new Customer2VO();
		vo.setName("이방인");
		vo.setPhone("010-1111-1111");
		vo.setAge(30);
		vo.setAddr("서울 강남");
		
		System.out.println(vo.getName());
		System.out.println(vo.getAge());
		System.out.println(vo.getAddr());
		System.out.println(vo.getPhone());
	}

}
