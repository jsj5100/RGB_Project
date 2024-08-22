<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@include file="./header.jsp"%>

<!-- calendar  -->
<link href="./assets/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css">
<script src="./assets/plugins/custom/fullcalendar/fullcalendar.bundle.js"></script>
<script src="./assets/js/custom/apps/calendar/calendar.js"></script>

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
				<div class="col-xl-4 mb-xl-10">
				<div class="card card-flush h-xl-100"> 
<!-- 				<div class="card-header border-0 pt-5"> -->
<!-- 				</div> -->
				<div class="card-body pt-5">
					
					<!-- 캘린더 -->
					<div id="kt_calendar_app"
								class="fc fc-media-screen fc-direction-ltr fc-theme-standard">
					<div class="fc-header-toolbar fc-toolbar fc-toolbar-ltr">
					<div class="fc-toolbar-chunk">
					<div class="fc-button-group" style="font-size:10px;">
						<button type="button" title="Previous month" aria-pressed="false" class="fc-prev-button fc-button fc-button-primary">
							<span class="fc-icon fc-icon-chevron-left"></span>
						</button>
											<button type="button" title="Next month" aria-pressed="false"
												class="fc-next-button fc-button fc-button-primary">
												<span class="fc-icon fc-icon-chevron-right"></span>
											</button>
										</div>
										<button type="button" title="This month" disabled=""
											aria-pressed="false" style="font-size:10px;"
											class="fc-today-button fc-button fc-button-primary">today</button>
									</div>
									<div class="fc-toolbar-chunk">
										<p class="fc-toolbar-title" id="fc-dom-1" style="font-size:15px;">8월</p>
									</div>
									<div class="fc-toolbar-chunk">
										<div class="fc-button-group">
											<button type="button" title="month view" aria-pressed="true"
												class="fc-dayGridMonth-button fc-button fc-button-primary fc-button-active" style="font-size:10px;">month</button>
											<button type="button" title="week view" aria-pressed="false"
												class="fc-timeGridWeek-button fc-button fc-button-primary" style="font-size:10px;">week</button>
											<button type="button" title="day view" aria-pressed="false"
												class="fc-timeGridDay-button fc-button fc-button-primary" style="font-size:10px;">day</button>
										</div>
									</div>
								</div>
								<div aria-labelledby="fc-dom-1"
									class="fc-view-harness fc-view-harness-active"
									style="height: 232.593px;">
									<div class="fc-daygrid fc-dayGridMonth-view fc-view">
										<table role="grid" class="fc-scrollgrid  fc-scrollgrid-liquid">
											<thead role="rowgroup">
												<tr role="presentation"
													class="fc-scrollgrid-section fc-scrollgrid-section-header ">
													<th role="presentation"><div
															class="fc-scroller-harness">
															<div class="fc-scroller" style="overflow: hidden;">
																<table role="presentation" class="fc-col-header "
																	style="width: 312px;">
																	<colgroup></colgroup>
																	<thead role="presentation" >
																		<tr role="row">
																			<th role="columnheader"
																				class="fc-col-header-cell fc-day fc-day-sun"><div
																					class="fc-scrollgrid-sync-inner">
																					<a aria-label="Sunday"
																						class="fc-col-header-cell-cushion ">Sun</a>
																				</div></th>
																			<th role="columnheader"
																				class="fc-col-header-cell fc-day fc-day-mon"><div
																					class="fc-scrollgrid-sync-inner">
																					<a aria-label="Monday"
																						class="fc-col-header-cell-cushion ">Mon</a>
																				</div></th>
																			<th role="columnheader"
																				class="fc-col-header-cell fc-day fc-day-tue"><div
																					class="fc-scrollgrid-sync-inner">
																					<a aria-label="Tuesday"
																						class="fc-col-header-cell-cushion ">Tue</a>
																				</div></th>
																			<th role="columnheader"
																				class="fc-col-header-cell fc-day fc-day-wed"><div
																					class="fc-scrollgrid-sync-inner">
																					<a aria-label="Wednesday"
																						class="fc-col-header-cell-cushion ">Wed</a>
																				</div></th>
																			<th role="columnheader"
																				class="fc-col-header-cell fc-day fc-day-thu"><div
																					class="fc-scrollgrid-sync-inner">
																					<a aria-label="Thursday"
																						class="fc-col-header-cell-cushion ">Thu</a>
																				</div></th>
																			<th role="columnheader"
																				class="fc-col-header-cell fc-day fc-day-fri"><div
																					class="fc-scrollgrid-sync-inner">
																					<a aria-label="Friday"
																						class="fc-col-header-cell-cushion ">Fri</a>
																				</div></th>
																			<th role="columnheader"
																				class="fc-col-header-cell fc-day fc-day-sat"><div
																					class="fc-scrollgrid-sync-inner">
																					<a aria-label="Saturday"
																						class="fc-col-header-cell-cushion ">Sat</a>
																				</div></th>
																		</tr>
																	</thead>
																</table>
															</div>
														</div></th>
												</tr>
											</thead>
											<tbody role="rowgroup">
												<tr role="presentation"
													class="fc-scrollgrid-section fc-scrollgrid-section-body  fc-scrollgrid-section-liquid">
													<td role="presentation"><div
															class="fc-scroller-harness fc-scroller-harness-liquid">
															<div class="fc-scroller fc-scroller-liquid-absolute"
																style="overflow: hidden auto;">
																<div class="fc-daygrid-body fc-daygrid-body-balanced "
																	style="width: 312px;">
																	<table role="presentation"
																		class="fc-scrollgrid-sync-table"
																		style="width: 312px; height: 187px;">
																		<colgroup></colgroup>
																		<tbody role="presentation">
																			<tr role="row">
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other"
																					data-date="2024-07-28" aria-labelledby="fc-dom-2"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-2" class="fc-daygrid-day-number"
																								title="Go to July 28, 2024" data-navlink=""
																								tabindex="0">28</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-mon fc-day-past fc-day-other"
																					data-date="2024-07-29" aria-labelledby="fc-dom-4"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-4" class="fc-daygrid-day-number"
																								title="Go to July 29, 2024" data-navlink=""
																								tabindex="0">29</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-tue fc-day-past fc-day-other"
																					data-date="2024-07-30" aria-labelledby="fc-dom-6"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-6" class="fc-daygrid-day-number"
																								title="Go to July 30, 2024" data-navlink=""
																								tabindex="0">30</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-wed fc-day-past fc-day-other"
																					data-date="2024-07-31" aria-labelledby="fc-dom-8"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-8" class="fc-daygrid-day-number"
																								title="Go to July 31, 2024" data-navlink=""
																								tabindex="0">31</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
																					data-date="2024-08-01" aria-labelledby="fc-dom-10"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-10" class="fc-daygrid-day-number"
																								title="Go to August 1, 2024" data-navlink=""
																								tabindex="0">1</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-past border-success bg-success text-inverse-success"
																									tabindex="0"><div class="fc-event-main">
																										<div class="fc-event-main-frame">
																											<div class="fc-event-title-container">
																												<div class="fc-event-title fc-sticky">All
																													Day Event</div>
																											</div>
																										</div>
																									</div>
																									<div
																										class="fc-event-resizer fc-event-resizer-end"></div></a>
																							</div>
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;">
																								<a class="fc-daygrid-more-link fc-more-link"
																									title="Show 1 more event" aria-expanded="false"
																									aria-controls="" tabindex="0">+1 more</a>
																							</div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
																					data-date="2024-08-02" aria-labelledby="fc-dom-12"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-12" class="fc-daygrid-day-number"
																								title="Go to August 2, 2024" data-navlink=""
																								tabindex="0">2</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-past border-info bg-info text-info-success"
																									tabindex="0"><div class="fc-event-main">
																										<div class="fc-event-main-frame">
																											<div class="fc-event-title-container">
																												<div class="fc-event-title fc-sticky">Company
																													Trip</div>
																											</div>
																										</div>
																									</div>
																									<div
																										class="fc-event-resizer fc-event-resizer-end"></div></a>
																							</div>
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;">
																								<a class="fc-daygrid-more-link fc-more-link"
																									title="Show 1 more event" aria-expanded="false"
																									aria-controls="" tabindex="0">+1 more</a>
																							</div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
																					data-date="2024-08-03" aria-labelledby="fc-dom-14"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-14" class="fc-daygrid-day-number"
																								title="Go to August 3, 2024" data-navlink=""
																								tabindex="0">3</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-draggable fc-event-start fc-event-past fc-event-light fc-event-solid-primary"
																									tabindex="0"><div class="fc-event-main">
																										<div class="fc-event-main-frame">
																											<div class="fc-event-title-container">
																												<div class="fc-event-title fc-sticky">ICT
																													Expo 2021 - Product Release</div>
																											</div>
																										</div>
																									</div></a>
																							</div>
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;">
																								<a class="fc-daygrid-more-link fc-more-link"
																									title="Show 1 more event" aria-expanded="false"
																									aria-controls="" tabindex="0">+1 more</a>
																							</div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																			</tr>
																			<tr role="row">
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
																					data-date="2024-08-04" aria-labelledby="fc-dom-16"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-16" class="fc-daygrid-day-number"
																								title="Go to August 4, 2024" data-navlink=""
																								tabindex="0">4</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-draggable fc-event-resizable fc-event-end fc-event-past fc-event-light fc-event-solid-primary"
																									tabindex="0"><div class="fc-event-main">
																										<div class="fc-event-main-frame">
																											<div class="fc-event-title-container">
																												<div class="fc-event-title fc-sticky">ICT
																													Expo 2021 - Product Release</div>
																											</div>
																										</div>
																									</div>
																									<div
																										class="fc-event-resizer fc-event-resizer-end"></div></a>
																							</div>
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;">
																								<a class="fc-daygrid-more-link fc-more-link"
																									title="Show 1 more event" aria-expanded="false"
																									aria-controls="" tabindex="0">+1 more</a>
																							</div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
																					data-date="2024-08-05" aria-labelledby="fc-dom-18"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-18" class="fc-daygrid-day-number"
																								title="Go to August 5, 2024" data-navlink=""
																								tabindex="0">5</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
																					data-date="2024-08-06" aria-labelledby="fc-dom-20"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-20" class="fc-daygrid-day-number"
																								title="Go to August 6, 2024" data-navlink=""
																								tabindex="0">6</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
																					data-date="2024-08-07" aria-labelledby="fc-dom-22"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-22" class="fc-daygrid-day-number"
																								title="Go to August 7, 2024" data-navlink=""
																								tabindex="0">7</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
																					data-date="2024-08-08" aria-labelledby="fc-dom-24"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-24" class="fc-daygrid-day-number"
																								title="Go to August 8, 2024" data-navlink=""
																								tabindex="0">8</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
																					data-date="2024-08-09" aria-labelledby="fc-dom-26"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-26" class="fc-daygrid-day-number"
																								title="Go to August 9, 2024" data-navlink=""
																								tabindex="0">9</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-past fc-event-danger"
																									tabindex="0"><div
																										class="fc-daygrid-event-dot"></div>
																									<div class="fc-event-time">4p</div>
																									<div class="fc-event-title">Repeating
																										Event</div></a>
																							</div>
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;">
																								<a class="fc-daygrid-more-link fc-more-link"
																									title="Show 1 more event" aria-expanded="false"
																									aria-controls="" tabindex="0">+1 more</a>
																							</div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
																					data-date="2024-08-10" aria-labelledby="fc-dom-28"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-28" class="fc-daygrid-day-number"
																								title="Go to August 10, 2024" data-navlink=""
																								tabindex="0">10</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																			</tr>
																			<tr role="row">
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
																					data-date="2024-08-11" aria-labelledby="fc-dom-30"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-30" class="fc-daygrid-day-number"
																								title="Go to August 11, 2024" data-navlink=""
																								tabindex="0">11</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
																					data-date="2024-08-12" aria-labelledby="fc-dom-32"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-32" class="fc-daygrid-day-number"
																								title="Go to August 12, 2024" data-navlink=""
																								tabindex="0">12</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-past"
																									tabindex="0"><div class="fc-event-main">
																										<div class="fc-event-main-frame">
																											<div class="fc-event-title-container">
																												<div class="fc-event-title fc-sticky">Dinner</div>
																											</div>
																										</div>
																									</div>
																									<div
																										class="fc-event-resizer fc-event-resizer-end"></div></a>
																							</div>
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;">
																								<a class="fc-daygrid-more-link fc-more-link"
																									title="Show 1 more event" aria-expanded="false"
																									aria-controls="" tabindex="0">+1 more</a>
																							</div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
																					data-date="2024-08-13" aria-labelledby="fc-dom-34"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-34" class="fc-daygrid-day-number"
																								title="Go to August 13, 2024" data-navlink=""
																								tabindex="0">13</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
																					data-date="2024-08-14" aria-labelledby="fc-dom-36"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-36" class="fc-daygrid-day-number"
																								title="Go to August 14, 2024" data-navlink=""
																								tabindex="0">14</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-past border-warning bg-warning text-inverse-success"
																									tabindex="0"><div
																										class="fc-daygrid-event-dot"></div>
																									<div class="fc-event-time">1:30p</div>
																									<div class="fc-event-title">Reporting</div></a>
																							</div>
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;">
																								<a class="fc-daygrid-more-link fc-more-link"
																									title="Show 1 more event" aria-expanded="false"
																									aria-controls="" tabindex="0">+1 more</a>
																							</div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
																					data-date="2024-08-15" aria-labelledby="fc-dom-38"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-38" class="fc-daygrid-day-number"
																								title="Go to August 15, 2024" data-navlink=""
																								tabindex="0">15</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
																					data-date="2024-08-16" aria-labelledby="fc-dom-40"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-40" class="fc-daygrid-day-number"
																								title="Go to August 16, 2024" data-navlink=""
																								tabindex="0">16</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-past"
																									tabindex="0"><div
																										class="fc-daygrid-event-dot"></div>
																									<div class="fc-event-time">4p</div>
																									<div class="fc-event-title">Repeating
																										Event</div></a>
																							</div>
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;">
																								<a class="fc-daygrid-more-link fc-more-link"
																									title="Show 1 more event" aria-expanded="false"
																									aria-controls="" tabindex="0">+1 more</a>
																							</div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
																					data-date="2024-08-17" aria-labelledby="fc-dom-42"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-42" class="fc-daygrid-day-number"
																								title="Go to August 17, 2024" data-navlink=""
																								tabindex="0">17</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																			</tr>
																			<tr role="row">
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
																					data-date="2024-08-18" aria-labelledby="fc-dom-44"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-44" class="fc-daygrid-day-number"
																								title="Go to August 18, 2024" data-navlink=""
																								tabindex="0">18</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
																					data-date="2024-08-19" aria-labelledby="fc-dom-46"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-46" class="fc-daygrid-day-number"
																								title="Go to August 19, 2024" data-navlink=""
																								tabindex="0">19</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
																					data-date="2024-08-20" aria-labelledby="fc-dom-48"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-48" class="fc-daygrid-day-number"
																								title="Go to August 20, 2024" data-navlink=""
																								tabindex="0">20</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
																					data-date="2024-08-21" aria-labelledby="fc-dom-50"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-50" class="fc-daygrid-day-number"
																								title="Go to August 21, 2024" data-navlink=""
																								tabindex="0">21</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: -44.5625px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-primary"
																									tabindex="0"><div class="fc-event-main">
																										<div class="fc-event-main-frame">
																											<div class="fc-event-title-container">
																												<div class="fc-event-title fc-sticky">Conference</div>
																											</div>
																										</div>
																									</div>
																									<div
																										class="fc-event-resizer fc-event-resizer-end"></div></a>
																							</div>
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;">
																								<a class="fc-daygrid-more-link fc-more-link"
																									title="Show 1 more event" aria-expanded="false"
																									aria-controls="" tabindex="0">+1 more</a>
																							</div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-thu fc-day-today "
																					data-date="2024-08-22" aria-labelledby="fc-dom-52"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-52" class="fc-daygrid-day-number"
																								title="Go to August 22, 2024" data-navlink=""
																								tabindex="0">22</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-today"
																									tabindex="0"><div class="fc-daygrid-event-dot"></div>
																									<div class="fc-event-time">10:30a</div>
																									<div class="fc-event-title">Meeting</div></a>
																							</div>
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-today fc-event-info"
																									tabindex="0"><div
																										class="fc-daygrid-event-dot"></div>
																									<div class="fc-event-time">12p</div>
																									<div class="fc-event-title">Lunch</div></a>
																							</div>
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-today fc-event-warning"
																									tabindex="0"><div
																										class="fc-daygrid-event-dot"></div>
																									<div class="fc-event-time">2:30p</div>
																									<div class="fc-event-title">Meeting</div></a>
																							</div>
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-today fc-event-info"
																									tabindex="0"><div
																										class="fc-daygrid-event-dot"></div>
																									<div class="fc-event-time">5:30p</div>
																									<div class="fc-event-title">Happy Hour</div></a>
																							</div>
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;">
																								<a class="fc-daygrid-more-link fc-more-link"
																									title="Show 5 more events"
																									aria-expanded="false" aria-controls=""
																									tabindex="0">+5 more</a>
																							</div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-fri fc-day-future"
																					data-date="2024-08-23" aria-labelledby="fc-dom-54"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-54" class="fc-daygrid-day-number"
																								title="Go to August 23, 2024" data-navlink=""
																								tabindex="0">23</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-future fc-event-primary"
																									tabindex="0"><div
																										class="fc-daygrid-event-dot"></div>
																									<div class="fc-event-time">12p</div>
																									<div class="fc-event-title">Birthday
																										Party</div></a>
																							</div>
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a
																									class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-future fc-event-solid-danger fc-event-light"
																									tabindex="0"><div
																										class="fc-daygrid-event-dot"></div>
																									<div class="fc-event-time">6p</div>
																									<div class="fc-event-title">Dinner</div></a>
																							</div>
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;">
																								<a class="fc-daygrid-more-link fc-more-link"
																									title="Show 2 more events"
																									aria-expanded="false" aria-controls=""
																									tabindex="0">+2 more</a>
																							</div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-sat fc-day-future"
																					data-date="2024-08-24" aria-labelledby="fc-dom-56"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-56" class="fc-daygrid-day-number"
																								title="Go to August 24, 2024" data-navlink=""
																								tabindex="0">24</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																			</tr>
																			<tr role="row">
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-sun fc-day-future"
																					data-date="2024-08-25" aria-labelledby="fc-dom-58"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-58" class="fc-daygrid-day-number"
																								title="Go to August 25, 2024" data-navlink=""
																								tabindex="0">25</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-mon fc-day-future"
																					data-date="2024-08-26" aria-labelledby="fc-dom-60"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-60" class="fc-daygrid-day-number"
																								title="Go to August 26, 2024" data-navlink=""
																								tabindex="0">26</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-tue fc-day-future"
																					data-date="2024-08-27" aria-labelledby="fc-dom-62"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-62" class="fc-daygrid-day-number"
																								title="Go to August 27, 2024" data-navlink=""
																								tabindex="0">27</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-wed fc-day-future"
																					data-date="2024-08-28" aria-labelledby="fc-dom-64"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-64" class="fc-daygrid-day-number"
																								title="Go to August 28, 2024" data-navlink=""
																								tabindex="0">28</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div
																								class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																								style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																								<a class="fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-future fc-event-solid-info fc-event-light" tabindex="0">
																								<div class="fc-event-main">
																									<div class="fc-event-main-frame">
																										<div class="fc-event-title-container">
																										<div class="fc-event-title fc-sticky">Site visit</div>
																									</div>
																									</div>
																								</div>
																									<div class="fc-event-resizer fc-event-resizer-end"></div></a>
																							</div>
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;">
																								<a class="fc-daygrid-more-link fc-more-link"
																									title="Show 1 more event" aria-expanded="false"
																									aria-controls="" tabindex="0">+1 more</a>
																							</div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-thu fc-day-future"
																					data-date="2024-08-29" aria-labelledby="fc-dom-66"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-66" class="fc-daygrid-day-number"
																								title="Go to August 29, 2024" data-navlink=""
																								tabindex="0">29</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-fri fc-day-future"
																					data-date="2024-08-30" aria-labelledby="fc-dom-68"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-68" class="fc-daygrid-day-number"
																								title="Go to August 30, 2024" data-navlink=""
																								tabindex="0">30</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-sat fc-day-future"
																					data-date="2024-08-31" aria-labelledby="fc-dom-70"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-70" class="fc-daygrid-day-number"
																								title="Go to August 31, 2024" data-navlink=""
																								tabindex="0">31</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																			</tr>
																			<tr role="row">
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-sun fc-day-future fc-day-other"
																					data-date="2024-09-01" aria-labelledby="fc-dom-72"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-72" class="fc-daygrid-day-number"
																								title="Go to September 1, 2024" data-navlink=""
																								tabindex="0">1</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-mon fc-day-future fc-day-other"
																					data-date="2024-09-02" aria-labelledby="fc-dom-74"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-74" class="fc-daygrid-day-number"
																								title="Go to September 2, 2024" data-navlink=""
																								tabindex="0">2</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-tue fc-day-future fc-day-other"
																					data-date="2024-09-03" aria-labelledby="fc-dom-76"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-76" class="fc-daygrid-day-number"
																								title="Go to September 3, 2024" data-navlink=""
																								tabindex="0">3</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-wed fc-day-future fc-day-other"
																					data-date="2024-09-04" aria-labelledby="fc-dom-78"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-78" class="fc-daygrid-day-number"
																								title="Go to September 4, 2024" data-navlink=""
																								tabindex="0">4</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-thu fc-day-future fc-day-other"
																					data-date="2024-09-05" aria-labelledby="fc-dom-80"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-80" class="fc-daygrid-day-number"
																								title="Go to September 5, 2024" data-navlink=""
																								tabindex="0">5</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other"
																					data-date="2024-09-06" aria-labelledby="fc-dom-82"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-82" class="fc-daygrid-day-number"
																								title="Go to September 6, 2024" data-navlink=""
																								tabindex="0">6</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																				<td role="gridcell"
																					class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other"
																					data-date="2024-09-07" aria-labelledby="fc-dom-84"><div
																						class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																						<div class="fc-daygrid-day-top">
																							<a id="fc-dom-84" class="fc-daygrid-day-number"
																								title="Go to September 7, 2024" data-navlink=""
																								tabindex="0">7</a>
																						</div>
																						<div class="fc-daygrid-day-events">
																							<div class="fc-daygrid-day-bottom"
																								style="margin-top: 0px;"></div>
																						</div>
																						<div class="fc-daygrid-day-bg"></div>
																					</div></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
				</div>
				</div>	
				<!--캘린더 종료 -->
			
				<!-- card 종료 -->
				<!-- 게시판 시작 -->
				<div class="col-xl-8 mb-xl-10">
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
			
			</div>
				<!-- 캘린더/게시판 전체범위 종 -->
				
				
				
		</div>
	</div>

</body>
<%@include file="./footer.jsp" %>
<!--end::Body-->
</html>