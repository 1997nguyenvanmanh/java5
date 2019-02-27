<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib prefix="f" uri="/WEB-INF/tlds/function.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="card-body TOP" style="display:;">
			<div class="card-body">
				<h1 class="card-title">TOP Nhân Viên Xuất Sắc</h1>
				<p class="card-text"></p>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>TOP#</th>
							<th>ID</th>
							<th>Họ tên</th>
							<th>Ảnh</th>
							<th>Tổng điểm</th>
							<th>Phòng ban</th>
						</tr>
					</thead>
					<tbody>
						<c:set value="0" var="count" />
						<c:forEach items="${ITEM}" var="item">
						<c:set value="${count+1}" var="count" />
							<tr>
								<td>${count}</td>
								<td>${item[0]}</td>
								<td>${(f:findByID(item[0])).name}</td>
								<td><img align="${sta.photo}"
								src="/Java5/thuvien/images/${(f:findByID(item[0])).photo}" width="44px"
								height="66px" /></td>
								<td>${item[1]-item[2]}</td>
								<td>${(f:findByID(item[0])).departId.name}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
</body>
</html>