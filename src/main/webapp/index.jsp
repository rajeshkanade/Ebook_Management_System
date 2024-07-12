<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DB"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect" import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EBook : Index</title>
	<%@include file="all_component/allCss.jsp"%>
	<style type="text/css">
		.back-img{
			background:url("img/book.jpg");
			 height:80vh;
			width:100%;
			background-size:cover;
			background-repeat:no-repeat;
		}
		.crd-ho:hover{
		background:#fcf7f7;
		cursor:pointer;
		}
	</style>
</head>
<body>


<%
	User u = (User) session.getAttribute("userObj");

%>
	
	<%@include file="all_component/navbar.jsp" %>
	
	
	
	
	<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
	
  	<div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  	</div>
  <div class="carousel-inner  w-100">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="img/background-1.jpg" class="d-block w-100 img-fluid" alt="..." style="height: calc(100vh - 130px);">
      <div class="carousel-caption d-none d-md-block">
         <h2>Discover New Books</h2>
         <p>Explore our vast collection of ebooks covering various genres, from fiction to non-fiction, and discover your next favorite read.</p>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="img/background-2.png" class="d-block w-100 img-fluid" alt="..." style="height: calc(100vh - 130px);">
      <div class="carousel-caption d-none d-md-block text-white">
        <h2>Read Anywhere, Anytime</h2>
        <p>With our ebook management system, you can access your library on any device, whether it's your computer, tablet, or smartphone, making reading convenient for you.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="img/background-3.jpg" class="d-block w-100 img-fluid" alt="..." style="height: calc(100vh - 130px);">
      <div class="carousel-caption d-none d-md-block">
        <h2>Personalized Recommendations</h2>
        <p>Receive tailored recommendations based on your reading preferences and browsing history, ensuring you always find books that resonate with you.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
	</div>
	<script>
  $('.carousel').carousel({
    interval: 2000 // Change slide every 2 seconds (2000 milliseconds)
  });
</script>
	
	
	<!-- Recent Book Start  -->
	
	<div class="container-fluid pb-5" style="background:#f7f7f7;">
		<div class="container">
			<h3 class="text-center mt-4"> Recent Book</h3>
			<div class="row">
				<%
				BookDAOImpl dao2 = new BookDAOImpl(DB.getConn());
				List<BookDetails> list2 = dao2.getRecentBook();
				for(BookDetails b2 : list2){
					if(b2.getBookCategory().equals("new")){
					%>
					<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="bookImg/<%=b2.getPhotoName() %>" style="width:90%; height:300px;" class="img-thumblin">
							<p><%=b2.getBookName() %></p>
							<p><%=b2.getAuthor() %></p>
							<p><%=b2.getBookCategory() %></p>
							<div class="row d-flex justify-content-center">
								<%
								 if(u == null){
								 %>
								 <a href="login.jsp" class="btn btn-danger btn-sm col-4 " style="margin-left:5px"><i class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>
								 <%
								 }else{
								 %>
								 <a href="cart?bid=<%=b2.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm col-4 " style="margin-left:5px"><i class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>
								 <%
								 } 
								 %>
								<a href="view_book.jsp?bid=<%=b2.getBookId() %>" class="btn btn-success btn-sm  col-4" style="margin-left:5px">View Details</a>
								<a href="" class="btn btn-danger btn-sm col-3 " style="margin-left:5px"><i class="fa-solid fa-indian-rupee-sign"></i><%=b2.getPrice() %></a>
							</div>
						</div>
					</div>
				</div>
				<%
					}else{
						%>
						<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="bookImg/<%=b2.getPhotoName() %>" style="width:90%; height:300px;" class="img-thumblin">
							<p><%=b2.getBookName() %></p>
							<p><%=b2.getAuthor() %></p>
							<p><%=b2.getBookCategory() %></p>
							<div class="row d-flex justify-content-center">
								<a href="view_book.jsp?bid=<%=b2.getBookId() %>" class="btn btn-success btn-sm  col-4" style="margin-left:5px">View Details</a>
								<a href="" class="btn btn-danger btn-sm col-3 " style="margin-left:5px"><i class="fa-solid fa-indian-rupee-sign"></i><%=b2.getPrice() %></a>
							</div>
						</div>
					</div>
				</div>
						<%
					}
				}
				%>
			</div>
			<div class="text-center mt-3">
				<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
			</div>
		</div>

	<!-- End Recent Book -->
	<hr>
	<!-- New Book Start -->	
	<div class="container-fluid" style="background:#f7f7f7;">
		<div class="container">
			<h3 class="text-center mt-4"> New Book</h3>
			<div class="row">				
				<%
					BookDAOImpl dao = new BookDAOImpl(DB.getConn());
					List<BookDetails> list = dao.getNewBook();
					for(BookDetails b : list){
				%>
					<div class="col-md-3">
						<div class="card crd-ho">
							<div class="card-body text-center">
								<img alt="" src="bookImg/<%=b.getPhotoName() %>" 
								style="width:90%; height:300px;" class="img-thumblin">
								<p><%=b.getBookName() %></p>
								<p><%=b.getAuthor() %></p>
								<p>Categories:<%=b.getBookCategory() %></p>
								<div class="row d-flex justify-content-center">
								
								 <%
								 if(u == null){
								 %>
								 <a href="login.jsp" class="btn btn-danger btn-sm col-4 " style="margin-left:5px"><i class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>
								 <%
								 }else{
								 %>
								 <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm col-4 " style="margin-left:5px"><i class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>
								 <%
								 } 
								 %>
									
									<a href="view_book.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm  col-4" style="margin-left:5px">View Details</a>
									<a href="" class="btn btn-danger btn-sm col-3 " style="margin-left:5px"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
								</div>
							</div>
						</div>
					</div>
					<%
					} 
					%>
			</div>
			<div class="text-center mt-3">
				<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
			</div>
		</div>
	<!-- New Book End -->
	<hr>
	<!-- Old Book Start -->
		<div class="container">
			<h3 class="text-center mt-4"> Old Book</h3>
			<div class="row">
				<%
					BookDAOImpl dao3 = new BookDAOImpl(DB.getConn());
					List<BookDetails> list3 = dao.getOldBook();
					for(BookDetails b3 : list3){
				%>
					<div class="col-md-3">
						<div class="card crd-ho">
							<div class="card-body text-center">
								<img alt="" src="bookImg/<%=b3.getPhotoName() %>" 
								style="width:90%; height:300px;" class="img-thumblin">
								<p><%=b3.getBookName() %></p>
								<p><%=b3.getAuthor() %></p>
								<p>Categories:<%=b3.getBookCategory() %></p>
								<div class="row d-flex justify-content-center">
						<!-- 			<a href="" class="btn btn-danger btn-sm col-4 " style="margin-left:5px"><i class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>    -->
									<a href="view_book.jsp?bid=<%=b3.getBookId() %>" class="btn btn-success btn-sm  col-4" style="margin-left:5px">View Details</a>
									<a href="" class="btn btn-danger btn-sm col-3 " style="margin-left:5px"><i class="fa-solid fa-indian-rupee-sign"></i><%=b3.getPrice() %></a>
								</div>
							</div>
						</div>
					</div>
					<%
					} 
					%>
			</div>
			<div class="text-center mt-3">
				<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
			</div>
		</div>
	</div>
	</div>
	<!-- Old BOok End -->
	
	<%@include file="all_component/footer.jsp" %>
</body>
</html>