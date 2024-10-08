<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RGB Groupware Project</title>
</head>
<%@include file="./header.jsp"%>
<body>
	<div style="padding-left: 80px; margin-top: 10px;" id="kt_app_content"
		class="app-content flex-column-fluid">
		<div style="padding-left: 80px;" id="kt_app_content_container"
			class="app-container container-xxl">
			<div style="width: 100%; height: auto; margin-top: 10px;"
				class="card">
				<div class="card-header border-0 pt-5">
					<h3 class="card-title align-items-start flex-column">
						<span class="card-label fw-bold fs-3 mb-1">완료문서함</span>
					</h3>
					<div class="card-title">
						<!--begin::Search-->
						<div class="d-flex align-items-center position-relative my-1">
							<i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
								<span class="path1"></span> <span class="path2"></span>
							</i> <input type="text" data-kt-user-table-filter="search"
								class="form-control form-control-solid w-250px ps-13"
								placeholder="이름, 사번검색">
						</div>
						<!--end::Search-->
					</div>
					<!-- 					<div class="card-toolbar"> -->
					<!-- 						<a href="#" class="btn btn-sm btn-primary"> <img style="width: 30px; padding-right: 5px;" src="./assets/images/document.svg"> 문서함 이동 -->
					<!-- 						</a> -->
					<!-- 					</div> -->
				</div>
				<div class="card-body pt-3 pb-1">
					<div id="kt_table_users_wrapper"
						class="dataTables_wrapper dt-bootstrap4 no-footer">
						<div class="table-responsive">
							<div id="kt_table_users_wrapper"
								class="dataTables_wrapper dt-bootstrap4 no-footer">
								<div class="table-responsive">
									<table class="table align-middle gs-0 gy-4">
										<thead>
											<tr class="border-0">
												<th class="p-0 min-w-100px"></th>
												<th class="p-0 min-w-100px"></th>
												<th class="p-0 min-w-100px"></th>
												<th class="p-0 min-w-100px"></th>
												<th class="p-0 min-w-50px"></th>
												<th class="p-0 min-w-100px text-end"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td style="width: 150px;">
													<div class="d-flex align-items-center">
														<div class="symbol symbol-45px me-5">
															<img style="margin-left: 10px;"
																src="./assets/images/whiteimg.png">
														</div>
														<div style="flex: 0 0 15px;"></div>
														<div class="symbol symbol-45px me-5">
															<p style="margin: 0px;">
																<b class="text-gray-800 fw-bold mb-1 fs-6">문서번호</b> <span><img
																	src="./assets/images/arrow.png"></span>
															</p>
														</div>
													</div>
												</td>
												<td class="text-end" style="width: 300px;">
													<p style="text-align: center; margin: 0px;">
														<b class="text-gray-800 fw-bold mb-1 fs-6">문서명</b> <span><img
															src="./assets/images/arrow.png"></span>
													</p>
												</td>
												<td class="text-end">
													<p style="text-align: center; margin: 0px;">
														<b class="text-gray-800 fw-bold mb-1 fs-6">기안자</b>
													</p>
												</td>
												<td class="text-end">
													<p class="text-gray-800 fw-bold mb-1 fs-6"
														style="text-align: center;">
														<b class="text-gray-800 fw-bold mb-1 fs-6">마감일자</b> <span><img
															src="./assets/images/arrow.png"></span>
													</p>

												</td>
												<td class="text-end"></td>
											</tr>

											<c:forEach var="list" items="${lists}">
												<tr>
													<td>
														<div class="d-flex align-items-center">


															<div class="symbol symbol-45px me-5">
																<img
																	style="margin-left: 10px; width: 45px; height: 45px;"
																	src="./assets/images/vacation.png">
															</div>



															<div style="flex: 0 0 25px;"></div>
															<div class="symbol symbol-45px me-5">
																<p class="text-gray-800 fw-bold mb-1 fs-6">${list.doc_no}</p>
															</div>
														</div>
													</td>
													<td class="text-end"><a href="./detailApprovalDocument.do?doc_no=${list.doc_no}"
														class="text-gray-800 fw-bold text-hover-primary d-block mb-1 fs-6"
														style="text-align: center;">${list.doc_name}</a>
													</td>
													<td class="text-end"><a href="#"
														style="text-align: center;"
														class="text-gray-800 fw-bold text-hover-primary d-block mb-1 fs-6">${list.emp_name}</a>
													</td>
													<td class="text-end">
														<p style="text-align: center;"
															class="text-gray-800 fw-bold d-block mb-1 fs-6">
															${list.doc_exp}</p>
													</td>
													<td class="text-end">
														<div class="d-flex flex-column w-100 me-2">
															<div
																class="d-flex flex-stack text-gray-500 fs-7 fw-semibold mb-2">
																<span class="me-2">100%</span> <span>Progress</span>
															</div>
															<div class="progress h-6px w-100 bg-light-danger">
																<div class="progress-bar bg-success" role="progressbar"
																	style="width: 100%" aria-valuenow="0" aria-valuemin="0"
																	aria-valuemax="100"></div>
															</div>
														</div>
													</td>

												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="./footer.jsp"%>
</body>
<script type="text/javascript">
	
</script>
</html>