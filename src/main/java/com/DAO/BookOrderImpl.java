package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
import com.entity.Book_Order;

public class BookOrderImpl implements BookOrderDAO{
	private Connection conn;

	public BookOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	

	@Override
	public boolean saveOrder(List<Book_Order> blist) {
		
		boolean f = false;
		try {
			
			String sql = "insert into book_order(order_id,user_name,email,address,phno,book_name,author,price,payment) values (?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for(Book_Order b :blist) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFullAddr());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch();
				
				
			}
			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}



	@Override
	public List<Book_Order> getOrderDetails() {
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order o = null;
		try {
			
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
//				o = new BookDetails(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
				o = new Book_Order();
//				System.out.print(b);
				o.setOrderId(rs.getString(2));
				o.setName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAddr(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
//				System.out.println("list:"+list);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}



	@Override
	public List getOrderByUser(String email) {
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order o = null;
		try {
			
			String sql = "select * from book_order where email = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
//				o = new BookDetails(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
				o = new Book_Order();
//				System.out.print(b);
				o.setOrderId(rs.getString(2));
				o.setName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAddr(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
//				System.out.println("list:"+list);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}



	@Override
	public boolean deleteOrder(String email, String oid) {
		Boolean f = false;
		
		try {
			String sql = "delete from book_order where email=? and order_id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, oid);
			
			
			int i = ps.executeUpdate();	
			if(i==1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	
	
}
