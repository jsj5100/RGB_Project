<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@include file="./header.jsp"%>
<body>
	<div style="padding-left:80px; margin-top:10px;" id="kt_app_content" class="app-content flex-column-fluid">
		<div style="padding-left:80px;" id="kt_app_content_container" class="app-container container-xxl">
			<div class="card">
				<div class="card-body">
				<h1>하이요</h1>
				<h1>안녕하세요</h1>
				</div>
			</div>

			<!-- 캘린더/게시판 전체 범위 -->
			<div class="row g-5 g-xl-10">
				<!-- 캘린더 -->
				<div class="col-xl-4 mb-xl-10"></div>
				<!--캘린더 종료 -->

				<!-- 게시판 시작 -->
				<div class="col-xl-8 mb-5 mb-xl-10">
					<div class="card card-flush h-xl-100">
						<!-- 게시판 -->
						<!-- 						<div class="card"> -->
						<!-- 게시판 상단-->
						<div class="card-header border-0 pt-5">
							<h3 class="card-title align-items-start flex-column">
								<span class="card-label fw-bold fs-3 mb-1">전사 게시판</span>
							</h3>
							<div class="card-toolbar">
								<a href="/boardNotice.do" class="btn btn-sm btn-primary"> <i
									class="ki-duotone ki-user fs-2"></i>more
								</a>
							</div>
						</div>
						<!-- 게시판 테이블 하단 -->
						<div class="card-body pt-3 pb-1">
							<!--begin::Table container-->
							<div class="table-responsive">
								<!--begin::Table-->
								<table class="table align-middle gs-0 gy-4">
									<!--begin::Table head-->
									<thead>
										<tr class="border-0">
											<th class="p-0 min-w-400px"></th>
											<th class="p-0 min-w-100px"></th>
											<th class="p-0 min-w-100px"></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<div class="d-flex align-items-center">

													<!-- 														<div class="d-flex justify-content-start flex-column"> -->
													<a href="#"
														class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6">제목</a>
													<!-- 														</div> -->
												</div>
											</td>
											<td class="text-gray-500 fw-semibold ps-xl-20">작성자</td>
											<td class="text-end">
												<div class="d-flex flex-column w-100 me-2">
													<div
														class="d-flex flex-stack text-gray-500 fs-7 fw-semibold mb-2">
														<span>작성일</span>
													</div>

												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="d-flex align-items-center">

													<a href="#"
														class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6">
														<span>소방점관련안내</span>
													</a>
												</div>
											</td>
											<td class="text-gray-500 fw-semibold ps-xl-20">김희연</td>
											<td class="text-end">
												<div class="d-flex flex-column w-100 me-2">
													<div
														class="d-flex flex-stack text-gray-500 fs-7 fw-semibold mb-2">
														<span>2024.08.19</span>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>

				</div>
				<!-- 캘린더/게시판 전체범위 종 -->
			</div>

		</div>
	</div>
	<script src="./assets/js/custom/apps/calendar/calendar.js"></script>
</body>
<%@include file="./footer.jsp" %>
<!--end::Body-->
</html>