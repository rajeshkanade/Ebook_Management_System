package com.user.servlet;
//import javax.servlet.jsp.tagext.TagLibraryValidator;  
//import javax.servlet.jsp.tagext.ValidationMessage;
//
//import java.io.IOException;
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
//import java.sql.Connection;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DB;
import com.entity.User;
import java.sql.Connection;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
				String name = req.getParameter("fname");
				String email = req.getParameter("email");
				String phno = req.getParameter("phno");
				String password = req.getParameter("password");
				String check = req.getParameter("check");
				
				
	//			System.out.println(name + " " + email + " " + phno + " " + password + " " + " " + check);
				User us = new User();
				us.setName(name);
				us.setEmail(email);
				us.setPhno(phno);
				us.setPassword(password);
				HttpSession session = req.getSession();
				if(check != null) {
					UserDAOImpl dao = new UserDAOImpl(DB.getConn());
					boolean f = dao.userRegister(us);
					if(f) {
						//System.out.println("User Registration Successfully...");
						session.setAttribute("succMsg","Registration Successfully");
						resp.sendRedirect("register.jsp");
					}
					else {
						//System.out.println("Something wrong on server...");
						session.setAttribute("failedMsg","Something wrong on server...");
						resp.sendRedirect("register.jsp");
					}
				}else {
					System.out.println("please check Agree Terms & conditions...");
					session.setAttribute("failedMsg","please check Agree Terms & conditions...");
					resp.sendRedirect("register.jsp");
					}
			}catch(Exception e) {
					e.printStackTrace();
			}
		
	}

}
