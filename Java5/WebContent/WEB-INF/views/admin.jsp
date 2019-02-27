<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý Phòng Ban</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link
	href="<c:url value="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="https://doc-08-40-docs.googleusercontent.com/docs/securesc/v59e6svcev51kn4c9u5a42ks8uojuvvs/c3cu1uivq6bbl3os7holmhddcfuiudj4/1550743200000/03000763563995590061/03000763563995590061/1mvvxJo0AszuuB9x5itXBDOw52Y4fIUSv?h=12019089771500364299&e=download"/>"
	rel="stylesheet">
<link
	href="<c:url value="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />"
	rel="stylesheet">
</head>
<body>
	<!-- NAV -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- End NAV -->
	<!-- ======================================================================= -->
	<!-- Boby Left-->
	<div class="container-fluid"
		style="height: 1000px; background-color: #898989; width: 22%; float: left;">
		<jsp:include page="aside.jsp"></jsp:include>
	</div>
	<div class="container-fluid"
		style="height: 1000px; width: 78%; float: right;">
		<jsp:include page="${param.view}"></jsp:include>
	</div>
</body>
</html>
