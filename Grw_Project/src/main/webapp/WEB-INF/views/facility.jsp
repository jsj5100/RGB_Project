<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<%@include file="./header.jsp"%>
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
													
													
													<div class="d-flex flex-column text-gray-600">
														<div class="d-flex align-items-center py-2">
															회의실101호</div>
														<div class="d-flex align-items-center py-2">
														회의실102호</div>
														<div class="d-flex align-items-center py-2">
														회의실103호</div>
														<div class="d-flex align-items-center py-2">
														아반떼5505</div>
														<div class="d-flex align-items-center py-2">
														티볼리3302</div>
														<div class="d-flex align-items-center py-2 d-none">
															<span class="bullet bg-primary me-3"></span>
															<em>more...</em>
														</div>
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
															<ul class="nav nav-pills d-flex flex-nowrap hover-scroll-x py-2" role="tablist">
																<!--begin::Date-->
																<li class="nav-item me-1" role="presentation">
																	<a class="nav-link btn d-flex flex-column flex-center rounded-pill min-w-40px me-2 py-4 btn-active-primary" data-bs-toggle="tab" href="#kt_schedule_day_0" aria-selected="false" tabindex="-1" role="tab">
																		<span class="opacity-50 fs-7 fw-semibold">Su</span>
																		<span class="fs-6 fw-bolder">21</span>
																	</a>
																</li>
																<!--end::Date-->
																<!--begin::Date-->
																<li class="nav-item me-1" role="presentation">
																	<a class="nav-link btn d-flex flex-column flex-center rounded-pill min-w-40px me-2 py-4 btn-active-primary active" data-bs-toggle="tab" href="#kt_schedule_day_1" aria-selected="true" role="tab">
																		<span class="opacity-50 fs-7 fw-semibold">Mo</span>
																		<span class="fs-6 fw-bolder">22</span>
																	</a>
																</li>
																<!--end::Date-->
																<!--begin::Date-->
																<li class="nav-item me-1" role="presentation">
																	<a class="nav-link btn d-flex flex-column flex-center rounded-pill min-w-40px me-2 py-4 btn-active-primary" data-bs-toggle="tab" href="#kt_schedule_day_2" aria-selected="false" tabindex="-1" role="tab">
																		<span class="opacity-50 fs-7 fw-semibold">Tu</span>
																		<span class="fs-6 fw-bolder">23</span>
																	</a>
																</li>
																<!--end::Date-->
																<!--begin::Date-->
																<li class="nav-item me-1" role="presentation">
																	<a class="nav-link btn d-flex flex-column flex-center rounded-pill min-w-40px me-2 py-4 btn-active-primary" data-bs-toggle="tab" href="#kt_schedule_day_3" aria-selected="false" tabindex="-1" role="tab">
																		<span class="opacity-50 fs-7 fw-semibold">We</span>
																		<span class="fs-6 fw-bolder">24</span>
																	</a>
																</li>
																<!--end::Date-->
																<!--begin::Date-->
																<li class="nav-item me-1" role="presentation">
																	<a class="nav-link btn d-flex flex-column flex-center rounded-pill min-w-40px me-2 py-4 btn-active-primary" data-bs-toggle="tab" href="#kt_schedule_day_4" aria-selected="false" tabindex="-1" role="tab">
																		<span class="opacity-50 fs-7 fw-semibold">Th</span>
																		<span class="fs-6 fw-bolder">25</span>
																	</a>
																</li>
																<!--end::Date-->
																<!--begin::Date-->
																<li class="nav-item me-1" role="presentation">
																	<a class="nav-link btn d-flex flex-column flex-center rounded-pill min-w-40px me-2 py-4 btn-active-primary" data-bs-toggle="tab" href="#kt_schedule_day_5" aria-selected="false" tabindex="-1" role="tab">
																		<span class="opacity-50 fs-7 fw-semibold">Fr</span>
																		<span class="fs-6 fw-bolder">26</span>
																	</a>
																</li>
																<!--end::Date-->
																<!--begin::Date-->
																<li class="nav-item me-1" role="presentation">
																	<a class="nav-link btn d-flex flex-column flex-center rounded-pill min-w-40px me-2 py-4 btn-active-primary" data-bs-toggle="tab" href="#kt_schedule_day_6" aria-selected="false" tabindex="-1" role="tab">
																		<span class="opacity-50 fs-7 fw-semibold">Sa</span>
																		<span class="fs-6 fw-bolder">27</span>
																	</a>
																</li>
																<!--end::Date-->
																<!--begin::Date-->
																<li class="nav-item me-1" role="presentation">
																	<a class="nav-link btn d-flex flex-column flex-center rounded-pill min-w-40px me-2 py-4 btn-active-primary" data-bs-toggle="tab" href="#kt_schedule_day_7" aria-selected="false" tabindex="-1" role="tab">
																		<span class="opacity-50 fs-7 fw-semibold">Su</span>
																		<span class="fs-6 fw-bolder">28</span>
																	</a>
																</li>
																<!--end::Date-->
																<!--begin::Date-->
																<li class="nav-item me-1" role="presentation">
																	<a class="nav-link btn d-flex flex-column flex-center rounded-pill min-w-40px me-2 py-4 btn-active-primary" data-bs-toggle="tab" href="#kt_schedule_day_8" aria-selected="false" tabindex="-1" role="tab">
																		<span class="opacity-50 fs-7 fw-semibold">Mo</span>
																		<span class="fs-6 fw-bolder">29</span>
																	</a>
																</li>
																<!--end::Date-->
																<!--begin::Date-->
																<li class="nav-item me-1" role="presentation">
																	<a class="nav-link btn d-flex flex-column flex-center rounded-pill min-w-40px me-2 py-4 btn-active-primary" data-bs-toggle="tab" href="#kt_schedule_day_9" aria-selected="false" tabindex="-1" role="tab">
																		<span class="opacity-50 fs-7 fw-semibold">Tu</span>
																		<span class="fs-6 fw-bolder">30</span>
																	</a>
																</li>
																<!--end::Date-->
																<!--begin::Date-->
																<li class="nav-item me-1" role="presentation">
																	<a class="nav-link btn d-flex flex-column flex-center rounded-pill min-w-40px me-2 py-4 btn-active-primary" data-bs-toggle="tab" href="#kt_schedule_day_10" aria-selected="false" tabindex="-1" role="tab">
																		<span class="opacity-50 fs-7 fw-semibold">We</span>
																		<span class="fs-6 fw-bolder">31</span>
																	</a>
																</li>
																<!--end::Date-->
															</ul>
															<!--end::Dates-->
															<!--begin::Tab Content-->
															<div class="tab-content">
																<!--begin::Day-->
																<div id="kt_schedule_day_0" class="tab-pane fade show" role="tabpanel">
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">10:00 - 11:00 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Team Backlog Grooming Session</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Walter White</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">11:00 - 11:45 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Project Review &amp; Testing</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Karina Clarke</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">16:30 - 17:30 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">9 Degree Project Estimation Meeting</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Walter White</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																</div>
																<!--end::Day-->
																<!--begin::Day-->
																<div id="kt_schedule_day_1" class="tab-pane fade show active" role="tabpanel">
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">11:00 - 11:45 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Lunch &amp; Learn Catch Up</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Michael Walters</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">14:30 - 15:30 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Sales Pitch Proposal</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Peter Marcus</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">14:30 - 15:30 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Dashboard UI/UX Design Review</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Yannis Gloverson</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">12:00 - 13:00 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Marketing Campaign Discussion</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Bob Harris</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																</div>
																<!--end::Day-->
																<!--begin::Day-->
																<div id="kt_schedule_day_2" class="tab-pane fade show" role="tabpanel">
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">10:00 - 11:00 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Dashboard UI/UX Design Review</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Caleb Donaldson</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">12:00 - 13:00 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Team Backlog Grooming Session</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Walter White</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">11:00 - 11:45 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Marketing Campaign Discussion</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Walter White</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">14:30 - 15:30 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Project Review &amp; Testing</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Karina Clarke</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																</div>
																<!--end::Day-->
																<!--begin::Day-->
																<div id="kt_schedule_day_3" class="tab-pane fade show" role="tabpanel">
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">16:30 - 17:30 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Dashboard UI/UX Design Review</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Yannis Gloverson</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">13:00 - 14:00 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Marketing Campaign Discussion</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Karina Clarke</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">16:30 - 17:30 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Creative Content Initiative</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">David Stevenson</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">10:00 - 11:00 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Creative Content Initiative</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Naomi Hayabusa</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">12:00 - 13:00 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Creative Content Initiative</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Terry Robins</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																</div>
																<!--end::Day-->
																<!--begin::Day-->
																<div id="kt_schedule_day_4" class="tab-pane fade show" role="tabpanel">
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">13:00 - 14:00 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Development Team Capacity Review</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Mark Randall</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">14:30 - 15:30 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Team Backlog Grooming Session</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Terry Robins</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">9:00 - 10:00 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">9 Degree Project Estimation Meeting</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Mark Randall</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">12:00 - 13:00 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Project Review &amp; Testing</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Walter White</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																</div>
																<!--end::Day-->
																<!--begin::Day-->
																<div id="kt_schedule_day_5" class="tab-pane fade show" role="tabpanel">
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">14:30 - 15:30 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Lunch &amp; Learn Catch Up</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Naomi Hayabusa</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">12:00 - 13:00 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Project Review &amp; Testing</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Naomi Hayabusa</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">9:00 - 10:00 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Sales Pitch Proposal</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Sean Bean</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">9:00 - 10:00 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">9 Degree Project Estimation Meeting</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Sean Bean</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																</div>
																<!--end::Day-->
																<!--begin::Day-->
																<div id="kt_schedule_day_6" class="tab-pane fade show" role="tabpanel">
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">11:00 - 11:45 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Sales Pitch Proposal</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Terry Robins</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">12:00 - 13:00 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Weekly Team Stand-Up</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Sean Bean</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">13:00 - 14:00 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Creative Content Initiative</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Mark Randall</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">9:00 - 10:00 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Creative Content Initiative</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">David Stevenson</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																</div>
																<!--end::Day-->
																<!--begin::Day-->
																<div id="kt_schedule_day_7" class="tab-pane fade show" role="tabpanel">
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">10:00 - 11:00 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Weekly Team Stand-Up</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Karina Clarke</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">11:00 - 11:45 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Creative Content Initiative</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Peter Marcus</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">14:30 - 15:30 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">9 Degree Project Estimation Meeting</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Kendell Trevor</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">14:30 - 15:30 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Project Review &amp; Testing</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Bob Harris</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																</div>
																<!--end::Day-->
																<!--begin::Day-->
																<div id="kt_schedule_day_8" class="tab-pane fade show" role="tabpanel">
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">11:00 - 11:45 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Lunch &amp; Learn Catch Up</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Yannis Gloverson</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">10:00 - 11:00 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">9 Degree Project Estimation Meeting</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">David Stevenson</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">11:00 - 11:45 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">9 Degree Project Estimation Meeting</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Michael Walters</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">16:30 - 17:30 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Committee Review Approvals</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Yannis Gloverson</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																</div>
																<!--end::Day-->
																<!--begin::Day-->
																<div id="kt_schedule_day_9" class="tab-pane fade show" role="tabpanel">
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">10:00 - 11:00 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Team Backlog Grooming Session</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Naomi Hayabusa</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">12:00 - 13:00 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Weekly Team Stand-Up</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Michael Walters</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">13:00 - 14:00 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Project Review &amp; Testing</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Naomi Hayabusa</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">13:00 - 14:00 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Development Team Capacity Review</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Sean Bean</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																</div>
																<!--end::Day-->
																<!--begin::Day-->
																<div id="kt_schedule_day_10" class="tab-pane fade show" role="tabpanel">
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">9:00 - 10:00 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Lunch &amp; Learn Catch Up</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Caleb Donaldson</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">14:30 - 15:30 
																			<span class="fs-7 text-muted text-uppercase">pm</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Project Review &amp; Testing</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Kendell Trevor</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">11:00 - 11:45 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Project Review &amp; Testing</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Karina Clarke</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																	<!--begin::Time-->
																	<div class="d-flex flex-stack position-relative mt-6">
																		<!--begin::Bar-->
																		<div class="position-absolute h-100 w-4px bg-secondary rounded top-0 start-0"></div>
																		<!--end::Bar-->
																		<!--begin::Info-->
																		<div class="fw-semibold ms-5">
																			<!--begin::Time-->
																			<div class="fs-7 mb-1">10:00 - 11:00 
																			<span class="fs-7 text-muted text-uppercase">am</span></div>
																			<!--end::Time-->
																			<!--begin::Title-->
																			<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">Project Review &amp; Testing</a>
																			<!--end::Title-->
																			<!--begin::User-->
																			<div class="fs-7 text-muted">Lead by 
																			<a href="#">Michael Walters</a></div>
																			<!--end::User-->
																		</div>
																		<!--end::Info-->
																		<!--begin::Action-->
																		<a href="#" class="btn btn-light bnt-active-light-primary btn-sm">View</a>
																		<!--end::Action-->
																	</div>
																	<!--end::Time-->
																</div>
																<!--end::Day-->
															</div>
															<!--end::Tab Content-->
														</div>
														<!--end::Card body-->
													</div>
													
													
													<!-- 예약신청현황 -->
													<div class="card card-flush mb-6 mb-xl-9">
														<!--begin::Card header-->
														<div class="card-header mt-6">
															<!--begin::Card title-->
															<div class="card-title flex-column">
																<h2 class="mb-1">예약신청현황</h2>
															</div>
															<!--end::Card title-->
															<!--begin::Card toolbar-->
<!-- 															<div class="card-toolbar"> 신청버튼 넣을지 고민중-->
<!-- 																<button type="button" class="btn btn-light-primary btn-sm" data-bs-toggle="modal" data-bs-target="#kt_modal_add_task"> -->
<!-- 																<i class="ki-duotone ki-add-files fs-3"> -->
<!-- 																	<span class="path1"></span> -->
<!-- 																	<span class="path2"></span> -->
<!-- 																	<span class="path3"></span> -->
<!-- 																</i>Add Task</button> -->
<!-- 															</div> -->
															<!--end::Card toolbar-->
														</div>
														<!--end::Card header-->
														<!--begin::Card body-->
														<div class="card-body d-flex flex-column">
															<!--begin::Item-->
															<div class="d-flex align-items-center position-relative mb-7">
																<!--begin::Label-->
																<div class="position-absolute top-0 start-0 rounded h-100 bg-secondary w-4px"></div>
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
<!-- 																<button type="button" class="btn btn-icon btn-active-light-primary w-30px h-30px ms-auto" data-kt-menu-placement="bottom-end"> -->
<!-- 																대기 -->
<!-- 																</button> -->
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