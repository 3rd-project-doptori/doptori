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
<%-- <link href="${cpath}/resources/css/main.css" rel="stylesheet" type="text/css"> --%>
<%-- <script src="${cpath}/resources/js/board.js"></script> --%>
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
		<form name="calendarFrm" id="calendarFrm" action="" method="GET" enctype="multipart/form-data">
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
				<%-- <button type="button" class="login" onclick="javascript:location.href='${cpath}/calendar2.do/${loginMember.getMb_num()}'">
					Today
				</button> --%>
				<button type="button" class="btn login" onclick="modalClick()" data-bs-toggle="modal" data-bs-target="#exampleModal"data-bs-whatever="@mdo">
					일정 등록
				</button>
			</div>
			<table class="calendar_body">

				<thead>
					<tr bgcolor="#FF809F">
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
								<c:forEach var="scheduleList" items="${dateList.schedule_data_arr}" varStatus="schedule_data_arr_status">
									<a href="${cpath}/schedule_show?fd_num=${scheduleList.fd_num}"
										onclick="window.open(this.href, '_blank', 'width=700,height=800,left=400%, top=200%, toolbars=no,scrollbars=no'); return false;"
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
		
			$(document).ready(function(){
			        	
	        	$.ajax({
	        		url : "${cpath}/step.do",
	        		type : "get",
	        		dataType : "json",
	        		success : function(res){
	        			//console.log(res);
	        			$("#fd_step").html("");
	        			$.each(res, (index, obj)=>{
	        				$("#fd_step").append("<option value='"+obj.step_name+"'>"+ obj.step_num + ". " +obj.step_name+"</option>");
	        			});
	        			
	        		},
	        		error : function(){
	        			alert("Ajax 통신 실패!!");	
	        		}
	        	});
	        	
	        }); // ready 끝
        
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
			
			function previewImage(input) {
			    var file = input.files[0];
			    var img = document.getElementById("preview");
			    if (file.type.match('image.*')) {
			      var reader = new FileReader();
			      reader.onload = (function(img) {
			        return function(e) {
			          img.src = e.target.result;
			        };
			      })(img);
			      reader.readAsDataURL(file);
			    }
			  }
		</script>
		<script src="${cpath}/resources/assets/js/bootstrap.min.js"></script>
		<script src="${cpath}/resources/assets/js/popper.min.js"></script>
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
					<form name="schedule_add" action="${cpath}/schedule_add.do/${loginMember.getMb_num()}" method="post" enctype="multipart/form-data">
						<input type="hidden" name="year" value="${today_info.search_year}" />
						<input type="hidden" name="month"
							value="${today_info.search_month-1}" />
						<div class="modal-body">
							<table class="table table-bordered text-center ve">
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
										<td colspan="3"><select class="form-control"
														name="fd_item" id="fd_item" required>
															<option selected disabled>품목을 선택하세요.</option>
														<c:forEach items="${list2}" var="vo2">
														<c:set var="cnt2" value="${cnt2+1}" />
															<option value="${vo2.fdm2_item}">${cnt2}. ${vo2.fdm2_item}</option>												
														</c:forEach>
														</select>
										</td>
									</tr>
									<tr>
										<th scope="row">필지</th>
										<td colspan="3"><select class="form-control"
														name="fd_address" id="fd_address" required>
															<option selected disabled>필지를 선택하세요.</option>
														<c:forEach items="${list}" var="vo">
														<c:set var="cnt" value="${cnt+1}" />
															<option value="${vo.ad_sido} ${vo.ad_gugun} ${vo.ad_dong} ${vo.ad_ri} ${vo.fdm1_detail_address}">${cnt}. ${vo.ad_sido} ${vo.ad_gugun} ${vo.ad_dong} ${vo.ad_ri} ${vo.fdm1_detail_address}</option>												
														</c:forEach>
														</select>
										</td>
									</tr>
									<tr>
										<th scope="row">품종</th>
										<td><select class="form-control"
														name="fd_kind" id="fd_kind" required>
															<option selected disabled>품종을 선택하세요.</option>
														<c:forEach items="${list2}" var="vo2">
														<c:set var="cnt3" value="${cnt3+1}" />
															<option value="${vo2.fdm2_kind}">${cnt3}. ${vo2.fdm2_kind}</option>												
														</c:forEach>
														</select>
										</td>
										<th class="color">작업단계</th>
										<td><select  id="fd_step" class="form-control" name="fd_step"  required></select>
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
												<select class="form-control" name="fd_fertilizer" id="fd_fertilizer" required>
														<option selected disabled>비료를 선택하세요.</option>
														<c:forEach items="${list5}" var="vo5">
															<c:set var="cnt4" value="${cnt4+1}" />
															<c:if test="${!empty vo5.fdm3_fertilizer}">
																<option value="${vo5.fdm3_fertilizer}">${cnt4}. ${vo5.fdm3_fertilizer}</option>		
															</c:if>										
														</c:forEach>
												</select> 
												<input type="text" id="inlineCheckbox1" name="fd_fertilizer_amount" placeholder="사용량(kg)">
											</div>
										</td>
										<td>
											<div>
												<select class="form-control" name="fd_pesticide" id="fd_pesticide" required>
														<option selected disabled>농약을 선택하세요.</option>
														<c:forEach items="${list5}" var="vo5">
															<c:set var="cnt5" value="${cnt5+1}" />
															<c:if test="${!empty vo5.fdm3_pesticide}">
																<option value="${vo5.fdm3_pesticide}">${cnt5}. ${vo5.fdm3_pesticide}</option>		
															</c:if>										
														</c:forEach>
												</select>  
													
													<input type="text" id="inlineCheckbox1" name="fd_pesticide_amount" placeholder="살포량(kg)">
											</div>
										</td>
										<td>
											<div>
												<select class="form-control" name="fd_man_name" id="fd_man_name" required>
														<option selected disabled>인력을 선택하세요.</option>
														<c:forEach items="${list3}" var="vo3">
															<c:set var="cnt6" value="${cnt6+1}" />
															<option value="${vo3.fdm5_man_name}">${cnt6}. ${vo3.fdm5_man_name}</option>		
														</c:forEach>
												</select>   
												<input type="text" id="inlineCheckbox1" name="fd_worktime" placeholder="투입시간">
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
										<td colspan="2">
											<div class="mb-3">
												<label for="formFileMultiple" class="form-label">총
													10장만 등록 가능합니다</label> <input class="form-control" type="file"
													id="formFileMultiple" name="uploadFile" multiple="multiple" onchange="previewImage(this)">
											</div>
										</td>
										<td>이미지 미리보기<img id="preview" style="width: 10rem;"></td>
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
							<button type="submit" class="btn btn-primary">Send message</button>
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