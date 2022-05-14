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
	<header class="pt-1 pb-1">
	<div class="container d-flex justify-content-between align-items-center">
		<div>
			<div class="d-flex justify-content-start">
				<h1 id="title-main"><a id="title-main" href="/home">Reviews on Tap</a></h1>
				<img class="ms-2" id="title-img" src="/images/beer.png">
			</div>
			<p id="title-secondary">WHERE BEER LOVERS REVIEW BEER</p>
		</div>
		<div class="d-flex">
			<c:choose>
				<c:when test="${empty sessionScope.user}">
					<a class="ms-3 nav-item" href="/home">Home</a>
					<a class="ms-3 nav-item" href="/beers/all">All Beers</a>
					<a class="ms-3 nav-item" href="/users/register">Register</a>
				</c:when>
			</c:choose>
		</div>
	</div>
	</header>
	<div class="container main-content">
		<div class="d-flex justify-content-center">
			<div class="mt-5 mb-5">
				<div class="d-flex justify-content-center static-title">
					<h3>Log In</h3>
				</div>
				<form:form action="/users/login" method="POST" modelAttribute="user">
					<div class="mb-3 error">
						<c:out value="${message}" />
					</div>
					<div class="mb-3">
						<form:label class="form-label static-title" path="email">Email:</form:label>
						<form:input class="form-control" type="email" path="email" />

					</div>
					<div class="mb-3">
						<form:label class="form-label static-title" path="password">Password:</form:label>
						<form:input class="form-control" type="password" path="password" />

					</div>
					<div class="d-flex justify-content-center">
						<button class="btn btn-warning">Log In</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>