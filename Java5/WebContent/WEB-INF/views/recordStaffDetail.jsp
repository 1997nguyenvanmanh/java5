<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty SELECTED_STAFFRECORD }">
		<div class="modal fade" id="InfoTT">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">
							Thông tin thành tích nhân viên:
							<h6
								style="margin-bottom: 0px; margin-top: 12px; margin-left: 6px;">
								${SELECTED_STAFFRECORD.name} phòng
								${SELECTED_STAFFRECORD.departId.name}</h6>
						</h4>

						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">

						<c:if test="${not empty LIST_RECORD}">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>STT</th>
										<th>ID</th>
										<th>Loại</th>
										<th>Lý do</th>
										<th>Ngày ghi nhận</th>
										<th>
										<th>
									</tr>
								</thead>
								<tbody>
									<c:set value="0" var="count" />
									<c:forEach items="${LIST_RECORD}" var="rec">
										<tr>
											<c:set value="${count+1}" var="count" />
											<td>${count}</td>
											<td>${rec.id }</td>
											<td>${rec.type?'Thành tích':'Kỷ luật'}</td>
											<td>${rec.reason}</td>
											<td><fmt:formatDate value="${rec.date}"
													pattern="dd-MM-yyyy" /></td>
											<td>
												<div class="dropdown">
													<button
														class="btn btn-primary fa fa-cog text-info btnSetting dropdown-toggle"
														data-toggle="dropdown"></button>

													<div class="dropdown-menu">
														<button
															onclick="location.href='/Java5/admin/record/update/${rec.id}'"
															type="button" class="dropdown-item" data-toggle="modal"
															data-target="#EditTT">Sửa</button>
														<a class="dropdown-item"
															href="/Java5/admin/record/delete/${rec.id}">Xóa</a>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
						<div class="container-fluid">
							<div class="row">
								<div class="col-9"></div>
								<div class="col-3">
									<ul class="pagination">
										<c:if test="${PAGER.currentPage>2 }">
											<li class="page-item"><a class="page-link"
												href="/Java5/admin/record/recordstaffmanagerment/${SELECTED_STAFFRECORD.id}?displayPerPage=${PAGER.displayPerPage}&currentPage=1&totalResult=${PAGER.totalResult}&orderColumn=${PAGER.orderColumn}&keyword=${PAGER.orderColumn}&asc=${PAGER.asc}">First
													Page</a></li>
										</c:if>
										<c:forEach begin="1" end="${PAGER.totalPage}" step="1"
											var="page">
											<li class="page-item"><a class="page-link"
												href="/Java5/admin/record/recordstaffmanagerment/${SELECTED_STAFFRECORD.id}?displayPerPage=${PAGER.displayPerPage}&currentPage=${page}&totalResult=${PAGER.totalResult}&orderColumn=${PAGER.orderColumn}&keyword=${PAGER.orderColumn}&asc=${PAGER.asc}">${page}</a>
											</li>
										</c:forEach>
										<c:if test="${PAGER.currentPage <PAGER.totalPage-2}">
											<li class="page-item"><a class="page-link"
												href="/Java5/admin/record/recordstaffmanagerment/${SELECTED_STAFFRECORD.id}?displayPerPage=${PAGER.displayPerPage}&currentPage=${PAGER.totalPage}&totalResult=${PAGER.totalResult}&orderColumn=${PAGER.orderColumn}&keyword=${PAGER.orderColumn}&asc=${PAGER.asc}">Last
													Page</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End TTNV -->
	</c:if>
	<script type="text/javascript">
		$('#InfoTT').modal('show');
	</script>
</body>
</html>