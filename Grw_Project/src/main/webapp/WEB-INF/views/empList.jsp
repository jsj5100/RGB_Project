<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="./header.jsp"%>
</head>

<body>
	<div id="kt_app_content" class="app-content flex-column-fluid">
		<!--begin::Content container-->
		<div id="kt_app_content_container" class="app-container container-xxl"
			style="padding-top: 30px;">
			<div class="d-flex flex-column flex-lg-row">
				<!--begin::Card-->
				<!-- 트리 -->
				<div
					class="flex-column flex-lg-row-auto w-lg-250px w-xl-350px mb-10"
					style="padding-left: 30px; padding-right: 10px;">
					<div class="card">
						<div id="tree"></div>
					</div>
				</div>


				<div class="card">
					<!--begin::Card header-->
					<div class="card-header border-0 pt-6">
						<!--begin::Card title-->
						<div class="card-title">
							<!--begin::Search-->
							<div class="d-flex align-items-center position-relative my-1">
								<i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
									<span class="path1"></span> <span class="path2"></span>
								</i> <input type="text" id="searchEmp" data-kt-user-table-filter="search"
									class="form-control form-control-solid w-250px ps-13"
									placeholder="이름, 사번검색">
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

								<!--begin::Menu 1-->
								<div class="menu menu-sub menu-sub-dropdown w-300px w-md-325px"
									data-kt-menu="true">
									<!--begin::Header-->
									<div class="px-7 py-5"></div>
									<!--end::Header-->
									<!--begin::Separator-->
									<div class="separator border-gray-200"></div>
								</div>
								<!--end::Menu 1-->
								<!--end::Filter-->
								<!--begin::Export-->

								<!--end::Export-->
								<!--begin::Add user-->
								
								
								
								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#kt_modal_add_user">
									<i class="ki-duotone ki-plus fs-2"></i>사원등록
								</button>
								<!--end::Add user-->
							</div>
							<!--end::Toolbar-->
							<!--begin::Group actions-->
							<div class="d-flex justify-content-end align-items-center d-none"
								data-kt-user-table-toolbar="selected">
								<div class="fw-bold me-5">
									<span class="me-2" data-kt-user-table-select="selected_count">
									</span>선택
								</div>
								<button type="button" class="btn btn-danger"
									data-kt-user-table-select="delete_selected">선택삭제</button>
							</div>
							
							
							
							
							
							
							
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
											<h2 class="fw-bold">사원등록</h2>
											<!--end::Modal title-->
											<!--begin::Close-->
											<!-- 										<div class="btn btn-icon btn-sm btn-active-icon-primary" -->
											<!-- 											data-kt-users-modal-action="close"> -->
											<!-- 											<i class="ki-duotone ki-cross fs-1"> <span class="path1"></span> -->
											<!-- 												<span class="path2"></span> -->
											<!-- 											</i> -->
											<!-- 										</div> -->
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
												action="./addEmp.do" method="post">
												<!--begin::Scroll-->
												<div class="d-flex flex-column scroll-y px-5 px-lg-10"
													id="kt_modal_add_user_scroll" data-kt-scroll="true"
													data-kt-scroll-activate="true"
													data-kt-scroll-max-height="auto"
													data-kt-scroll-dependencies="#kt_modal_add_user_header"
													data-kt-scroll-wrappers="#kt_modal_add_user_scroll"
													data-kt-scroll-offset="300px" style="max-height: 645px;">
												

													<!--begin::Input group-->
													<div class="fv-row mb-7 fv-plugins-icon-container">
														<!--begin::Label-->
														<label class="required fw-semibold fs-6 mb-2">이름</label>
														<!--end::Label-->
														<!--begin::Input-->
														<input type="text" name="userName"
															class="form-control form-control-solid mb-3 mb-lg-0"
															placeholder="홍길동" value="">
														<!--end::Input-->
														<div
															class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
													</div>
													<!--end::Input group-->

													<!--begin::Input group-->
													<div class="fv-row mb-7 fv-plugins-icon-container">
														<!--begin::Label-->
														<label class="required fw-semibold fs-6 mb-2">사원번호</label>
														<!--end::Label-->
														<!--begin::Input-->
														<input type="text" name="userNo"
															class="form-control form-control-solid mb-3 mb-lg-0"
															placeholder="ex)240101" value="">
														<!--end::Input-->
														<div
															class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
													</div>
													<!--end::Input group-->

													<div class="fv-row mb-7 fv-plugins-icon-container">
														<!--begin::Label-->
														<label class="required fw-semibold fs-6 mb-2">패스워드</label>
														<!--end::Label-->
														<!--begin::Input-->
														<input type="password" name="userPw"
															class="form-control form-control-solid mb-3 mb-lg-0"
															placeholder="ex)240101" value="">
														<!--end::Input-->
														<div
															class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
													</div>

													<!--begin::Input group-->
													<div class="fv-row mb-7 fv-plugins-icon-container">
														<!-- 																									begin::Label -->
														<label class="required fw-semibold fs-6 mb-2">이메일</label>
														<!-- 																									end::Label -->
														<!-- 																									begin::Input -->
														<input type="email" name="userEmail"
															class="form-control form-control-solid mb-3 mb-lg-0"
															placeholder="example@gmail.com" value="">
														<!-- 																									end::Input -->
														<div
															class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
														</div>
													</div>
													<!--end::Input group-->

													<!--begin::Input group-->
													<div class="fv-row mb-7 fv-plugins-icon-container">
														<!--begin::Label-->
														<label class="required fw-semibold fs-6 mb-2">부서명</label>
														<!--end::Label-->
														<!--begin::Input-->
														<select
															class="form-control form-control-solid mb-3 mb-lg-0"
															name="deptSelect">
															<option>인사부</option>
															<option>경영기획부</option>
															<option>재무부</option>
															<option>마케팅부</option>
															<option>영업부</option>
															<option>고객지원부</option>
															<option>연구개발부</option>
															<option>품질관리부</option>
															<option>생산부</option>
															<option>IT</option>
															<option>감사부</option>
															<option>법률지원부</option>
															<option>해외영업부</option>
															<option>시설관리부</option>
															<option>리스크관리부</option>
														</select>
														<!-- 													<input type="text" name="user_name" -->
														<!-- 														class="form-control form-control-solid mb-3 mb-lg-0" -->
														<!-- 														placeholder="Full name" value="옵션"> -->
														<!--end::Input-->
														<!-- 													<div -->
														<!-- 														class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"> -->
														<!-- 													</div> -->
													</div>

													<!--end::Input group-->

													<!--begin::Input group-->
													<div class="fv-row mb-7 fv-plugins-icon-container">
														<!--begin::Label-->
														<label class="required fw-semibold fs-6 mb-2">주민등록번호</label>
														<!--end::Label-->
														<!--begin::Input-->
														<input type="text" name="userIdnum"
															class="form-control form-control-solid mb-3 mb-lg-0"
															placeholder="ex)950101-1xxxxxx" value="">
														<!--end::Input-->
														<div
															class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
													</div>
													<!--end::Input group-->


													<div class="fv-row mb-7 fv-plugins-icon-container">
														<!--begin::Label-->
														<label class="required fw-semibold fs-6 mb-2">성별</label>
														<!--end::Label-->
														<select
															class="form-control form-control-solid mb-3 mb-lg-0"
															name="userGender">
															<option>남성</option>
															<option>여성</option>
														</select>
														<div
															class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
													</div>

													<!--begin::Input group-->
													<div class="fv-row mb-7 fv-plugins-icon-container">
														<!--begin::Label-->
														<label class="required fw-semibold fs-6 mb-2">입사날짜</label>
														<!--end::Label-->
														<!--begin::Input-->
														<input type="date" name="userJoin"
															class="form-control form-control-solid mb-3 mb-lg-0"
															placeholder="Full name" value="">
														<!--end::Input-->
														<div
															class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
													</div>
													<!--end::Input group-->

													<!--begin::Input group-->
													<div class="fv-row mb-7 fv-plugins-icon-container">
														<!--begin::Label-->
														<label class="required fw-semibold fs-6 mb-2">직위</label>
														<!--end::Label-->
														<!--begin::Input-->

														<select
															class="form-control form-control-solid mb-3 mb-lg-0"
															name="userTier">
															<option>사원</option>
															<option>대리</option>
															<option>과장</option>
															<option>부장</option>
															<option>사장</option>
															<option>대표</option>
														</select>

														<!-- 													<input type="text" name="user_name" -->
														<!-- 														class="form-control form-control-solid mb-3 mb-lg-0" -->
														<!-- 														placeholder="Full name" value="ex)대리"> -->
														<!--end::Input-->
														<div
															class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
													</div>
													<!--end::Input group-->

													<!--begin::Input group-->
													<div class="fv-row mb-7 fv-plugins-icon-container">
														<!--begin::Label-->
														<label class="required fw-semibold fs-6 mb-2">권한</label>
														<!--end::Label-->
														<!--begin::Input-->

														<select
															class="form-control form-control-solid mb-3 mb-lg-0"
															name="userAuth">
															<option>비권한</option>
															<option>인사관리자</option>
															<option>결재관리자</option>
															<option>재무관리자</option>
															<option>마케팅관리자</option>
															<option>영업관리자</option>
															<option>고객지원관리자</option>
															<option>연구개발관리자</option>
															<option>품질관리관리자</option>
															<option>생산관리자</option>
															<option>IT관리자</option>
															<option>감사책임자</option>
															<option>법률지원관리자</option>
															<option>해외영업관리자</option>
															<option>시설관리자</option>
															<option>리스크전략관리자</option>
														</select>
														<!-- 													<input type="text" name="user_name" -->
														<!-- 														class="form-control form-control-solid mb-3 mb-lg-0" -->
														<!-- 														placeholder="Full name" value="ex)인사관리자"> -->
														<!--end::Input-->
														<div
															class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
													</div>
													<!--end::Input group-->
														<div class="fv-row mb-7 fv-plugins-icon-container">
														<!--begin::Label-->
														<label class="required fw-semibold fs-6 mb-2">재직여부</label>
														<!--end::Label-->
														<select
															class="form-control form-control-solid mb-3 mb-lg-0"
															name="userState">
															<option>Y</option>
															<option>N</option>
														</select>
														<div
															class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
													</div>



												
												</div>
												<!--end::Scroll-->
												<!--begin::Actions-->
												<div class="text-center pt-10">
													<!-- 												<button type="reset" class="btn btn-light me-3" -->
													<!-- 													data-kt-users-modal-action="cancel">취소하기</button> -->
													<button type="button" id="kt_modal_add_event_cancel"
														class="btn btn-light me-3" data-bs-dismiss="modal">취소하기</button>
													<button type="submit" id="kt_modal_add_event_submit" class="btn btn-primary" data-bs-dismiss="modal" onclick="addEmp()">
								                        <span class="indicator-label">등록하기</span>
								                    </button>
<!-- 													<button type="submit" class="btn btn-primary" -->
<!-- 														data-kt-users-modal-action="submit" -->
<!-- 														data-bs-dismiss="modal"> -->
<!-- 														<span class="indicator-label">등록하기</span> <span -->
<!-- 															class="indicator-progress">등록중... <span -->
<!-- 															class="spinner-border spinner-border-sm align-middle ms-2"> -->
<!-- 														</span></span> -->
<!-- 													</button> -->
													
													
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

				<form action="./delEmp.do" method="post">
					<div class="card-body py-4">
						<!--begin::Table-->
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
												colspan="1" aria-label=" " style="width: 29.8906px;">
												<div
													class="form-check form-check-sm form-check-custom form-check-solid me-3">
													<input class="form-check-input" type="checkbox"
														data-kt-check="true"
														data-kt-check-target="#kt_table_users .form-check-input"
														value="1">
												</div>
											</th>
											<th class="min-w-50px sorting" tabindex="0"
												aria-controls="kt_table_users" rowspan="1" colspan="1"
												aria-label="User: activate to sort column ascending"
												style="width: 278.953px;">No</th>
											<th class="min-w-125px sorting" tabindex="0"
												aria-controls="kt_table_users" rowspan="1" colspan="1"
												aria-label="Role: activate to sort column ascending"
												style="width: 162.219px;">이름</th>
											<th class="min-w-125px sorting" tabindex="0"
												aria-controls="kt_table_users" rowspan="1" colspan="1"
												aria-label="Last login: activate to sort column ascending"
												style="width: 162.219px; padding-right: 10px;">사원번호</th>
											<th class="min-w-100px sorting" tabindex="0"
												aria-controls="kt_table_users" rowspan="1" colspan="1"
												aria-label="Two-step: activate to sort column ascending"
												style="width: 162.219px;">직위</th>

											<th class="min-w-80px sorting" tabindex="0"
												aria-controls="kt_table_users" rowspan="1" colspan="1"
												aria-label="Two-step: activate to sort column ascending"
												style="width: 162.219px;">부서명</th>
											<!-- ----------------------------------------- -->

											<th class="min-w-80px sorting" tabindex="0"
												aria-controls="kt_table_users" rowspan="1" colspan="1"
												aria-label="Joined Date: activate to sort column ascending"
												style="width: 208.641px;">재직여부</th>
											<th class="text-end min-w-100px sorting_disabled" rowspan="1"
												colspan="1" aria-label="Actions" style="width: 130.359px;">관리</th>
										</tr>
									</thead>

									<tbody class="text-gray-600 fw-semibold">
										<c:forEach var="vo" items="${EmpList}" varStatus="vs">
											<tr class="odd">
												<td>
													<div
														class="form-check form-check-sm form-check-custom form-check-solid">
														<input class="form-check-input" type="checkbox" value="1">
													</div>
												</td>
												<!-- 										<td class="d-flex align-items-center"> -->
												<td>${vs.count} <!--begin:: Avatar --> <!-- 											<div --> <!-- 												class="symbol symbol-circle symbol-50px overflow-hidden me-3"> -->
													<!-- 												<a href="apps/user-management/users/view.html"> -->
													<!-- 													<div class="symbol-label"> --> <!-- 														<img src="assets/media/avatars/300-6.jpg" alt="Emma Smith" -->
													<!-- 															class="w-100"> --> <!-- 													</div> -->
													<!-- 												</a> --> <!-- 											</div>  --> <!--end::Avatar-->
													<!--begin::User details--> <!-- 											<div class="d-flex flex-column"> -->
													<!-- 												<a href="apps/user-management/users/view.html" -->
													<!-- 													class="text-gray-800 text-hover-primary mb-1">1</a> -->
													<!-- 													<span>　</span> --> <!-- 											</div> begin::User details -->

												</td>

												<td>
													<!-- 											<a href="./userView.do">홍길동</a> --> <a>${vo.emp_name}</a>
												</td>

												<td data-order="2024-08-21T11:37:58+09:00">
													<div class="badge badge-light fw-bold">${vo.emp_no}</div>
												</td>
												<td>
													<div class="badge badge-light-success fw-bold">${vo.tier_name}</div>

												</td>

												<td data-order="2023-10-25T06:43:00+09:00">${vo.dep_name}</td>
												<td data-order="2023-10-25T06:43:00+09:00">${vo.emp_state}</td>

												<td class="text-end"><a href="#"
													class="btn btn-light btn-active-light-primary btn-flex btn-center btn-sm"
													data-kt-menu-trigger="click"
													data-kt-menu-placement="bottom-end">설정<i
														class="ki-duotone ki-down fs-5 ms-1"></i></a> <!--begin::Menu-->
													<div
														class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4"
														data-kt-menu="true">
														<!--begin::Menu item-->
														<div class="menu-item px-3">
															<a href="./myPage.do" class="menu-link px-3">수정</a>
														</div>
														<!--end::Menu item-->
														<!--begin::Menu item-->
														<!-- 												<div class="menu-item px-3"> -->
														<!-- 													<a href="#" class="menu-link px-3" -->
														<!-- 														data-kt-users-table-filter="delete_row">삭제</a> -->
														<!-- 												</div> -->
														<!--end::Menu item-->
													</div> <!--end::Menu--></td>

											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
							
						</div>
						<!--end::Table-->
					</div>
				</form>





					<!--end::Card body-->
				</div>
				<!--end::Card-->

			</div>




		</div>
	</div>
	<!--end::Content container-->


	<!-- 		</div> -->








</body>


<!-- Code injected by live-server -->
<script>
</script>

<!--begin::Javascript-->
<script>
	var hostUrl = "assets/";
</script>

<!--begin::Global Javascript Bundle(mandatory for all pages)-->
<script src="./assets/plugins/global/plugins.bundle.js"></script>
<script src="./assets/js/scripts.bundle.js"></script>
<!--end::Global Javascript Bundle-->
<!--begin::Vendors Javascript(used for this page only)-->
<script src="./assets/plugins/custom/datatables/datatables.bundle.js"></script>
<!--end::Vendors Javascript-->
<!--begin::Custom Javascript(used for this page only)-->
<script
	src="./assets/js/custom/apps/user-management/users/list/table.js"></script>
<script
	src="./assets/js/custom/apps/user-management/users/list/export-users.js"></script>
<script src="./assets/js/custom/apps/user-management/users/list/add.js"></script>
<script src="./assets/js/widgets.bundle.js"></script>
<script src="./assets/js/custom/apps/chat/chat.js"></script>
<script src="./assets/js/custom/utilities/modals/create-campaign.js"></script>
<script src="./assets/js/custom/utilities/modals/users-search.js"></script>
<!--end::Custom Javascript-->
<!--end::Javascript-->

















<!-- Js Tree script -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<script type="text/javascript">

	function getJson() {
		
		// 서버에서 트리 데이터를 가져옵니다
	    fetch('./treeDept.do') // 서버에서 트리 데이터를 가져오는 URL
	        .then(response => {
	            if (!response.ok) {
	                throw new Error("네트워크 응답이 올바르지 않습니다.");
	            }
	            return response.json();
	        })
	        .then(data => {
	            console.log(data);
	            var company = new Array();
	            
	            company[0] = {
	    			id : "root",
	    			parent : "#",
	    			text : "부서명"
	    		}
	            
	            $.each(data, function(idx, item) {
					company[idx+1] = {
						id : item.dep_no,
						parent : 'root',
						text : item.dep_name
					};
				});
	         	// 트리 생성
				$('#tree').jstree({
					core : {
						data : company  
					}, //데이터연결
					types : {
						'default' : {
							'icon' : 'jstree-folder'
						}
					},
					plugins : [ 'wholerow', 'types' ]
				}).bind('loaded.jstree', function(event, data) {
					//트리 로딩 롼료 이벤트
				}).bind('select_node.jstree', function(event, data) {
					//노드 선택 이벤트
					console.log(data);
					
					if (data.node.parent == '#') return;
					
					//document.getElementById('searchEmp').value = "";
					selectTree(data.node.id);
					document.getElementById('searchEmp').value = data.node.text;
					$("#searchEmp").focus();
				})
	        })
	        .catch(error => console.error('Error fetching tree data:', error));
	}
	
	
	
	function selectTree(dep_no) {
		// 서버에서 트리 데이터를 가져옵니다
	    fetch('./selectDept.do?dep_no=' + dep_no) // 서버에서 트리 데이터를 가져오는 URL
	        .then(response => {
	            if (!response.ok) {
	                throw new Error("네트워크 응답이 올바르지 않습니다.");
	            }
	            return response.json();
	        })
	        .then(data => {
	            console.log("선택한 부서번호 : " + dep_no);
	            console.log(data);
	        })
	        .catch(error => console.error('Error fetching tree data:', error));
	}

	$(document).ready(function() {
		getJson();
	});
</script>
<script src="./js/empList.js"></script>
<%@include file="./footer.jsp"%>
</html>

