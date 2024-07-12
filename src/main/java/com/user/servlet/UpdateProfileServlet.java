package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DB;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			
			UserDAOImpl dao = new UserDAOImpl(DB.getConn());
			
			HttpSession session = req.getSession();
			boolean f = dao.checkPassword(id, password);
			if(f) {
				
				boolean f2 = dao.updateProfile(us);
				if(f2) {
					session.setAttribute("succMsg","Updated Successfully  Please Login Again");
					resp.sendRedirect("edit_profile.jsp");
				}else {
					session.setAttribute("failedMsg","Something wrong on server");
					resp.sendRedirect("eidt_profile.jsp");
				}
				
			}else {
				session.setAttribute("failedMsg","Password is Incorrect");
				resp.sendRedirect("edit_profile.jsp");
			}
			
			
			
//		
		}catch(Exception e) {
				e.printStackTrace();
		}
	}
	
}
