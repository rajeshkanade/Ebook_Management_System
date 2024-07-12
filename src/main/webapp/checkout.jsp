<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DB"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored = "false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
<style>
	 tbody tr:nth-child(even) th , tbody tr:nth-child(even) td{
		background-color:#ccbfbe !important;
		
	}
	 tr{
	margin-bottom : 10px;
	}
	 thead tr th, thead tr td{
	background-color: #87a6d4 !important;
	}
	.bg-color th,.bg-color td{
	background-color:#fae243 !important;}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>
<c:if test="${empty userObj }">
	<c:redirect url="login.jsp"></c:redirect>
	
</c:if>

<c:if test="${not empty succMsg }">
	<div class="alert alert-success text-center" role="alert">
 	 	${succMsg }
	</div>
	
	<c:remove var="succMsg" scope="session"/>
	
</c:if>
<c:if test="${not empty failedMsg }">
	<div class="alert alert-danger text-center" role="alert">
 	 	${failedMsg }
	</div>
	
	<c:remove var="failedMsg" scope="session"/>
	
</c:if>
<div class="container-fluid p-2" style="#f0f1f2;">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="card p-2 mt-3">
					<div class="card-body">
				<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table-stripped">
						  <thead>
						    <tr>
						      <th scope="col">Book Name</th>
						      <th scope="col">Author</th>
						      <th scope="col">Price</th>
						      <th scope="col">Action</th>
						    </tr>
						  </thead>
						  <tbody>
						  
						  
						  <%
						  	
						  User u = (User)session.getAttribute("userObj");
						  
						  CartDAOImpl dao = new CartDAOImpl(DB.getConn());
						  	List<Cart> cart = dao.getBookByUser(u.getId());
						  	Double totalPrice = 0.0;
						  	for(Cart c : cart)
						  	{
						  		totalPrice = c.getTotalPrice();
						  	%>
						  	<tr>
						      <th scope="row"><%=c.getBookName() %></th>
						      <td><%=c.getAuthor() %></td>
						      <td><%=c.getPrice() %></td>
						      <td>
								 <a href="removeBook?bid=<%=c.getBid()%>&&uid=<%=c.getUserid()%>&&cid=<%=c.getCid() %>" class="btn btn-sm btn-danger">Remove</a>
						      </td>
						    </tr>
						  	<%
						  	}
						  %>
						  <%if(totalPrice == 0.0){
						  %>
						  <%}else{ %>
						  
						  <tr class="bg-color mt-3">
						  <td>Total Price </td>
						  <td></td>
						  <td></td>
						  <td><%=totalPrice %></td>
						  </tr>
						  <%} %>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
					<h3>Yours Details for Order</h3>
						<form action="order" method="post">
						<input type="hidden" value="<%=u.getId() %>" name="id">
						  <div class="form-row row py-3">
						    <div class="form-group col-md-6 form-col ">
						      <label for="inputEmail4">Name</label>
						      <input type="text" class="form-control" id="inputEmail4" value="<%=u.getName() %>" readonly="readonly" name="name">
						    </div>
						    <div class="form-group col-md-6 form-col">
						      <label for="inputPassword4">Email</label>
						      <input type="email" class="form-control" id="inputPassword4" name="email" value="<%=u.getEmail() %>" readonly="readonly">
						    </div>
						  </div>
						  <div class="form-row row py-3">
							  <div class="form-group col-md-6 form-col ">
							    <label for="inputAddress">Mobile No</label>
							    <input type="number" class="form-control" id="inputMobileNo" name="phno" value="<%=u.getPhno()%>" readonly="readonly">
							  </div>
							  <div class="form-group col-md-6 form-col ">
							    <label for="inputAddress2">Address</label>
							    <input type="text" class="form-control" id="inputAddress" name="address">
							  </div>
						  </div>
						  <div class="form-row row py-3">
						    <div class="form-group col-md-6 form-col ">
						      <label for="inputCity">Landmark</label>
						      <input type="text" class="form-control" id="inputLandmark" name="landmark">
						    </div>
						    <div class="form-group col-md-6 form-col ">
						      <label for="inputState">City</label>
						      <input type="text" class="form-control" id="inputCity]" name="city">
						    </div>
						    </div>
						    <div class="form-row row py-3">
						    <div class="form-group col-md-6 form-col ">
						      <label for="inputZip">State</label>
						      <input type="text" class="form-control" id="inputState" name="state">
						      </div>
						      <div class="form-group col-md-6 form-col">
						       <label for="inputZip">Zip</label>
						      <input type="text" class="form-control" id="inputZip" name="zip">
						    </div>
						  </div>
						  <div class="form-group">
						  	<label>Payment Type</label>
						    <select class="form-control" name="payment">
						    	<option value="noselect">---Select----</option>
						    	<option>Cash on Delivery</option>
						    	
						    	
						    </select>
						  </div>
						  <div class="text-center py-3">
						  <button type="submit" class="btn btn-warning">Order Now</button>
						 <a href="index.jsp" class="btn btn-success">Continue Shipping</a> 
						  </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>




</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>