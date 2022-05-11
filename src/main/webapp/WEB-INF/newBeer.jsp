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
		<div class="d-flex justify-content-between p-3">
			<h1>Beer Review</h1>
			<div class="d-flex align-items-center">
				<a href="/users/login">Already a user? Log in here!</a>
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<div>
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
						<form:input class="form-control" type="number" step="0.1" path="abv" />
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