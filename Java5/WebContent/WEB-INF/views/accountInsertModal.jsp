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
<div class="modal fade" id="AddTK">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"><s:message code="acc.add"/></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="/Java5/admin/account/insert">
						<div class="row">
							<div class="col-12">
								<div class="form-group txt">
									<label><s:message code="acc.use"/></label> <input name="username"
										class="form-control" required>
								</div>
								<div class="form-group txt">
									<label><s:message code="acc.pass"/></label> <input name="password"
										class="form-control " required>
								</div>
								<div class="form-group txt">
									<label><s:message code="acc.name"/></label> <input name="fullname"
										class="form-control" required>
								</div>
								<hr>
								<button type="submit" class="btn btn-primary"><s:message code="acc.confirm"/></button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>