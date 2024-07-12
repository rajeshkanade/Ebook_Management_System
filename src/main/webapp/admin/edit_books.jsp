<%@page import="com.entity.BookDetails"%>
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
						<h4 class="text-center"> Edit Books </h4>
					
						
						<%
							
							int id = Integer.parseInt(request.getParameter("id"));
							BookDAOImpl dao = new BookDAOImpl(DB.getConn());
							BookDetails b = dao.getBookById(id);
						%>
						
						
						<form action="../editbooks" method="post" >
							<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Book Name*</label>
								<input type="text" name="bname" class="form-control" id="exampleInputEmail1" aria-describeby="emailHelp" value="<%=b.getBookName() %>">
							</div>
							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Author Name*</label>
								<input type="text" name="author" class="form-control" id="exampleInputEmail1" aria-describeby="emailHelp" value="<%=b.getAuthor() %>">
							</div>
							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Price*</label>
								<input type="number" name="price" class="form-control" id="exampleInputEmail1" aria-describeby="emailHelp" value="<%=b.getPrice() %>">
							</div>
							
							<div class="form-group mt-3">
								<label for="inputState">Book Status</label>
								<select id="inputState" name="bstatus" class="form-control">
									<% 
									if("Active".equals(b.getStatus())){
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									}else{
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select>
								
								
							</div>
							
							
							<button type="submit" class="btn btn-primary mt-3">Update</button>
							
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