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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%-- <link rel="stylesheet" type="text/css" href="${cpath}/resources/css/schedule_show.css"> --%>
    <style>
    	
		.form-control{width: 70%;}
		body{font-size:1.08rem;}
		h1{font-size: 2.2rem; font-weight: 700;}
    </style>
</head>
<body>
		<div class="normal_manage_board_modal container py-4">
      
      <!-- share 값에 따라 공개, 비공개 체크 상태 -->
	<!-- <script type="text/javascript">
               
               if(${schedule_show.fd_open }=="1")
            	   document.getElementById("first_radio").checked = true;
               else
            	   document.getElementById("second_radio").checked = true;
                 
     </script> -->
				<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title" id="exampleModalLabel">영농일지</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
				<form action="${cpath}/FarmDiaryUpdate2.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="year" value="${today_info.search_year}" />
				<input type="hidden" name="month"
					value="${today_info.search_month-1}" />
						<input type="hidden" name= "fd_num" class="text_type1" value=${schedule_show.fd_num }></input>
						<div class="modal-body">
							<table class="table table-bordered text-center">
								<colgroup>
									<col width="20%">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th scope="col">시작일</th>
										<th><input type="date" id="fd_start" name="fd_start" value="${schedule_show.fd_start}">
										</th>
										<th class="color">종료일</th>
										<th><input type="date" id="fd_end" name="fd_end" value="${schedule_show.fd_end}">
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">품목</th>
										<td colspan="3"><select class="form-control" name="fd_item" id="fd_item" required>
									<c:forEach items="${list2}" var="vo2">
										<option value="${vo2.fdm2_item}" <c:if test ="${schedule_show.fd_item eq vo2.fdm2_item}">selected="selected"</c:if>>${vo2.fdm2_item}</option>												
									</c:forEach>
								  </select>
										</td>
									</tr>
									<tr>
										<th scope="row">필지</th>
										<td colspan="3"><select class="form-control" name="fd_address" id="fd_address">
                                			<option value="${schedule_show.fd_address}" selected disabled>${schedule_show.fd_address}</option>
										<c:forEach items="${list}" var="vo">
											<option value="${vo.ad_sido} ${vo.ad_gugun} ${vo.ad_dong} ${vo.ad_ri} ${vo.fdm1_detail_address}">${vo.ad_sido} ${vo.ad_gugun} ${vo.ad_dong} ${vo.ad_ri} ${vo.fdm1_detail_address}</option>												
										</c:forEach>
									</select>
										</td>
									</tr>
									<tr>
										<th scope="row">품종</th>
										<td><select class="form-control" name="fd_kind" id="fd_kind" required>
										<c:forEach items="${list2}" var="vo2">
											<option value="${vo2.fdm2_kind}" <c:if test ="${schedule_show.fd_kind eq vo2.fdm2_kind}">selected="selected"</c:if>>${vo2.fdm2_kind}</option>												
										</c:forEach>
								  	</select>
										</td>
										<th class="color">작업단계</th>
										<td><select id="fd_step" class="form-control" name="fd_step" required>
										<option value="${schedule_show.fd_step}" selected disabled>${schedule_show.fd_step}</option>
										<c:forEach items="${list6}" var="vo6">
										<option value="${vo6.step_name}" <c:if test ="${schedule_show.fd_step eq vo6.step_name}">selected="selected"</c:if>>${vo6.step_name}</option>												
										</c:forEach>
									</select>
										</td>
									</tr>
									<tr class="color">
										<th scope="row">작업내용</th>
										<td>
                                	<input type="text" class="form-control" id="inlineCheckbox1" name="fd_cont" placeholder="작업내용" value="${schedule_show.fd_cont}">
                                </td>
                                <th scope="row">인력명<br><br><br>투입시간</th>
                                <td>
                                	<select class="form-control" name="fd_man_name" id="fd_man_name" required>
										<c:forEach items="${list3}" var="vo3">
											<option value="${vo3.fdm5_man_name}" <c:if test ="${schedule_show.fd_man_name eq vo3.fdm5_man_name}">selected="selected"</c:if>>${vo3.fdm5_man_name}</option>		
										</c:forEach>
									</select>
									<br>
									<input type="text" class="form-control" id="inlineCheckbox1" name="fd_worktime" placeholder="투입시간" value="${schedule_show.fd_worktime}">
                                </td>
									</tr>
									<tr>
										<th scope="row">농약명<br><br><br>살포량</th>
                                <td>
                                	<select class="form-control" name="fd_pesticide" id="fd_pesticide" required>
										<c:forEach items="${list5}" var="vo5">
											<c:if test="${!empty vo5.fdm3_pesticide}">
												<option value="${vo5.fdm3_pesticide}" <c:if test ="${schedule_show.fd_pesticide eq vo5.fdm3_pesticide}">selected="selected"</c:if>>${vo5.fdm3_pesticide}</option>		
											</c:if>										
										</c:forEach>
									</select>
									<br>
								  	<input type="text" class="form-control" id="inlineCheckbox1" name="fd_pesticide_amount" placeholder="살포량(kg)" value="${schedule_show.fd_pesticide_amount}">
                                </td>
                                <th scope="row">비료명<br><br><br>사용량</th>
                                <td>
                                	<select class="form-control" name="fd_fertilizer" id="fd_fertilizer" required>
										<c:forEach items="${list5}" var="vo5">
											<c:if test="${!empty vo5.fdm3_fertilizer}">
												<option value="${vo5.fdm3_fertilizer}" <c:if test ="${schedule_show.fd_fertilizer eq vo5.fdm3_fertilizer}">selected="selected"</c:if>>${vo5.fdm3_fertilizer}</option>		
											</c:if>										
										</c:forEach>
									</select> 
								  	<br>
								  	<input type="text" class="form-control" id="inlineCheckbox1" name="fd_fertilizer_amount" placeholder="사용량(kg)" value="${schedule_show.fd_fertilizer_amount}">
                                </td>
									</tr>
									<tr>
										<th scope="row">날씨 정보</th>
                                <td colspan="3">
											<div class="cont">
												<div>
													<ul class="ul">
														<li class="li"><span class="stitle,weather">날씨</span>
															<select id="wfKor" name="fd_weather" class="form-control" title="날씨 선택">
																<option value="맑음" <c:if test ="${schedule_show.fd_weather eq '맑음'}">selected="selected"</c:if>>맑음</option>
																<option value="구름 조금" <c:if test ="${schedule_show.fd_weather eq '구름 조금'}">selected="selected"</c:if>>구름 조금</option>
																<option value="구름 많음" <c:if test ="${schedule_show.fd_weather eq '구름 많음'}">selected="selected"</c:if>>구름 많음</option>
																<option value="흐림" <c:if test ="${schedule_show.fd_weather eq '흐림'}">selected="selected"</c:if>>흐림</option>
																<option value="비" <c:if test ="${schedule_show.fd_weather eq '비'}">selected="selected"</c:if>>비</option>
																<option value="눈/비" <c:if test ="${schedule_show.fd_weather eq '눈/비'}">selected="selected"</c:if>>눈/비</option>
																<option value="눈" <c:if test ="${schedule_show.fd_weather eq '눈'}">selected="selected"</c:if>>눈</option>
														</select></li>
														<li class="li">
															<div>
																<span class="stitle">최저기온(℃)</span> <input type="text"
																	value="${schedule_show.fd_low_temp}" name="fd_low_temp" id="low_temp" class="form-control"
																	onkeyup="numberChk('low_temp');">
															</div>
														</li>
														<li class="li">
															<div>
																<span class="stitle">최고기온(℃)</span> <input type="text"
																	name="fd_high_temp" id="high_temp" class="form-control"
																	onkeyup="numberChk('high_temp');" value="${schedule_show.fd_high_temp}">
															</div>
														</li>
														<li class="li">
															<div>
																<span class="stitle">강수량(mm)</span> <input type="text"
																	name="fd_precipitation" id="r12" class="form-control"
																	onkeyup="numberChk('r12');" value="${schedule_show.fd_precipitation}">
															</div>
														</li>
														<li class="li">
															<div>
																<span class="stitle">습도(%)</span> <input type="text"
																	value="${schedule_show.fd_humid}" name="fd_humid" id="reh" class="form-control"
																	onkeyup="numberChk('reh');">
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
												 <input class="form-control" type="file"
													id="formFileMultiple" name="uploadFile" multiple="multiple" onchange="previewImage(this)">
											</div>
										</td>
										<td><img id="preview" style="width: 10rem;"></td>
									</tr>
									<tr>
										<th scope="row">영농일지 <br>공개 여부</th>
										<td colspan="3">
                                <c:choose>
									<c:when test="${schedule_show.fd_open==1}">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio"
												id="first_radio" name="fd_open" value="1" checked>
											<label class="form-check-label" for="first_radio">공개</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio"
												id="second_radio" name="fd_open" value="0"> 
											<label class="form-check-label" for="second_radio">비공개</label>
										</div>
									</c:when>
									<c:otherwise>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio"
												id="first_radio" name="fd_open" value="1" >
											<label class="form-check-label" for="first_radio">공개</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio"
												id="second_radio" name="fd_open" value="0" checked> 
											<label class="form-check-label" for="second_radio">비공개</label>
										</div>
									</c:otherwise>
								</c:choose>
                                </td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-secondary" style="margin-right: 0.5rem;" >수정</button>
                            <button class='btn btn-outline-secondary' onclick="goDel_schedule(${schedule_show.fd_num })">삭제</button>
						</div>
					</form>
                    </div>			
				</div>
				</div>
	
<script>
/* 수정버튼과 삭제버튼 클릭 시 수행되는 코드 */

	 
	 
	 $('button').on("click",function(e){
		 var formObj = $("form");
		 
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
  
function goDel_schedule(fd_num){

	var real = confirm("정말 삭제하시겠습니까???");
	if(real){
		
		$.ajax({
			 url : "${cpath}/farmdiarylistdelete/" + fd_num,// PathVariable로 넘기기
	         type : "delete",
	         success : location.href="/schedule/delete",
	         error : function(){
	        	 alert("글삭제 실패!!")
	         }
	         
	    });// ajax
	
	}// if문
	
}

</script>
	
	

</body>
</html>