<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between">
			<h1>Beer Review</h1>
			<div class="d-flex align-items-center">
				<a href="/users/login">Already a user? Log in here!</a>
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<div>
				<div class="d-flex justify-content-center">
					<h3>Register</h3>
				</div>
				<form:form action="/users/register" method="POST" modelAttribute="user">
					<div class="mb-3">
						<form:label class="form-label" path="firstName">First Name:</form:label>
						<form:errors path="firstName" />
						<form:input class="form-control" type="text" path="firstName" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="firstName">Last Name:</form:label>
						<form:errors path="lastName" />
						<form:input class="form-control" type="text" path="lastName" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="hometown">Hometown:</form:label>
						<form:errors path="hometown" />
						<form:input class="form-control" type="text" path="hometown" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="email">Email:</form:label>
						<form:errors path="email" />
						<form:input class="form-control" type="email" path="email" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="password">Password:</form:label>
						<form:errors path="password" />
						<form:input class="form-control" type="password" path="password" />
					</div>
					<div class="mb-3">
						<form:label class="form-label" path="passwordConfirm">Confirm Password:</form:label>
						<form:errors path="passwordConfirm" />
						<form:input class="form-control" type="password" path="passwordConfirm" />
					</div>
					<div class="d-flex justify-content-center">
						<button class="btn btn-primary ">Login</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>