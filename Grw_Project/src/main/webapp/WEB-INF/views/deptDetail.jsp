<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="./header.jsp"%>
</head>
<script src="./js/deptList.js"></script>
<body>


	<div id="kt_app_content" class="app-content flex-column-fluid">
		<div id="kt_app_content_container" class="app-container container-xxl">
			<div
				class="card card-flush pb-0 bgi-position-y-center bgi-no-repeat mb-10"
				style="background-size: auto calc(100% + 10rem); background-position-x: 100%; background-image: url('assets/media/illustrations/sketchy-1/4.png')">
				<div class="card-header pt-10">
					<div class="d-flex align-items-center">
						<div class="symbol symbol-circle me-5">
							<div
								class="symbol-label bg-transparent text-primary border border-secondary border-dashed">
								<i class="ki-duotone ki-abstract-47 fs-2x text-primary"> <span
									class="path1"></span> <span class="path2"></span>
								</i>
							</div>
						</div>
						<div class="d-flex flex-column">
							<h2 class="mb-1">설정 [부서관리]</h2>
							<div class="text-muted fw-bold">
								<span class="mx-3"></span>
								<span class="mx-3"></span> <span class="mx-3"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body pb-0"></div>
			</div>
			<div class="card card-flush">
				<div class="card-header pt-8">
					<div class="card-title">
						<h2>부서관리 수정</h2>
					</div>
				</div>
				
				
				
				
				
				
				<div class="card-body">
					<form class="form" id="kt_file_manager_settings"
						action="./deptDel.do" method="post">
						
						
						<div class="fv-row row mb-15">
							<div class="col-md-3 d-flex align-items-center">
								<label class="fs-6 fw-semibold">부서명</label>
							</div>
							<div class="col-md-9">
								<input type="text" name="depName"
									class="form-control form-control-solid mb-3 mb-lg-0"
									placeholder="${deptDetaile.dep_name} (부서명을 수정하세요.)">
							</div>
						</div>


						<div class="fv-row row mb-15">
							<div class="col-md-3">
								<label class="fs-6 fw-semibold mt-2">부서번호</label>
							</div>
							<div class="col-md-9">
								<input class="form-control form-control-solid mb-3 mb-lg-0"
									name="depNo"
									type="text" value="${deptDetaile.dep_no}" readonly/>
							</div>
						</div>


						<div class="fv-row row mb-15">
							<div class="col-md-3">
								<label class="fs-6 fw-semibold mt-2">부서상태</label>
							</div>
							<div class="col-md-9">
								<select class="form-control form-control-solid mb-3 mb-lg-0"
										name="depSta">
									<option>Y</option>
									<option>N</option>
								</select>
							</div>
						</div>


						<div class="row mt-12">
							<div class="col-md-9 offset-md-3">
								<button type="button" class="btn btn-light me-3"
									onclick="location.href='./deptList.do'">취소</button>
								<button type="submit" class="btn btn-primary"
									id="kt_file_manager_settings_submit">
									<span class="indicator-label">수정</span> <span
										class="indicator-progress">수정 중 입니다... <span
										class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
								</button>
							</div>
						</div>
						
						
					</form>
				</div>
				
				
				
				
			</div>
		</div>
	</div>
</body>


<%@include file="./footer.jsp"%>
</html>