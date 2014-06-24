package com.software.shopping.order;

import java.sql.Date;
import java.util.List;

import com.software.shopping.user1.User;
import com.software.shopping.cart.*;

public class SalesOrder {
	private int id;

	private User user;

	private String addr;

	private String oDate;

	private int status;

	private List<SalesItem> items;

	Cart cart;
	
	public Cart getCart() {
		return cart;
	}
	
	public void setCart(Cart c) {
		this.cart = c;
	}
	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<SalesItem> getItems() {
		return items;
	}

	public void setItems(List<SalesItem> items) {
		this.items = items;
	}

	public String getODate() {
		return oDate;
	}

	public void setODate(String date) {
		
		oDate = date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public void updateStatus() {
		OrderMgr.getInstance().updateStatus(this);
	}
	
	public void save() {
		OrderMgr.getInstance().saveOrder(this);
	}
	
	

}
