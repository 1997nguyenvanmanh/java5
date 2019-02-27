<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f" uri="/WEB-INF/tlds/function.tld"%>
<div class="card-body TT">
	<div class="card-body">
		<h1 class="card-title">TỔNG HỢP THÀNH TÍCH/ KỶ LUẬT NHÂN VIÊN</h1>
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
		<br>
		<c:if test="${not empty LIST_REPORTRECORD}">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>STT</th>
						<th>ID</th>
						<th>Họ tên</th>
						<th>Ảnh</th>
						<th>Tổng thành tích</th>
						<th>Tổng kỉ luật</th>
						<th>Điểm thưởng</th>
						<th style="width: 10px;"></th>
					</tr>
				</thead>
				<tbody id="TableNVTT">
					<c:set value="0" var="count"></c:set>
					<c:forEach items="${LIST_REPORTRECORD}" var="rep">
						<c:set value="${count+1}" var="count"></c:set>
						<tr>
							<td>${count}</td>
							<td>${rep[0]}</td>
							<td>${(f:findByID(rep[0])).name}</td>
							<td><img align="${sta.photo}"
								src="/Java5/thuvien/images/${(f:findByID(item[0])).photo}"
								width="44px" height="66px" /></td>
							<td>${rep[1]}</td>
							<td>${rep[2]}</td>
							<td>${rep[1]-rep[2]}</td>
							<td width="50px"><button type="button"
									onclick="location.href='/Java5/admin/record/recordstaffmanagerment/${rep[0]}'"
									class="dropdown-item" data-toggle="modal" data-target="#InfoTT">Chi
									tiết</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<div class="row">
				<div class="col-9"></div>
				<div class="col-3">
					<ul class="pagination">
						<c:if test="${PAGER.currentPage>2}">
							<li class="page-item"><a class="page-link"
								href="/Java5/admin/record/recordstaffmanagerment?displayPerPage=${PAGER.displayPerPage}&currentPage=1&totalResult=${PAGER.totalResult}&orderColumn=${PAGER.orderColumn}&keyword=${PAGER.orderColumn}&asc=${PAGER.asc}">First
									Page</a></li>
						</c:if>
						<c:forEach begin="1" end="${PAGER.totalPage}" step="1" var="page">
							<li class="page-item"><a class="page-link"
								href="/Java5/admin/record/recordstaffmanagerment?displayPerPage=${PAGER.displayPerPage}&currentPage=${page}&totalResult=${PAGER.totalResult}&orderColumn=${PAGER.orderColumn}&keyword=${PAGER.orderColumn}&asc=${PAGER.asc}">${page}</a>
							</li>
						</c:forEach>
						<c:if test="${PAGER.currentPage <PAGER.totalPage-2}">
							<li class="page-item"><a class="page-link"
								href="/Java5/admin/record/recordstaffmanagerment?displayPerPage=${PAGER.displayPerPage}&currentPage=${PAGER.totalPage}&totalResult=${PAGER.totalResult}&orderColumn=${PAGER.orderColumn}&keyword=${PAGER.orderColumn}&asc=${PAGER.asc}">Last
									Page</a></li>
						</c:if>
					</ul>
				</div>
			</div>
	</div>
</div>
<jsp:include page="recordEditModal.jsp"></jsp:include>
<jsp:include page="recordStaffDetail.jsp"></jsp:include>