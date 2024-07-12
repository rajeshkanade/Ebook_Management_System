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
<title>Admin : All Books</title>
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
	
	<h3 class="text-center">Manage All Books</h3>
		
						<c:if test="${not empty succMsg}">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty faliedMsg}">
						<p class="text-center text-danger">${faliedMsg }</p>
						<c:remove var="faliedMsg" scope="session"/>
						</c:if>
		<table class="table table-striped">
		  <thead class="bg-primary text-white" >
		    <tr style="background-color:#6f2cf6;">
		      <th scope="col">ID</th>
		      <th scope="col">Book Img</th>
		      <th scope="col">Book Name</th>
		      <th scope="col">Author Name</th>
		      <th scope="col">Price</th>
		      <th scope="col">Categories</th>
		      <th scope="col">Status</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		  
		  <%
		 
		  	BookDAOImpl dao = new BookDAOImpl(DB.getConn());
		  	List<BookDetails> list = dao.getAllBooks();
		  	//System.out.println(list);
		  	//System.out.println("size of list : "+list.size());
		  	
		  	for(BookDetails b:list){
		  		//System.out.println("book Id : " + b.getBookId());
		  		%>
		  		 <tr>
				      <th scope="row"><%=b.getBookId()%></th>
				      <td><img src="../bookImg/<%=b.getPhotoName()%>" style="width:50px;height:70px"></td>
				      <td><%=b.getBookName() %></td>
				      <td><%=b.getAuthor()%></td>
				      <td>₹<%=b.getPrice()%></td>
				       <td><%=b.getBookCategory()%></td>
				      <td><%=b.getStatus()%></td>
				      <td>
				      <a href="edit_books.jsp?id=<%=b.getBookId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-file-pen"></i> Edit</a>
				       <a href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Delete</a>
				      </td>
		    		</tr>
		  		<%
		  	}
		  %>
		   
		  
		     
		  </tbody>
		</table>

 	<!-- 	<%@include file="footer.jsp" %> -->

</body>
</html>