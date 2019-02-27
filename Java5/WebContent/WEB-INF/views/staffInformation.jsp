<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty SELECTED_ITEM_INFO }">
<div class="modal fade" id="TTNV">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title"><s:messager code="sta.infostaff"/></h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="">
                        <div class="row">
                            <div class="col-7">
                                <div class="form-group txt">
                                    <label><s:messager code="sta.id"/></label>
                                    <input class="form-control" value="${SELECTED_ITEM_INFO.id}" readonly="readonly">
                                </div>
                                <div class="form-group txt">
                                    <label><s:messager code="sta.name"/></label>
                                    <input class="form-control" value="${SELECTED_ITEM_INFO.name}" readonly="readonly">
                                </div>
                                <div class="form-group txt">
                                    <label><s:messager code="sta.gender"/></label>
                                    <input class="form-control" value="${SELECTED_ITEM_INFO.gender?"<s:messager code="sta.male"/>":"<s:messager code="sta.female"/>"}" readonly="readonly">
                                </div>
                                <div class="form-group txt">
                                    <label><s:messager code="sta.dateobirth"/></label>
                                    <input class="form-control" type="date" value="${SELECTED_ITEM_INFO.birthday}" readonly="readonly">
                                </div>
                                <div class="form-group txt">
                                    <label><s:messager code="sta.salary"/></label>
                                    <input class="form-control" value="<fmt:formatNumber type="number" value="${SELECTED_ITEM_INFO.salary}"/>" readonly="readonly">
                                </div>

                                <div class="form-group txt">
                                    <label><s:messager code="sta.note"/></label>
                                    <input class="form-control" value="${SELECTED_ITEM_INFO.notes}" readonly="readonly">
                                </div>
                                <div class="form-group txt">
                                    <label><s:messager code="sta.depart"/></label>
                                    <input class="form-control" value="${SELECTED_ITEM_INFO.departId.name}" readonly="readonly">
                                </div>
                                
                        </div>
                        <div class="col-5"> <img src="thuvien/images/avt.png" class="rounded avt" alt="Cinque Terre"></div>
                       
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End TTNV -->
</c:if>
	<script type="text/javascript">
		$('#TTNV').modal('show');
	</script>
</body>
</html>