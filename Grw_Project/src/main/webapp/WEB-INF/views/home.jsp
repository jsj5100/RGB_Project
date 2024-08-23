<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@include file="../../../header.jsp"%>

<!-- calendar  -->
<link href="./assets/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
<script src="./assets/plugins/custom/fullcalendar/ko.global.js"></script>
<script src="./assets/js/custom/apps/calendar/cal.js"></script>
<body>
	<div style="padding-left:80px; margin-top:10px;" id="kt_app_content" class="app-content flex-column-fluid">
		<div style="padding-left:80px;" id="kt_app_content_container" class="app-container container-xxl">

			<!-- 인사부분 위젯추가 -->
			<div class="card card-flush h-xl-100">
				<!-- HEAD -->
				<div
					class="card-header rounded bgi-no-repeat bgi-size-cover bgi-position-y-top bgi-position-x-center align-items-start h-250px"
					style="background-image: url('./assets/media/svg/shapes/top-green.png');"
					data-bs-theme="light">
					<div
						class="card-title align-items-start flex-column text-white pt-15">
						<span class="fw-bold fs-2x mb-3">0 달의 근태현황</span>
						<span class="fw-bold fs-1x mb-3">000님의 근태현황</span>
						<div class="fs-4 text-white">
						</div>
					</div>
					<div class="menu-content px-2 py-6">
									<a class="btn btn-primary btn-sm px-4" href="./empAttendanceList.do">근태 리스트</a>
					</div>
					<!-- HEAD -->
				</div>
				<div class="card-body mt-n20">
					<div class="mt-n20 position-relative">
						<div class="row g-3 g-lg-6">
							<div style="flex: 0 0 auto; width: 25%;">
								<div class="bg-gray-100 bg-opacity-70 rounded-2 px-6 py-5">
									<div class="symbol symbol-30px me-5 mb-8">
										<span class="symbol-label"> <i
											class="ki-duotone ki-timer fs-1 text-primary"> <span
												class="path1"></span> <span class="path2"></span>
										</i>
										</span>
									</div>
									<div class="m-0">
										<span
											class="text-gray-700 fw-bolder d-block fs-2qx lh-1 ls-n1 mb-1">0</span>
										<span class="text-gray-500 fw-semibold fs-6">출근</span>
									</div>
								</div>
							</div>
							<div style="flex: 0 0 auto; width: 25%;">
								<div class="bg-gray-100 bg-opacity-70 rounded-2 px-6 py-5">
									<div class="symbol symbol-30px me-5 mb-8">
										<span class="symbol-label"> <i
											class="ki-duotone ki-timer fs-1 text-primary"> <span
												class="path1"></span> <span class="path2"></span>
										</i>
										</span>
									</div>
									<div class="m-0">
										<span
											class="text-gray-700 fw-bolder d-block fs-2qx lh-1 ls-n1 mb-1">0</span>
										<span class="text-gray-500 fw-semibold fs-6">지각</span>
									</div>
								</div>
							</div>
							<div style="flex: 0 0 auto; width: 25%;">
								<div class="bg-gray-100 bg-opacity-70 rounded-2 px-6 py-5">
									<div class="symbol symbol-30px me-5 mb-8">
										<span class="symbol-label"> <i
											class="ki-duotone ki-timer fs-1 text-primary"> <span
												class="path1"></span> <span class="path2"></span> <span
												class="path3"></span>
										</i>
										</span>
									</div>
									<div class="m-0">
										<span
											class="text-gray-700 fw-bolder d-block fs-2qx lh-1 ls-n1 mb-1">0</span>
										<span class="text-gray-500 fw-semibold fs-6">조퇴</span>
									</div>
								</div>
							</div>
							<div style="flex: 0 0 auto; width: 25%;">
								<div class="bg-gray-100 bg-opacity-70 rounded-2 px-6 py-5">
									<div class="symbol symbol-30px me-5 mb-8">
										<span class="symbol-label"> <i
											class="ki-duotone ki-timer fs-1 text-primary"> <span
												class="path1"></span> <span class="path2"></span> <span
												class="path3"></span>
										</i>
										</span>
									</div>
									<div class="m-0">
										<span
											class="text-gray-700 fw-bolder d-block fs-2qx lh-1 ls-n1 mb-1">0</span>
										<span class="text-gray-500 fw-semibold fs-6">결근</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 인사부분 위젯 끝 -->

			<div style="width:100%; height:auto; margin-top:10px;"class="card">
				<div class="card-header border-0 pt-5">
					<h3 class="card-title align-items-start flex-column">
						<span class="card-label fw-bold fs-3 mb-1">진행중인 문서 현황</span>
					</h3>
					<div class="card-toolbar">
						<a href="#" class="btn btn-sm btn-primary"> <img
							style="width: 30px; padding-right: 5px;"
							src="./assets/images/document.svg"> 문서함 이동
						</a>
					</div>
				</div>
				<div class="card-body pt-3 pb-1">
					<div class="table-responsive">
						<table class="table align-middle gs-0 gy-4">
							<thead>
								<tr class="border-0">
									<th class="p-0 min-w-200px"></th>
									<th class="p-0 min-w-100px"></th>
									<th class="p-0 min-w-150px"></th>
									<th class="p-0 min-w-150px"></th>
									<th class="p-0 min-w-125px text-end"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="d-flex align-items-center">
											<div class="symbol symbol-45px me-5">
												<img src="assets/media/avatars/300-9.jpg" class="" alt="">
											</div>
											<div class="d-flex justify-content-start flex-column">
												<a href="#"
													class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6">기안서</a>
												<span class="text-gray-500 fw-semibold">Successful
													Fellas</span>
											</div>
										</div>
									</td>
									<td class="text-end pe-lg-20"><a href="#"
										class="text-gray-800 fw-bold text-hover-primary d-block mb-1 fs-6">$32,000</a>
										<span class="text-gray-500 fw-semibold d-block fs-7">Paid</span>
									</td>
									<td class="text-gray-500 fw-semibold ps-xl-20">ReactJs,
										HTML</td>
									<td class="text-end">
										<div class="d-flex flex-column w-100 me-2">
											<div
												class="d-flex flex-stack text-gray-500 fs-7 fw-semibold mb-2">
												<span class="me-2">79%</span> <span>Progress</span>
											</div>
											<div class="progress h-6px w-100 bg-light-danger">
												<div class="progress-bar bg-danger" role="progressbar"
													style="width: 79%" aria-valuenow="79" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="d-flex align-items-center">
											<div class="symbol symbol-45px me-5">
												<div
													class="symbol-label fs-6 fw-bold bg-light-info text-info">AH</div>
											</div>
											<div class="d-flex justify-content-start flex-column">
												<a href="#"
													class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6">Andreas
													Hawks</a> <span class="text-gray-500 fw-semibold">Successful
													Fellas</span>
											</div>
											<!--end::Name-->
										</div>
									</td>
									<td class="text-end pe-lg-20"><a href="#"
										class="text-gray-800 fw-bold text-hover-primary d-block mb-1 fs-6">$4,000</a>
										<span class="text-gray-500 fw-semibold d-block fs-7">Paid</span>
									</td>
									<td class="text-gray-500 fw-semibold ps-xl-20">Python,
										MySQL</td>
									<td class="text-end">
										<div class="d-flex flex-column w-100 me-2">
											<div
												class="d-flex flex-stack text-gray-500 fs-7 fw-semibold mb-2">
												<span class="me-2">65%</span> <span>Progress</span>
											</div>
											<div class="progress h-6px w-100 bg-light-primary">
												<div class="progress-bar bg-primary" role="progressbar"
													style="width: 65%" aria-valuenow="65" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="d-flex align-items-center">
											<!--begin::Avatar-->
											<div class="symbol symbol-45px me-5">
												<div
													class="symbol-label fs-6 fw-bold bg-light-success text-success">SC</div>
											</div>
											<!--end::Avatar-->
											<!--begin::Name-->
											<div class="d-flex justify-content-start flex-column">
												<a href="#"
													class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6">Sarah
													Connor</a> <span class="text-gray-500 fw-semibold">Successful
													Fellas</span>
											</div>
											<!--end::Name-->
										</div>
									</td>
									<td class="text-end pe-lg-20"><a href="#"
										class="text-gray-800 fw-bold text-hover-primary d-block mb-1 fs-6">$170,000</a>
										<span class="text-gray-500 fw-semibold d-block fs-7">Paid</span>
									</td>
									<td class="text-gray-500 fw-semibold ps-xl-20">ReactJS,
										Ruby</td>
									<td class="text-end">
										<div class="d-flex flex-column w-100 me-2">
											<div
												class="d-flex flex-stack text-gray-500 fs-7 fw-semibold mb-2">
												<span class="me-2">84%</span> <span>Progress</span>
											</div>
											<div class="progress h-6px w-100 bg-light-success">
												<div class="progress-bar bg-success" role="progressbar"
													style="width: 84%" aria-valuenow="84" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="d-flex align-items-center">
											<!--begin::Avatar-->
											<div class="symbol symbol-45px me-5">
												<img src="assets/media/avatars/300-12.jpg" class="" alt="">
											</div>
											<!--end::Avatar-->
											<!--begin::Name-->
											<div class="d-flex justify-content-start flex-column">
												<a href="#"
													class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6">Amanda
													Harden</a> <span class="text-gray-500 fw-semibold">Successful
													Fellas</span>
											</div>
											<!--end::Name-->
										</div>
									</td>
									<td class="text-end pe-lg-20"><a href="#"
										class="text-gray-800 fw-bold text-hover-primary d-block mb-1 fs-6">$2,800</a>
										<span class="text-gray-500 fw-semibold d-block fs-7">Paid</span>
									</td>
									<td class="text-gray-500 fw-semibold ps-xl-20">AngularJS,
										C#</td>
									<td class="text-end">
										<div class="d-flex flex-column w-100 me-2">
											<div
												class="d-flex flex-stack text-gray-500 fs-7 fw-semibold mb-2">
												<span class="me-2">47%</span> <span>Progress</span>
											</div>
											<div class="progress h-6px w-100 bg-light-info">
												<div class="progress-bar bg-info" role="progressbar"
													style="width: 47%" aria-valuenow="47" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
			</div>
			
			
			<!-- 캘린더/게시판 전체 범위 -->
			<div style="padding-top:10px;" class="row g-5 g-xl-10">
				<div class="col-xl-6 mb-5 mb-xl-10">
					<div class="card card-flush overflow-hidden h-md-100">
<!-- 				<div class="card-header border-0 pt-5"> -->
<!-- 				</div> -->
						<div class="card-body pt-5" >
							<div style="height:auto;" id="calendar"></div>
						</div>
					</div>
					<!-- 캘린더 -->
				</div>
				<!--캘린더 종료 -->
			
				<!-- card 종료 -->
				<!-- 게시판 시작 -->
				<div class="col-xl-6 mb-5 mb-xl-10">
					<div class="card card-flush overflow-hidden h-md-100">
						<!-- 게시판 -->
						<!-- 						<div class="card"> -->
						<!-- 게시판 상단-->
						<div class="card-header">
							<div class="card-title">
								<h3>전사게시판</h3>
							</div>
							<div class="card-toolbar">
								<a href="#" class="btn btn-sm btn-primary my-1">View All</a>
							</div>
						</div>

						
						<div class="card-body p-0">
							<!--게시판 테이블 전체 시작-->
							<div class="table-responsive">
							<!--테이블 시작-->
							<table class="table align-middle table-row-bordered table-row-solid gy-4 gs-9">
								<thead class="border-gray-200 fs-5 fw-semibold bg-lighten">
									<tr>
										<th class="min-w-350px">제목</th>
										<th class="min-w-100px">작성자</th>
										<th class="min-w-150px">작성일</th>
									</tr>
								</thead>
								
								<!-- 게시글 반복 리스트처리할 예정-->
								<tbody class="fw-6 fw-semibold text-gray-600">
									<tr>
										<td>
											<a href="#" class="text-hover-primary text-gray-600">소방점관련 안내사항</a>
										</td>
											<td>김희연</td>
											<td>2024.08.10</td>
									</tr>
								
									</tbody>
									<!-- 게시글 본문 -->
						</table>
						<!--end::Table-->
							</div>
											<!--end::Table wrapper-->
										</div>
				</div>			
					
				</div>
			</div>
				<!-- 캘린더/게시판 전체범위 종 -->
				
				
				
		</div>
	</div>

</body>
<%@include file="../../../footer.jsp" %>
<!--end::Body-->
</html>