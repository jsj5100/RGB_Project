<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자산관리</title>
<link href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css'>
<link href='https://cdn.datatables.net/2.1.5/css/dataTables.bootstrap5.css'>
<script src='https://code.jquery.com/jquery-3.7.1.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js'></script>
<script src='https://cdn.datatables.net/2.1.5/js/dataTables.js'></script>
<script src='https://cdn.datatables.net/2.1.5/js/dataTables.bootstrap5.js'></script>
<%@include file="./header.jsp"%>

<script type="text/javascript" src="./js/facility.js"></script>
<style type="text/css">
	tr .selected{
		background-color: orange;
	}

</style>


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
					<div class="tab-content" data-bs-spy="scroll" id="reservation_content-container">
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
					</div>
					<!--end::Card header-->

					<!-- 카드 바디 -->
					<!-- 예약신청리스트 목록 보여주기 -->
<!-- 					begin::Card body -->
				<!-- 데이터 테이블스 -->
				<div class="card-body p-0">
					<div class="table-responsive">
						<c:choose>
                        <c:when test="${loginDto.auth_no eq 'FC00A'}">
                        	<p><button class="btn btn-light-primary btn-sm" id="approvebtn">승인</button>
							<button class="btn btn-light-primary btn-sm" id="denybtn">반려</button></p>
						</c:when>
						
						<c:otherwise>
							<p><button class="btn btn-light-primary btn-sm" id="cancelbtn">신청취소</button></p>
						</c:otherwise>
						</c:choose>
						<!--begin::Table-->
						<table id="table_list" class="table align-middle table-row-bordered table-row-solid gy-4 gs-9">
						<!--begin::Thead-->
							<thead class="border-gray-200 fs-5 fw-semibold bg-lighten">
								<tr>
									<th class="min-w-50px"></th>
									<th class="min-w-100px">신청자산</th>
									<th class="min-w-250px">사용기간</th>
									<th class="min-w-100px">신청자</th>
									<th class="min-w-150px">진행상태</th>
									<th class="min-w-150px">신청일</th>
									<th class="min-w-200px">신청사유</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				</div>						
				<!--end::Menu-->
			</div>
			<!--end::Item-->
		</div>
		<!--end::Card body-->
	</div>

	</div>

</div>
	
	<!-- 모달 이미지 영역 -->
	<div class="modal fade" id="kt_modal_add_schedule" tabindex="-1" style="display: none;" aria-hidden="true">
    <!--begin::Modal dialog-->
    <div class="modal-dialog modal-dialog-centered mw-650px">
        <!--begin::Modal content-->
        <div class="modal-content">
            <!--begin::Modal header-->
            <div class="modal-header">
                <!--begin::Modal title-->
                <h2 class="fw-bold">자산예약</h2>
                <!--end::Modal title-->

                <!--begin::Close-->
                <div class="btn btn-icon btn-sm btn-active-icon-primary" data-kt-users-modal-action="close" data-bs-dismiss="modal">
                    <i class="ki-duotone ki-cross fs-1">
                    <span class="path1"></span>
                    <span class="path2"></span></i>                
                </div>
                <!--end::Close-->
            </div>
            <!--end::Modal header-->

            <!--begin::Modal body-->
            <div class="modal-body scroll-y mx-5 mx-xl-15 my-7">
                <!--begin::Form-->
                <form id="kt_modal_add_schedule_form" class="form fv-plugins-bootstrap5 fv-plugins-framework">
                    <!--begin::Input group-->
                    
                     <div class="fv-row mb-9">
	                        <!--begin::Label-->
	                        <label class="fs-6 fw-semibold required mb-2">자산 선택</label>
	                        <!--end::Label-->
	                        <!-- 자산선택 셀렉트박스 -->
	                        <select class="form-control form-control-solid" id="kt_facility_location" name="calendar_event_location" required>
							  <option value="" id="facility_ctegory" disabled selected>선택해주세요</option>
							  <c:forEach var="facilityList" items="${fclist}">
							  	<c:if test="${facilityList.fc_no ne null}">
							  		<option value="${facilityList.fc_no}">${facilityList.fc_name}</option>
							  	</c:if>
							  </c:forEach>
							</select>
	                        <!--begin::Input-->
<!-- 	                        <input type="text" class="form-control form-control-solid" placeholder="" id="kt_calendar_event_location" name="calendar_event_location"> -->
	                        <!--end::Input-->
	                    </div>
                    <!--end::Input group-->

                    <!--begin::Input group-->
                    <div class="row row-cols-lg-2 g-10">
	                        <div class="col">
	                        	<!-- 시작일 -->
	                            <div class="fv-row mb-9 fv-plugins-icon-container fv-plugins-bootstrap5-row-valid">
	                                <!--begin::Label-->
	                                <label class="fs-6 fw-semibold mb-2 required">사용시작일</label>
	                                <!--end::Label-->
	                                <!--begin::Input-->
	                                <input class="form-control form-control-solid flatpickr-input" placeholder="Select a date &amp; time." id="kt_modal_add_schedule_datepicker_start" type="text" readonly="readonly">
	                                <!--end::Input-->
	                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
	                            </div>
	                        </div>
	                        <div class="col" data-kt-calendar="datepicker">
	                            <div class="fv-row mb-9">
	                                <!--begin::Label-->
	                                <label class="fs-6 fw-semibold mb-2">사용종료일</label>
	                                <!--end::Label-->
	                                <!--begin::Input-->
	                                <input class="form-control form-control-solid flatpickr-input" placeholder="Select a date &amp; time." id="kt_modal_add_schedule_datepicker_end" type="text" readonly="readonly">
	                                <!--end::Input-->
	                            </div>
	                        </div>
	                    </div>
                    
                    
                    <div class="fv-row mb-7 fv-plugins-icon-container">
                    <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div></div>
                    <!--end::Input group-->

                    <!--begin::Input group-->
                    <div class="fv-row mb-7 fv-plugins-icon-container">
                        <!--begin::Label-->
                        <label class="required fs-6 fw-semibold form-label mb-2">사용목적</label>
                        <!--end::Label-->

                        <!--begin::Input-->
                        <input type="text" class="form-control form-control-solid" id="facility_use" value="">
                        <!--end::Input-->
                    <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div></div>
                    <!--end::Input group-->


                    <!--begin::Actions-->
                    <div class="text-center pt-15">
                        <button type="reset" id="modal_cancel_button" class="btn btn-light me-3" data-kt-users-modal-action="cancel" data-bs-dismiss="modal">
                            취소
                        </button>

                        <button type="button" id="kt_modal_add_schedule_submit" class="btn btn-primary" onclick="insertReservation()" data-bs-dismiss="modal">
                            <span class="indicator-label">
                                등록
                            </span>
                        </button>
                    </div>
                    <!--end::Actions-->
                </form>
                <!--end::Form-->
            </div>
            <!--end::Modal body-->
        </div>
        <!--end::Modal content-->
    </div>
    <!--end::Modal dialog-->
</div>
	
</body>
<%@include file="./footer.jsp" %>

</html>