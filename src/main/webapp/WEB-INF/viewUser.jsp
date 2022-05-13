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
<body class="page-body">
	<header class="d-flex justify-content-between align-items-center pt-3 pb-1">
		<div class="ms-5">
			<div class="d-flex justify-content-start">
				<h1><a id="title-main" href="/home">Reviews on Tap</a></h1>
				<img class="ms-2" id="title-img"
					src="/images/beer.png">
			</div>
			<p id="title-secondary">WHERE BEER LOVERS REVIEW BEER</p>
		</div>
		<div class="d-flex me-5">
			<a class="ms-3 nav-item" href="/home">Home</a>
			<a class="ms-3 nav-item" href="/beers/all">All Beers</a>
			<a class="ms-3 nav-item" href="/users/logout">Logout</a>
		</div>
	</header>
	<div class="container main-content">
		<div class="d-flex justify-content-around p-5">
			<div class="mt-5 mb-5">
				<div class="border user-item p-3">
					<div class="d-flex justify-content-center mb-3">
						<h2>My Info</h2>
					</div>
					<h3 class="mb-3">Name: ${currentUser.firstName}
						${currentUser.lastName}</h3>
					<h3 class="mb-3">Email: ${currentUser.email}</h3>
					<h3 class="mb-3">Hometown: ${currentUser.hometown}</h3>
				</div>
			</div>
			<div>
				<div class="d-flex justify-content-center mb-3">
					<h3>My Reviews</h3>
				</div>
				<div class="scroll p-3">
					<c:forEach var="review" items="${reviews}">
						<div class="border review-item p-3 mb-3">
							<div>
								<h3><a class="beer-title" href="/beers/${review.beer.id}">${review.beer.name}</a></h3>
							</div>
							<p>Score: ${review.score}/5</p>
							<p>Comments:</p>
							<p>${review.comments}</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>