package com.software.shopping.product;

import java.util.Date;
import java.util.List;

public interface ProductDAO {
	public List<Product> getProducts();
	
	public List<Product> getProducts(int pageNo, int pageSize) ;
	//������𣨿ɶ��֣����ҡ��������ֲ��ң������������ң����ݼ۸��������
	public int findProducts(List<Product> list, int[] categoryId, 
			                          String keyword, 
			                          double lowNormalPrice, 
			                          double highNormalPrice,
			                          double lowMemberPrice, 
			                          double highMemberPrice,
			                          Date startDate,
			                          Date endDate,
			                          int pageNo,
			                          int pageSize);
	
	public boolean deleteProductsByCategoryId( int categoryId);
	
	public boolean deleteProductsById(int[] idArray);
	
	public boolean updateProduct(Product p);
	
	public boolean addProduct(Product p);

	public int getProducts(List<Product> products, int pageNo, int pageSize);

	public Product loadById(int id);

}
