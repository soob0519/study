package study8;

public class HotelColtrol extends HotelInfo {
	
	String hotelLoc;
	
	public void input(String name,
						int roomNumber,
						int roomPrice,
						int roomSize,
						int roomAcc,
						String hotelLoc) {
		this.name = name;
		this.roomNumber = roomNumber;
		this.roomPrice = roomPrice;
		this.roomSize = roomSize;
		this.roomAcc = roomAcc;
		this.hotelLoc = hotelLoc;
	}
	
	public void print() {
		System.out.println("호텔명: "+name);
		System.out.println("호텔 위치: "+hotelLoc);
		System.out.println("방번호: "+roomNumber);
		System.out.println("방가격: "+roomPrice);
	}
	
	
	public static void main(String[] args) {
		
		HotelColtrol hc = new HotelColtrol();
		
		hc.input("하이미디어", 101, 150000, 30, 5, "서울시 강남구");
		hc.print();
		/*
		hc.name = "하이미디어";
		hc.roomNumber = 101;
		hc.roomPrice = 150000;
		hc.roomSize = 30;
		hc.roomAcc = 5;
		hc.hotelLoc = "서울시 강남구";
		 */
		

	}

}
