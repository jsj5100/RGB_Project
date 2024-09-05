<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div id="kt_app_content_container" class="app-container container-xxl"
		style="padding-top: 30px;">
		<!--begin::Card-->
		<div class="card">
			<!--begin::Card header-->
			<div class="card-header borde r-0 pt-6">
				<!--begin::Card title-->
				<div class="card-title">
					<!--begin::Search-->
					<div class="d-flex align-items-center position-relative my-1">
						<i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
							<span class="path1"></span> <span class="path2"></span>
						</i> <input type="text" data-kt-user-table-filter="search"
							class="form-control form-control-solid w-250px ps-13"
							placeholder="부서명">
					</div>
					<!--end::Search-->
				</div>
				<!--begin::Card title-->
				<!--begin::Card toolbar-->
				<div class="card-toolbar">
					<!--begin::Toolbar-->
					<div class="d-flex justify-content-end"
						data-kt-user-table-toolbar="base">
						<!--begin::Filter-->
						<!--                         <button type="button" class="btn btn-light-primary me-3" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end"> -->
						<!--                         <i class="ki-duotone ki-filter fs-2"> -->
						<!--                             <span class="path1"></span> -->
						<!--                             <span class="path2"></span> -->
						<!--                         </i>Filter</button> -->
						<!--begin::Menu 1-->
						<div class="menu menu-sub menu-sub-dropdown w-300px w-md-325px"
							data-kt-menu="true">
							<div class="px-7 py-5">
								<div class="fs-5 text-gray-900 fw-bold">Filter Options</div>
							</div>
							<div class="separator border-gray-200"></div>
							<div class="px-7 py-5" data-kt-user-table-filter="form">

								<!--end::Input group-->
								<!--begin::Actions-->
								<div class="d-flex justify-content-end">
									<button type="reset"
										class="btn btn-light btn-active-light-primary fw-semibold me-2 px-6"
										data-kt-menu-dismiss="true" data-kt-user-table-filter="reset">Reset</button>
									<button type="submit" class="btn btn-primary fw-semibold px-6"
										data-kt-menu-dismiss="true" data-kt-user-table-filter="filter">Apply</button>
								</div>
								<!--end::Actions-->
							</div>
							<!--end::Content-->
						</div>
						<!--end::Menu 1-->
						<!--end::Filter-->
						<!--begin::Export-->
						<!--                         <button type="button" class="btn btn-light-primary me-3" data-bs-toggle="modal" data-bs-target="#kt_modal_export_users"> -->
						<!--                         <i class="ki-duotone ki-exit-up fs-2"> -->
						<!--                             <span class="path1"></span> -->
						<!--                             <span class="path2"></span> -->
						<!--                         </i>Export</button> -->
						<!--end::Export-->
						<!--begin::Add user-->
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#kt_modal_add_user">
							<i class="ki-duotone ki-plus fs-2"></i>부서등록
						</button>
						<!--end::Add user-->
					</div>
					<!--end::Toolbar-->
					<!--begin::Group actions-->
					<div class="d-flex justify-content-end align-items-center d-none"
						data-kt-user-table-toolbar="selected">
						<div class="fw-bold me-5">
							<span class="me-2" data-kt-user-table-select="selected_count"></span>선택됨
						</div>
						<button type="button" class="btn btn-danger"
							data-kt-user-table-select="delete_selected">선택삭제</button>
					</div>
					<!--end::Group actions-->
					<!--begin::Modal - Adjust Balance-->
					<div class="modal fade" id="kt_modal_export_users" tabindex="-1"
						aria-hidden="true">
						<!--begin::Modal dialog-->
						<div class="modal-dialog modal-dialog-centered mw-650px">
							<!--begin::Modal content-->
							<div class="modal-content">
								<!--begin::Modal header-->
								<div class="modal-header">
									<!--begin::Modal title-->
									<h2 class="fw-bold">Export Users</h2>
									<!--end::Modal title-->
									<!--begin::Close-->
									<div class="btn btn-icon btn-sm btn-active-icon-primary"
										data-kt-users-modal-action="close">
										<i class="ki-duotone ki-cross fs-1"> <span class="path1"></span>
											<span class="path2"></span>
										</i>
									</div>
									<!--end::Close-->
								</div>
								<!--end::Modal header-->
								<!--begin::Modal body-->
							</div>
							<!--end::Modal content-->
						</div>
						<!--end::Modal dialog-->
					</div>
					<!--end::Modal - New Card-->

					<!--begin::Modal - Add task-->
					<div class="modal fade" id="kt_modal_add_user" tabindex="-1"
						aria-hidden="true">
						<!--begin::Modal dialog-->
						<div class="modal-dialog modal-dialog-centered mw-650px">
							<!--begin::Modal content-->
							<div class="modal-content">
								<!--begin::Modal header-->
								<div class="modal-header" id="kt_modal_add_user_header">
									<!--begin::Modal title-->
									<h2 class="fw-bold">부서등록</h2>
									<!--end::Modal title-->
									<!--begin::Close-->
									<div class="btn btn-icon btn-sm btn-active-icon-primary"
										data-bs-dismiss="modal" id="kt_modal_add_event_close">
										<i class="ki-duotone ki-cross fs-1"> <span class="path1"></span>
											<span class="path2"></span>
										</i>
									</div>
									<!--end::Close-->
								</div>
								<!--end::Modal header-->
								<!--begin::Modal body-->
								<div class="modal-body px-5 my-7">
									<!--begin::Form-->
									<form id="kt_modal_add_user_form"
										class="form fv-plugins-bootstrap5 fv-plugins-framework"
										action="./addDept.do" method="post">
										<!-- changed from # -->
										<!--begin::Scroll-->
										<div class="d-flex flex-column scroll-y px-5 px-lg-10"
											id="kt_modal_add_user_scroll" data-kt-scroll="true"
											data-kt-scroll-activate="true"
											data-kt-scroll-max-height="auto"
											data-kt-scroll-dependencies="#kt_modal_add_user_header"
											data-kt-scroll-wrappers="#kt_modal_add_user_scroll"
											data-kt-scroll-offset="300px" style="max-height: 645px;">

											<div class="fv-row mb-7 fv-plugins-icon-container">
												<!--begin::Label-->
												<label class="required fw-semibold fs-6 mb-2">부서명</label>
												<!--end::Label-->
												<!--begin::Input-->
												<input type="text" name="depName"
													class="form-control form-control-solid mb-3 mb-lg-0"
													placeholder="ex) 기술지원팀" value="">
												<!--end::Input-->
												<div
													class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
											</div>
											<!--end::Input group-->

											<!--begin::Input group-->
											<div class="fv-row mb-7 fv-plugins-icon-container">
												<!--begin::Label-->
												<label class="required fw-semibold fs-6 mb-2">부서번호</label>
												<!--end::Label-->
												<!--begin::Input-->
												<input type="text" name="depNo"
													class="form-control form-control-solid mb-3 mb-lg-0"
													placeholder="ex) HR001" value="">
												<!--end::Input-->
												<div
													class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
											</div>

											<div class="fv-row mb-7 fv-plugins-icon-container">
												<!--begin::Label-->
												<label class="required fw-semibold fs-6 mb-2">부서상태</label>
												<!--end::Label-->
												<!--begin::Input-->
												<select class="form-control form-control-solid mb-3 mb-lg-0"
													name="depState">
													<option>Y</option>
												</select>
												<!--end::Input-->
												<div
													class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
											</div>



										</div>
										<!--end::Scroll-->
										<!--begin::Actions-->
										<div class="text-center pt-10">
											<button type="button" id="kt_modal_add_event_cancel"
												class="btn btn-light me-3" data-bs-dismiss="modal">취소</button>
											<button type="submit" class="btn btn-primary"
												data-kt-users-modal-action="submit" data-bs-dismiss="modal">
												<span class="indicator-label">등록</span> <span
													class="indicator-progress">등록중... <span
													class="spinner-border spinner-border-sm align-middle ms-2"></span>
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
					<!--end::Modal - Add task-->
				</div>
				<!--end::Card toolbar-->
			</div>
			<!--end::Card header-->
			<!--begin::Card body-->




			<div class="card-body py-4">
				<!--begin::Table-->
				<div id="kt_table_users_wrapper"
					class="dataTables_wrapper dt-bootstrap4 no-footer">
					<div class="table-responsive">


						<div id="kt_table_users_wrapper"
							class="dataTables_wrapper dt-bootstrap4 no-footer">
							<div class="table-responsive">
								<table
									class="table align-middle table-row-dashed fs-6 gy-5 dataTable no-footer"
									id="kt_table_users">


									<thead>
										<tr
											class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
											<th class="w-10px pe-2 sorting_disabled" rowspan="1"
												colspan="1"
												aria-label="
										
											
										
									"
												style="width: 38.625px;">
												<div
													class="form-check form-check-sm form-check-custom form-check-solid me-3">
													<input class="form-check-input" type="checkbox"
														data-kt-check="true"
														data-kt-check-target="#kt_table_users .form-check-input"
														value="1">
												</div>
											</th>
											<th class="min-w-125px sorting" tabindex="0"
												aria-controls="kt_table_users" rowspan="1" colspan="1"
												aria-label="No: activate to sort column ascending"
												style="width: 143.641px;">No</th>
											<th class="min-w-125px sorting" tabindex="0"
												aria-controls="kt_table_users" rowspan="1" colspan="1"
												aria-label="부서명: activate to sort column ascending"
												style="width: 229.203px;">부서명</th>
											<th class="min-w-125px sorting" tabindex="0"
												aria-controls="kt_table_users" rowspan="1" colspan="1"
												aria-label="부서번호: activate to sort column ascending"
												style="width: 229.203px;">부서번호</th>
											<th class="min-w-125px sorting" tabindex="0"
												aria-controls="kt_table_users" rowspan="1" colspan="1"
												aria-label="부서관리자: activate to sort column ascending"
												style="width: 229.203px;">부서관리자</th>
											<th class="min-w-125px sorting" tabindex="0"
												aria-controls="kt_table_users" rowspan="1" colspan="1"
												aria-label="부서상태: activate to sort column ascending"
												style="width: 143.641px;">부서상태</th>
											<th class="text-end min-w-100px sorting_disabled" rowspan="1"
												colspan="1" aria-label="관리" style="width: 120.984px;">관리</th>
										</tr>
									</thead>

									<tbody class="text-gray-600 fw-semibold">










































































































































									</tbody>

								</table>
							</div>
							<div class="row">
								<div
									class="col-sm-12 col-md-5 d-flex align-items-center justify-content-center justify-content-md-start"></div>
								<div
									class="col-sm-12 col-md-7 d-flex align-items-center justify-content-center justify-content-md-end">
									<div class="dataTables_paginate paging_simple_numbers"
										id="kt_table_users_paginate">
										<ul class="pagination">
											
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!--end::Table-->
			</div>
			<!--end::Card body-->
		</div>
		<!--end::Card-->
	</div>
	<%@include file="./footer.jsp"%>
</body>
</html>