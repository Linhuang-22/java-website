package com.software.shopping.category;


import java.util.*;



public class Category {
	
	private int id;

	private String name;

	private String descr;

	private int pid;

	private boolean leaf;

	private int grade;
	
	
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

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public boolean isLeaf() {
		return leaf;
	}

	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public void addChild(Category c){
		Category.addChildCategory(id, c.getName(), c.getDescr());
	}
	
	public static void add(Category c){
		CategoryDAO.save(c);
	}
	
	public void delete() {
		CategoryDAO.delete(this.id,this.pid);
	}
	
	
	public static void addTopCategory(String name,String descr){
		/*
		Category c = new Category();
		c.setId(-1);
		c.setName(name);
		c.setDescr(descr);
		c.setPid(0);  //0表示是根上的
		c.setLeaf(true);  //是叶子节点
		c.setGrade(1);  //最根上的，第一级
		CategoryDAO.save(c);
		*/
		addChildCategory(0,name,descr);
	}
	
	public static void addChildCategory(int pid, String name,String descr){
		CategoryDAO.addChildCategory(pid,name,descr);
	}
	
	public static List<Category> getCategories(){
		List<Category> list = new ArrayList<Category>();
		CategoryDAO.getCategories(list,0);  //把0下的分类全部取出，放入list
		return list;
		
	}
	
	public static Category loadById(int id){
		return CategoryDAO.loadById(id);
	}
	
	public void update(){
		CategoryDAO.update(this.id,this.name,this.descr);
	}
	
	/*
	public static boolean isLeaf(int id) {
		return false;
	}
	*/
}
