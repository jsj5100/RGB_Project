<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<%@include file="./header.jsp"%>
<script type="text/javascript" src="./js/facility.js"></script>

<body>
	<div style="padding-left:80px; margin-top:10px;" id="kt_app_content" class="app-content flex-column-fluid">
		<div style="padding-left:80px;" id="kt_app_content_container" class="app-container container-xxl" style="padding-top: 30px;">
			<!-- 카드시작 -->
			<div class="d-flex flex-column flex-lg-row">

			<!--좌측 -->
			<div class="flex-column flex-lg-row-auto w-100 w-lg-200px w-xl-300px mb-10">
			
				<div class="card card-flush">
				<!--begin::Card header-->
				<div class="card-header">
				    <!--begin::Card title-->
				    <div class="card-title">
				        <h2 class="mb-0">자산조회</h2>
				    </div>
				    <!--end::Card title-->
				</div>
				<!--end::Card header-->

				<!--begin::Card body-->
				<div class="card-body pt-0">
				    <!--begin::Permissions-->
				    <div class="card-title">
				        <h4 class="mb-0">자산목록</h4>
				    </div>
				    
				    <hr>
				    
				    <!-- 자산리스트 출력 박스 -->
				    <div class="d-flex flex-column text-gray-600" id="facility_container">
				    </div>
				    <!--end::Permissions-->
				</div>
				<!--end::Card body-->

				<!--begin::Card footer-->
				<div class="card-footer pt-0">
				    <button type="button" class="btn btn-light btn-active-primary" data-bs-toggle="modal" data-bs-target="#kt_modal_update_role">예약신청</button>
				    <button type="button" class="btn btn-light btn-active-primary" data-bs-toggle="modal" data-bs-target="#kt_modal_update_role">추가(관리자용)</button>
				</div>
				<!--end::Card footer-->
				</div>
			</div>

			<!-- 우측 -->
			<div class="flex-lg-row-fluid ms-lg-10">
				<div class="card card-flush mb-6 mb-xl-9">
				
					<!--begin::Card header-->
					<div class="card-header mt-6">
					
					<!--begin::Card title-->
					<div class="card-title flex-column">
						<h2 class="mb-1">자산예약현황</h2>
					</div>
					<!--end::Card title-->
					
					<!--begin::Card toolbar-->
					<div class="card-toolbar">
					<button type="button" class="btn btn-light-primary btn-sm" data-bs-toggle="modal" data-bs-target="#kt_modal_add_schedule">
						<i class="ki-duotone ki-brush fs-3">
						<span class="path1"></span>
						<span class="path2"></span>
						</i>예약신청</button>
					</div>
					<!--end::Card toolbar-->
					
				</div>
				<!--end::Card header-->
				
				<!--begin::Card body-->
				<div class="card-body p-9 pt-4">
					<!--begin::Dates-->
					<ul class="nav nav-pills d-flex flex-nowrap hover-scroll-x py-2" role="tablist" id="reservation_day_container">
					</ul>
					<!--end::Dates-->
					
					<!--begin::Tab Content-->
					<div class="tab-content" id="reservation_content-container">
					</div>											
				</div>
				<!--end::Card body-->
				</div>
				<!-- 시설예약 일정 영역 종료 -->									
													
				<!-- 예약신청현황 -->
				<div class="card card-flush mb-6 mb-xl-9">
				<!--begin::Card header-->
					<div class="card-header mt-6">
						<!--begin::Card title-->
						<div class="card-title flex-column">
							<h2 class="mb-1">예약신청현황</h2>
						</div>
					<!--end::Card title-->
					<!-- begin::Card toolbar -->
<!-- 						<div class="card-toolbar" data-control="select2"> -->
<!-- 							<select class="form-select form-select-solid" aria-label="Default select example"> -->
<!-- 								<option selected>신청현황</option> -->
<!-- 								<option value="1">신청대기</option> -->
<!-- 								<option value="2">승인</option> -->
<!-- 								<option value="3">반려</option> -->
<!-- 							</select> -->
<!-- 						</div> -->
					    
<!-- 																<button type="button" class="btn btn-light-primary btn-sm" data-bs-toggle="modal" data-bs-target="#kt_modal_add_task"> -->
<!-- 																<i class="ki-duotone ki-add-files fs-3"> -->
<!-- 																	<span class="path1"></span> -->
<!-- 																	<span class="path2"></span> -->
<!-- 																	<span class="path3"></span> -->
<!-- 																</i>Add Task</button> -->
					
					<!-- end::Card toolbar -->
															
															
				</div>
				<!--end::Card header-->
				
				<!-- 카드 바디 -->
				<!-- 예약신청리스트 목록 보여주기 -->
				<!--begin::Card body-->
				<div class="card-body d-flex flex-column" id="reservation_state_all">
					<!--begin::Item-->
					<div class="d-flex align-items-center position-relative mb-7">
					<!--begin::Label-->
						<div class="position-absolute top-0 start-0 rounded h-100 bg-secondary w-4px">
						</div>
					<!--end::Label-->
					
					<!--begin::Details-->
						<div class="fw-semibold ms-5">
							<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary">회의실301호 예약신청</a>
							<!--begin::Info-->
							<div class="fs-7 text-muted">신청자 
						</div>
						<!--end::Info-->
					</div>
					<!--end::Details-->
																
																
					<!-- 사용자일때 승인여부 조회되게 -->
<!-- 				<button type="button" class="btn btn-icon btn-active-light-primary w-30px h-30px ms-auto" data-kt-menu-placement="bottom-end"> -->
<!-- 				대기 -->
<!-- 				</button> -->


					<!-- 관리자만 -->
					<!--begin::Menu-->
					<button type="button" class="btn btn-icon btn-active-light-primary w-30px h-30px ms-auto" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
						<i class="ki-duotone ki-setting-3 fs-3">
							<span class="path1"></span>
							<span class="path2"></span>
							<span class="path3"></span>
							<span class="path4"></span>
							<span class="path5"></span>
						</i>
					</button>
																
																
																
																<!--begin::Task menu-->
																<div class="menu menu-sub menu-sub-dropdown w-250px w-md-300px" data-kt-menu="true" data-kt-menu-id="kt-users-tasks">
																	<!--begin::Header-->
																	<div class="px-7 py-5">
																		<div class="fs-5 text-gray-900 fw-bold">예약현황</div>
																	</div>
																	<!--end::Header-->
																	<!--begin::Menu separator-->
																	<div class="separator border-gray-200"></div>
																	<!--end::Menu separator-->
																	<!--begin::Form-->
																	<form class="form px-7 py-5 fv-plugins-bootstrap5 fv-plugins-framework" data-kt-menu-id="kt-users-tasks-form">
																		<!--begin::Input group-->
																		<div class="fv-row mb-10 fv-plugins-icon-container">
																			<!--begin::Label-->
																			<label class="form-label fs-6 fw-semibold">신청현황:</label>
																			<!--end::Label-->
																			<!--begin::Input-->
																			<select class="form-select form-select-solid select2-hidden-accessible" name="task_status" data-kt-select2="true" data-placeholder="Select option" data-allow-clear="true" data-hide-search="true" data-select2-id="select2-data-7-yotd" tabindex="-1" aria-hidden="true" data-kt-initialized="1">
																				<option data-select2-id="select2-data-9-3e37"></option>
																				<option value="1">승인</option>
																				<option value="2">대기</option>
																				<option value="3">반려</option>
																				<option value="4">취소</option>
																			</select>
																			
																			<span class="select2 select2-container select2-container--bootstrap5" dir="ltr" data-select2-id="select2-data-8-0chc" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single form-select form-select-solid" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-task_status-vq-container" aria-controls="select2-task_status-vq-container"><span class="select2-selection__rendered" id="select2-task_status-vq-container" role="textbox" aria-readonly="true" title="Select option"><span class="select2-selection__placeholder">Select option</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
																			<!--end::Input-->
																		<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div></div>
																		<!--end::Input group-->
																		<!--begin::Actions-->
																		<div class="d-flex justify-content-end">
																			<button type="button" class="btn btn-sm btn-light btn-active-light-primary me-2" data-kt-users-update-task-status="reset">Reset</button>
																			<button type="submit" class="btn btn-sm btn-primary" data-kt-users-update-task-status="submit">
																				<span class="indicator-label">Apply</span>
																				<span class="indicator-progress">Please wait... 
																				<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
																			</button>
																		</div>
																		<!--end::Actions-->
																	</form>
																	<!--end::Form-->
																</div>
																<!--end::Task menu-->
																<!--end::Menu-->
															</div>
															<!--end::Item-->
														</div>
														<!--end::Card body-->
													</div>
			</div>


	
			</div>
		</div>
	</div>
</body>
<%@include file="./footer.jsp" %>

</html>