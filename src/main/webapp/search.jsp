<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DB"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Books</title>
	<%@include file="all_component/allCss.jsp"%>
	<style>
	.crd-ho:hover{
		background:#fcf7f7;
		cursor:pointer;
		}
	</style>
</head>
<body>
<%

	User u = (User) session.getAttribute("userObj");

%>
	<%@include file="all_component/navbar.jsp" %>
	
	<div class="container-fluid mt-5">
		<div class="container">
			<div class="row">
				<%
				
				String ch = request.getParameter("ch");
				
				BookDAOImpl dao2 = new BookDAOImpl(DB.getConn());
				List<BookDetails> list2 = dao2.getBookBySearch(ch);
				for(BookDetails b2 : list2){
					if(b2.getBookCategory().equals("new")){
					%>
					<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="bookImg/<%=b2.getPhotoName() %>" style="width:90%; height:300px;" class="img-thumblin">
							<p><%=b2.getBookName() %></p>
							<p><%=b2.getAuthor() %></p>
							<p><%=b2.getBookCategory() %></p>
							<div class="row d-flex justify-content-center">
								<%
								 if(u == null){
								 %>
								 <a href="login.jsp" class="btn btn-danger btn-sm col-4 " style="margin-left:5px"><i class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>
								 <%
								 }else{
								 %>
								 <a href="cart?bid=<%=b2.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm col-4 " style="margin-left:5px"><i class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>
								 <%
								 } 
								 %>
				
									<a href="view_book.jsp?bid=<%=b2.getBookId() %>" class="btn btn-success btn-sm  col-4" style="margin-left:5px">View Details</a>
									<a href="" class="btn btn-danger btn-sm col-3 " style="margin-left:5px"><i class="fa-solid fa-indian-rupee-sign"></i><%=b2.getPrice() %></a>
								</div>
						</div>
					</div>
				</div>
				<%
					}else{
						%>
						<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="bookImg/<%=b2.getPhotoName() %>" style="width:90%; height:300px;" class="img-thumblin">
							<p><%=b2.getBookName() %></p>
							<p><%=b2.getAuthor() %></p>
							<p><%=b2.getBookCategory() %></p>
							<div class="row d-flex justify-content-center">
								<a href="view_book.jsp?bid=<%=b2.getBookId() %>" class="btn btn-success btn-sm  col-4" style="margin-left:5px">View Details</a>
								<a href="" class="btn btn-danger btn-sm col-3 " style="margin-left:5px"><i class="fa-solid fa-indian-rupee-sign"></i><%=b2.getPrice() %></a>
							</div>
						</div>
					</div>
				</div>
						<%
					}
				}
				%>
			</div>
		</div>
	</div>
	
</body>
</html>