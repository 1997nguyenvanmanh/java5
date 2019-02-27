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
	<c:if test="${not empty INSERT_RECORD_ITEM }">
		<!-- EDITPB -->
		<div class="modal fade" id="InsertRecord">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Ghi nhận thành tích/ kỷ luật nhân viên: 
						${INSERT_RECORD_ITEM.name} phòng ${INSERT_RECORD_ITEM.departId.name} </h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form action="/Java5/admin/record/insert" method="post">
							<div class="row">
								<div class="col-12">
									<input type="hidden" name="staffId" value="${INSERT_RECORD_ITEM.id}" />
									<div>
										<label>Loại</label> <br>
										<div style="display: inline-block;">
											<input type="radio" name="type" value="true" required /> 
												<label >Thành tích</label>
										</div>
										<div style="display: inline-block;">
											<input type="radio" name="type" value="false"  required /> 
											<label" >Kỷ luật</label>
										</div>
									</div>
									<div class="form-group txt">
										<label>Lý do</label> <input class="form-control"
											name="reason" required>
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
		$('#InsertRecord').modal('show');
	</script>
</body>
</html>