<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="./header.jsp"%>
<body>
	<!-- 컨텐트 영역 -->
	<div style="padding-left:80px; margin-top:10px;" id="kt_app_content" class="app-content flex-column-fluid">
		<div style="padding-left:80px;" id="kt_app_content_container" class="app-container container-xxl">
			<!-- 카드 시작 -->
			<div class="card">
			<div class="card-header">
				<h2 class="card-title fw-bold">Calendar</h2>
				<div class="card-toolbar">
					<button class="btn btn-flex btn-primary" data-kt-calendar="add">
					<i class="ki-duotone ki-plus fs-2"></i>Add Event</button>
				</div>
			</div>
			<div class="card-body">
				<div style="height:auto;" id="calendar"></div>
			</div>
			</div>
		</div>
	</div>
</body>
<%@include file="./footer.jsp" %>
</html>