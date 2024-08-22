<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@include file="./header.jsp"%>

<!-- calendar  -->
<link href="./assets/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
<script src="./assets/plugins/custom/fullcalendar/ko.global.js"></script>
<script src="./assets/js/custom/apps/calendar/cal.js"></script>
<style>
  .card {
    overflow: hidden; /* 카드 내부에 스크롤 생기지 않게 함 */
  }

  #calendar {
    width: 100%; /* 카드의 너비에 맞게 조정 */
    height: auto; /* 카드의 높이에 맞게 조정 (예: 헤더나 패딩을 고려) */
    box-sizing: border-box; /* 패딩과 테두리도 포함하여 크기 조정 */
  }
</style>
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
			
			<div style="padding-top:10px;" class="row g-5 g-xl-10">
				<div class="col-xl-6 mb-5 mb-xl-10">
					<div class="card card-flush overflow-hidden h-md-100">
<!-- 				<div class="card-header border-0 pt-5"> -->
<!-- 				</div> -->
						<div class="card-body pt-5" >
							<div id="calendar"></div>
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
<%@include file="./footer.jsp" %>
<!--end::Body-->
</html>