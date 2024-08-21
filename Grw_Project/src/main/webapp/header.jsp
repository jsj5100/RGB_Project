<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--begin::Head-->
<html data-bs-theme="light">
<head>
<title>RGB Groupware Project</title>
<meta charset="utf-8">
<link rel="canonical" href="https://preview.keenthemes.com/keen">
<link rel="shortcut icon" href="./assets/media/logos/favicon.ico">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700">


<link href="./assets/plugins/custom/datatables/datatables.bundle.css"
	rel="stylesheet" type="text/css">


<link href="./assets/plugins/global/plugins.bundle.css" rel="stylesheet"
	type="text/css">
<link href="./assets/css/style.bundle.css" rel="stylesheet"
	type="text/css">


</head>


<body id="kt_app_body" data-kt-app-header-fixed-mobile="true"
	data-kt-app-sidebar-enabled="true" data-kt-app-sidebar-fixed="true"
	data-kt-app-sidebar-push-header="true"
	data-kt-app-sidebar-push-toolbar="true"
	data-kt-app-sidebar-push-footer="true"
	data-kt-app-sidebar-stacked="true"
	data-kt-app-sidebar-secondary-enabled="false"
	data-kt-app-toolbar-enabled="true" class="app-default">

<div>
				<div id="kt_app_sidebar" class="app-sidebar" data-kt-drawer="true"
					data-kt-drawer-name="app-sidebar"
					data-kt-drawer-activate="{default: true, lg: false}"
					data-kt-drawer-direction="start"
					data-kt-drawer-toggle="#kt_app_sidebar_mobile_toggle" style="">
					<div class="app-sidebar-primary">
						<div
							class="app-sidebar-logo d-none d-lg-flex flex-center pt-8 pb-5"
							id="kt_app_sidebar_logo">
							<img alt="Logo" src="assets/media/logos/default-small-dark.svg" class="h-35px">
							</div>
						<div
							class="app-sidebar-menu flex-grow-1 hover-scroll-overlay-y scroll-ms my-7 my-lg-5"
							id="kt_aside_menu_wrapper" data-kt-scroll="true"
							data-kt-scroll-height="auto"
							data-kt-scroll-dependencies="#kt_app_sidebar_logo, #kt_app_sidebar_footer"
							data-kt-scroll-wrappers="#kt_app_sidebar_menu"
							data-kt-scroll-offset="5px" style="height: 765px;"></div>
						
							
					</div>
				</div>
				<div id="kt_app_toolbar" class="app-toolbar py-4 py-lg-8"
					data-kt-sticky="true" data-kt-sticky-name="app-toolbar-sticky"
					data-kt-sticky-offset="{default: 'false', lg: '300px'}"
					style="padding-left:80px; background-color:white; animation-duration: 0.3s;">
					<!--begin::Toolbar container-->
					<div id="kt_app_toolbar_container"
						class="app-container container-xxl d-flex flex-stack flex-wrap">
						<!--begin::Page title-->
						<div
							class="page-title d-flex py-2 py-lg-0 flex-column justify-content-center me-3">
							<!--begin::Title-->
							<h1
								class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">Overview</h1>
							<!--end::Title-->
							<!--begin::Breadcrumb-->
							<ul
								class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
								<!--begin::Item-->
								<li class="breadcrumb-item text-muted"><a href="index.html"
									class="text-muted text-hover-primary">Home</a></li>
								<!--end::Item-->
								<!--begin::Item-->
								<li class="breadcrumb-item"><span
									class="bullet bg-gray-500 w-5px h-2px"></span></li>
								<!--end::Item-->
								<!--begin::Item-->
								<li class="breadcrumb-item text-muted">Pages</li>
								<!--end::Item-->
								<!--begin::Item-->
								<li class="breadcrumb-item"><span
									class="bullet bg-gray-500 w-5px h-2px"></span></li>
								<!--end::Item-->
								<!--begin::Item-->
								<li class="breadcrumb-item text-muted">User Profile</li>
								<!--end::Item-->
							</ul>
							<!--end::Breadcrumb-->
						</div>
						<!--end::Page title-->
						<!--begin::Actions-->
						<div class="d-flex align-items-center gap-2 gap-lg-3">
							<!--begin::Search-->
							<div id="kt_header_search"
								class="header-search d-flex align-items-stretch"
								data-kt-search-keypress="true" data-kt-search-min-length="2"
								data-kt-search-enter="enter" data-kt-search-layout="menu"
								data-kt-menu-trigger="auto" data-kt-menu-overflow="false"
								data-kt-menu-permanent="true"
								data-kt-menu-placement="bottom-end" data-kt-search="true">
								<!--begin::Search toggle-->
								<div class="d-flex align-items-center"
									data-kt-search-element="toggle" id="kt_header_search_toggle">
									<div
										class="btn btn-custom btn-sm btn-icon btn-color-primary bg-body">
										<i class="ki-duotone ki-magnifier fs-2"> <span
											class="path1"></span> <span class="path2"></span>
										</i>
									</div>
								</div>
								<!--end::Search toggle-->
								<!--begin::Menu-->
								<div data-kt-search-element="content"
									class="menu menu-sub menu-sub-dropdown p-7 w-325px w-md-375px"
									data-kt-menu="true">
									<!--begin::Wrapper-->
									<div data-kt-search-element="wrapper">
										<!--begin::Form-->
										<form data-kt-search-element="form"
											class="w-100 position-relative mb-3" autocomplete="off">
											<!--begin::Icon-->
											<i
												class="ki-duotone ki-magnifier fs-2 text-gray-500 position-absolute top-50 translate-middle-y ms-0">
												<span class="path1"></span> <span class="path2"></span>
											</i>
											<!--end::Icon-->
											<!--begin::Input-->
											<input type="text"
												class="search-input form-control form-control-flush ps-10"
												name="search" value="" placeholder="Search..."
												data-kt-search-element="input">
											<!--end::Input-->
											<!--begin::Spinner-->
											<span
												class="search-spinner position-absolute top-50 end-0 translate-middle-y lh-0 d-none me-1"
												data-kt-search-element="spinner"> <span
												class="spinner-border h-15px w-15px align-middle text-gray-500"></span>
											</span>
											<!--end::Spinner-->
											<!--begin::Reset-->
											<span
												class="search-reset btn btn-flush btn-active-color-primary position-absolute top-50 end-0 translate-middle-y lh-0 d-none"
												data-kt-search-element="clear"> <i
												class="ki-duotone ki-cross fs-2 fs-lg-1 me-0"> <span
													class="path1"></span> <span class="path2"></span>
											</i>
											</span>
											<!--end::Reset-->
											<!--begin::Toolbar-->
											<div
												class="position-absolute top-50 end-0 translate-middle-y"
												data-kt-search-element="toolbar">
												<!--begin::Preferences toggle-->
												<div data-kt-search-element="preferences-show"
													class="btn btn-icon w-20px btn-sm btn-active-color-primary me-1"
													data-bs-toggle="tooltip"
													aria-label="Show search preferences"
													data-bs-original-title="Show search preferences"
													data-kt-initialized="1">
													<i class="ki-duotone ki-setting-2 fs-2"> <span
														class="path1"></span> <span class="path2"></span>
													</i>
												</div>
												<!--end::Preferences toggle-->
												<!--begin::Advanced search toggle-->
												<div data-kt-search-element="advanced-options-form-show"
													class="btn btn-icon w-20px btn-sm btn-active-color-primary"
													data-bs-toggle="tooltip"
													aria-label="Show more search options"
													data-bs-original-title="Show more search options"
													data-kt-initialized="1">
													<i class="ki-duotone ki-down fs-2"></i>
												</div>
												<!--end::Advanced search toggle-->
											</div>
											<!--end::Toolbar-->
										</form>
										<!--end::Form-->
										<!--begin::Separator-->
										<div class="separator border-gray-200 mb-6"></div>
										<!--end::Separator-->

										<!--begin::Recently viewed-->
										<div class="mb-5" data-kt-search-element="main">
											<!--begin::Heading-->
											<div class="d-flex flex-stack fw-semibold mb-4">
												<!--begin::Label-->
												<span class="text-muted fs-6 me-2">Recently Searched:</span>
												<!--end::Label-->
											</div>
											<!--end::Heading-->
											<!--begin::Items-->
											<div class="scroll-y mh-200px mh-lg-325px">
												<!--begin::Item-->
												<div class="d-flex align-items-center mb-5">
													<!--begin::Symbol-->
													<div class="symbol symbol-40px me-4">
														<span class="symbol-label bg-light"> <i
															class="ki-duotone ki-laptop fs-2 text-primary"> <span
																class="path1"></span> <span class="path2"></span>
														</i>
														</span>
													</div>
													<!--end::Symbol-->
													<!--begin::Title-->
													<div class="d-flex flex-column">
														<a href="#"
															class="fs-6 text-gray-800 text-hover-primary fw-semibold">BoomApp
															by Keenthemes</a> <span class="fs-7 text-muted fw-semibold">#45789</span>
													</div>
													<!--end::Title-->
												</div>
												<!--end::Item-->
												<!--begin::Item-->
												<div class="d-flex align-items-center mb-5">
													<!--begin::Symbol-->
													<div class="symbol symbol-40px me-4">
														<span class="symbol-label bg-light"> <i
															class="ki-duotone ki-chart-simple fs-2 text-primary">
																<span class="path1"></span> <span class="path2"></span>
																<span class="path3"></span> <span class="path4"></span>
														</i>
														</span>
													</div>
													<!--end::Symbol-->
													<!--begin::Title-->
													<div class="d-flex flex-column">
														<a href="#"
															class="fs-6 text-gray-800 text-hover-primary fw-semibold">"Kept
															API Project Meeting</a> <span
															class="fs-7 text-muted fw-semibold">#84050</span>
													</div>
													<!--end::Title-->
												</div>
												<!--end::Item-->
												<!--begin::Item-->
												<div class="d-flex align-items-center mb-5">
													<!--begin::Symbol-->
													<div class="symbol symbol-40px me-4">
														<span class="symbol-label bg-light"> <i
															class="ki-duotone ki-chart fs-2 text-primary"> <span
																class="path1"></span> <span class="path2"></span>
														</i>
														</span>
													</div>
													<!--end::Symbol-->
													<!--begin::Title-->
													<div class="d-flex flex-column">
														<a href="#"
															class="fs-6 text-gray-800 text-hover-primary fw-semibold">"KPI
															Monitoring App Launch</a> <span
															class="fs-7 text-muted fw-semibold">#84250</span>
													</div>
													<!--end::Title-->
												</div>
												<!--end::Item-->
												<!--begin::Item-->
												<div class="d-flex align-items-center mb-5">
													<!--begin::Symbol-->
													<div class="symbol symbol-40px me-4">
														<span class="symbol-label bg-light"> <i
															class="ki-duotone ki-chart-line-down fs-2 text-primary">
																<span class="path1"></span> <span class="path2"></span>
														</i>
														</span>
													</div>
													<!--end::Symbol-->
													<!--begin::Title-->
													<div class="d-flex flex-column">
														<a href="#"
															class="fs-6 text-gray-800 text-hover-primary fw-semibold">Project
															Reference FAQ</a> <span class="fs-7 text-muted fw-semibold">#67945</span>
													</div>
													<!--end::Title-->
												</div>
												<!--end::Item-->
												<!--begin::Item-->
												<div class="d-flex align-items-center mb-5">
													<!--begin::Symbol-->
													<div class="symbol symbol-40px me-4">
														<span class="symbol-label bg-light"> <i
															class="ki-duotone ki-sms fs-2 text-primary"> <span
																class="path1"></span> <span class="path2"></span>
														</i>
														</span>
													</div>
													<!--end::Symbol-->
													<!--begin::Title-->
													<div class="d-flex flex-column">
														<a href="#"
															class="fs-6 text-gray-800 text-hover-primary fw-semibold">"FitPro
															App Development</a> <span class="fs-7 text-muted fw-semibold">#84250</span>
													</div>
													<!--end::Title-->
												</div>
												<!--end::Item-->
												<!--begin::Item-->
												<div class="d-flex align-items-center mb-5">
													<!--begin::Symbol-->
													<div class="symbol symbol-40px me-4">
														<span class="symbol-label bg-light"> <i
															class="ki-duotone ki-bank fs-2 text-primary"> <span
																class="path1"></span> <span class="path2"></span>
														</i>
														</span>
													</div>
													<!--end::Symbol-->
													<!--begin::Title-->
													<div class="d-flex flex-column">
														<a href="#"
															class="fs-6 text-gray-800 text-hover-primary fw-semibold">Shopix
															Mobile App</a> <span class="fs-7 text-muted fw-semibold">#45690</span>
													</div>
													<!--end::Title-->
												</div>
												<!--end::Item-->
												<!--begin::Item-->
												<div class="d-flex align-items-center mb-5">
													<!--begin::Symbol-->
													<div class="symbol symbol-40px me-4">
														<span class="symbol-label bg-light"> <i
															class="ki-duotone ki-chart-line-down fs-2 text-primary">
																<span class="path1"></span> <span class="path2"></span>
														</i>
														</span>
													</div>
													<!--end::Symbol-->
													<!--begin::Title-->
													<div class="d-flex flex-column">
														<a href="#"
															class="fs-6 text-gray-800 text-hover-primary fw-semibold">"Landing
															UI Design" Launch</a> <span
															class="fs-7 text-muted fw-semibold">#24005</span>
													</div>
													<!--end::Title-->
												</div>
												<!--end::Item-->
											</div>
											<!--end::Items-->
										</div>
										<!--end::Recently viewed-->
										<!--begin::Empty-->
										<div data-kt-search-element="empty" class="text-center d-none">
											<!--begin::Icon-->
											<div class="pt-10 pb-10">
												<i class="ki-duotone ki-search-list fs-4x opacity-50"> <span
													class="path1"></span> <span class="path2"></span> <span
													class="path3"></span>
												</i>
											</div>
											<!--end::Icon-->
											<!--begin::Message-->
											<div class="pb-15 fw-semibold">
												<h3 class="text-gray-600 fs-5 mb-2">No result found</h3>
												<div class="text-muted fs-7">Please try again with a
													different query</div>
											</div>
											<!--end::Message-->
										</div>
										<!--end::Empty-->
									</div>
									<!--end::Wrapper-->
									<!--begin::Preferences-->
									<form data-kt-search-element="advanced-options-form"
										class="pt-1 d-none">
										<!--begin::Heading-->
										<h3 class="fw-semibold text-gray-900 mb-7">Advanced
											Search</h3>
										<!--end::Heading-->
										<!--begin::Input group-->
										<div class="mb-5">
											<input type="text"
												class="form-control form-control-sm form-control-solid"
												placeholder="Contains the word" name="query">
										</div>
										<!--end::Input group-->
										<!--begin::Input group-->
										<div class="mb-5">
											<!--begin::Radio group-->
											<div class="nav-group nav-group-fluid">
												<!--begin::Option-->
												<label> <input type="radio" class="btn-check"
													name="type" value="has" checked="checked"> <span
													class="btn btn-sm btn-color-muted btn-active btn-active-primary">All</span>
												</label>
												<!--end::Option-->
												<!--begin::Option-->
												<label> <input type="radio" class="btn-check"
													name="type" value="users"> <span
													class="btn btn-sm btn-color-muted btn-active btn-active-primary px-4">Users</span>
												</label>
												<!--end::Option-->
												<!--begin::Option-->
												<label> <input type="radio" class="btn-check"
													name="type" value="orders"> <span
													class="btn btn-sm btn-color-muted btn-active btn-active-primary px-4">Orders</span>
												</label>
												<!--end::Option-->
												<!--begin::Option-->
												<label> <input type="radio" class="btn-check"
													name="type" value="projects"> <span
													class="btn btn-sm btn-color-muted btn-active btn-active-primary px-4">Projects</span>
												</label>
												<!--end::Option-->
											</div>
											<!--end::Radio group-->
										</div>
										<!--end::Input group-->
										<!--begin::Input group-->
										<div class="mb-5">
											<input type="text" name="assignedto"
												class="form-control form-control-sm form-control-solid"
												placeholder="Assigned to" value="">
										</div>
										<!--end::Input group-->
										<!--begin::Input group-->
										<div class="mb-5">
											<input type="text" name="collaborators"
												class="form-control form-control-sm form-control-solid"
												placeholder="Collaborators" value="">
										</div>
										<!--end::Input group-->
										<!--begin::Input group-->
										<div class="mb-5">
											<!--begin::Radio group-->
											<div class="nav-group nav-group-fluid">
												<!--begin::Option-->
												<label> <input type="radio" class="btn-check"
													name="attachment" value="has" checked="checked"> <span
													class="btn btn-sm btn-color-muted btn-active btn-active-primary">Has
														attachment</span>
												</label>
												<!--end::Option-->
												<!--begin::Option-->
												<label> <input type="radio" class="btn-check"
													name="attachment" value="any"> <span
													class="btn btn-sm btn-color-muted btn-active btn-active-primary px-4">Any</span>
												</label>
												<!--end::Option-->
											</div>
											<!--end::Radio group-->
										</div>
										<!--end::Input group-->
										<!--begin::Input group-->
										<div class="mb-5">
											<select name="timezone" aria-label="Select a Timezone"
												data-control="select2"
												data-dropdown-parent="#kt_header_search"
												data-placeholder="date_period"
												class="form-select form-select-sm form-select-solid select2-hidden-accessible"
												data-select2-id="select2-data-1-pbzk" tabindex="-1"
												aria-hidden="true" data-kt-initialized="1">
												<option value="next" data-select2-id="select2-data-3-jz2v">Within
													the next</option>
												<option value="last">Within the last</option>
												<option value="between">Between</option>
												<option value="on">On</option>
											</select><span
												class="select2 select2-container select2-container--bootstrap5"
												dir="ltr" data-select2-id="select2-data-2-a7o8"
												style="width: 100%;"><span class="selection"><span
													class="select2-selection select2-selection--single form-select form-select-sm form-select-solid"
													role="combobox" aria-haspopup="true" aria-expanded="false"
													tabindex="0" aria-disabled="false"
													aria-labelledby="select2-timezone-ok-container"
													aria-controls="select2-timezone-ok-container"><span
														class="select2-selection__rendered"
														id="select2-timezone-ok-container" role="textbox"
														aria-readonly="true" title="Within the next">Within
															the next</span><span class="select2-selection__arrow"
														role="presentation"><b role="presentation"></b></span></span></span><span
												class="dropdown-wrapper" aria-hidden="true"></span></span>
										</div>
										<!--end::Input group-->
										<!--begin::Input group-->
										<div class="row mb-8">
											<!--begin::Col-->
											<div class="col-6">
												<input type="number" name="date_number"
													class="form-control form-control-sm form-control-solid"
													placeholder="Lenght" value="">
											</div>
											<!--end::Col-->
											<!--begin::Col-->
											<div class="col-6">
												<select name="date_typer" aria-label="Select a Timezone"
													data-control="select2"
													data-dropdown-parent="#kt_header_search"
													data-placeholder="Period"
													class="form-select form-select-sm form-select-solid select2-hidden-accessible"
													data-select2-id="select2-data-4-n63z" tabindex="-1"
													aria-hidden="true" data-kt-initialized="1">
													<option value="days" data-select2-id="select2-data-6-3bme">Days</option>
													<option value="weeks">Weeks</option>
													<option value="months">Months</option>
													<option value="years">Years</option>
												</select><span
													class="select2 select2-container select2-container--bootstrap5"
													dir="ltr" data-select2-id="select2-data-5-8r34"
													style="width: 100%;"><span class="selection"><span
														class="select2-selection select2-selection--single form-select form-select-sm form-select-solid"
														role="combobox" aria-haspopup="true" aria-expanded="false"
														tabindex="0" aria-disabled="false"
														aria-labelledby="select2-date_typer-su-container"
														aria-controls="select2-date_typer-su-container"><span
															class="select2-selection__rendered"
															id="select2-date_typer-su-container" role="textbox"
															aria-readonly="true" title="Days">Days</span><span
															class="select2-selection__arrow" role="presentation"><b
																role="presentation"></b></span></span></span><span class="dropdown-wrapper"
													aria-hidden="true"></span></span>
											</div>
											<!--end::Col-->
										</div>
										<!--end::Input group-->
										<!--begin::Actions-->
										<div class="d-flex justify-content-end">
											<button type="reset"
												class="btn btn-sm btn-light fw-bold btn-active-light-primary me-2"
												data-kt-search-element="advanced-options-form-cancel">Cancel</button>
											<a href="utilities/search/horizontal.html"
												class="btn btn-sm fw-bold btn-primary"
												data-kt-search-element="advanced-options-form-search">Search</a>
										</div>
										<!--end::Actions-->
									</form>
									<!--end::Preferences-->
									<!--begin::Preferences-->
									<form data-kt-search-element="preferences" class="pt-1 d-none">
										<!--begin::Heading-->
										<h3 class="fw-semibold text-gray-900 mb-7">Search
											Preferences</h3>
										<!--end::Heading-->
										<!--begin::Input group-->
										<div class="pb-4 border-bottom">
											<label
												class="form-check form-switch form-switch-sm form-check-custom form-check-solid flex-stack">
												<span
												class="form-check-label text-gray-700 fs-6 fw-semibold ms-0 me-2">Projects</span>
												<input class="form-check-input" type="checkbox" value="1"
												checked="checked">
											</label>
										</div>
										<!--end::Input group-->
										<!--begin::Input group-->
										<div class="py-4 border-bottom">
											<label
												class="form-check form-switch form-switch-sm form-check-custom form-check-solid flex-stack">
												<span
												class="form-check-label text-gray-700 fs-6 fw-semibold ms-0 me-2">Targets</span>
												<input class="form-check-input" type="checkbox" value="1"
												checked="checked">
											</label>
										</div>
										<!--end::Input group-->
										<!--begin::Input group-->
										<div class="py-4 border-bottom">
											<label
												class="form-check form-switch form-switch-sm form-check-custom form-check-solid flex-stack">
												<span
												class="form-check-label text-gray-700 fs-6 fw-semibold ms-0 me-2">Affiliate
													Programs</span> <input class="form-check-input" type="checkbox"
												value="1">
											</label>
										</div>
										<!--end::Input group-->
										<!--begin::Input group-->
										<div class="py-4 border-bottom">
											<label
												class="form-check form-switch form-switch-sm form-check-custom form-check-solid flex-stack">
												<span
												class="form-check-label text-gray-700 fs-6 fw-semibold ms-0 me-2">Referrals</span>
												<input class="form-check-input" type="checkbox" value="1"
												checked="checked">
											</label>
										</div>
										<!--end::Input group-->
										<!--begin::Input group-->
										<div class="py-4 border-bottom">
											<label
												class="form-check form-switch form-switch-sm form-check-custom form-check-solid flex-stack">
												<span
												class="form-check-label text-gray-700 fs-6 fw-semibold ms-0 me-2">Users</span>
												<input class="form-check-input" type="checkbox" value="1">
											</label>
										</div>
										<!--end::Input group-->
										<!--begin::Actions-->
										<div class="d-flex justify-content-end pt-7">
											<button type="reset"
												class="btn btn-sm btn-light fw-bold btn-active-light-primary me-2"
												data-kt-search-element="preferences-dismiss">Cancel</button>
											<button type="submit" class="btn btn-sm fw-bold btn-primary">Save
												Changes</button>
										</div>
										<!--end::Actions-->
									</form>
									<!--end::Preferences-->
								</div>
								<!--end::Menu-->
							</div>
							<!--end::Search-->
							<a href="#" class="btn btn-custom btn-icon btn-sm bg-body"
								id="kt_drawer_chat_toggle"> <i
								class="ki-duotone ki-message-text-2 fs-2 text-primary"> <span
									class="path1"></span> <span class="path2"></span> <span
									class="path3"></span>
							</i>
							</a> <a href="apps/user-management/users/list.html"
								class="btn btn-custom btn-flex btn-sm bg-body fw-bold"> <span
								class="text-gray-600">New Member</span>
							</a> <a href="#" class="btn btn-flex btn-sm fw-bold btn-primary"
								data-bs-toggle="modal"
								data-bs-target="#kt_modal_create_campaign">New Campaign</a>
							<!--begin::Secondary button-->
							<!--end::Secondary button-->
							<!--begin::Primary button-->
							<!--end::Primary button-->
						</div>
						<!--end::Actions-->
					</div>
					<!--end::Toolbar container-->
				</div>
				</div>
				<script>var hostUrl = "assets/";</script>
		<!--begin::Global Javascript Bundle(mandatory for all pages)-->
		<script src="assets/plugins/global/plugins.bundle.js"></script>
		<script src="assets/js/scripts.bundle.js"></script>
		<!--end::Global Javascript Bundle-->
		<!--begin::Vendors Javascript(used for this page only)-->
		<script src="assets/plugins/custom/datatables/datatables.bundle.js"></script>
		<!--end::Vendors Javascript-->
		<!--begin::Custom Javascript(used for this page only)-->
		<script src="assets/js/custom/pages/user-profile/general.js"></script>
		<script src="assets/js/widgets.bundle.js"></script>
		<script src="assets/js/custom/apps/chat/chat.js"></script>
		<script src="assets/js/custom/utilities/modals/create-campaign.js"></script>
		<script src="assets/js/custom/utilities/modals/new-card.js"></script>
		<script src="assets/js/custom/utilities/modals/users-search.js"></script>
</body>
</html>