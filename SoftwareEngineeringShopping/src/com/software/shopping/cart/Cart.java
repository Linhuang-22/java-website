package com.software.shopping.cart;

import java.util.ArrayList;
import java.util.List;

import com.sun.mail.imap.protocol.Item;

public class Cart {
	private List<CartItem> items = new ArrayList<CartItem>();
	
	public List<CartItem> getItems(){
		return items;		
	}
	
	public void setItems(List<CartItem> items){
		this.items = items;		
	}
	
	public void add(CartItem item){
		for(int i = 0; i < items.size(); i ++)
		{
			CartItem ci = items.get(i);
			if(ci.getProductId() == item.getProductId()){
				ci.setCount(ci.getCount() + 1);
				return;
			}
		}
		items.add(item);
	}
	
	public double getTotalPrice(){
		double totalPrice = 0.0;
		for(int i = 0; i < items.size(); i ++)
		{
			CartItem ci = items.get(i);
			totalPrice += ci.getTotalPrice();
		}
		return totalPrice;
	}
	
}
