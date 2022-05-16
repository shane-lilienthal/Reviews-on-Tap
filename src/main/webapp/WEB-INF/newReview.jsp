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
<body class = "page-body">
	<header class="pt-2 pb-1">
	<div class=" container d-flex justify-content-between align-items-center">
		<div>
			<div class="d-flex justify-content-start">
				<h1><a id="title-main" href="/home">Reviews on Tap</a></h1>
				<img class="ms-2" id="title-img"
					src="/images/beer.png">
			</div>
			<p id="title-secondary">REVIEWS BY BEER LOVERS, FOR BEER LOVERS</p>
		</div>
		<div class="d-flex">
			<a class="ms-3 nav-item" href="/home">Home</a>
			<a class="ms-3 nav-item" href="/users/${currentUser.id}">My Profile</a>
			<a class="ms-3 nav-item" href="/beers/all">All Beers</a>
			<a class="ms-3 nav-item" href="/users/logout">Logout</a>
		</div>
	</div>
	</header>
	<div class="container main-content">
		<div class="d-flex justify-content-center">
			<div class="mt-5 mb-5">
				<div class="d-flex justify-content-center static-title">
					<h3>Add a review for ${beer.name}!</h3>
				</div>
				<form:form class="p-3" action="/reviews/${beer.id}/add" method="POST"
					modelAttribute="review">
					<div class="mb-3">
						<form:label class="form-label" path="score">Score:</form:label>
						<form:input class="form-control" type="number" step="0.5"
							path="score" />
						<form:errors class="error" path="score" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="comments">Comments:</form:label>
						<form:textarea class="form-control" path="comments" />
						<form:errors class="error" path="comments" />
					</div>
					<form:input type="hidden" path="user" value="${currentUser.id}" />
					<form:errors path="user" />
					<form:input type="hidden" path="beer" value="${beer.id}" />
					<form:errors path="user" />
					<div class="d-flex justify-content-center">
						<button class="btn btn-warning">Add Review</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>