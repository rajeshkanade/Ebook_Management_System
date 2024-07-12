package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class BookDAOImpl implements BookDAO {

	
	

	
	private Connection conn;
	
	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;}
	
	@Override
	public boolean addBooks(BookDetails b) {
		boolean f = false;
		
		try {
			
			String sql = "insert into book_details(bookname,author,price,bookCategory,status,photo,email)values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());
			
			int i = ps.executeUpdate();
			
			if(i ==1) {
				f = true;
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	@Override
	public List<BookDetails> getAllBooks() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			
			String sql = "select * from book_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new BookDetails(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
//				System.out.print(b);
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
//				System.out.println("list:"+list);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
		
	}

	@Override
	public BookDetails getBookById(int id) {
		BookDetails b = null;
		try {
			String sql = "Select * from book_details where bookId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new BookDetails(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean updateEditBooks(BookDetails b) {
		boolean f = false;
		
		try {
			String sql = "update book_details set bookname = ? , author = ? , price = ? , status = ? where bookId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			
			String sql = "delete from book_details where bookId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();		}
		return f;
	}
	@Override
	public List<BookDetails> getNewBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where bookCategory = ? and status = ? order by bookId DESC";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"new");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while(rs.next() && i <= 4) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getRecentBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where status = ? order by bookId DESC";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while(rs.next() && i <= 4) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<BookDetails> getOldBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where bookCategory = ? and status = ? order by bookId DESC";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "old");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while(rs.next() && i <= 4) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println(list);
		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where status = ? order by bookId DESC";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next() ) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllNewBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where bookCategory = ? and status = ? order by bookId DESC";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"new");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where bookCategory = ? and status = ? order by bookId DESC";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "old");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println(list);
		return list;
	}

	@Override
	public List<BookDetails> getBookByOld(String email, String Category) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where bookCategory = ? and email = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, Category);
			ps.setString(2, email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				System.out.println("list here : " + list);
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String Category , int bid) {
		boolean f = false;
		
		try {
			
			String sql = "delete from book_details where email = ? and bookCategory = ? and bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2,Category);
			ps.setInt(3,bid);
			
			int i = ps.executeUpdate()	;
			if(i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	@Override
	public List<BookDetails> getBookBySearch(String ch) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "SELECT * \r\n"
					+ "FROM book_details \r\n"
					+ "WHERE (bookName LIKE ? OR author LIKE ? OR bookCategory LIKE ?) AND Status = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				System.out.println("list here : " + list);
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} 

	

}
