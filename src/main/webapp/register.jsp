<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : Register</title>
<%@include file="all_component/allCss.jsp" %>
<style>
	.no-spinner[type=number] {
		/****** This is used to remove number spinner or chicker from the input filed *****/
  		-moz-appearance: textfield;
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>
	<div class="container-fluid p-2" style="background-color:#f0f1f2;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
						<h4 class="text-center  p-2 fw-bold">Registration Page</h4>
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${failedMsg }</p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						
							<form action="register" method="post">
								  <div class="mb-3">
									    <label for="exampleInputEmail1" class="form-label">Name</label>
									    <input type="text" class="form-control" id="exampleInputName"  required="required" aria-describedby="nameHelp" name="fname">
								  </div>
								   <div class="mb-3">
									    <label for="exampleInputEmail1" class="form-label">Email address</label>
									    <input type="email" class="form-control" id="exampleInputEmail1" required="required"  aria-describedby="emailHelp" name="email">
									    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
								  </div>
								  <div class="mb-3">
									    <label for="exampleInputPassword1" class="form-label ">Mobile Number</label>
									    <input type="number" class="form-control no-spinner" name="phno" id="exampleInputPassword1" pattern="[0-9]*" required="required">
									    <div id="emailHelp" class="form-text">We'll never share your mobile no. with anyone else.</div>
								  </div>
								  <div class="mb-3">
									    <label for="exampleInputPassword1" class="form-label">Password</label>
									    <input type="password" class="form-control" name="password" id="exampleInputPassword1" required="required">
								  </div>
								  <div class="mb-3 form-check">
									    <input type="checkbox"  class="form-check-input" name="check" id="exampleCheck1">
									    <label class="form-check-label" for="exampleCheck1" >Agree Terms & Condition</label>
								  </div>
								  <button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp" %>
</body>
</html>