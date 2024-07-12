<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DB"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	
	<%@include file="all_component/navbar.jsp" %>
	
	<%
		int bid = Integer.parseInt(request.getParameter("bid"));
		BookDAOImpl dao = new BookDAOImpl(DB.getConn());
		BookDetails b = dao.getBookById(bid);
		
	%>
	<div class="container-fluid" style="background-color:#f0f1f2; height:100vh;">
	<div class="container p-3">
		<div class="row ">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="bookImg/<%=b.getPhotoName() %>" style="height:180px; width:150px; ">
				<div class="mt-2">
				<h4>Book Name :<span class="text-success"><%=b.getBookName() %></span></h4>
				<h4>Book Author :<span class="text-success"><%=b.getAuthor() %></span></h4>
				<h4>Category : <span class="text-success"><%=b.getBookCategory() %></span></h4>
				</div>
				
			</div>
			
			<div class="col-md-6 text-center p-5 border bg-white">
			<%
				if("new".equals(b.getBookCategory()))
				{
				%>
				<h3> <span class="text-success"><%=b.getBookName() %> </span></h3>
				<h3><span class="text-success"><%=b.getAuthor() %></span></h3>
				<%
				}
				else{ 
				%>
				<h3 class="text-success"><%=b.getBookName() %></h3>
				<h3 class="text-success">Contact to Seller</h3>
				<h3 class="text-success"><%=b.getEmail() %></h3>
				<%
				} 
				%>
				<div  class="row mt-3 text-danger">
					<div class="col-md-4 ">
						<i class="fa-solid fa-money-bill-wave fa-2x "></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4">
							<i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
							<p>Return Available</p>
					</div>
						
					<div class="col-md-4">
							<i class="fa-solid fa-truck-moving fa-2x"></i>
							<p>Free Shipping </p>
					</div>
					
				</div>
				<%
				if("new".equals(b.getBookCategory()))
				{
				%>
				<div class="p-3 text-center">
					<a href="" class="btn btn-primary"><i class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>
					<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
					
				</div>
				<%
				}else{
				%>
				<div class="p-3 text-center">
					
					<a href="" class="btn btn-primary">Contact to Seller</a>
					<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	</div>
</body>
</html>