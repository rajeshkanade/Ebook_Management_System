<%@page import="com.entity.Book_Order"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
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
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>

<c:if test="${empty userObj }">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="all_component/navbar.jsp" %>
		
<div class="container mt-5">
					<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${failedMsg }</p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
<table class="table table-striped ">
  <thead class="thead-dark">
    <tr>
      <th class="bg-primary" scope="col">Order Id</th>
      <th class="bg-primary" scope="col">User Name</th>
      <th class="bg-primary" scope="col">Email Id</th>
      <th class="bg-primary" scope="col">Book Name</th>
      <th class="bg-primary" scope="col">Author</th>
      <th class="bg-primary" scope="col">Price</th>
      <th class="bg-primary" scope="col">payment Type</th>
      <th class="bg-primary" scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  	User u = (User)session.getAttribute("userObj");
  String email = u.getEmail();
  // BookDAOImpl dao = new BookDAOImpl(DB.getConn());
  BookOrderImpl dao = new BookOrderImpl(DB.getConn());
  List<Book_Order> list = dao.getOrderByUser(email);
  
  if(list !=null){
  for(Book_Order b : list)
  {
	 %>
	  <tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getName() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPaymentType()%></td>
      <td><a href="delete_order?email=<%=email%>&&oid=<%=b.getOrderId()%>" class="btn btn-sm btn-danger">Delete</a></td>
    </tr>
	 
	  <%

	  
  }
  }else{
	  %>
		<h3 class="text-center text-primary">No Books Add for Sell</h3>	  
	  
	  <%
	  
	  
  }
  
  %>
   
    
  </tbody>
</table>
</div>
</body>
</html>