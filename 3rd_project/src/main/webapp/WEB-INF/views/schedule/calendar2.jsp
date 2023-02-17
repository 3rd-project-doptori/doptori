<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.doptori.entity.Farm"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<html lang="ko">
<head>
<title>캘린더</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${cpath}/resources/css/main.css" rel="stylesheet"
	type="text/css">
<script src="${cpath}/resources/js/board.js"></script>
<script type="text/javaScript" language="javascript"></script>
<script
	src="https://www.lgkids.co.kr/es_all/plugins/jscolor-2.0.5/jscolor.js"></script>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script>
	var fd_num;
	var fd_start;
	var fd_end;
	var fd_address;
	var fd_item;
	var fd_kind;
	var fd_step;
	var fd_cont;
	var fd_pesticide;
	var fd_pesticide_amount;
	var fd_fertilizer;
	var fd_fertilizer_amount;
	var fd_man_name;
	var fd_worktime;
	var fd_weather;
	var fd_low_temp;
	var fd_high_temp;
	var fd_precipitation;
	var fd_humid;
	var fd_picture;
	var fd_open;
</script>

<link rel="stylesheet" type="text/css"
	href="${cpath}/resources/css/calendar.css">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

</head>
<body>
	<div class="container py-4">
	<jsp:include page="/WEB-INF/views/header.jsp"/>
		<form name="calendarFrm" id="calendarFrm" action="" method="GET">
			<input type="hidden" name="year" value="${today_info.search_year}" />
			<input type="hidden" name="month"
				value="${today_info.search_month-1}" />
			<script>
				/* 스케줄 등록시 등록완료 팝업창 */
				var message = "${message}";
				console.log(message);
				if (message != "") {
					alert(message);
				}
			</script>
			<div class="calendar"></div>

			<!--날짜 네비게이션  -->
			<div class="navigation">
				<a class="before_after_year"
					href="${cpath}/calendar2.do/${loginMember.getMb_num()}?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
					&lt;&lt; <!-- 이전해 -->
				</a> <a class="before_after_month"
					href="${cpath}/calendar2.do/${loginMember.getMb_num()}?year=${today_info.before_year}&month=${today_info.before_month}">
					&lt; <!-- 이전달 -->
				</a> <span class="this_month"> &nbsp;${today_info.search_year}. <c:if
						test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span> <a class="before_after_month"
					href="${cpath}/calendar2.do/${loginMember.getMb_num()}?year=${today_info.after_year}&month=${today_info.after_month}">
					<!-- 다음달 --> &gt;
				</a> <a class="before_after_year"
					href="${cpath}/calendar2.do/${loginMember.getMb_num()}?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
					<!-- 다음해 --> &gt;&gt;
				</a>
			</div>
			<div class="today_button_div">
				<button type="button" class="buttonstyle"
					onclick="javascript:location.href='${cpath}/calendar2.do/${loginMember.getMb_num()}'"
					style="height: 30px; width: 80px;">Today</button>
				<button type="button"
					class="buttonstyle board_move openMask_board_move pointer"
					style="height: 30px; width: 130px;" onclick="modalClick()"
					data-bs-toggle="modal" data-bs-target="#exampleModal"
					data-bs-whatever="@mdo">Add Schedule</button>
			</div>
			<table class="calendar_body">

				<thead>
					<tr bgcolor="#A0D9E2">
						<td class="day sun">Sun</td>
						<td class="day">Mon</td>
						<td class="day">Tue</td>
						<td class="day">Wed</td>
						<td class="day">Thu</td>
						<td class="day">Fri</td>
						<td class="day sat">Sat</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="dateList" items="${dateList}"
							varStatus="date_status">
							<c:choose>
								<c:when test="${dateList.value=='today'}">
									<c:if test="${date_status.index%7==0}">
										<tr>
									</c:if>
									<td class="today">
										<div class="date">
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td class="sat_day">
										<div class="sat">
								</c:when>
								<c:when test="${date_status.index%7==0}">
					</tr>
					<tr>
						<td class="sun_day">
							<div class="sun">
								</c:when>
								<c:otherwise>
									<td class="normal_day">
										<div class="date">
								</c:otherwise>
								</c:choose>
								${dateList.date}
							</div>
							<div>
								<!-- 달력에 일정 띄우고 클릭 시 수정/삭제 창 띄우는 코드 -->
								<c:forEach var="scheduleList"
									items="${dateList.schedule_data_arr}"
									varStatus="schedule_data_arr_status">

									<a href="${cpath}/schedule_show?fd_num=${scheduleList.fd_num}"
										onclick="window.open(this.href, '_blank', 'width=550,height=600,left=680%, top=200%, toolbars=no,scrollbars=no'); return false;"
										class="date_subject ">${scheduleList.fd_step}</a>
									<br>

								</c:forEach>
							</div>
						</td>
						</c:forEach>
				</tbody>

			</table>
		</form>

		<script>
			function modalClick() {
				var con = $("#addModal");
				con[0].style.display = 'block';
			}

			function closeModal() {
				var con = $("#addModal");
				con[0].style.display = 'none';
			}

			function scheduleAdd() {
				var schedule_add_form = document.schedule_add;
				if (schedule_add_form.fd_start.value == ""
						|| schedule_add_form.fd_start.value == null) {
					alert("날짜를 입력해주세요.");
					schedule_add_form.fd_start.focus();
					return false;
				} else if (schedule_add_form.fd_cont.value == ""
						|| schedule_add_form.fd_cont.value == null) {
					alert("제목을 입력해주세요.");
					schedule_add_form.fd_start.focus();
					return false;
				}
				schedule_add_form.submit();
			}
		</script>
		<script src="${cpath}/resources/assets/js/popper.min.js"></script>
		<script src="${cpath}/resources/assets/js/bootstrap.min.js"></script>
		<script src="${cpath}/resources/assets/js/jquery.countdown.min.js"></script>
		<script src="${cpath}/resources/assets/js/jquery.counterup.min.js"></script>
		<div id="mask_board_move"></div>


		<div class="modal fade modal-lg" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">New
							message</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form name="schedule_add"
						action="${cpath}/schedule_add.do/${loginMember.getMb_num()}">
						<input type="hidden" name="year" value="${today_info.search_year}" />
						<input type="hidden" name="month"
							value="${today_info.search_month-1}" />
						<div class="modal-body">
							<table class="table table-bordered">
								<colgroup>
									<col width="13%">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th scope="col">시작일</th>
										<th><input type="date" id="fd_start" name="fd_start">
										</th>
										<th class="color">종료일</th>
										<th><input type="date" id="fd_end" name="fd_end">
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">품목</th>
										<td colspan="3"><select class="form" id="item" name="fd_item"></select>
										</td>
									</tr>
									<tr>
										<th scope="row">필지</th>
										<td colspan="3"><select class="form" id="address" name="fd_address"></select>
										</td>
									</tr>
									<tr>
										<th scope="row">품종</th>
										<td><select class="form" id="kind" name="fd_kind"></select>
										</td>
										<th class="color">작업단계</th>
										<td><select class="form" id="step" name="fd_step"></select>
										</td>
									</tr>
									<tr class="color">
										<th scope="row">작업내용</th>
										<td colspan="3">
											<div class="form-floating">
												<textarea class="form-control"
													placeholder="Leave a comment here" id="floatingTextarea2"
													name="fd_cont" style="height: 100px"></textarea>
												<label for="floatingTextarea2">Comments</label>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">활동유형</th>
										<td>
											<div>
												<input type="text" id="inlineCheckbox1" name="fd_pesticide"
													value="option1" placeholder="농약명"> <input
													type="text" id="inlineCheckbox1" name="fd_pesticide_amount"
													value="1.2" placeholder="살포량">
											</div>
										</td>
										<td>
											<div>
												<input type="text" id="inlineCheckbox1" name="fd_fertilizer"
													value="option2" placeholder="비료명"> <input
													type="text" id="inlineCheckbox1"
													name="fd_fertilizer_amount" value="1.4" placeholder="사용량">
											</div>
										</td>
										<td>
											<div>
												<input type="text" id="inlineCheckbox1" name="fd_man_name"
													value="option3" placeholder="인력명"> <input
													type="text" id="inlineCheckbox1" name="fd_worktime"
													value="1.5" placeholder="투입시간">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">날씨정보</th>
										<td colspan="3">
											<div class="cont">
												<div>
													<ul class="ul">
														<li class="li"><span class="stitle,weather">날씨</span>
															<select id="wfKor" name="fd_weather" title="날씨 선택">
																<option value="1" selected>맑음</option>
																<option value="2">구름 조금</option>
																<option value="3">구름 많음</option>
																<option value="4">흐림</option>
																<option value="5">비</option>
																<option value="6">눈/비</option>
																<option value="7">눈</option>
														</select></li>
														<li class="li">
															<div>
																<span class="stitle">최저기온</span> <input type="text"
																	value="" name="fd_low_temp" id="low_temp" class="alR"
																	onkeyup="numberChk('low_temp');"> ℃
															</div>
														</li>
														<li class="li">
															<div>
																<span class="stitle">최고기온</span> <input type="text"
																	name="fd_high_temp" id="high_temp" class="alR"
																	onkeyup="numberChk('high_temp');"> ℃
															</div>
														</li>
														<li class="li">
															<div>
																<span class="stitle">강수량</span> <input type="text"
																	name="fd_precipitation" id="r12" class="alR"
																	onkeyup="numberChk('r12');"> mm
															</div>
														</li>
														<li class="li">
															<div>
																<span class="stitle">습도</span> <input type="text"
																	value="" name="fd_humid" id="reh" class="alR"
																	onkeyup="numberChk('reh');"> %
															</div>
														</li>
													</ul>

													<!-- <p><span>*강수량 및 습도는 전날 평균량 기준으로 조회됩니다.</span></p> -->

												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">사진첨부</th>
										<td colspan="3">
											<div class="mb-3">
												<label for="formFileMultiple" class="form-label">총
													10장만 등록 가능합니다</label> <input class="form-control" type="file"
													id="formFileMultiple" name="fd_picture" multiple>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">영농일지 공개 여부</th>
										<td colspan="3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													id="first_radio" name="fd_open" value="1" checked>
												<label class="form-check-label" for="first_radio">공개</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													id="second_radio" name="fd_open" value="0"> <label
													class="form-check-label" for="second_radio">비공개</label>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary"
								onclick="scheduleAdd();">Send message</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	</div>
	<!-- 틀 끝 -->

	<!-- JavaScript Bundle with Popper -->

</body>
</html>