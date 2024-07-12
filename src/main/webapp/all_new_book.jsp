<%@page import="com.entity.User"%>
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
<title>all New Books</title>
	<%@include file="all_component/allCss.jsp"%>
	<link rel="spreadsheet" type="text/css" href="./all_component/style.css">
<style>
	.crd-ho:hover{
		background:#fcf7f7;
		cursor:pointer;
		}
	#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
	}

	#toast.display {
		visibility: visible;
		animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
	}

	@keyframes fadeIn {from { bottom:0;
		opacity: 0;
	}
	
	to {
		bottom: 30px;
		opacity: 1;
	}
	
	}
	@keyframes fadeOut {form { bottom:30px;
		opacity: 1;
	}
	
	to {
		bottom: 0;
		opacity: 0;
	}
	}
 
 
		
	</style>
</head>
<body>
<%

	User u = (User) session.getAttribute("userObj");

%>
	<c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>
		
		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },3000)
		}	
</script>
		<c:remove var="addCart" scope="session"/>
	</c:if>
	<%@include file="all_component/navbar.jsp" %>
	<div class="container-fluid mt-5">
		<div class="container">
			<div class="row">				
				<%
					BookDAOImpl dao = new BookDAOImpl(DB.getConn());
					List<BookDetails> list = dao.getAllNewBook();
					for(BookDetails b : list){
				%>
					<div class="col-md-3">
						<div class="card crd-ho">
							<div class="card-body text-center">
								<img alt="" src="bookImg/<%=b.getPhotoName() %>" 
								style="width:90%; height:300px;" class="img-thumblin">
								<p><%=b.getBookName() %></p>
								<p><%=b.getAuthor() %></p>
								<p>Categories:<%=b.getBookCategory() %></p>
								<div class="row d-flex justify-content-center">
								<%
								 if(u == null){
								 %>
								 <a href="login.jsp" class="btn btn-danger btn-sm col-4 " style="margin-left:5px"><i class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>
								 <%
								 }else{
								 %>
								 <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm col-4 " style="margin-left:5px"><i class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>
								 <%
								 } 
								 %>
				
									<a href="view_book.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm  col-4" style="margin-left:5px">View Details</a>
									<a href="" class="btn btn-danger btn-sm col-3 " style="margin-left:5px"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
								</div>
							</div>
						</div>
					</div>
					<%
					} 
					%>
			</div>
		</div>
	</div>
</body>
</html>