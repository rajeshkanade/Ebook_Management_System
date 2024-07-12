
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored = "false" %>

<style>
	.cart-logo{
	float:right;
		padding-top:5px;
	}
</style>

<div class="container-fluid" style="height:10px; background-color : #303f9f;"></div>



<div class="container-fluid p-3">
	<div class="row ">
		<div class ="col-md-3 text-custom">
		<h3><i class="fa-solid fa-book"></i> Ebooks</h3>
		</div>
		<div class="col-md-6">
				<form class="d-flex" role="search" action="search.jsp" method="post">
			        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="ch">
			        <button class="btn btn-primary" type="submit">Search</button>
			     </form>
		</div>  
		
		<c:if test="${not empty userObj }">
		<div class="col-md-3 ">
			<a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-user"></i> ${userObj.name}</a>
			<a href="logout" class="btn btn-primary"><i class="fa-solid fa-right-from-bracket "></i> logout</a>
			
			<a href="checkout.jsp"><i class="fa-solid fa-cart-plus fa-2x cart-logo"></i></a>
		</div>
		
		
		</c:if>
		
		<c:if test="${ empty userObj }">
		<div class="col-md-3 ">
			<a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
			<a href="register.jsp" class="btn btn-primary"><i class="fa-solid fa-id-card"></i> Register</a>
		</div>
		
		</c:if>
	
	</div>
 </div>
<nav class="navbar navbar-expand-lg bg-custom navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house-fire"></i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i> New Book</a>
        </li>
        <li class="nav-item">
          <a href="all_old_book.jsp" class="nav-link active" aria-disabled="true"><i class="fa-solid fa-book-open"></i> Old Book</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <a href="setting.jsp" class="btn btn-outline-success btn-light m-1 text-custom fw-bold" type="submit"><i class="fa-solid fa-gear"></i> Setting</a>
        <a href="helpLine.jsp" class="btn btn-outline-success btn-light m-1 text-custom fw-bold" type="submit"><i class="fa-solid fa-id-badge"></i> Contact Us</a>
      </form> 
    </div>

</nav>
</div>