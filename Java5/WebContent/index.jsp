<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty ADMIN}">
		<c:redirect url="/login"></c:redirect>
	</c:if>
	<c:redirect url="/admin"></c:redirect>
</body>
</html>