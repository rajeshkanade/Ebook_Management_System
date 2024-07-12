package com.user.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.Part;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DB;
import com.entity.BookDetails;


@WebServlet("/sell_book")
@MultipartConfig
public class AddOldBook extends HttpServlet{
	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			

			try {
				
				String bookName = req.getParameter("bname");
				String author = req.getParameter("author");
				String price = req.getParameter("price");
				String categories = "old";
				String status = "Active";
				Part part = req.getPart("bimg");
				String fileName = part.getSubmittedFileName();
				
				String user = req.getParameter("user");
				
				BookDetails b = new BookDetails(bookName , author , price , categories , status , fileName,user);
				
				BookDAOImpl dao = new BookDAOImpl(DB.getConn());
				
				
				
				
				boolean f = dao.addBooks(b);
				
				HttpSession session = req.getSession();
				
				
				
				if(f) {
					
					
					String imageFileName = part.getSubmittedFileName();
//					System.out.println(imageFileName);
//					
					String uploadPath = "E:/Users/HP/eclipse-workspace/Ebook-App/src/main/webapp/bookImg/" + imageFileName;
					System.out.println(uploadPath);
					
					try {
						
					FileOutputStream fos = new FileOutputStream(uploadPath);
					InputStream is = part.getInputStream();
					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();
					}catch(Exception e) {
						e.printStackTrace();
					}
					
//					String path = getServletContext().getRealPath("") +"book"; // used to get the path of folder where we want to store img 
//					System.out.println(path);
//					File file = new File(path); // this is created to access the path of folder
//					part.write(path + File.separator + fileName); // due to this we can store the img to the path using similar file name
//					System.out.println(path);				
					session.setAttribute("succMsg", "Book Added Sucessfully");
					resp.sendRedirect("sell_book.jsp");
				}
				else {
					session.setAttribute("faliedMsg", "Something wrong on Server");
					resp.sendRedirect("sell_book.jsp");
				}
				
				System.out.println(b);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
}
