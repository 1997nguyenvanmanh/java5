<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!-- CARD QLTK -->
			<div class="card-body QLNV">
				<div class="card-body">
					<h1 class="card-title"><s:message code="acc.accountmanagerment"/></h1>
					<p class="card-text">
					<div class="row">
						<div class="col-8">
							<button class="btn btn-success" data-toggle="modal"
								data-target="#AddTK"><s:message code="acc.add"/></button>
						</div>
						<div class="col-4">
							<form class="form-inline my-2 my-lg-0">
								<input class="form-control mr-sm-2" type="text"
									placeholder="Search">
								<button class="btn btn-success my-2 my-sm-0" type="button"><s:message code="acc.search"/></button>
							</form>
						</div>
					</div>
					<br>
					<c:if test="${not empty LIST_ACCOUNT}">
						<table class="table table-hover">
							<thead>
								<tr>
									<th><s:message code="acc.use"/></th>
									<th><s:message code="acc.pass"/></th>
									<th><s:message code="acc.name"/></th>
									<th style="width: 10px;"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${LIST_ACCOUNT}" var="acc">
									<tr>
										<td>${acc.username}</td>
										<td>${acc.password}</td>
										<td>${acc.fullname}</td>
										<td>
											<div class="dropdown">
												<button
													class="btn btn-primary fa fa-cog text-info btnSetting dropdown-toggle"
													data-toggle="dropdown"></button>

												<div class="dropdown-menu">
													<button
														onclick="location.href='/Java5/admin/account/update?username=${acc.username}&password=${acc.password}&fullname=${acc.fullname}'"
														type="button" class="dropdown-item" data-toggle="modal"
														data-target="#EditTK"><s:message code="acc.edit"/></button>
													<a class="dropdown-item"
														href="/Java5/admin/account/delete?username=${acc.username}"><s:message code="acc.del"/></a>
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
			<!-- End CARD QLTK -->
			<jsp:include page="accountInsertModal.jsp"></jsp:include>
	<jsp:include page="accountEditModal.jsp"></jsp:include>
