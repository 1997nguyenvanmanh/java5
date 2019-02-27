<%@page import="entity.Departs"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty SELECTED_ITEM_EDIT }">
		<div class="modal fade" id="EditRecord">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title"><s:messager code="sta.editstaff"/></h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<form action="/Java5/admin/staff/update" method="post">
							<div class="row">
								<div class="col-7">
									<div class="form-group txt">
										<label>ID</label> <input class="form-control" name="id"
											value="${SELECTED_ITEM_EDIT.id}" readonly="readonly">
									</div>
									<div class="form-group txt">
										<label><s:messager code="sta.name"/></label> <input class="form-control"
											name="name" value="${SELECTED_ITEM_EDIT.name}" required>
									</div>
									<div>
										<label><s:messager code="sta.gender"/></label> <br>
										<div style="display: inline-block;">
											<input type="radio" name="gender" value="true"
												${SELECTED_ITEM_EDIT.gender?"checked":""} required /> 
												<label ><s:messager code="sta.male"/></label>
										</div>
										<div style="display: inline-block;">
											<input type="radio" name="gender" value="false" 
											${SELECTED_ITEM_EDIT.gender?"":"checked"} required /> 
											<label" ><s:messager code="sta.female"/></label>
										</div>
									</div>
									<div class="form-group txt">
										<label><s:messager code="sta.dateobirth"/></label> <input class="form-control"
											type="date" name="birthday"
											value="${SELECTED_ITEM_EDIT.birthday}" required>
									</div>
									<div class="form-group txt">
										<label>Email</label> <input class="form-control" name="email"
											value="${SELECTED_ITEM_EDIT.email}" required>
									</div>
									<div class="form-group txt">
										<label><s:messager code="sta.phone"/></label> <input class="form-control"
											name="phone" value="${SELECTED_ITEM_EDIT.phone}" required>
									</div>
									<div class="form-group txt">
										<label><s:messager code="sta.salary"/></label> <input class="form-control"
											name="salary" value="<fmt:formatNumber pattern="###########" type="number" value="${SELECTED_ITEM_EDIT.salary}"/>" required>
									</div>
									<div class="form-group txt">
										<label><s:messager code="sta.note"/></label> <input class="form-control"
											name="notes" value="${SELECTED_ITEM_EDIT.notes}">
									</div>
									<label><s:messager code="sta.depart"/></label> <select name="departId"
										class="custom-select">
										<option value="0">---<s:messager code="sta.choosedepart"/>---</option>
										<c:forEach items="${LIST_DEPART}" var="dep">
											<option value="${dep.id}"
												${SELECTED_ITEM_EDIT.departId.id==dep.id?'selected':''}>${dep.name}</option>
										</c:forEach>
									</select>
									<div class="custom-file">
										<input name="photo" type="file" class="custom-file-input"
											value="${SELECTED_ITEM_EDIT.photo}"> <label
											class="custom-file-label" for="customFile"><s:messager code="sta.choosefile"/></label>
									</div>
								</div>
								<div class="col-5">IMG</div>
								<hr>
								<button type="submit" class="btn btn-primary"><s:messager code="sta.confirm"/></button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- End EditNV -->
	</c:if>
	<script type="text/javascript">
		$('#EditRecord').modal('show');
	</script>
</body>
</html>