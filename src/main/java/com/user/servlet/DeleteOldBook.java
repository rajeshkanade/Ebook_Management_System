package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;

import com.DAO.BookDAOImpl;
import com.DB.DB;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/delete_old_book")

public class DeleteOldBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String email = req.getParameter("email");
			BookDAOImpl dao = new BookDAOImpl(DB.getConn());
			int bid = Integer.parseInt(req.getParameter("bid"));
			
			boolean f = dao.oldBookDelete(email, "old" , bid);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Old Book Delete Successfully");
				resp.sendRedirect("old_book.jsp");
				
			}
			else {
				session.setAttribute("failedMsg", "Something went wrong !");
				resp.sendRedirect("old_book.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
