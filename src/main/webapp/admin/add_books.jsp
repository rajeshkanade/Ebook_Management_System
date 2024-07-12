<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allCss.jsp" %>

</head>
<body>
	<%@include file="navbar.jsp" %>
	<!-- this is used to secure the page without login you cannot enter this pages  -->
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp"/>
	</c:if>
	
	<div class="container-fluid" style="background-color:#f0f1f2;">
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center"> Add Books </h4>
						
						<c:if test="${not empty succMsg}">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty faliedMsg}">
						<p class="text-center text-danger">${faliedMsg }</p>
						<c:remove var="faliedMsg" scope="session"/>
						</c:if>
						
						
						<form action="../add_books" method="post" enctype="multipart/form-data">
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
								<label for="inputState">Book Categories</label>
								<select id="inputState" name="categories" class="form-control">
									<option selected> ----Select----</option>
									<option value="new">New Book </option>
								</select>
								
							</div>
							<div class="form-group mt-3">
								<label for="inputState">Book Status</label>
								<select id="inputState" name="bstatus" class="form-control">
									<option selected>----Select----</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
								
							</div>
							<div class="form-group mt-3">
								<label for="exampleFormControlFile1">Upload Photo</label>
								<input type="file" name="bimg" class="form-control-file" id="exampleFormControlFile1" aria-describeby="emailHelp">
							</div>
							
							<button type="submit" class="btn btn-primary mt-3">Add</button>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%@include file="footer.jsp" %>
		
</body>
</html>