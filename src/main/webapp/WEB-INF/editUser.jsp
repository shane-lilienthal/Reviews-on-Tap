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
					<h1 id="title-main">
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
		<div class="d-flex justify-content-center">
			<div class="mt-5 mb-5">
				<div class="d-flex justify-content-center static-title">
					<h3>Edit Info</h3>
				</div>
				<form:form class="p-3" action="/users/${currentUser.id}/update" method="POST"
					modelAttribute="currentUser">
					<input type="hidden" name="id" value="<c:out value="${currentUser.id}"/>">
					<div class="mb-3">
						<form:label class="form-label" path="firstName">First Name:</form:label>
						<form:input class="form-control" type="text" path="firstName" />
						<form:errors class="error" path="firstName" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="firstName">Last Name:</form:label>
						<form:input class="form-control" type="text" path="lastName" />
						<form:errors class="error" path="lastName" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="hometown">Hometown:(optional)</form:label>
						<form:input class="form-control" type="text" path="hometown" />
						<form:errors class="error" path="hometown" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="email">Email:</form:label>
						<form:input class="form-control" type="email" path="email" />
						<form:errors class="error" path="email" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="password">Enter Current Password or New Password:</form:label>
						<form:input class="form-control" type="password" value="" path="password" />
						<form:errors class="error" path="password" />
					</div>
					<div class="d-flex justify-content-center">
						<button class="btn btn-warning">Update</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>