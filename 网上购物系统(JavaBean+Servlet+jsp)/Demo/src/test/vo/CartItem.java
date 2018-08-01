package test.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class CartItem implements Serializable {
	private Map itemMap = new HashMap();
	private BookInfo book;
	private int num;
	private double subPrice;
	private Collection items;

	public double getSubPrice() {
		return this.book.getPrice() * num;
	}

	public void setSubPrice(double subPrice) {
		this.subPrice = subPrice;
	}

	public BookInfo getBook() {
		return book;
	}

	public void setBook(BookInfo book) {
		this.book = book;
	}

	public CartItem(BookInfo book, int num) {
		this.book = book;
		this.num = num;

	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public CartItem() {
	}

	public Iterator getAllCartItem() {
		return itemMap.values().iterator();
	}

	public Collection getItems() {
		return itemMap.values();
	}

	public void setItems(Collection items) {
		this.items = items;
	}

	public ArrayList getItemList(Map map) {
		ArrayList l = new ArrayList();
		Iterator iter = map.values().iterator();
		while (iter.hasNext()) {
			CartItem cart = (CartItem) iter.next();
			Orderdetails od = new Orderdetails();
			od.setBname(cart.getBook().getBname());
			od.setPrice(cart.getBook().getPrice());
			od.setNum(cart.getNum());
			l.add(od);
		}
		return l;
	}
}
