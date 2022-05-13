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
				<img class="ms-2" id="title-img" src="/images/beer.png">
			</div>
			<p id="title-secondary">WHERE BEER LOVERS REVIEW BEER</p>
		</div>
		<div class="d-flex me-5">
			<a class="ms-3 nav-item" href="/home">Home</a>
			<a class="ms-3 nav-item" href="/users/${currentUser.id}">My Profile</a>
			<a class="ms-3 nav-item" href="/beers/all">All Beers</a>
			<a class="ms-3 nav-item" href="/users/logout">Logout</a>
		</div>
	</header>
	<div class="container main-content">
		<div class="d-flex justify-content-center">
			<div class="mt-5 mb-5">
				<div class="d-flex justify-content-center">
					<h3>Add a new beer!</h3>
				</div>
				<form:form action="/beers/add" method="POST" modelAttribute="beer">
					<div class="mb-3">
						<form:label class="form-label" path="name">Name:</form:label>
						<form:input class="form-control" type="text" path="name" />
						<form:errors style="color: red" path="name" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="brewery">Brewery:</form:label>
						<form:input class="form-control" type="text" path="brewery" />
						<form:errors style="color: red" path="brewery" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="type">Type</form:label>
						<form:input class="form-control" type="text" path="type" />
						<form:errors style="color: red" path="type" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="abv">ABV(percentage):</form:label>
						<form:input class="form-control" type="number" step="0.1"
							path="abv" />
						<form:errors style="color: red" path="abv" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="picture">Picture file/URL:</form:label>
						<form:input class="form-control" type="text" path="picture" />
						<form:errors style="color: red" path="picture" />
					</div>
					<div class="d-flex justify-content-center">
						<button class="btn btn-primary ">Add Beer</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>