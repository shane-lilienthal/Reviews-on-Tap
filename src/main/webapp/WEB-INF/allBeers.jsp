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
				<c:forEach var="beer" items="${beers}">
					<div class="d-flex align-items-center mb-4">
						<img class="m-3" src="${beer.picture}"  /> 
						<h1><a href="/beers/${beer.id}">${beer.name}</a></h1>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>