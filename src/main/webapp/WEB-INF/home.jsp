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
			<a class="ms-3 nav-item" href="/beers/all">All Beers</a>
			<c:choose>
				<c:when test="${empty sessionScope.user}">
					<a class="ms-3 nav-item" href="/users/register">Register</a>
					<a class="ms-3 nav-item" href="/users/login">Login</a>
				</c:when>
				<c:otherwise>
					<a class="ms-3 nav-item" href="/users/${currentUser.id}">My Profile</a>
					<a class="ms-3 nav-item" href="/users/logout">Logout</a>
				</c:otherwise>
			</c:choose>
		</div>
	</header>
	<div class="container main-content">
		<div class="d-flex justify-content-center">
			<div class="mt-5 mb-5">
				<c:forEach var="review" items="${reviews}">
					<div class="border review-item p-3 mb-3">
						<h2><a class="beer-title" href="/beers/${review.beer.id}">${review.beer.name}</a></h2>
						<h4>Reviewed By: ${review.user.firstName}
							${review.user.lastName}, ${review.user.hometown}</h4>
						<h4>Score: ${review.score}/5</h4>
						<h4>Comments:</h4>
						<p>${review.comments}</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>