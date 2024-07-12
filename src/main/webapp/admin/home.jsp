<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Home</title>
<%@include file="allCss.jsp" %>
<style>
a{
text-decoration : none ;
color : black;
}
.footer{
	position:fixed;
	bottom : 0;
	width:100%;
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
	<div class="container mt-5">
		<div class="row p-5">
			<div class="col-md-3">
			<a href="add_books.jsp">
				<div class="card">
					<div class="card-body text-center">
					<i class="fa-solid fa-square-plus fa-3x text-primary"></i>
					<br>
					<h4> Add Book </h4>
					------------------				
					</div>
				</div>
			</a>
			</div>
			<div class="col-md-3">
			<a href="all_books.jsp">
				<div class="card">
					<div class="card-body text-center">
					<i class="fa-solid fa-book-open fa-3x text-danger"></i>
					<br>
					<h4> All Books </h4>
					------------------				
					</div>
				</div>
			</a>
			</div>
			<div class="col-md-3">
			<a href="orders.jsp">
				<div class="card">
					<div class="card-body text-center">
					<i class="fa-solid fa-box-open fa-3x text-warning"></i>
					<br>
					<h4> Orders </h4>
					-------------------				
					</div>
				</div>
			</a>
			</div>
			<div class="col-md-3">
			<a href="../login.jsp" data-bs-toggle="modal" data-bs-target="#exampleModal">
				<div class="card">
					<div class="card-body text-center">
					<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i>
					<br>
					<h4> Logout </h4>
					-------------------					
					</div>
					
				</div>
			</a>
			</div>
		</div>
	
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <div clas="text-center">
	        <h4> Do you want to logout </h4>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <a href="../logout"  type="button" class="btn btn-primary">Logout</a>
        </div>
      </div>
      <div class="modal-footer"></div>
    </div>
  </div>
</div>
<div class="footer">
	<%@include file="footer.jsp" %>
</div>
</body>
</html>