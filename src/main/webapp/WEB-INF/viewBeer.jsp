<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between p-3">
			<h1>Beer Review</h1>
			<div class="d-flex align-items-center">
				<a href="/users/register">New to beer review? Register here!</a>
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<div>
				
				<div class="border p-3">
					<div class="d-flex justify-content-center mb-3">
						<img class="" src="${beer.picture}" />
					</div>
					<h3 class="mb-3">Name: ${beer.name}</h3>
					<h3 class="mb-3">Brewery: ${beer.brewery}</h3>
					<h3 class="mb-3">Type: ${beer.type}</h3>
					<h3 class="mb-3">ABV: ${beer.abv}%</h3>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>