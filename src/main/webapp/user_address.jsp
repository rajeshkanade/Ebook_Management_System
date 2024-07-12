<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : User Address</title>
<%@include file="all_component/allCss.jsp"%>
<style>
.full-body {
      min-height: 100%;
      
    }
</style>
</head>
<body style="background-color:#f7f7f7;">
	<%@include file="all_component/navbar.jsp" %>
	
	<div class="container-fluid pt-4 full-body"  >
		<div class="contianer">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
					<div class="card-body">
					<h3 class="text-success text-center">Yours Details for Order</h3>
						<form >
						 
						  <div class="form-row row py-3">
							  <div class="form-group  form-col ">
							    <label for="inputAddress2">Address</label>
							    <input type="text" class="form-control" id="inputAddress" >
							  </div>
						  </div>
						  <div class="form-row row py-3">
						    <div class="form-group col-md-6 form-col ">
						      <label for="inputCity">Landmark</label>
						      <input type="text" class="form-control" id="inputLandmark">
						    </div>
						    <div class="form-group col-md-6 form-col ">
						      <label for="inputState">City</label>
						      <input type="text" class="form-control" id="inputCity]">
						    </div>
						    </div>
						    <div class="form-row row py-3">
						    <div class="form-group col-md-6 form-col ">
						      <label for="inputZip">State</label>
						      <input type="text" class="form-control" id="inputState">
						      </div>
						      <div class="form-group col-md-6 form-col">
						       <label for="inputZip">Zip</label>
						      <input type="text" class="form-control" id="inputZip">
						    </div>
						  </div>
						  <div class="text-center py-3">
						  <button type="submit" class="btn btn-warning">Save Address</button>
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