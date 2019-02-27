<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!-- CARD QLPB -->
<div class="card-body">
	<div class="card-body">
		<h1 class="card-title"><s:messager code="dep.departmanagerment"/></h1>
		<p class="card-text">
		<div class="row">
			<div class="col-8">
				<button class="btn btn-success" data-toggle="modal"
					data-target="#AddPB"><s:messager code="dep.add"/></button>
			</div>
			<div class="col-4">
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search">
					<button class="btn btn-success my-2 my-sm-0" type="button"><s:messager code="dep.search"/></button>
				</form>
			</div>
		</div>
		<br>
		<c:if test="${not empty LIST_DEPART}">
			<table class="table table-hover">
				<thead>
					<tr>
						<th><s:messager code="dep.id"/></th>
						<th><s:messager code="dep.name"/></th>
						<th style="width: 10px;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${LIST_DEPART}" var="dep">
						<tr>
							<td>${dep.id}</td>
							<td>${dep.name}</td>
							 
							<td>
								<div class="dropdown">
									<button
										class="btn btn-primary fa fa-cog text-info btnSetting dropdown-toggle"
										data-toggle="dropdown"></button>

									<div class="dropdown-menu">
										<button
											onclick="location.href='/Java5/admin/depart/update?id=${dep.id}&name=${dep.name}'"
											type="button" class="dropdown-item" data-toggle="modal"
											data-target="#EditPB"><s:messager code="dep.edit"/></button>
										<a class="dropdown-item"
											href="/Java5/admin/depart/delete?id=${dep.id}&name=${dep.name}"><s:messager code="dep.del"/></a>
									</div>
								</div>

							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</div>
<!-- End CARD QLPB --><jsp:include page="departInsertModal.jsp"></jsp:include>
<jsp:include page="departEditModal.jsp"></jsp:include>