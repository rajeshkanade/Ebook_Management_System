package com.user.servlet;

import java.io.IOException; 

//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



import com.DAO.CartDAOImpl;
import com.DB.DB;


@WebServlet("/removeBook")
public class RemoveBookCartServlet extends HttpServlet{

	


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));
		
			CartDAOImpl dao = new CartDAOImpl(DB.getConn());
			boolean f = dao.deleteBook(bid,uid,cid);
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Book Removed from Cart");
				resp.sendRedirect("checkout.jsp");
				
			}
			else {
				session.setAttribute("failedMsg", "Something Wrong");
				resp.sendRedirect("checkout.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
}
