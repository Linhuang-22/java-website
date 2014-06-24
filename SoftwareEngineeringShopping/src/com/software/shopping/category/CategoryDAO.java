package com.software.shopping.category;

import java.sql.*;
import java.util.List;

import com.software.shopping.util.DB;

public class CategoryDAO {
	public static void save(Category c){
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql ="";
			if (c.getId() == -1){
				sql = "insert into category values(null,?,?,?,?,?)";
			}else {
				sql = "insert into category values(" + c.getId() + ",?,?,?,?,?)";
			}
			pstmt=DB.prepare(conn, sql);
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getDescr());
			pstmt.setInt(3, c.getPid());
			pstmt.setInt(4, c.isLeaf()?0:1);
			pstmt.setInt(5, c.getGrade());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
	
	public static void getCategories(List<Category> list,int id){
		Connection conn = null;
		try {
			conn = DB.getConn();
			getCategories(conn,list,id);
		}finally{
			DB.closeConn(conn);
		}
	}
	
	private static void getCategories(Connection conn, List<Category> list,int id){
		ResultSet rs = null;
		try {
			String sql ="select * from category where pid = " + id;
			rs=DB.executeQuery(conn, sql);
			while(rs.next()){
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("isleaft") == 0 ? true : false);
				c.setGrade(rs.getInt("grade"));
				list.add(c);
				if (!c.isLeaf()){
					getCategories(list,c.getId());
				}
			}
		
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally{
			DB.closeRs(rs);
		}
	}

	public static void addChildCategory(int pid, String name, String descr) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			conn.setAutoCommit(false);
			
			rs=DB.executeQuery(conn, "select * from category where id = " + pid);
			int parentGrade=0;
			if(rs.next())
				parentGrade = rs.getInt("grade");
			String sql ="insert into category values(null, ?, ?, ?, ?, ?)";
			
			pstmt=DB.prepare(conn, sql);
			pstmt.setString(1, name);
			pstmt.setString(2, descr);
			pstmt.setInt(3, pid);
			pstmt.setInt(4, 0);
			pstmt.setInt(5,parentGrade+1 );
			pstmt.executeUpdate();
			
			DB.executeUpdate1(conn, "update category set isleaft = 1 where id = " + pid);
		
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			DB.closeRs(rs);
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}

	public static Category loadById(int id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		Category c = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			rs=DB.executeQuery(conn, "select * from category where id = " + id);
			if (rs.next()){
				c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("isleaft") == 0 ? true : false);
				c.setGrade(rs.getInt("grade"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		
		return c;
	}

	public static void delete(int id,int pid) {
		Connection conn = null;
		Statement stmt=null;
		ResultSet rs = null;
		ResultSet rss = null;
		
		try {
			conn = DB.getConn();
			String sql ="select * from category where pid = " + id;
			rs=DB.executeQuery(conn, sql);
			
			stmt = DB.getStatement(conn);
			
			//先删除掉所有子节点
			while(rs.next()){
				int idd=rs.getInt("id");
				boolean leaf=rs.getInt("isleaft") == 0 ? true : false;
				int pidd=rs.getInt("pid");
						
				if (leaf){
					stmt.executeUpdate("delete from category where id="+idd);
				}else{
					CategoryDAO.delete(idd,pidd);
				}
			}
			
			//最后删除自己
			stmt.executeUpdate("delete from category where id="+id);
			
			//如果删除掉的节点的父节点没有子节点了，把父节点的isleaft设置为0
			String sqll="select * from category where pid = " + pid;
			rss=DB.executeQuery(conn, sqll);
			if(!rss.next()){
				DB.executeUpdate1(conn, "update category set isleaft = 0 where id = " + pid);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
		
	}

	public static void update(int id, String name, String descr) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "update category set name = ?, descr = ? where id =" + id;
			pstmt=DB.prepare(conn, sql);
			pstmt.setString(1, name);
			pstmt.setString(2, descr);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
	
	
	
}
