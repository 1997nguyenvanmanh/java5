<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty SELECTED_ITEM }">
		<!-- EDITPB -->
		<div class="modal fade" id="EditPB">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Sửa thông tin phòng ban</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form action="/Java5/admin/depart/update" method="post">
							<div class="row">
								<div class="col-12">
									<div class="form-group txt">
										<label>ID</label> <input class="form-control" name="id"
											value="${SELECTED_ITEM.id}" readonly="readonly">
									</div>
									<div class="form-group txt">
										<label>Tên phòng</label> <input class="form-control"
											name="name" value="${SELECTED_ITEM.name}" required>
									</div>
									<hr>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- End AddPB -->
	</c:if>
	<script type="text/javascript">
		$('#EditPB').modal('show');
	</script>
</body>
</html>