<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : Sell Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp" %>
	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"/>
	</c:if>
	<div class="container-fluid" style="background:#f7f7f7;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary p-1"> Sell Old Books </h4>
						
						<c:if test="${not empty succMsg}">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty faliedMsg}">
						<p class="text-center text-danger">${faliedMsg }</p>
						<c:remove var="faliedMsg" scope="session"/>
						</c:if>
						<form action="sell_book" method="post" enctype="multipart/form-data">
						<input type="hidden" value="${userObj.email }" name="user">
							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Book Name*</label>
								<input type="text" name="bname" class="form-control" id="exampleInputEmail1" aria-describeby="emailHelp">
							</div>
							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Author Name*</label>
								<input type="text" name="author" class="form-control" id="exampleInputEmail1" aria-describeby="emailHelp">
							</div>
							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Price*</label>
								<input type="number" name="price" class="form-control" id="exampleInputEmail1" aria-describeby="emailHelp">
							</div>
							
							
							<div class="form-group mt-3">
								<label for="exampleFormControlFile1">Upload Photo</label>
								<input type="file" name="bimg" class="form-control-file" id="exampleFormControlFile1" aria-describeby="emailHelp">
							</div>
							
							<button type="submit" class="btn btn-primary mt-3">sell</button>
							
						</form>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>