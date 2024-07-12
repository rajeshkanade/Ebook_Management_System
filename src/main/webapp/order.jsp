<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : My Orders</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f7f7f7;">
<%@include file="all_component/navbar.jsp" %>
	<div class="container">
	<h3 class="text-center text-primary">Your Orders</h3>
		<table class="table table-striped mt-5">
  <thead class="bg-primary text-white">
    <tr class="bg-primary ">
      <th class="bg-primary" scope="col">Order Id</th>
      <th class="bg-primary" scope="col">Name</th>
      <th class="bg-primary" scope="col">Book Name</th>
      <th class="bg-primary" scope="col">Author</th>
      <th class="bg-primary" scope="col">Price</th>
      <th class="bg-primary" scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>Mark</td>
      <td>Otto</td>
      
    </tr>
  </tbody>
</table>
	</div>
</body>
</html>