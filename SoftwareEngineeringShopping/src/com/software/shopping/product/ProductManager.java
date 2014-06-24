package com.software.shopping.product;

import java.util.Date;
import java.util.List;

public class ProductManager {
	
	ProductDAO dao = null;
	
	private static ProductManager pm = null;
	private int pageCount = 0;
	

	static {
		if (pm == null){
			pm = new ProductManager();
			pm.setDao(new ProductMysqlDAO());
		}
	}
	
	private ProductManager(){
		
	}
	
	public static ProductManager getInstance(){
		return pm;
	}
	
	public ProductDAO getDao() {
		return dao;
	}

	public void setDao(ProductDAO dao) {
		this.dao = dao;
	}
	
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public List<Product> getProducts() {
		return dao.getProducts();
	}
	
	public List<Product> getProducts(int pageNo, int pageSize) {
		return dao.getProducts(pageNo, pageSize);
	}
	
	/**
	 * 
	 * @param products
	 * @param pageNo
	 * @param pageSize
	 * @return page counts of the specified pageSize
	 */
	public int getProducts(List<Product> products,int pageNo, int pageSize){
		return dao.getProducts(products,pageNo, pageSize);
	}
	
	//根据类别（可多种）查找、根据名字查找，根据描述查找，根据价格区间查找
	public int findProducts(List<Product> list, int[] categoryId, 
			                          String keyword, 
			                          double lowNormalPrice, 
			                          double highNormalPrice,
			                          double lowMemberPrice, 
			                          double highMemberPrice,
			                          Date startDate,
			                          Date endDate,
			                          int pageNo,
			                          int pageSize) {
		//注意将数据库里的date是String类型，拿出来的时候要转化为Date类型
		return dao.findProducts(list, categoryId, keyword, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, pageNo, pageSize);
	} 
	
	public List<Product> findProductsByCategoryId(int[] categoryId) {
		return null;
	} 
	
	public List<Product> findProductsByName( String name) {
			return null;
	} 
	
	public List<Product> findProductsByDescr( String descr) {
		return null;
	}
	
	public List<Product> findProductsByNormalPri( double lowNormalPrice, double highNormalPrice) {
		return null;
	}
	
	public List<Product> findProductsByMembrePri( double lowMemberPrice, double highMemberPrice) {
		return null;
	}
	
	public List<Product> findProductsByMembrePri( Date startDate,Date endDate) {
		//注意将数据库里的date是String类型，拿出来的时候要转化为Date类型
		return null;
	}
	
	public boolean deleteProductsByCategoryId( int categoryId){
		return  false;
	}
	
	public boolean deleteProductsById(int[] idArray){
		return false;
	}
	
	public boolean updateProduct(Product p){
		return dao.updateProduct(p);
	}
	
	public boolean addProduct(Product p){
		return dao.addProduct(p);
	}
	
	public Product loadById(int id) {
		System.out.println("huhuhh");
		return dao.loadById(id);
	}
	
}
