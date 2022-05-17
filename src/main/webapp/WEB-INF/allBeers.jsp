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
				<a class="ms-3 nav-item" href="/home">Home</a>
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
		<div class="d-flex justify-content-center pt-5">
			<div>
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<div class="d-flex justify-content-center static-title mb-5">
							<p>*Log in or register to add a beer to the collection!</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="d-flex justify-content-center mb-5">
							<a class="nav-item" href="/beers/new">*Don't see a beer?
								Add it here!</a>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="all-beers ps-3 pe-3 mb-5">
					<c:forEach var="beer" items="${beers}">
						<div class="d-flex justify-content-start align-items-center mb-4">
							<img class="img-thumbnail beer-img" src="${beer.picture}" />
							<h1>
								<a class="beer-title ms-5" href="/beers/${beer.id}">${beer.name}</a>
							</h1>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>