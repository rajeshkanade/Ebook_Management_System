<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook App : Setting</title>
<%@include file="all_component/allCss.jsp"%>
<style>
	a{
	text-decoration:none;
	}
	a:hover{
	text-decoration : none;
	}
</style>
</head>
<body>
<c:if test="${empty userObj }">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>
		<%@include file="all_component/navbar.jsp" %>
		
	<div class="contianer-fluid" style="background:#f7f7f7;">
		<div class="container">
		
		<h1 class="text-center" >Hello , ${userObj.name } </h1>
		
		<div class="row p-5">
			<div class="col-md-4">
			<a href="sell_book.jsp">
				<div class="card">
					<div class="card-body text-center">
						<div class="text-success"><i class="fa-solid fa-book-open fa-3x"></i></div>
						
						<h3>Sell Old Book</h3>
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-4">
			<a href="old_book.jsp">
				<div class="card">
					<div class="card-body text-center">
						<div class="text-danger"><i class="fa-solid fa-book-open fa-3x"></i></div>
						
						<h3>Old Book</h3>
					</div>
				</div>
				</a>
			</div>
		
		<div class="col-md-4">
			<a href="edit_profile.jsp">
				<div class="card">
					<div class="card-body text-center">
						<div class="text-warning"><i class="fa-solid fa-address-card fa-3x"></i></div>
						
						<h4>Login & Security (Edit Profile)</h4>
					</div>
				</div>
				</a>
			</div>
		</div>
		
		
		<div class="row p-5">
			
<!-- 		<div class="col-md-6 mt-3">
			<a href="order.jsp">
				<div class="card">
					<div class="card-body text-center">
						<div class="text-danger"><i class="fa-solid fa-box-open fa-3x"></i></div>
						
						<h4>My Order</h4>
						<p>Track Your Order </p>
						
					</div>
				</div>
				</a>
			</div>  -->
			<div class="col-md-6 mt-3">
			<a href="helpLine.jsp">
				<div class="card">
					<div class="card-body text-center">
						<div class="text-success"><i class="fa-solid fa-user-circle fa-3x"></i></div>
						
						<h4>Help Center</h4>
						<p>24*7 Service</p>
						
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
			<a href="MyOrder.jsp">
				<div class="card">
					<div class="card-body text-center">
						<div class="text-danger"><i class="fa-solid fa-cart-flatbed fa-3x"></i></div>
						
						<h4>My Orders</h4>
						<p>All orders</p>
						
					</div>
				</div>
				</a>
			</div>
		
		</div>
		</div>
	</div>
		
	<%@include file="all_component/footer.jsp" %>
</body>
</html>