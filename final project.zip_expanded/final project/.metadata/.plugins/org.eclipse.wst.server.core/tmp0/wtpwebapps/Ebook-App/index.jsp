<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/images.jpeg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

<%
	User u=(User)session.getAttribute("userobj");

%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-white">
			<i class="fas fa-book"></i> Online Book Shop
		</h2>
	</div>
	
	<!--Start Recent Book-->
	<div class="container">
		<h3 class="text-center mt-1">Own Publication</h3>
		<div class="row">
		<%
		BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
		List<BookDetails> list2 =dao2.getRecentBooks();
		for(BookDetails b:list2) 
		{
		%>
			<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/<%=b.getPhotoName() %>"
						style="width: 150px; height: 200px" class="img-thumblin">
					<p><%=b.getBookName() %></p>
					<p><%=b.getAuthor() %></p>
					<p>Categories:<%=b.getBookCategory() %></p>
					<div class="row">
						<%
						if(u==null)
						{
						%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%
						} else{
						%>
						<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%	
						}
						%>
						<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a> <a
							href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-bangladeshi-taka-sign"></i><%=b.getPrice() %></a>
					</div>
				</div>
			</div>
		</div>	
		<%
		}
		%>
		

		</div>	
		<div class="text-center mt-2">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!--End of Recent Book -->
	
	<!--Start of New Book -->
	<hr>
	<div class="container">
		<h3 class="text-center mt-1">New Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list=dao.getNewBook();
			for(BookDetails b:list) {
			%>
			<div class="col-md-3">
			<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName() %>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Categories:<%=b.getBookCategory() %></p>
						<div class="row">
						
						<%
						if(u==null)
						{
						%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%
						} else{
						%>
						<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%	
						}
						%>
						
							
							
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a> 
							
							<a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-bangladeshi-taka-sign"></i><%=b.getPrice() %></a>
						</div>
					</div>
				</div>
			</div>
							
			<%
			}
			%>

			
		</div>
		<div class="text-center mt-2">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	
	<!-- End of New Book -->
	
	<!-- Old Book -->
	<hr>
	<div class="container">
		<h3 class="text-center mt-1">Old Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao3=new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list3=dao3.getOldBooks();
			for(BookDetails b:list3) {
			%>
			<div class="col-md-3">
			<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName() %>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Categories:<%=b.getBookCategory() %></p>
						<div class="row">
						<%
						if(u==null)
						{
						%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%
						} else{
						%>
						<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%	
						}
						%>
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-bangladeshi-taka-sign"></i><%=b.getPrice() %></a>
						</div>
					</div>
				</div>
			</div>
							
			<%
			}
			%>



			
		</div>
		<div class="text-center mt-2">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
</body>
</html>