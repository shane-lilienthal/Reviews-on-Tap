<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css" />
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between p-3">
			<div>
				<div class="d-flex justify-content-start">
					<h1>Reviews on Tap</h1>
					<img class="ms-1" id="title-img"
						src="https://www.pinclipart.com/picdir/middle/81-814899_beer-mug-vector-by-checonx-clipart.png">
				</div>
				<p>WHERE BEER LOVERS REVIEW BEER</p>
			</div>
			<div class="d-flex align-items-center">
				<a class="ms-3" href="/home">Home</a> <a class="ms-3"
					href="/users/${currentUser.id}">My Profile</a> <a class="ms-3"
					href="/beers/all">All Beers</a> <a class="ms-3"
					href="/users/logout">Logout</a>
			</div>
		</div>
		<div class="d-flex justify-content-between p-5">


			<div>
				<div class="border p-3">
					<div class="d-flex justify-content-center mb-3">
						<img class="" src="${beer.picture}" />
					</div>
					<h3 class="mb-3">Name: ${beer.name}</h3>
					<h3 class="mb-3">Brewery: ${beer.brewery}</h3>
					<h3 class="mb-3">Type: ${beer.type}</h3>
					<h3 class="mb-3">ABV: ${beer.abv}%</h3>
				</div>
				<div>
					<a class="d-flex justify-content-center mt-3"
						href="/reviews/new/${beer.id}">Add your review here!</a>
				</div>
			</div>
			<div>
				<c:forEach var="review" items="${reviews}">
					<div class="border p-3 mb-3 ms-3">
						<div>
							<h3>Reviewed By: ${review.user.firstName}
								${review.user.lastName}, ${review.user.hometown}</h3>
						</div>
						<div>
							<p>Score: ${review.score}/5</p>
						</div>
					</div>
				</c:forEach>
			</div>


		</div>
	</div>
</body>
</html>