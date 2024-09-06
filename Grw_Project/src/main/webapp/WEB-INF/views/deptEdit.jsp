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
<body>


	<div id="kt_app_content" class="app-content flex-column-fluid">
		<!--begin::Content container-->
		<div id="kt_app_content_container" class="app-container container-xxl">
			<!--begin::Card-->
			<div
				class="card card-flush pb-0 bgi-position-y-center bgi-no-repeat mb-10"
				style="background-size: auto calc(100% + 10rem); background-position-x: 100%; background-image: url('assets/media/illustrations/sketchy-1/4.png')">
				<!--begin::Card header-->
				<div class="card-header pt-10">
					<div class="d-flex align-items-center">
						<!--begin::Icon-->
						<div class="symbol symbol-circle me-5">
							<div
								class="symbol-label bg-transparent text-primary border border-secondary border-dashed">
								<i class="ki-duotone ki-abstract-47 fs-2x text-primary"> <span
									class="path1"></span> <span class="path2"></span>
								</i>
							</div>
						</div>
						<!--end::Icon-->
						<!--begin::Title-->
						<div class="d-flex flex-column">
							<h2 class="mb-1">설정 [부서관리]</h2>
							<div class="text-muted fw-bold">
								<!-- 													<a href="#">Keenthemes</a> -->
								<span class="mx-3"></span>
								<!-- 													<a href="#">File Manager</a> -->
								<span class="mx-3"></span> <span class="mx-3"></span>
							</div>
						</div>
						<!--end::Title-->
					</div>
				</div>
				<!--end::Card header-->
				<!--begin::Card body-->
				<div class="card-body pb-0">
					<!--begin::Navs-->
					<!-- 											<div class="d-flex overflow-auto h-55px"> -->
					<!-- 												<ul class="nav nav-stretch nav-line-tabs nav-line-tabs-2x border-transparent fs-5 fw-semibold flex-nowrap"> -->
					<!-- 													begin::Nav item -->
					<!-- 													<li class="nav-item"> -->
					<!-- 														<a class="nav-link text-active-primary me-6" href="apps/file-manager/folders.html">Files</a> -->
					<!-- 													</li> -->
					<!-- 													end::Nav item -->
					<!-- 													begin::Nav item -->
					<!-- 													<li class="nav-item"> -->
					<!-- 														<a class="nav-link text-active-primary me-6 active" href="apps/file-manager/settings.html">Settings</a> -->
					<!-- 													</li> -->
					<!-- 													end::Nav item -->
					<!-- 												</ul> -->
					<!-- 											</div> -->
					<!--begin::Navs-->
				</div>
				<!--end::Card body-->
			</div>
			<!--end::Card-->
			<!--begin::Card-->
			<div class="card card-flush">
				<!--begin::Card header-->
				<div class="card-header pt-8">
					<!--begin::Card title-->
					<div class="card-title">
						<h2>부서관리 수정</h2>
					</div>
					<!--end::Card title-->
				</div>
				<!--end::Card header-->
				<!--begin::Card body-->
				<div class="card-body">
					<!--begin::Form-->
					<form class="form" id="kt_file_manager_settings"
						action="./deptList.do" method="post">
						<!--begin::Input group-->
						<div class="fv-row row mb-15">
							<!--begin::Col-->
							<div class="col-md-3 d-flex align-items-center">
								<!--begin::Label-->
								<label class="fs-6 fw-semibold">부서명</label>
								<!--end::Label-->
							</div>
							<!--end::Col-->
							<!--begin::Col-->
							<div class="col-md-9">
								<!--begin::Input-->


								<select class="form-control form-control-solid mb-3 mb-lg-0"
									name="deptName">
									<c:forEach var="deptMg" items="${depEdit}">
										<option>${deptMg.dep_name}</option>
									</c:forEach>
								</select>
							</div>
							<!--end::Col-->
						</div>
						<!--end::Input group-->
						<!--begin::Input group-->
						<div class="fv-row row mb-15">
							<!--begin::Col-->
							<div class="col-md-3">
								<!--begin::Label-->
								<label class="fs-6 fw-semibold mt-2">부서번호</label>
								<!-- 														<div class="text-muted fs-7">For more info on moment() date formats, please  -->
								<!-- 														<a href="https://momentjs.com/docs/#/displaying/format/" target="_blank">click here</a>. -->
								<!-- 														</div> -->
								<!--end::Label-->
							</div>
							<!--end::Col-->
							<!--begin::Col-->
							<div class="col-md-9">
								<select class="form-control form-control-solid mb-3 mb-lg-0"
									name="deptNo">
									<c:forEach var="deptMg" items="${depEdit}">
										<option>${deptMg.dep_no}</option>
									</c:forEach>
								</select>
							</div>
							<!--end::Col-->
						</div>
						<div class="fv-row row mb-15">
							<!--begin::Col-->
							<div class="col-md-3">
								<!--begin::Label-->
								<label class="fs-6 fw-semibold mt-2">부서관리자</label>
								<!-- 														<div class="text-muted fs-7">Default file compression type when downloading folders</div> -->
								<!--end::Label-->
							</div>
							<!--end::Col-->
							<!--begin::Col-->
							<div class="col-md-9">
								<select class="form-control form-control-solid mb-3 mb-lg-0"
									name="deptMg">
									<c:forEach var="deptMg" items="${depEdit}">
										<option>${deptMg.emp_name}</option>
									</c:forEach>
								</select>
							</div>
							<!--end::Col-->
						</div>
						<!--end::Input group-->
						<!--begin::Input group-->

						<!--end::Input group-->
						<!--begin::Action buttons-->
						<div class="row mt-12">
							<div class="col-md-9 offset-md-3">
								<!--begin::Cancel-->
								<button type="button" class="btn btn-light me-3"
									onclick="location.href='./deptList.do'">취소</button>
								<!--end::Cancel-->
								<button type="button" class="btn btn-danger"
									onclick="location.href='./deptList.do'">삭제</button>
								<!--begin::Button-->
								<button type="submit" class="btn btn-primary"
									id="kt_file_manager_settings_submit">
									<span class="indicator-label">저장</span> <span
										class="indicator-progress">저장 중 입니다... <span
										class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
								</button>
								<!--end::Button-->
							</div>
						</div>
						<!--begin::Action buttons-->
					</form>
					<!--end::Form-->
				</div>
				<!--end::Card body-->
			</div>
			<!--end::Card-->
		</div>
		<!--end::Content container-->
	</div>


</body>


<%@include file="./footer.jsp"%>
</html>

