<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div class="card-body QLNV">
	<div class="card-body">
		<h1 class="card-title"><s:message code="sta.staffmanagerment"></s:message></h1>
		<p class="card-text">
		<div class="row">
			<div class="col-2">
				<button class="btn btn-success" data-toggle="modal"
					data-target="#AddNV"><s:message code="sta.add"/></button>
			</div>

			<div class="col-6">
				<form class="form-inline my-2 my-lg-0"
					style="display: inline-block;"
					action="/Java5/admin/staff/staffmanagerment">
					<select name="departId" class="custom-select">
						<option value="0" selected><s:message code="sta.choosedepart"/></option>
						<c:forEach items="${LIST_DEPART}" var="dep">
							<option ${PAGER.departId==dep.id?'selected':'' }
								value="${dep.id}">${dep.name}</option>
						</c:forEach>
					</select> <select id="displayPerPage" name="displayPerPage" class="custom-select"
						style="width: 60px;">
						<option ${PAGER.displayPerPage==1?'selected':''} value="1">1</option>
						<option ${PAGER.displayPerPage==5?'selected':''} value="5">5</option>
						<option ${PAGER.displayPerPage==10?'selected':''} value="10">10</option>
						<option ${PAGER.displayPerPage==25?'selected':''} value="25">25</option>
						<option ${PAGER.displayPerPage==50?'selected':''} value="50">50</option>
						<option ${PAGER.displayPerPage==100?'selected':''} value="100">100</option>
					</select> <select id="orderColumn" name="orderColumn" class="custom-select"
						style="width: 60px;">
						<option ${PAGER.orderColumn==''?'selected':''} value=""><s:message code="sta.orderby"/></option>
						<option ${PAGER.orderColumn=='id'?'selected':''} value="id"><s:message code="sta.id"/></option>
						<option ${PAGER.orderColumn=='name'?'selected':''} value="name"><s:message code="sta.name"/></option>
					</select> <select id="asc" name="asc" class="custom-select" style="width: 60px;">
						<option ${PAGER.asc=='true'?'selected':''} value="true"><s:message code="sta.orderby.asc"/></option>
						<option ${PAGER.asc=='false'?'selected':''} value="false"><s:message code="sta.orderby.desc"/></option>
					</select>
			</div>

			<div class="col-4">
				<input class="form-control mr-sm-2" type="text"
					style="width: 134px; display: inline-block;" placeholder="Search"
					name="keyword" value="${PAGER.keyword}">
				<button id="reset" class="btn btn-success my-2 my-sm-0" type="reset">Reset</button>
				<button class="btn btn-success my-2 my-sm-0" type="submit">Reload</button>
			</div>
			</form>
		</div>
		<br>
		<c:if test="${not empty LIST_STAFF}">
			<table class="table   table-hover">
				<thead>
					<tr>
						<th><s:message code="sta.id"/></th>
						<th><s:message code="sta.name"/></th>
						<th><s:message code="sta.gender"/></th>
						<th><s:message code="sta.dateobirth"/></th>
						<th><s:message code="sta.photo"/></th>
						<th><s:message code="sta.email"/></th>
						<th><s:message code="sta.phone"/></th>
						<th><s:message code="sta.depart"/></th>
						<th style="width: 10px;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${LIST_STAFF}" var="sta">
						<tr>
							<td>${sta.id}</td>
							<td>${sta.name}</td>
							<td>${sta.gender==false?"Nữ":"Nam"}</td>
							<td><fmt:formatDate value="${sta.birthday}"
									pattern="dd-MM-yyyy" /></td>
							<td><img align="${sta.photo}"
								src="/Java5/thuvien/images/${sta.photo}" width="44px"
								height="66px" /></td>
							<td>${sta.email}</td>
							<td>${sta.phone}</td>
							<td>${sta.departId.name}</td>
							<td width="50px">
								<div class="dropdown">
									<button
										class="btn btn-primary fa fa-cog text-info btnSetting dropdown-toggle"
										data-toggle="dropdown"></button>
									<div class="dropdown-menu">
										<!-- Button to Open the Modal -->
										<button
											onclick="location.href='/Java5/admin/staff/info?id=${sta.id}'"
											type="button" class="dropdown-item" data-toggle="modal"
											data-target="#TTNV"><s:message code="sta.info"/></button>
										<button
											onclick="location.href='/Java5/admin/staff/update?id=${sta.id}'"
											type="button" class="dropdown-item" data-toggle="modal"
											data-target="#EditNV"><s:message code="sta.edit"/></button>
										<a class="dropdown-item"
											href="/Java5/admin/staff/delete?id=${sta.id}"><s:message code="sta.del"/></a>
										<button
											onclick="location.href='/Java5/admin/record/insert/${sta.id}'"
											type="button" class="dropdown-item" data-toggle="modal"
											data-target="#InsertRecord"><s:message code="sta.recach"/></button>
									</div>
								</div>
							</td>
						</tr>
						<c:set var="count" value="${count+1}" />
					</c:forEach>
				</tbody>
			</table>
			<div class="row">
				<div class="col-9"></div>
				<div class="col-3">
					<ul class="pagination">
						<c:if test="${PAGER.currentPage>2 }">
							<li class="page-item"><a class="page-link"
								href="/Java5/admin/staff/staffmanagerment?displayPerPage=${PAGER.displayPerPage}&currentPage=1&totalResult=${PAGER.totalResult}&orderColumn=${PAGER.orderColumn}&keyword=${PAGER.orderColumn}&asc=${PAGER.asc}">First
									Page</a></li>
						</c:if>
						<c:forEach begin="1" end="${PAGER.totalPage}" step="1" var="page">
							<li ${page>PAGER.currentPage+1||page<PAGER.currentPage-1?'style="display: none;"':''}  class="page-item"><a class="page-link"
								href="/Java5/admin/staff/staffmanagerment?displayPerPage=${PAGER.displayPerPage}&currentPage=${page}&totalResult=${PAGER.totalResult}&orderColumn=${PAGER.orderColumn}&keyword=${PAGER.orderColumn}&asc=${PAGER.asc}">${page}</a>
							</li>
						</c:forEach>
						<c:if test="${PAGER.currentPage <PAGER.totalPage-2}">
							<li class="page-item"><a class="page-link"
								href="/Java5/admin/staff/staffmanagerment?displayPerPage=${PAGER.displayPerPage}&currentPage=${PAGER.totalPage}&totalResult=${PAGER.totalResult}&orderColumn=${PAGER.orderColumn}&keyword=${PAGER.orderColumn}&asc=${PAGER.asc}">Last
									Page</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</c:if>
	</div>
	<jsp:include page="staffInformation.jsp"></jsp:include>
	<jsp:include page="staffEditModal.jsp"></jsp:include>
	<jsp:include page="recordInsertModal.jsp"></jsp:include>
</div>
<jsp:include page="staffInsertModal.jsp"></jsp:include>
<script>
	$("#reset").on("click", function() {
		$('#departId').prop('selected', function() {
			return this.defaultSelected;
		});
		$('#displayPerPage').prop('selected', function() {
			return this.defaultSelected;
		});
		$('#orderColumn').prop('selected', function() {
			return this.defaultSelected;
		});
		$('#asc').prop('selected', function() {
			return this.defaultSelected;
		});
	});
</script>