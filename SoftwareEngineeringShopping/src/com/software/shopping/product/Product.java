package com.software.shopping.product;

import com.software.shopping.category.*;

public class Product {
	int id;
	String name;
	String descr;
	double normalPrice;
	double memberPrice;
	String pdate;
	int categoryId;
	
	Category category;


	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescr() {
		return descr;
	}
	
	public void setDescr(String descr) {
		this.descr = descr;
	}
	
	public double getNormalPrice() {
		return normalPrice;
	}
	
	public void setNormalPrice(double normalPrice) {
		this.normalPrice = normalPrice;
	}
	
	public double getMemberPrice() {
		return memberPrice;
	}
	
	public void setMemberPrice(double memberPrice) {
		this.memberPrice = memberPrice;
	}
	
	public String getPdate() {
		return pdate;
	}
	
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	
	public int getCategoryId() {
		return categoryId;
	}
	
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	
}
