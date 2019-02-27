	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
</head>
<body>

	<div class="modal fade" id="AddNV">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"><s:messager code="sta.infostaff"/></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="/Java5/admin/staff/insert" method="post">
						<div class="row">
							<div class="col-7">
								<div class="form-group txt">
									<label><s:messager code="sta.name"/></label> <input class="form-control"
										name="name">
								</div>
								<div class="form-group txt">
									<label><s:messager code="sta.gender"/></label> <br>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" id="gtaddnv1"
											name="gender" value="true"> <label
											class="custom-control-label" for="gtaddnv1"><s:messager code="sta.male"/></label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" id="gtaddnv2"
											name="gender" value="false"> <label
											class="custom-control-label" for="gtaddnv2"><s:messager code="sta.female"/></label>
									</div>
								</div>
								<div class="form-group txt">
									<label><s:messager code="sta.dateobrith"/></label> <input class="form-control"
										type="date" name="birthday">
								</div>
								<div class="form-group txt">
									<label>Email</label> <input class="form-control" name="email">
								</div>
								<div class="form-group txt">
									<label><s:messager code="sta.phone"/></label> <input class="form-control"name="phone">
								</div>
								<div class="form-group txt">
									<label><s:messager code="sta.salary"/></label> <input class="form-control" name="salary" type="number">
								</div>
								<div class="form-group txt">
									<label><s:messager code="sta.note"/></label> <input class="form-control" name="notes">
								</div>
								<label><s:messager code="sta.deparrt"/></label> 
								<select name="departId"
									class="custom-select">
									<option value="0" selected><s:messager code="sta.choosedepart"/></option>
									<c:forEach items="${LIST_DEPART}" var="dep">
										<option value="${dep.id}">${dep.name}</option>
									</c:forEach>
								</select>
								<br>
								
								<div class="custom-file">
									<input name="photo" type="file" class="custom-file-input">
									<label class="custom-file-label" for="customFile">Choose
										file</label>
								</div>
								<br>
								<div class="col-auto right"><button type="submit" class="btn btn-primary"><s:messager code="sta.confirm"/></button></div>
									</div>
								<div class="col-5">
								IMG</div>
							<hr>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End TTNV -->
</body>
</html>