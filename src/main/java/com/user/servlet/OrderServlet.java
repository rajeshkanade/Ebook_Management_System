package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DB;
import com.entity.Book_Order;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;


@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			
			String state = req.getParameter("state");
			String pincode = req.getParameter("zip");
			String paymentType = req.getParameter("payment");
			
			
			String fullAddr = address + "," + landmark + "," + city + "," + state + "," + pincode;
			
//			System.out.println("name :- " + name +" email :- " + email + " fullAddr :- " + fullAddr + "PaymentType :- " + paymentType);
			
			CartDAOImpl dao = new CartDAOImpl(DB.getConn());
			List<Cart> blist = dao.getBookByUser(id);		
			
			
			BookOrderImpl dao2 = new BookOrderImpl(DB.getConn());
			
			
			Book_Order o = null;
			
			ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
			for(Cart c : blist) {
				o = new Book_Order();
				Random r = new Random();
				o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
			
				o.setName(name);
				o.setEmail(email);
				o.setPhno(phno);
				o.setFullAddr(fullAddr);
				o.setBookName(c.getBookName());
				o.setAuthor(c.getAuthor());
				o.setPrice(c.getPrice() + "");
				o.setPaymentType(paymentType);		
				orderList.add(o);
			}
			
			
			if("noselect".equals(paymentType)) {
				session.setAttribute("failedMsg", "Please Choose Payment Type ");
				resp.sendRedirect("checkout.jsp");
			}
			else {
				boolean f = dao2.saveOrder(orderList);
				if(f) {
					resp.sendRedirect("order_success.jsp");
				}else {
					session.setAttribute("failedMsg", "Your Order Failed ");
					resp.sendRedirect("checkout.jsp");
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
