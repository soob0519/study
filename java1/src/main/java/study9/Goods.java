package study9;

abstract class GoodsInfo {
	private int quantity; // private int quantity = 0; 
	abstract public void quantityUp(int n);
	abstract public void quantityDown(int n);
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public void quantityZero() {
		quantity = 0;
	}	
}



public class Goods extends GoodsInfo {
	
	public void quantityUp(int n) {
		int quantity = getQuantity();
		quantity += n;
		setQuantity(quantity);
	}
	
	public void quantityDown(int n) {
		int quantity = getQuantity();
		quantity -= n;
		setQuantity(quantity);
	}
		
	public static void main(String[] args) {
		Goods g = new Goods();
		System.out.println("잔량: "+g.getQuantity()); // 0
		g.quantityUp(100);
		System.out.println("잔량: "+g.getQuantity()); // 100
		g.quantityDown(50);
		System.out.println("잔량: "+g.getQuantity()); // 50
		g.quantityZero();
		System.out.println("잔량: "+g.getQuantity());
		

	}

}
