package bean;

import java.util.Map;

public class OrderItem {

    private int itemId;           //订单项编号
    private int cakeId;          //商品编号
    private int orderId;       //订单编号
    private int quantity;      //数量
    
    private Cake cake;
    public OrderItem() {
    }

   
    public OrderItem(Map<String, Object> map) {
		this.setOrderId((int) map.get("orderId"));
		this.setCakeId((int) map.get("cakeId"));
		this.setItemId((int) map.get("itemId"));
		this.setQuantity((int) map.get("quantity"));
	}


	public int getItemId() {
		return itemId;
	}


	public void setItemId(int itemId) {
		this.itemId = itemId;
	}


	public int getCakeId() {
		return cakeId;
	}


	public void setCakeId(int cakeId) {
		this.cakeId = cakeId;
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public Cake getCake() {
		return cake;
	}


	public void setCake(Cake cake) {
		this.cake = cake;
	}


    
}
