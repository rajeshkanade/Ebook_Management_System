<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DB"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : All Orders</title>
<%@include file="allCss.jsp" %>
<style >
	.table thead	tr th{
	background-color:#6f2cf6;
	color:white;
	}
	.footer{
	position: fixed;
    bottom: 0;
    width: 100%;
    
    color: #fff;
    text-align: center;
    padding:0;
    }
</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<!-- this is used to secure the page without login you cannot enter this pages  -->
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp"/>
	</c:if>

	<h3 class="text-center"> Manage Orders</h3>
		<table class="table table-striped">

		  <thead class="bg-primary text-white" >
		    <tr style="background-color:#6f2cf6;">
		      <th class="text-center" scope="col">Order Id</th>
		      <th scope="col">Name</th>
		      <th scope="col">Email</th>
		      <th scope="col">Address</th>
		      <th scope="col">Ph No</th>
		      <th scope="col">Book Name</th>
		      <th scope="col">Author</th>
		      <th scope="col">Price</th>
		      <th scope="col">Payment Type</th>
		    </tr>
		  </thead>
		  <tbody>
	<%
	 BookOrderImpl dao = new BookOrderImpl(DB.getConn());
	 List<Book_Order> list = dao.getOrderDetails();
	 System.out.println(list);
	 for(Book_Order o : list)
	 {
		 %>
		 
		  <tr>
		      <th class="text-center" scope="row"><%=o.getOrderId()%></th>
		      <td><%=o.getName() %></td>
		      <td><%=o.getEmail() %></td>
		      <td><%=o.getFullAddr() %></td>
		      <td><%=o.getPhno() %></td>
		      <td><%=o.getBookName() %></td>
		      <td><%=o.getAuthor() %></td>
		      <td><%=o.getPrice() %></td>
		      <td><%=o.getPaymentType() %></td>
		    </tr>
		 <%
	 }
	%>
		   
		  </tbody>
		</table>
<!-- 	<footer class="footer">
	 <%@include file="footer.jsp" %>
	 </footer> -->


</body>
</html>