package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DAO.BookOrderImpl;
import com.DB.DB;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/delete_order")
public class DeleteOrder extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			String email = req.getParameter("email");
			BookOrderImpl dao = new BookOrderImpl(DB.getConn());
			String oid = req.getParameter("oid");
			System.out.println("Email :-" +email + " oid :-" + oid);
			
			boolean f = dao.deleteOrder(email, oid);
			
			if(f) {
				session.setAttribute("succMsg", " Order Delete Successfully");
				resp.sendRedirect("MyOrder.jsp");
				
			}
			else {
				session.setAttribute("failedMsg", "Something went wrong !");
				resp.sendRedirect("MyOrder.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
