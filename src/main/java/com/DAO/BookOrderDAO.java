package com.DAO;

import java.util.List;

import com.entity.Book_Order;

public interface BookOrderDAO {
	
	public boolean saveOrder(List<Book_Order> blist);
	public List getOrderDetails();
	public List getOrderByUser(String email);
	public boolean deleteOrder(String email, String oid);
}
