<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<c:if test="${empty userObj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
		<%@include file="all_component/navbar.jsp" %>
		<div class="container-fluid" style="background:#f7f7f7;">
			<div class="container">
				<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
						<h4 class="text-center text-primary p-2 fw-bold">Edit Profile</h4>
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${failedMsg }</p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						
							<form action="update_profile" method="post">
							<input type="hidden" value="${userObj.id }" name="id">
								  <div class="mb-3">
									    <label for="exampleInputEmail1" class="form-label">Enter Your FullName</label>
									    <input type="text" class="form-control" id="exampleInputName"  required="required" aria-describedby="nameHelp" name="fname" value="${userObj.name }">
								  </div>
								   <div class="mb-3">
									    <label for="exampleInputEmail1" class="form-label">Email address</label>
									    <input type="email" class="form-control" id="exampleInputEmail1" required="required"  aria-describedby="emailHelp" name="email" value="${userObj.email }">
									    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
								  </div>
								  <div class="mb-3">
									    <label for="exampleInputPassword1" class="form-label ">Mobile Number</label>
									    <input type="number" class="form-control no-spinner" name="phno" id="exampleInputPassword1" pattern="[0-9]*" required="required" value="${userObj.phno }">
									    <div id="emailHelp" class="form-text">We'll never share your mobile no. with anyone else.</div>
								  </div>
								  <div class="mb-3">
									    <label for="exampleInputPassword1" class="form-label">Password</label>
									    <input type="password" class="form-control" name="password" id="exampleInputPassword1" required="required">
								  </div>
								  <button type="submit" class="btn btn-primary">Update</button>
							</form></div>
					</div>
				</div>
			</div>
			</div>
		</div>
</body>
</html>