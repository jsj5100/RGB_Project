<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
</head>

<%@include file="./header.jsp"%>
<body>

	<!-- 컨텐츠 영역 -->
	<div style="padding-left:80px; margin-top:10px;" id="kt_app_content" class="app-content flex-column-fluid">
		<div style="padding-left:80px;" id="kt_app_content_container" class="app-container container-xxl" style="padding-top: 30px;">
			<!-- 카드 시작 -->
			<div class="card">
			<div class="card-header">
				<h2 class="card-title fw-bold">Calendar</h2>
				<div class="card-toolbar">
				
					<button type="button" class="btn btn-primary" data-kt-calendar="add" data-bs-toggle="modal" data-bs-target="#kt_modal_add_event">
						일정추가
					</button>
<!-- 					<button class="btn btn-flex btn-primary" data-kt-calendar="add" data-target="#kt_modal_add_event"> -->
<!-- 					<i class="ki-duotone ki-plus fs-2"></i>일정 추가</button> -->
				</div>
			</div>				
			<div  class="card-body">
				<div style="height:auto;" id="kt_calendar_app"></div>
			</div>
			
			</div>
			
	<!-- event 추가 modal -->
	<div class="modal fade" id="kt_modal_add_event" tabindex="-1" data-bs-focus="false" style="display: none;" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered mw-650px">
	        <div class="modal-content">
	        
	            <form class="form fv-plugins-bootstrap5 fv-plugins-framework" action="./calendar.do" method="post"  id="kt_modal_add_event_form">
	                <!--begin::Modal header-->
	                <div class="modal-header">
	                    <!--begin::Modal title-->
	                    <h2 class="fw-bold" data-kt-calendar="title">일정 추가</h2>
	                    <!--end::Modal title-->
	                    <!--begin::Close-->
	                    <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal" id="kt_modal_add_event_close">
	                        <i class="ki-duotone ki-cross fs-1">
	                            <span class="path1"></span>
	                            <span class="path2"></span>
	                        </i>
	                    </div>
	                    <!--end::Close-->
	                </div>
	                <!--end::Modal header-->
	                <!--begin::Modal body-->
	                <div class="modal-body py-10 px-lg-17">
	                    <!--begin::Input group-->
	                    <div class="fv-row mb-9 fv-plugins-icon-container">
	                        <!--begin::Label-->
	                        <label class="fs-6 fw-semibold required mb-2">일정 제목</label>
	                        <!--end::Label-->
	                        <!--begin::Input-->
	                        <input type="text" class="form-control form-control-solid" placeholder="" name="calendar_event_name">
	                        <!--end::Input-->
	                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
	                    </div>
	                    <!--end::Input group-->
	                    <!--begin::Input group-->
	                    <div class="fv-row mb-9">
	                        <!--begin::Label-->
	                        <label class="fs-6 fw-semibold mb-2">일정 내용</label>
	                        <!--end::Label-->
	                        <!--begin::Input-->
	                        <input type="text" class="form-control form-control-solid" placeholder="" name="calendar_event_description">
	                        <!--end::Input-->
	                    </div>
	                    <!--end::Input group-->
	                    <!--begin::Input group-->
	                    <div class="fv-row mb-9">
	                        <!--begin::Label-->
	                        <label class="fs-6 fw-semibold mb-2">일정 구분(체크박스로 변경예정)</label>
	                        <!--end::Label-->
	                        <!--begin::Input-->
	                        <input type="text" class="form-control form-control-solid" placeholder="" name="calendar_event_location">
	                        <!--end::Input-->
	                    </div>
	                    <!--end::Input group-->
	                    
	                    <!-- 하루종일 선택 -->
	                    <div class="fv-row mb-9">
	                        <!--begin::Checkbox-->
	                        <label class="form-check form-check-custom form-check-solid">
	                            <input class="form-check-input" type="checkbox" value="" id="kt_calendar_datepicker_allday">
	                            <span class="form-check-label fw-semibold" for="kt_calendar_datepicker_allday">All Day</span>
	                        </label>
	                        <!--end::Checkbox-->
	                    </div>
	                    <!--end::Input group-->
	                    
	                    
	                    <!-- 날짜 설정-->
	                    <div class="row row-cols-lg-2 g-10">
	                        <div class="col">
	                        	<!-- 시작일 -->
	                            <div class="fv-row mb-9 fv-plugins-icon-container fv-plugins-bootstrap5-row-valid">
	                                <!--begin::Label-->
	                                <label class="fs-6 fw-semibold mb-2 required">시작 날짜</label>
	                                <!--end::Label-->
	                                <!--begin::Input-->
	                                <input class="form-control form-control-solid flatpickr-input" name="calendar_event_start_date" placeholder="Pick a start date" id="kt_calendar_datepicker_start_date" type="text" readonly="readonly">
	                                <!--end::Input-->
	                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
	                            </div>
	                        </div>
	                        <div class="col" data-kt-calendar="datepicker">
	                            <div class="fv-row mb-9">
	                                <!--begin::Label-->
	                                <label class="fs-6 fw-semibold mb-2">시작 시간</label>
	                                <!--end::Label-->
	                                <!--begin::Input-->
	                                <input class="form-control form-control-solid flatpickr-input" name="calendar_event_start_time" placeholder="Pick a start time" id="kt_calendar_datepicker_start_time" type="text" readonly="readonly">
	                                <!--end::Input-->
	                            </div>
	                        </div>
	                    </div>
	                    <!--end::Input group-->
	                    
	                    <!--종료일-->
	                    <div class="row row-cols-lg-2 g-10">
	                        <div class="col">
	                            <div class="fv-row mb-9 fv-plugins-icon-container fv-plugins-bootstrap5-row-valid">
	                                <!--begin::Label-->
	                                <label class="fs-6 fw-semibold mb-2 required">종료 날짜</label>
	                                <!--end::Label-->
	                                <!--begin::Input-->
	                                <input class="form-control form-control-solid flatpickr-input" name="calendar_event_end_date" placeholder="Pick an end date" id="kt_calendar_datepicker_end_date" type="text" readonly="readonly">
	                                <!--end::Input-->
	                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
	                            </div>
	                        </div>
	                        <div class="col" data-kt-calendar="datepicker">
	                            <div class="fv-row mb-9">
	                                <!--begin::Label-->
	                                <label class="fs-6 fw-semibold mb-2">종료 시간</label>
	                                <!--end::Label-->
	                                <!--begin::Input-->
	                                <input class="form-control form-control-solid flatpickr-input" name="calendar_event_end_time" placeholder="Pick an end time" id="kt_calendar_datepicker_end_time" type="text" readonly="readonly">
	                                <!--end::Input-->
	                            </div>
	                        </div>
	                    </div>
	                    <!--end::Input group-->
	                </div>
	                
	                <!--end::Modal body-->
	                <!--begin::Modal footer-->
	                <div class="modal-footer flex-center">
	                    <!--begin::Button-->
	                    <button type="button" id="kt_modal_add_event_cancel" class="btn btn-light me-3" data-bs-dismiss="modal">취소</button>
	                    <!--end::Button-->
	                    <!--begin::Button-->
	                    <button type="button" id="kt_modal_add_event_submit" class="btn btn-primary">
	                        <span class="indicator-label">등록</span>
	                        <span class="indicator-progress">Please wait...
	                            <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
	                        </span>
	                    </button>
	                    <!--end::Button-->
	                </div>
	                <!--end::Modal footer-->
	            </form>
	        </div>
	    </div>
	</div>

	<!-- event 조회 modal -->
	<div class="modal fade" id="kt_modal_view_event" tabindex="-1" data-bs-focus="false" style="display: none;" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered mw-650px">
	        <!-- 모달 컨텐츠 영역 -->
	        <div class="modal-content">
	            <!-- 모달 헤더 -->
	            <div class="modal-header border-0 justify-content-end">
	                <!-- 일정 수정 아이콘 -->
	                <div class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-primary me-2"
	                     data-bs-toggle="tooltip" data-bs-dismiss="click" id="kt_modal_view_event_edit"
	                     aria-label="Edit Event" data-bs-original-title="Edit Event" data-kt-initialized="1">
	                    <i class="ki-duotone ki-pencil fs-2">
	                        <span class="path1"></span>
	                        <span class="path2"></span>
	                    </i>
	                </div>
	                <!-- 일정 수정 아이콘 영역 종료 -->
	
	                <!-- 일정 삭제하기 아이콘 영역 -->
	                <div class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-danger me-2"
	                     data-bs-toggle="tooltip" data-bs-dismiss="click" id="kt_modal_view_event_delete"
	                     aria-label="Delete Event" data-bs-original-title="Delete Event" data-kt-initialized="1">
	                    <i class="ki-duotone ki-trash fs-2">
	                        <span class="path1"></span>
	                        <span class="path2"></span>
	                        <span class="path3"></span>
	                        <span class="path4"></span>
	                        <span class="path5"></span>
	                    </i>
	                </div>
	                <!-- 삭제하기 아이콘 영역 종료 -->
	
	                <!-- 닫기 아이콘 시작 -->
	                <div class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-primary"
	                     data-bs-toggle="tooltip" data-bs-dismiss="modal" aria-label="Hide Event"
	                     data-bs-original-title="Hide Event" data-kt-initialized="1">
	                    <i class="ki-duotone ki-cross fs-2x">
	                        <span class="path1"></span>
	                        <span class="path2"></span>
	                    </i>
	                </div>
	                <!-- 닫기 아이콘 영역 종료 -->
	            </div>
	            <!-- 모달 헤더 종료 -->
	
	            <!-- 모달 이벤트 조회 내용 시작 -->
	            <div class="modal-body pt-0 pb-20 px-lg-17">
	                <div class="d-flex">
	                    <!-- 달력 표시 아이콘 -->
	                    <i class="ki-duotone ki-calendar-8 fs-1 text-muted me-5">
	                        <span class="path1"></span>
	                        <span class="path2"></span>
	                        <span class="path3"></span>
	                        <span class="path4"></span>
	                        <span class="path5"></span>
	                        <span class="path6"></span>
	                    </i>
	                    <!-- 아이콘 영역 삭제 -->
	
	                    <div class="mb-9">
	                        <!-- 이벤트 제목 -->
	                        <div class="d-flex align-items-center mb-2">
	                            <span class="fs-3 fw-bold me-3" data-kt-calendar="event_name"></span>
	                            <span class="badge badge-light-success" data-kt-calendar="all_day">All Day</span>
	                        </div>
	                        <!-- end::Event name -->
	
	                        <!-- begin::Event description -->
	                        <div class="fs-6" data-kt-calendar="event_description">
	                            Toto lorem ipsum dolor sit incid idunt ut
	                        </div>
	                        <!-- end::Event description -->
	                    </div>
	                </div>
	                <!-- end::Row -->
	
	                <!-- begin::Row -->
	                <div class="d-flex align-items-center mb-2">
	                    <!-- begin::Bullet -->
	                    <span class="bullet bullet-dot h-10px w-10px bg-success ms-2 me-7"></span>
	                    <!-- end::Bullet -->
	
	                    <!-- begin::Event start date/time -->
	                    <div class="fs-6">
	                        <span class="fw-bold">시작일</span>
	                        <span data-kt-calendar="event_start_date">1st Aug, 2024</span>
	                    </div>
	                    <!-- end::Event start date/time -->
	                </div>
	                <!-- end::Row -->
	
	                <!-- begin::Row -->
	                <div class="d-flex align-items-center mb-9">
	                    <!-- begin::Bullet -->
	                    <span class="bullet bullet-dot h-10px w-10px bg-danger ms-2 me-7"></span>
	                    <!-- end::Bullet -->
	
	                    <!-- begin::Event end date/time -->
	                    <div class="fs-6">
	                        <span class="fw-bold">종료일</span>
	                        <span data-kt-calendar="event_end_date">2nd Aug, 2024</span>
	                    </div>
	                    <!-- end::Event end date/time -->
	                </div>
	                <!-- end::Row -->
	
	                <!-- begin::Row -->
	                <div class="d-flex align-items-center">
	                    <!-- begin::Icon -->
	                    <i class="ki-duotone ki-geolocation fs-1 text-muted me-5">
	                        <span class="path1"></span>
	                        <span class="path2"></span>
	                    </i>
	                    <!-- end::Icon -->
	
	                    <!-- begin::Event location -->
	                    <div class="fs-6" data-kt-calendar="event_location">
	                        Federation Square
	                    </div>
	                    <!-- end::Event location -->
	                </div>
	                <!-- end::Row -->
	            </div>
	            <!-- end::Modal body -->
	        </div>
	    </div>
	</div>
	
	<!-- event 조회 모달 종료' -->			
	</div>
</div>	
	
</body>
<%@include file="./footer.jsp" %>

<script type="text/javascript">
$("#kt_calendar_datepicker_start_date").flatpickr({
    dateFormat: "Y-m-d"
});

$("#kt_calendar_datepicker_start_time").flatpickr({
	  enableTime: true,
	  noCalendar: true,
	  dateFormat: "H:i",
});

$("#kt_calendar_datepicker_end_date").flatpickr({
    dateFormat: "Y-m-d"
});

$("#kt_calendar_datepicker_end_time").flatpickr({
	  enableTime: true,
	  noCalendar: true,
	  dateFormat: "H:i",
});
</script>

</html>