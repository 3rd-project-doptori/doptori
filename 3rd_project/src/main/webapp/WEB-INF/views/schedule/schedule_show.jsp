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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<meta http-equiv="content-type" content="text/html; charset=utf-8">	
<script
	src="https://www.lgkids.co.kr/es_all/plugins/jscolor-2.0.5/jscolor.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>FrmPopup.htm : 팝업창</title>

<!-- Bootstrap CSS -->
    <!-- Icon -->
    <!-- Responsive Style -->
    <%-- <link rel="stylesheet" type="text/css" href="${cpath}/resources/css/calendar.css"> --%>
    
    <link rel="stylesheet" type="text/css" href="${cpath}/resources/css/schedule_show.css">
</head>
<body>
		<div class="normal_manage_board_modal">
      
      <!-- share 값에 따라 공개, 비공개 체크 상태 -->
	<!-- <script type="text/javascript">
               
               if(${schedule_show.fd_open }=="1")
            	   document.getElementById("first_radio").checked = true;
               else
            	   document.getElementById("second_radio").checked = true;
                 
     </script> -->
			<div class="top">
				<!-- <div class="close">x</div> -->
				
				
				<div class="subject">Schedule</div>
			</div>

			<div class="bottom">
				<div class="info">* 변경 혹은 삭제된 일정은 복구할 수 없습니다.)</div>
				
				<form role="form" name="schedule_modify">
				<input type="hidden" name="year" value="${today_info.search_year}" />
				<input type="hidden" name="month"
					value="${today_info.search_month-1}" />
						<input type="hidden" name= "fd_num" class="text_type1" value=${schedule_show.fd_num }></input>
						<div class="modal-body">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="13%">
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">시작일</th>
                                <th>
                                    <input type="date" id="date" name="fd_start" value=${schedule_show.fd_start }>
                                </th>
                                <th class="color">종료일</th>
                                <th>
                                    <input type="date" id="date" name="fd_end" value=${schedule_show.fd_end }>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">품목</th>
                                <td colspan="3">
                                    <select class="form" id="item" name="fd_item" value=${schedule_show.fd_item }>
                                        <option selected>품목</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">필지</th>
                                <td colspan="3">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="fd_address" value=${schedule_show.fd_address }>
                                        <label class="form-check-label" for="inlineCheckbox1">전라남도 순천시 OOO 111</label>
                                    </div>
                                </td>
                                </tr>
                                <tr>
                                    <th scope="row">품종</th>
                                    <td>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="fd_kind" value=${schedule_show.fd_kind }>
                                            <label class="form-check-label" for="inlineCheckbox1">딸기 토마토</label>
                                        </div>
                                    </td>
                                    <th class="color">작업단계</th>
                                    <td>
                                    	<div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="fd_step" value=${schedule_show.fd_step }>
                                            <label class="form-check-label" for="inlineCheckbox1">작업단계</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="color">
                                <th scope="row">작업내용</th>
                                <td colspan="3">
                                    <div class="form-floating">
                                        <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="fd_cont" style="height: 100px">${schedule_show.fd_cont}</textarea>
                                        <label for="floatingTextarea2">Comments</label>
                                    </div>
                                </td>
                                </tr>
                                <tr>
                                    <th scope="row">활동유형</th>
                                    <td>
                                    	<div>
                                            <input type="text" id="inlineCheckbox1" name="fd_pesticide" value="option1" placeholder="농약명" value=${schedule_show.fd_pesticide }>
                                            <input type="text" id="inlineCheckbox1" name="fd_pesticide_amount" value="1.2" placeholder="살포량" value=${schedule_show.fd_pesticide_amount }>
                                        </div>
                                    </td>
                                    <td>
                                    	<div>
                                            <input type="text" id="inlineCheckbox1" name="fd_fertilizer" value="option2" placeholder="비료명" value=${schedule_show.fd_fertilizer }>
                                            <input type="text" id="inlineCheckbox1" name="fd_fertilizer_amount" value="1.4" placeholder="사용량" value=${schedule_show.fd_fertilizer_amount }>
                                        </div>
                                    </td>
                                    <td>
                                    	<div>
                                            <input type="text" id="inlineCheckbox1" name="fd_man_name" value="option3" placeholder="인력명" value=${schedule_show.fd_man_name }>
                                            <input type="text" id="inlineCheckbox1" name="fd_worktime" value="1.5" placeholder="투입시간" value=${schedule_show.fd_worktime }>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">날씨정보</th>
                                    <td colspan="3">
                                        <div class="cont">
                                            <div>
                                                <ul class="ul">
                                                    <li class="li">
                                                        <span class="stitle,weather">날씨</span>
                                                        <select id="wfKor" name="fd_weather" title="날씨 선택" value=${schedule_show.fd_weather }>
                                                            <option value="1" selected>맑음</option>
                                                            <option value="2">구름 조금</option>
                                                            <option value="3">구름 많음</option>
                                                            <option value="4">흐림</option>
                                                            <option value="5">비</option>
                                                            <option value="6">눈/비</option>
                                                            <option value="7">눈</option>
                                                        </select>
                                                    </li>
                                                    <li class="li">
                                                        <div>
                                                            <span class="stitle">최저기온</span>
                                                            <input type="text" value=${schedule_show.fd_low_temp } name="fd_low_temp" id="low_temp" class="alR" onkeyup="numberChk('low_temp');"> ℃
                                                        </div>
                                                    </li>
                                                    <li class="li">
                                                        <div>
                                                            <span class="stitle">최고기온</span>
                                                            <input type="text" value=${schedule_show.fd_high_temp } name="fd_high_temp" id="high_temp" class="alR" onkeyup="numberChk('high_temp');"> ℃
                                                        </div>
                                                    </li>
                                                    <li class="li">
                                                        <div>
                                                            <span class="stitle">강수량</span>
                                                            <input type="text" value=${schedule_show.fd_precipitation } name="fd_precipitation" id="r12" class="alR" onkeyup="numberChk('r12');"> mm
                                                        </div>
                                                    </li>
                                                    <li class="li">
                                                        <div>
                                                            <span class="stitle">습도</span>
                                                            <input type="text" value=${schedule_show.fd_humid } name="fd_humid" id="reh" class="alR" onkeyup="numberChk('reh');"> %
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
                                            <label for="formFileMultiple" class="form-label">총 10장만 등록 가능합니다</label>
                                            <input class="form-control" type="file" id="formFileMultiple" name="fd_picture" value=${schedule_show.fd_picture } multiple>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">영농일지 공개 여부</th>
                                    <td colspan="3">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" id="first_radio" name="fd_open" value="1" checked="checked">
                                            <label class="form-check-label" for="first_radio">공개</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" id="second_radio" name="fd_open" value="0">
                                            <label class="form-check-label" for="second_radio">비공개</label>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
                    <div class="modal-footer">
                        <button type="submit" data-oper='modify' class="btn btn-secondary" >Modify</button>
                        <button type="submit" data-oper='delete' class="btn btn-primary" >delete</button>
                    </div>
                    </form>
                    </div>			
				</div>
	
<script>
/* 수정버튼과 삭제버튼 클릭 시 수행되는 코드 */
$(document).ready(function(){
	 var formObj = $("form");
	 
	 $('button').on("click",function(e){
		 e.preventDefault();
	 
		 var operation = $(this).data("oper");
		 
		 console.log(operation);
		 
		 if(operation === 'delete'){
			 formObj.attr("action", "/delete");
		 }else if(operation === 'modify'){
			 formObj.attr("action", "modify.do");
		 }
		 formObj.submit();
	 });
});
</script>
	
	

</body>
</html>