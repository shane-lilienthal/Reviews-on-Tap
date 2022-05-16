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
				<a class="ms-3 nav-item" href="/home">Home</a> <a
					class="ms-3 nav-item" href="/beers/all">All Beers</a> <a
					class="ms-3 nav-item" href="/users/logout">Logout</a>
			</div>
		</div>
	</header>
	<div class="container main-content">
		<div class="d-flex justify-content-between p-5">
			<div>
				<div class="d-flex justify-content-center static-title mb-3">
					<h2>My Info</h2>
				</div>
				<div class="border user-item p-3">
					<div class="d-flex justify-content-center mb-3">
						<img class="" src="/images/user_icon.jpg" />
					</div>
					<h3 class="mb-3">Name: ${currentUser.firstName}
						${currentUser.lastName}</h3>
					<h3 class="mb-3">Email: ${currentUser.email}</h3>
					<h3 class="mb-3">Hometown: ${currentUser.hometown}</h3>
				</div>
				<a class="d-flex justify-content-center nav-item mt-3"
					href="/users/${currentUser.id}/edit">Edit your info</a>
			</div>
			<div>
				<div class="d-flex justify-content-center static-title mb-3">
					<h3>My Reviews</h3>
				</div>
				<div class="scroll review-holder ps-5 pe-5 pb-5">
					<c:forEach var="review" items="${reviews}">
						<div class="border review-item p-3 mb-3">
							<div>
								<h3>
									<a class="beer-title-review" href="/beers/${review.beer.id}">${review.beer.name}</a>
								</h3>
							</div>
							<div class="d-flex justify-content-start">
								<h4>Score: ${review.score}/5</h4>
								<img class="ms-1" id="review-img" src="/images/star_icon.png">
							</div>
							<h4>Comments:</h4>
							<p>${review.comments}</p>
							<div>
								<a href="/reviews/${review.id}/edit"><button
										class="btn btn-primary">Edit</button></a> <a
									href="/reviews/${review.id}/delete"><button
										class="btn btn-danger">Delete</button></a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>