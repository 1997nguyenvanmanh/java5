<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card-body TT" style="display:;">
			<div class="card-body">
				<h1 class="card-title">TỔNG HỢP THÀNH TÍCH/ KỶ LUẬT PHÒNG BAN</h1>
				<p class="card-text">
				<div class="row">
					<div class="col-8"></div>
					<div class="col-4">
						<form class="form-inline my-2 my-lg-0">
							<input class="form-control mr-sm-2" id="searchNVTT" type="text"
								placeholder="Search">
							<button class="btn btn-success my-2 my-sm-0" type="button">Search</button>
						</form>
					</div>
				</div>
				<c:if test="${not empty LIST_REPORTRECORD}">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>Tên phòng ban</th>
								<th>Tổng thành tích</th>
								<th>Tổng kỉ luật</th>
								<th>Điểm thưởng</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${LIST_REPORTRECORD}" var="rep">
								<tr>
									<td>${rep[0]}</td>
									<td>${rep[1]}</td>
									<td>${rep[2]}</td>
									<td>${rep[3]}</td>
									<td>${rep[2]-rep[3]}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
		</div>