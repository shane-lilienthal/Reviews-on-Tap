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
<title>Reviews on Tap</title>
</head>
<body class="page-body">
	<header class="pt-2 pb-1">
		<div
			class="container d-flex justify-content-between align-items-center">
			<div>
				<div class="d-flex justify-content-start">
					<h1>
						<a id="title-main" href="/home">Reviews on Tap</a>
					</h1>
					<img class="ms-2" id="title-img" src="/images/beer.png">
				</div>
				<p id="title-secondary">REVIEWS BY BEER LOVERS, FOR BEER LOVERS</p>
			</div>
			<div class="d-flex">
				<a class="ms-3 nav-item" href="/home">Home</a> <a
					class="ms-3 nav-item" href="/beers/all">All Beers</a>
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<a class="ms-3 nav-item" href="/users/register">Register</a>
						<a class="ms-3 nav-item" href="/users/login">Login</a>
					</c:when>
					<c:otherwise>
						<a class="ms-3 nav-item" href="/users/${currentUser.id}">My
							Profile</a>
						<a class="ms-3 nav-item" href="/users/logout">Logout</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>
	<div class="container main-content">
		<div class="d-flex justify-content-between p-5">
			<div>
				<div class="d-flex justify-content-center static-title mb-3">
					<h2>Beer Info</h2>
				</div>
				<div class="border beer-item p-3">
					<div class="d-flex justify-content-center mb-3">
						<img class="" src="${beer.picture}" />
					</div>
					<h3 class="mb-3">Name: ${beer.name}</h3>
					<h3 class="mb-3">Brewery: ${beer.brewery}</h3>
					<h3 class="mb-3">Type: ${beer.type}</h3>
					<h3 class="mb-3">ABV: ${beer.abv}%</h3>
				</div>
				<div>
					<c:choose>
						<c:when test="${empty sessionScope.user}">
							<p class="d-flex justify-content-center mt-3 static-title">Log
								in or register to leave a review!</p>
						</c:when>
						<c:otherwise>
							<a class="d-flex justify-content-center mt-3 nav-item"
								href="/reviews/new/${beer.id}">Add your review here!</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div>
				<div class="d-flex justify-content-center static-title mb-3">
					<h3>All Reviews</h3>
				</div>
				<div class="scroll review-holder ps-5 pe-5 pb-5">
					<c:forEach var="review" items="${reviews}">
						<div class="border review-item p-3 mb-3 ms-3">
							<div>
								<h3>Reviewed By: ${review.user.firstName}
									${review.user.lastName}, ${review.user.hometown}</h3>
							</div>
							<div class="d-flex justify-content-start">
								<h4>Score: ${review.score}/5</h4>
								<img class="ms-1" id="review-img" src="/images/star_icon.png">
							</div>
							<h4>Comments:</h4>
							<p>${review.comments}</p>
						</div>
					</c:forEach>
				</div>
			</div>


		</div>
	</div>
</body>
</html>