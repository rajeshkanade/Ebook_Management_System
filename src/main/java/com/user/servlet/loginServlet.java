package com.user.servlet;

import java.io.IOException; 
//
//import javax.servlet.ServletException; 
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.DAO.UserDAOImpl;
//import com.DB.DB;
//import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DB;
import com.entity.User;


@WebServlet("/login")
public class loginServlet extends HttpServlet {



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDAOImpl dao = new UserDAOImpl(DB.getConn());
			HttpSession session = req.getSession();
			
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			if("rajeshkanade121@gmail.com".equals(email) && "1234".equals(password)) {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userObj", us);
				resp.sendRedirect("admin/home.jsp");
			}else {
				//System.out.println("heyy... I am here");
				User us = dao.login(email, password);
				if(us != null) {
					session.setAttribute("userObj", us);
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("failedMsg", "Email & password is Invalid");
					resp.sendRedirect("login.jsp");
				}
				resp.sendRedirect("home.jsp");
			}
			
		} catch (Exception e) {
			
		}
	}
	
}
