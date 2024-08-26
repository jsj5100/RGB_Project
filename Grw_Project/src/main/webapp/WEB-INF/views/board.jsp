<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<%@include file="./header.jsp"%>
<body>
	<!-- 컨텐츠 영역 -->
	<div style="padding-left:80px; margin-top:10px;" id="kt_app_content" class="app-content flex-column-fluid">
		<div style="padding-left:80px;" id="kt_app_content_container" class="app-container container-xxl" style="padding-top: 30px;">
			
			<!-- 카드 시작 -->
			<div class="card">
			<!--begin::Card header-->
			<div class="card-header border-0 pt-6">
				<!--begin::Card title-->
				<div class="card-title">
					<!--begin::Search-->
					<div class="d-flex align-items-center position-relative my-1">
						<i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
							<span class="path1"></span> <span class="path2"></span>
						</i> <input type="text" data-kt-user-table-filter="search" class="form-control form-control-solid w-250px ps-13" placeholder="부서명">
					</div>
					<!--end::Search-->
				</div>
				<!--begin::Card title-->
				<!--begin::Card toolbar-->
				<div class="card-toolbar">
					<!--begin::Toolbar-->
					<div class="d-flex justify-content-end" data-kt-user-table-toolbar="base">
						<!--begin::Add user-->
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#kt_modal_add_user">
							<i class="ki-duotone ki-plus fs-2"></i>게시판 추가
						</button>
						<!--end::Add user-->
					</div>
					<!--end::Toolbar-->
				</div>
				
				<!--begin::Card body-->
			<div class="card-body py-4">
				<!--begin::Table-->
				<div id="kt_table_users_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
					<div class="table-responsive">
						<div id="kt_table_users_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer"><div class="table-responsive"><table class="table align-middle table-row-dashed fs-6 gy-5 dataTable no-footer" id="kt_table_users">
							<thead>
								<tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
									<th class="min-w-125px sorting" tabindex="0" aria-controls="kt_table_users" rowspan="1" colspan="1" aria-label="No: activate to sort column ascending" style="width: 277.031px;">No</th>
									<th class="min-w-125px sorting" tabindex="0" aria-controls="kt_table_users" rowspan="1" colspan="1" aria-label="게시판이름: activate to sort column ascending" style="width: 161.078px;">게시판이름</th>
<!-- 									<th class="min-w-125px sorting" tabindex="0" aria-controls="kt_table_users" rowspan="1" colspan="1" aria-label="부서번호: activate to sort column ascending" style="width: 161.078px;"></th> -->
									<th class="min-w-125px sorting" tabindex="0" aria-controls="kt_table_users" rowspan="1" colspan="1" aria-label="게시판생성자: activate to sort column ascending" style="width: 161.078px;">게시판생성자</th>
									<th class="min-w-125px sorting" tabindex="0" aria-controls="kt_table_users" rowspan="1" colspan="1" aria-label="게시판상태: activate to sort column ascending" style="width: 207.172px;">게시판상태</th>
									<th class="text-end min-w-100px sorting_disabled" rowspan="1" colspan="1" aria-label="관리" style="width: 129.445px;">관리</th></tr>
							</thead>
							<tbody class="text-gray-600 fw-semibold">
							<tr class="odd">
									<td class="d-flex align-items-center">
										<!--begin:: Avatar --> <!--                                 <div class="symbol symbol-circle symbol-50px overflow-hidden me-3"> -->
										<!--begin::User details-->
										<div class="d-flex flex-column">
											1<span>　</span>
										</div> <!--begin::User details-->
									</td>
									<td>전사게시판</td>
<!-- 									<td data-order="2024-08-25T19:00:11+09:00"> -->
<!-- 										<div class="badge badge-light fw-bold">ST001</div> -->
<!-- 									</td> -->

									<td>관리자</td>


									<td data-order="Invalid date">사용중</td>
									<td class="text-end"><a href="#" class="btn btn-light btn-active-light-primary btn-flex btn-center btn-sm" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">설정<i class="ki-duotone ki-down fs-5 ms-1"></i></a> <!--begin::Menu-->
										<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4" data-kt-menu="true">
											<!--begin::Menu item-->
											<div class="menu-item px-3" data-bs-toggle="modal" data-bs-target="#kt_modal_add_user">
												<a class="menu-link px-3">수정</a>
											</div>
											<!--end::Menu item-->
											<!--begin::Menu item-->
											<div class="menu-item px-3">
												<a href="#" class="menu-link px-3" data-kt-users-table-filter="delete_row">삭제</a>
											</div>
											<!--end::Menu item-->
										</div> <!--end::Menu--></td>
								</tr>
								<tr class="even">
									<td class="d-flex align-items-center">
										<!--begin:: Avatar --> <!--                                 <div class="symbol symbol-circle symbol-50px overflow-hidden me-3"> -->
										<!--                                     <a href="apps/user-management/users/view.html"> -->
										<!--                                         <div class="symbol-label fs-3 bg-light-danger text-danger">M</div> -->
										<!--                                     </a> --> <!--                                 </div> -->
										<!--end::Avatar--> <!--begin::User details-->
										<div class="d-flex flex-column">
											2<span>　</span>
										</div> <!--begin::User details-->
									</td>
									<td>총무부게시판</td>
									<td>
										<div>김희연</div>
									</td>
									<td data-order="Invalid date">사용중지</td>
									<td class="text-end"><a href="#" class="btn btn-light btn-active-light-primary btn-flex btn-center btn-sm" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">설정<i class="ki-duotone ki-down fs-5 ms-1"></i></a> <!--begin::Menu-->
										<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4" data-kt-menu="true">
											<!--begin::Menu item-->
											<div class="menu-item px-3" data-bs-toggle="modal" data-bs-target="#kt_modal_add_user">
												<a class="menu-link px-3">수정</a>
											</div>
											<!--end::Menu item-->
											<!--begin::Menu item-->
											<div class="menu-item px-3">
												<a href="#" class="menu-link px-3" data-kt-users-table-filter="delete_row">삭제</a>
											</div>
											<!--end::Menu item-->
										</div> <!--end::Menu--></td>
								</tr>
								</tbody>
						</table>
						</div>
						<div class="row">
						<div class="col-sm-12 col-md-5 d-flex align-items-center justify-content-center justify-content-md-start"></div><div class="col-sm-12 col-md-7 d-flex align-items-center justify-content-center justify-content-md-end"><div class="dataTables_paginate paging_simple_numbers" id="kt_table_users_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="kt_table_users_previous"><a href="#" aria-controls="kt_table_users" data-dt-idx="0" tabindex="0" class="page-link"><i class="previous"></i></a></li><li class="paginate_button page-item active"><a href="#" aria-controls="kt_table_users" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item next disabled" id="kt_table_users_next"><a href="#" aria-controls="kt_table_users" data-dt-idx="2" tabindex="0" class="page-link"><i class="next"></i></a></li></ul></div></div></div></div>
					</div>
					<!-- 					<div class="row"> -->
				</div>
				<!--end::Table-->
			</div>
			<!--end::Card body-->
		</div>
				
		<!-- 모달창 시작 -->		
				
					<!--begin::Modal - Add task-->
					<div class="modal fade" id="kt_modal_add_user" tabindex="-1" aria-hidden="true">
						<!--begin::Modal dialog-->
						<div class="modal-dialog modal-dialog-centered mw-650px">
							<!--begin::Modal content-->
							<div class="modal-content">
								<!--begin::Modal header-->
								<div class="modal-header" id="kt_modal_add_user_header">
									<!--begin::Modal title-->
									<h2 class="fw-bold">게시판 추가</h2>
									<!--end::Modal title-->
									<!--begin::Close-->
									<div class="btn btn-icon btn-sm btn-active-icon-primary" data-kt-users-modal-action="close" data-bs-dismiss="modal">
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
									<form id="kt_modal_add_user_form" class="form fv-plugins-bootstrap5 fv-plugins-framework" action="#">
										<!--begin::Scroll-->
										<div class="d-flex flex-column scroll-y px-5 px-lg-10" id="kt_modal_add_user_scroll" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-max-height="auto" data-kt-scroll-dependencies="#kt_modal_add_user_header" data-kt-scroll-wrappers="#kt_modal_add_user_scroll" data-kt-scroll-offset="300px" style="max-height: 619px;">
											<!--begin::Input group-->
											<div class="fv-row mb-7 fv-plugins-icon-container">
												<!--begin::Label-->
												<label class="required fw-semibold fs-6 mb-2">게시판이름</label>
												<!--end::Label-->
												<!--begin::Input-->
												<input type="text" name="user_name" class="form-control form-control-solid mb-3 mb-lg-0" placeholder="ex) 전사게시판" value="">
												<!--end::Input-->
												<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
											<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
											</div>
											<!--end::Input group-->
											
											<!--게시판 형태 -->
											<div class="fv-row mb-7 fv-plugins-icon-container">
						                        <!--begin::Checkbox-->
						                       <label class="fw-semibold fs-6 mb-2">댓글허용</label> 
						                       <label><input class="form-check-input" type="checkbox" value="" id="kt_board_reply">
						                            <span class="form-check-label fw-semibold" for="kt_board_reply_allow"></span>
						                       </label>    
						                       <label class="fw-semibold fs-6 mb-2">첨부파일허용</label>
						                       <label><input class="form-check-input" type="checkbox" value="" id="kt_board_file">
						                            <span class="form-check-label fw-semibold" for="kt_board_file_allow"></span>
						                       </label>     
						                        
						                        <!--end::Checkbox-->
						                    </div>
						                    
						                    
											<!--begin::Input group-->
											<div class="fv-row mb-7 fv-plugins-icon-container">
												<!--begin::Label-->
												<label class="required fw-semibold fs-6 mb-2">게시판사용자 추가</label>
												<!--end::Label-->
												<!--begin::Input-->
												<input type="text" name="user_name" class="form-control form-control-solid mb-3 mb-lg-0" placeholder="ex) HR001" value="">
												<!--end::Input-->
												<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
											<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
											</div>
											<!--end::Input group-->

<!-- 											begin::Input group -->
<!-- 											<div class="fv-row mb-7 fv-plugins-icon-container"> -->
<!-- 												begin::Label -->
<!-- 												<label class="required fw-semibold fs-6 mb-2">게시판관리자</label> -->
<!-- 												end::Label -->
<!-- 												begin::Input -->
<!-- 												<input type="text" name="user_name" class="form-control form-control-solid mb-3 mb-lg-0" placeholder="ex) 홍길동" value=""> -->
<!-- 												end::Input -->
<!-- 												<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div> -->
<!-- 											<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div></div> -->
											<!--end::Input group-->

											<!--begin::Input group-->
											<!--end::Input group-->
										</div>
										<!--end::Scroll-->
										<!--begin::Actions-->
										<div class="text-center pt-10">
											<button type="reset" class="btn btn-light me-3" data-kt-users-modal-action="cancel" data-bs-dismiss="modal">취소</button>
											<button type="submit" class="btn btn-primary" data-kt-users-modal-action="submit">
												<span class="indicator-label">등록</span> <span class="indicator-progress">등록중... <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
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
			<!--end::Card header-->
			
		
		</div>
	</div>
</body>
<%@include file="./footer.jsp" %>
</html>