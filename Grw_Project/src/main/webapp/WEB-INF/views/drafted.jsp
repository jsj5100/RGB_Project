<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="./header.jsp"%>
<body>
	<div style="padding-left: 80px; margin-top: 10px;" id="kt_app_content"
		class="app-content flex-column-fluid">
		<div style="padding-left: 80px;" id="kt_app_content_container"
			class="app-container container-xxl">
			<div style="width: 100%; height: auto; margin-top: 10px;"
				class="card">
				<div class="card-header border-0 pt-5">
					<h3 class="card-title align-items-start flex-column">
						<span class="card-label fw-bold fs-3 mb-1">기안함</span>
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
												<td class="text-end"></td>
											</tr>

											<c:forEach var="list" items="${draftLists}">
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
													<td class="text-end"><a href="#" data-title="asdfd"
														data-content="<p>adg</p>
" onclick="showModal(this)"
														class="text-gray-800 fw-bold text-hover-primary d-block mb-1 fs-6"
														style="text-align: center;" data-bs-toggle="modal"
														data-bs-target="#kt_modal_select_location">${list.doc_name}</a>
														<span class="text-gray-500 fw-semibold d-block fs-7"
														style="text-align: center;">${list.doc_regdate}</span></td>
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
																<span class="me-2">0%</span> <span>Progress</span>
															</div>
															<div class="progress h-6px w-100 bg-light-danger">
																<div class="progress-bar bg-danger" role="progressbar"
																	style="width: 0%" aria-valuenow="0" aria-valuemin="0"
																	aria-valuemax="100"></div>
															</div>
														</div>
													</td>
													<td style="text-align: center;"><input type="button"
														value="삭제"></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
								<div class="row">
							<div
								class="col-sm-12 col-md-5 d-flex align-items-center justify-content-center justify-content-md-start">
								<div class="dataTables_length"
									id="kt_ecommerce_sales_table_length">
									<label><select name="kt_ecommerce_sales_table_length"
										aria-controls="kt_ecommerce_sales_table"
										class="form-select form-select-sm form-select-solid"><option
												value="10">10</option>
											<option value="25">25</option>
											<option value="50">50</option>
											<option value="100">100</option></select></label>
								</div>
							</div>
							<div
								class="col-sm-12 col-md-7 d-flex align-items-center justify-content-center justify-content-md-end">
								<div class="dataTables_paginate paging_simple_numbers"
									id="kt_ecommerce_sales_table_paginate">
									<ul class="pagination">
										<li class="paginate_button page-item previous disabled"
											id="kt_ecommerce_sales_table_previous"><a href="#"
											aria-controls="kt_ecommerce_sales_table" data-dt-idx="0"
											tabindex="0" class="page-link"><i class="previous"></i></a></li>
										<li class="paginate_button page-item active"><a href="#"
											aria-controls="kt_ecommerce_sales_table" data-dt-idx="1"
											tabindex="0" class="page-link">1</a></li>
										<li class="paginate_button page-item "><a href="#"
											aria-controls="kt_ecommerce_sales_table" data-dt-idx="2"
											tabindex="0" class="page-link">2</a></li>
										<li class="paginate_button page-item "><a href="#"
											aria-controls="kt_ecommerce_sales_table" data-dt-idx="3"
											tabindex="0" class="page-link">3</a></li>
										<li class="paginate_button page-item "><a href="#"
											aria-controls="kt_ecommerce_sales_table" data-dt-idx="4"
											tabindex="0" class="page-link">4</a></li>
										<li class="paginate_button page-item "><a href="#"
											aria-controls="kt_ecommerce_sales_table" data-dt-idx="5"
											tabindex="0" class="page-link">5</a></li>
										<li class="paginate_button page-item next"
											id="kt_ecommerce_sales_table_next"><a href="#"
											aria-controls="kt_ecommerce_sales_table" data-dt-idx="6"
											tabindex="0" class="page-link"><i class="next"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="kt_modal_select_location" tabindex="-1"
				style="display: none;" aria-hidden="true">
				<div class="modal-dialog mw-1000px">
					<div class="modal-content">
						<div class="modal-header">
							<h2 id="modalTitle"></h2>
						</div>
						<div class="modal-body">
							<div id="modalContent"></div>
						</div>
						<div class="modal-footer d-flex justify-content-end">
							<form action="./modifyTemplate.do" method="get">
								<input type="submit" id="kt_modal_select_location_button"
									class="btn btn-primary" data-bs-dismiss="modal" value="수정">
								<a href="#" class="btn btn-active-light me-5"
									data-bs-dismiss="modal">취소</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="./footer.jsp"%>
</body>
<script type="text/javascript">
	function showModal(element) {
		var title = element.getAttribute('data-title');
		var content = element.getAttribute('data-content');

		document.getElementById('modalTitle').textContent = title;
		document.getElementById('modalContent').innerHTML = content;
	}
</script>
</html>