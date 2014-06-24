package com.software.shopping.cart;
import com.software.shopping.product.Product;

public class CartItem {
	int productId;
	int count;
	double price;
	private Product product;
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public double getTotalPrice(){
		return price*count;
	}

	public Product getProduct() {
		return product;
	}
}
