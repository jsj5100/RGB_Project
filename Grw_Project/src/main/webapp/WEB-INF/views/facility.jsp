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
					<div class="d-flex flex-stack flex-wrap pt-10">
														
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
<!-- 					begin::Card toolbar -->
						<div class="card-toolbar" data-control="select2">
							<select class="form-select form-select-solid" aria-label="Default select example">
								<option selected>신청현황</option>
								<option value="1">신청대기</option>
								<option value="2">승인</option>
								<option value="3">반려</option>
							</select>
						</div>
					<!-- end::Card toolbar -->
					</div>
					<!--end::Card header-->

					<!-- 카드 바디 -->
					<!-- 예약신청리스트 목록 보여주기 -->
<!-- 					begin::Card body -->
					<div class="card-body d-flex flex-column" id="reservation_state_all" style="height:400px;">
						<div class="d-flex align-items-center position-relative mb-7" id="reservation_state_all"> 
						</div>
					</div>
<!-- 				end::Task menu -->
				
				<div class="fs-6 fw-semibold text-gray-700">
					<!--begin::Pages-->
					<ul class="pagination">
					</ul>
					<!--end::Pages-->
				</div>						
				<!--end::Menu-->
			</div>
			<!--end::Item-->
		</div>
		<!--end::Card body-->
	</div>

	</div>

</div>
	</div>
</body>
<%@include file="./footer.jsp" %>

</html>