<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : Login</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body>
	<%@include file="all_component/navbar.jsp" %>
	<div class="container-fluid p-2" style="#f0f1f2;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h3 class="text-center  p-2 ">Login</h3>
							
							<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session"/>
							</c:if>
							
							
							<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session"/>
							
							</c:if>
							
							
							<form action="login" method="post">
								  
								   <div class="mb-3">
									    <label for="exampleInputEmail1" class="form-label">Email address</label>
									    <input type="email" class="form-control" id="exampleInputEmail1"  aria-describedby="emailHelp" required="required" name="email">
									    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
								  </div>
								
								  <div class="mb-3">
									    <label for="exampleInputPassword1" class="form-label">Password</label>
									    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
								  </div>
								  <div class="mb-3 text-center">
								  <button type="submit" class="btn btn-primary ">Login</button>
								  <br>
								  <a href="register.jsp">Create Account</a>
								  </div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>