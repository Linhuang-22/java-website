package com.software.shopping.order;

import java.sql.*;
import java.util.List;

import com.software.shopping.cart.Cart;
import com.software.shopping.user1.User;

public class SalesOrder {
	int id;
	User user;
	String addr;
	Timestamp oDate;
	int status;
	Cart cart;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User u) {
		this.user = u;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Timestamp getODate() {
		return oDate;
	}

	public void setODate(Timestamp oDate) {
		this.oDate = oDate;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart c) {
		this.cart = c;
	}

	public void save() {
		OrderMgr.getInstance().saveOrder(this);
	}
	
	public List<SalesItem> getItems()
	{
		return OrderMgr.getInstance().getSalesItems(this);
	}
	
	public void updateStatus()
	{
		OrderMgr.getInstance().updateStatus(this);
	}
}
