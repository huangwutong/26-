package BookShop;

public class Ware{
	
	private String id;
	private String name;
	private int quantity;
	private float price;
	private float countprice;
	
	public Ware(){
		id="";
		price=0;
		quantity=0;
		countprice=0;
	}
	public void setId (String id){
		this.id=id;
	}
	public String getId(){
		return id;
	}
	public void setName (String name){
		this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setCountprice(float countprice){
		this.countprice=countprice;
	}
	public float getCountprice(){
		return countprice;
	}
	public void setPrice(float price){
		this.price=price;
	}
	public float getPrice(){
		return price;
	}
	public void setQuantity (int quantity){
		this.quantity=quantity;
	}
	public int getQuantity(){
		return quantity;
	}
}
