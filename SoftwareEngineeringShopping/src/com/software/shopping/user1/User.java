package com.software.shopping.user1;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.software.shopping.util.DB;

import com.software.shopping.cart.Cart;
import com.software.shopping.cart.CartItem;
import com.software.shopping.order.OrderMgr;
import com.software.shopping.order.SalesItem;
import com.software.shopping.order.SalesOrder;


public class User {
	private int id;

	private String username;

	private String password;

	private String phone;

	private String addr;

	private String rdate;

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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	
	public void save(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "insert into user values(null,?,?,?,?,?)";
			pstmt=DB.prepare(conn, sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, phone);
			pstmt.setString(4, addr);
			pstmt.setString(5, rdate);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}

	public static List<User> getUsers(){
		List<User> list = new ArrayList<User>();
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql="select * from user";
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("ID"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getString("rdate"));
				list.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return list;
	}
	
	public static void deleteUser(int id){
		Connection conn = null;
		Statement stmt=null;
		try {
			conn = DB.getConn();
			stmt = DB.getStatement(conn);
			stmt.executeUpdate("delete from user where id="+id);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
	}
	
	/*
	public static boolean userExists(String username){
		return false;
	}
	
	public static boolean isPasswordCorrect(String username,String password){
		return false;
		
	}
	*/
	
	public static User validate(String username,String password) throws UserNotFoundException, PasswordNotCorrectException{
		//判断登陆时用户名是否存在及用户密码是否正确
		Connection conn = null;
		ResultSet rs = null;
		User u = null;
		try {
			conn = DB.getConn();
			String sql="select * from user where username = '" + username + "'";
			rs = DB.executeQuery(conn, sql);
			if (!rs.next()){
				throw new UserNotFoundException();
			} else if(!rs.getString("password").equalsIgnoreCase(password) ){
				throw new PasswordNotCorrectException();
			} else {
				u=new User();
				u.setId(rs.getInt("ID"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getString("rdate"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		
		return u;
	}
	
	public void update(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "update user set username = ?, phone = ?, addr = ? where id =" + this.id;
			pstmt=DB.prepare(conn, sql);
			pstmt.setString(1, username);
			pstmt.setString(2, phone);
			pstmt.setString(3, addr);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
	
	public int buy(Cart c) {
		SalesOrder so = new SalesOrder();
		so.setUser(this);
		so.setAddr(this.getAddr());
		so.setStatus(0);
		
		so.setODate("2014-11-11");
		List<SalesItem> salesItems = new ArrayList<SalesItem>();
		List<CartItem> cartItems = c.getItems();
		for(int i=0; i<cartItems.size(); i++) {
			SalesItem si = new SalesItem();
			CartItem ci = cartItems.get(i);
			si.setProduct(ci.getProduct());
			si.setCount(ci.getCount());
			si.setUnitPrice(ci.getProduct().getMemberPrice());
			salesItems.add(si);
		}
		so.setItems(salesItems);
		return OrderMgr.getInstance().add(so); 
	}

}
