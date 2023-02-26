package bean;

import util.MathUtils;

public class CartItem {
	private Cake cake;
	private int quantity;//数量
	private double subtotal;//小计
	
	public CartItem() {}
	
	
	
	public CartItem(Cake cake, int quantity) {
		super();
		this.setCake(cake);
		this.setQuantity(quantity);
	}

	public Cake getCake() {
		return cake;
	}
	public void setCake(Cake cake) {
		this.cake = cake;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
		this.subtotal = MathUtils.getTwoDouble(quantity*cake.getPrice());
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	
	

	@Override
	public String toString() {
		return "CartItem [cake=" + cake + ", quantity=" + quantity + ", subtotal=" + subtotal + "]";
	}
	
	
	
}
