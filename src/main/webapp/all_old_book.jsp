<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DB"%>
<%@page import="com.DAO.BookDAOImpl"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Books</title>
	<%@include file="all_component/allCss.jsp"%>
	<style>
	.crd-ho:hover{
		background:#fcf7f7;
		cursor:pointer;
		}
	</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp" %>
	<div class="container-fluid mt-5">
		<div class="container">
			<div class="row">
				<%
					BookDAOImpl dao = new BookDAOImpl(DB.getConn());
					List<BookDetails> list = dao.getAllOldBook();
					for(BookDetails b3 : list){
				%>
					<div class="col-md-3">
						<div class="card crd-ho">
							<div class="card-body text-center">
								<img alt="" src="bookImg/<%=b3.getPhotoName() %>" 
								style="width:90%; height:300px;" class="img-thumblin">
								<p><%=b3.getBookName() %></p>
								<p><%=b3.getAuthor() %></p>
								<p>Categories:<%=b3.getBookCategory() %></p>
								<div class="row d-flex justify-content-center">
						<!-- 			<a href="" class="btn btn-danger btn-sm col-4 " style="margin-left:5px"><i class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>    -->
									<a href="view_book.jsp?bid=<%=b3.getBookId() %>" class="btn btn-success btn-sm  col-4" style="margin-left:5px">View Details</a>
									<a href="" class="btn btn-danger btn-sm col-3 " style="margin-left:5px"><i class="fa-solid fa-indian-rupee-sign"></i><%=b3.getPrice() %></a>
								</div>
							</div>
						</div>
					</div>
					<%
					} 
					%>
			</div
		</div>
	</div>
</body>
</html>