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
				<a href="/users/login">Already a user? Log in here!</a>
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<div>
				<div class="d-flex justify-content-center">
					<h3>Register</h3>
				</div>
				<form:form action="/users/register" method="POST"
					modelAttribute="user">
					<div class="mb-3">
						<form:label class="form-label" path="firstName">First Name:</form:label>
						<form:input class="form-control" type="text" path="firstName" />
						<form:errors style="color: red" path="firstName" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="firstName">Last Name:</form:label>
						<form:input class="form-control" type="text" path="lastName" />
						<form:errors style="color: red" path="lastName" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="hometown">Hometown:(optional)</form:label>
						<form:input class="form-control" type="text" path="hometown" />
						<form:errors style="color: red" path="hometown" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="email">Email:</form:label>
						<form:input class="form-control" type="email" path="email" />
						<form:errors style="color: red" path="email" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="password">Password:</form:label>
						<form:input class="form-control" type="password" path="password" />
						<form:errors style="color: red" path="password" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="passwordConfirm">Confirm Password:</form:label>
						<form:input class="form-control" type="password"
							path="passwordConfirm" />
						<form:errors style="color: red" path="passwordConfirm" />
					</div>
					<div class="d-flex justify-content-center">
						<button class="btn btn-primary ">Register</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>