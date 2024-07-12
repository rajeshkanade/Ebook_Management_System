package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BookDAO {
	public boolean addBooks(BookDetails b);
	
	public List<BookDetails> getAllBooks();
	
	public BookDetails getBookById(int id);
	
	public boolean updateEditBooks(BookDetails b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDetails> getNewBook();
	
	public List<BookDetails> getRecentBook();
	
	public List<BookDetails> getOldBook();
	
	public List<BookDetails> getAllRecentBook();
	
	public List<BookDetails> getAllNewBook();
	
	public List<BookDetails> getAllOldBook();
	
	public List<BookDetails> getBookByOld(String email , String Category);
	
	public boolean oldBookDelete(String email,String Category , int bid);
	
	public List<BookDetails> getBookBySearch(String ch);
	
	
	
}
