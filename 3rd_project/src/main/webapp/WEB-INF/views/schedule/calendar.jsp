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
<!-- jquery datepicker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- jquery datepicker 끝 -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${cpath}/resources/css/main.css" rel="stylesheet"
	type="text/css">
<script src="${cpath}/resources/js/board.js"></script>
<script type="text/javaScript" language="javascript"></script>
<script
	src="https://www.lgkids.co.kr/es_all/plugins/jscolor-2.0.5/jscolor.js"></script>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script>
	var idx;
	var num;
	var subject;
	var desc;
	var date;
	var share;
	var mycolor;
</script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/assets/css/bootstrap.min.css" >
    <!-- Icon -->
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/assets/fonts/line-icons.css">
    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/assets/css/main.css">
    <!-- Responsive Style -->
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/assets/css/responsive.css">
    
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/css/calendar.css">
    <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<div class="container py-4">
	<form name="calendarFrm" id="calendarFrm" action="" method="GET">
		<input type="hidden" name="year" value="${today_info.search_year}" />
		<input type="hidden" name="month" value="${today_info.search_month-1}" />
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
					href="${cpath}/calendar.do/${loginMember.getMb_num()}?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
					&lt;&lt; <!-- 이전해 -->
				</a> <a class="before_after_month"
					href="${cpath}/calendar.do/${loginMember.getMb_num()}?year=${today_info.before_year}&month=${today_info.before_month}">
					&lt; <!-- 이전달 -->
				</a> <span class="this_month"> &nbsp;${today_info.search_year}. <c:if
						test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span> <a class="before_after_month"
					href="${cpath}/calendar.do/${loginMember.getMb_num()}?year=${today_info.after_year}&month=${today_info.after_month}">
					<!-- 다음달 --> &gt;
				</a> <a class="before_after_year"
					href="${cpath}/calendar.do/${loginMember.getMb_num()}?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
					<!-- 다음해 --> &gt;&gt;
				</a>
			</div>
			<div class="today_button_div">
				<button type="button" class="buttonstyle"
					onclick="javascript:location.href='${cpath}/calendar.do/${loginMember.getMb_num()}'"
					style="height: 30px; width: 80px;">Today</button>
				<button type="button"
					class="buttonstyle board_move openMask_board_move pointer"
					style="height: 30px; width: 130px;" onclick = "modalClick()">Add Schedule</button>
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

									<a
										href="${cpath}/schedule_show?schedule_idx=${scheduleList.schedule_idx}"
										onclick="window.open(this.href, '_blank', 'width=550,height=600,left=680%, top=200%, toolbars=no,scrollbars=no'); return false;"
										class="date_subject "
										style="color: ${scheduleList.schedule_mycolor}">${scheduleList.schedule_subject}</a>
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
			// boardList라고 하는 함수가 실행!
			// 자바스크립트의 호이스팅
			FarmList3();	
		});
		
		function gocal(){
	  		location.href="<c:url value='/calendar.do/${loginMember.getMb_num()}'/>"  		
	  	}
	  	
	  	function godiary(){
	  		location.href = "${cpath}/FarmList2.do"
	  	}	
		
			function modalClick(){
				var con = $("#addModal");
				con[0].style.display = 'block';
			}
			
			function closeModal(){
				var con = $("#addModal");
				con[0].style.display = 'none';
			}
			
			$(function() {
				$("#testDatepicker")
						.datepicker(
								{

									dateFormat : "yy-mm-dd",
									changeMonth : true,
									changeYear : true,
									dayNames : [ '월요일', '화요일', '수요일', '목요일',
											'금요일', '토요일', '일요일' ],
									dayNamesMin : [ '월', '화', '수', '목', '금',
											'토', '일' ],
									monthNamesShort : [ '1', '2', '3', '4',
											'5', '6', '7', '8', '9', '10',
											'11', '12' ]
								});
			});
			function scheduleAdd() {
				var schedule_add_form = document.schedule_add;
				if (schedule_add_form.schedule_date.value == ""
						|| schedule_add_form.schedule_date.value == null) {
					alert("날짜를 입력해주세요.");
					schedule_add_form.schedule_date.focus();
					return false;
				} else if (schedule_add_form.schedule_subject.value == ""
						|| schedule_add_form.schedule_subject.value == null) {
					alert("제목을 입력해주세요.");
					schedule_add_form.schedule_date.focus();
					return false;
				}
				schedule_add_form.submit();
			}
		</script>
		    <script src="${cpath}/resources/assets/js/jquery-min.js"></script>
    <script src="${cpath}/resources/assets/js/popper.min.js"></script>
    <script src="${cpath}/resources/assets/js/bootstrap.min.js"></script>
    <script src="${cpath}/resources/assets/js/jquery.countdown.min.js"></script>
    <script src="${cpath}/resources/assets/js/jquery.counterup.min.js"></script>
		<div id="mask_board_move"></div>
		<div class = "normal_move_board_modal" id="addModal" style="display:none;">
		
		<div class="top" style="">
			<div class="close" onclick="closeModal()">x</div>
			<div class="subject">Add Schedule</div>
		</div>

		<div class="bottom">
			<div class="info">* 순번은 해당 날짜안에서 순서대로 입력이 됩니다.(하루에 최대 4개의 스케줄만
				등록할 수 있습니다.)</div>
			<form name="schedule_add" action="${cpath}/schedule_add.do/${loginMember.getMb_num()}">
				<input type="hidden" name="year" value="${today_info.search_year}" />
				<input type="hidden" name="month"
					value="${today_info.search_month-1}" />
				<div class="contents">
					<ul>
						<li>
							<div class="text_subject">순번 :</div>
							<div class="text_desc">
								<input type="text" name="schedule_num" class="text_type1" />
							</div>
						</li>
						<li>
							<div class="text_subject">날짜 :</div>
							<div class="text_desc">
								<input type="text" name="schedule_date" class="text_type1"
									id="testDatepicker" readonly="readonly" />
							</div>
						</li>
						<li>
							<div class="text_subject">제목 :</div>
							<div class="text_desc">
								<input type="text" name="schedule_subject" class="text_type1" />
							</div>
						</li>
						<li style="margin-bottom: 70px;">
							<div class="text_subject">내용 :</div>
							<div class="text_area_desc">
								<textarea name="schedule_desc" class="textarea_type1" rows="5"></textarea>
							</div>
						</li>

						<li class="button_li">
							<button type="button" class="buttonstyle board_move_go pointer"
								onclick="scheduleAdd();">Add</button>
						</li>
					</ul>

				</div>
			</form>
		</div>
		</div>
		
	</div>  <!-- 틀 끝 -->

	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>