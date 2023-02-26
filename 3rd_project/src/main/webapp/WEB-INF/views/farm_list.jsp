<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>영농일지</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="${cpath}/resources/css/farm_management.css">
    </head>
    <body>
        <div class="container py-4">
        <jsp:include page="/WEB-INF/views/header.jsp"/>
        <main>
            <div class="row bg-light">
                <form class="row p-3 gx-3 justify-content-center">
                <div class="col-auto">
                    <select class="form-select" id="autoSizingSelect" style="width: 126.777778px; margin:0;">
                    <option selected>주소</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                    </select>
                </div>
                <div class="col-5">
								<input type="text" class="form-control input-group"
									id="autoSizingInput" placeholder="검색어를 입력하세요" style="width: 523.277778px; margin:0;">
							</div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-secondary">검색</button>
                </div>
                </form>
            </div>
            <div class="table-responsive">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end mar">
                    <button class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal"
							data-bs-target="#exampleModal" data-bs-whatever="@management">일지작성</button>
                    <button type="button" class="btn btn-outline-secondary btn-sm">다운로드</button>
                </div>
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
					<form name="schedule_add2" action="${cpath}/schedule_add2.do/${loginMember.getMb_num()}" method="post" enctype="multipart/form-data">
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
										<td>
											<select  id="fd_step" class="form-control" name="fd_step"  required></select>
										</td>
									</tr>
									<tr class="color">
										<th scope="row">작업내용</th>
										<td colspan="3">
											<div class="form-floating">
												<textarea class="form-control" id="floatingTextarea2"
													name="fd_cont" style="height: 100px" placeholder="작업내용"></textarea>
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
										<td><img id="preview" style="width: 10rem;"></td>
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
					
					
					
					
			
                <table class="table recruit">  

                    <colgroup>  
                        <col width="10%">
                        <col width="20%">
                        <col>
                    </colgroup>  
      				<thead>
      					<tr>
      						<th>번호</th>
      						<th>작업 날짜</th>
      						<th>작업 내용</th>
      					</tr>
      				</thead>	
                    <tbody>  
            <c:forEach items="${list4}" var="vo4">
            <c:set var="cnt7" value="${cnt7+1}" />
                      <tr class="item">  
                        <td>${cnt7}</td>
                        <td>${vo4.fd_start}</td>
                        <td>${vo4.fd_step}</td>
                      </tr>  
          
                      <tr class="hide">  
                        <td colspan="3" style="padding: 55px 0;">  
       		<form action="${cpath}/FarmDiaryUpdate.do" method="post" enctype="multipart/form-data">
				<input type="hidden" class="form-control" name="fd_num" id="fd_num"  value="${vo4.fd_num}">
                          <table class="table text-center">
                            <colgroup>
                              <col width="18%">
                              <col>
                            </colgroup>
                            <tbody>
                            <tr>
                              <th scope="row">시작일</th>
                              <td>
                                  <input type="date" id="fd_start" name="fd_start" value="${vo4.fd_start}">
                              </td>
                              <th class="color">종료일</th>
                              <td>
                                  <input type="date" id="fd_end" name="fd_end" value="${vo4.fd_end}">
                              </td>
                            </tr>
                              <tr>
                                <th scope="row">필지 주소</th>
                                <td colspan="3">
                                	<select class="form-control" name="fd_address" id="fd_address">
                                			<option value="${vo4.fd_address}" selected>${vo4.fd_address}</option>
										<c:forEach items="${list}" var="vo">
											<option value="${vo.ad_sido} ${vo.ad_gugun} ${vo.ad_dong} ${vo.ad_ri} ${vo.fdm1_detail_address}">${vo.ad_sido} ${vo.ad_gugun} ${vo.ad_dong} ${vo.ad_ri} ${vo.fdm1_detail_address}</option>												
										</c:forEach>
									</select>
                                </td>
                              </tr>
                              <tr>
                              <th scope="row">품목</th>
                              <td>
                              	  <select class="form-control" name="fd_item" id="fd_item" required>
									<c:forEach items="${list2}" var="vo2">
										<option value="${vo2.fdm2_item}" <c:if test ="${vo4.fd_item eq vo2.fdm2_item}">selected="selected"</c:if>>${vo2.fdm2_item}</option>												
									</c:forEach>
								  </select>
                              </td>
                              <td></td> 
                              <td></td> 
                              </tr>
                              <tr>
                                <th scope="row">품종</th>
                                <td>
                                	<select class="form-control" name="fd_kind" id="fd_kind" required>
										<c:forEach items="${list2}" var="vo2">
											<option value="${vo2.fdm2_kind}" <c:if test ="${vo4.fd_kind eq vo2.fdm2_kind}">selected="selected"</c:if>>${vo2.fdm2_kind}</option>												
										</c:forEach>
								  	</select>
                                </td>
                                <th class="color">작업 단계</th>
                                <td>
                                	<select id="fd_step" class="form-control" name="fd_step" required>
										<option value="${vo4.fd_step}" selected disabled>${vo4.fd_step}</option>
										<c:forEach items="${list6}" var="vo6">
										<option value="${vo6.step_name}" <c:if test ="${vo4.fd_step eq vo6.step_name}">selected="selected"</c:if>>${vo6.step_name}</option>												
										</c:forEach>
									</select>
                                </td>
                              </tr>
                              <tr>
                                <th scope="row">작업내용</th>
                                <td>
                                	<textarea type="text" class="form-control" id="inlineCheckbox1" name="fd_cont" placeholder="작업내용">${vo4.fd_cont}</textarea>
                                </td>
                                <th scope="row">인력명<br><br>투입시간</th>
                                <td>
                                	<select class="form-control" name="fd_man_name" id="fd_man_name" required>
										<c:forEach items="${list3}" var="vo3">
											<option value="${vo3.fdm5_man_name}" <c:if test ="${vo4.fd_man_name eq vo3.fdm5_man_name}">selected="selected"</c:if>>${vo3.fdm5_man_name}</option>		
										</c:forEach>
									</select>
									<br>
									<input type="text" class="form-control" id="inlineCheckbox1" name="fd_worktime" placeholder="투입시간" value="${vo4.fd_worktime}">
                                </td>
                              </tr>
                              <tr>
                                <th scope="row">농약명<br><br>살포량</th>
                                <td>
                                	<select class="form-control" name="fd_pesticide" id="fd_pesticide" required>
										<c:forEach items="${list5}" var="vo5">
											<c:if test="${!empty vo5.fdm3_pesticide}">
												<option value="${vo5.fdm3_pesticide}" <c:if test ="${vo4.fd_pesticide eq vo5.fdm3_pesticide}">selected="selected"</c:if>>${vo5.fdm3_pesticide}</option>		
											</c:if>										
										</c:forEach>
									</select>
									<br>
								  	<input type="text" class="form-control" id="inlineCheckbox1" name="fd_pesticide_amount" placeholder="살포량(kg)" value="${vo4.fd_pesticide_amount}">
                                </td>
                                <th scope="row">비료명<br><br>사용량</th>
                                <td>
                                	<select class="form-control" name="fd_fertilizer" id="fd_fertilizer" required>
										<c:forEach items="${list5}" var="vo5">
											<c:if test="${!empty vo5.fdm3_fertilizer}">
												<option value="${vo5.fdm3_fertilizer}" <c:if test ="${vo4.fd_fertilizer eq vo5.fdm3_fertilizer}">selected="selected"</c:if>>${vo5.fdm3_fertilizer}</option>		
											</c:if>										
										</c:forEach>
									</select> 
								  	<br>
								  	<input type="text" class="form-control" id="inlineCheckbox1" name="fd_fertilizer_amount" placeholder="사용량(kg)" value="${vo4.fd_fertilizer_amount}">
                                </td>
                              </tr>
                              <tr>
                                <th scope="row">날씨 정보</th>
                                <td>
											<div class="cont">
													<ul class="ul">
														<li class="li"><span class="stitle,weather">날씨</span>
															<select id="wfKor" name="fd_weather" class="form-control" title="날씨 선택">
																<option value="맑음" <c:if test ="${vo4.fd_weather eq '맑음'}">selected="selected"</c:if>>맑음</option>
																<option value="구름 조금" <c:if test ="${vo4.fd_weather eq '구름 조금'}">selected="selected"</c:if>>구름 조금</option>
																<option value="구름 많음" <c:if test ="${vo4.fd_weather eq '구름 많음'}">selected="selected"</c:if>>구름 많음</option>
																<option value="흐림" <c:if test ="${vo4.fd_weather eq '흐림'}">selected="selected"</c:if>>흐림</option>
																<option value="비" <c:if test ="${vo4.fd_weather eq '비'}">selected="selected"</c:if>>비</option>
																<option value="눈/비" <c:if test ="${vo4.fd_weather eq '눈/비'}">selected="selected"</c:if>>눈/비</option>
																<option value="눈" <c:if test ="${vo4.fd_weather eq '눈'}">selected="selected"</c:if>>눈</option>
														</select></li>
														<li class="li">
															<div>
																<span class="stitle">최저기온(℃)</span> <input type="text"
																	value="${vo4.fd_low_temp}" name="fd_low_temp" id="low_temp" class="form-control"
																	onkeyup="numberChk('low_temp');">
															</div>
														</li>
														<li class="li">
															<div>
																<span class="stitle">최고기온(℃)</span> <input type="text"
																	name="fd_high_temp" id="high_temp" class="form-control"
																	onkeyup="numberChk('high_temp');" value="${vo4.fd_high_temp}">
															</div>
														</li>
														<li class="li">
															<div>
																<span class="stitle">강수량(mm)</span> <input type="text"
																	name="fd_precipitation" id="r12" class="form-control"
																	onkeyup="numberChk('r12');" value="${vo4.fd_precipitation}">
															</div>
														</li>
														<li class="li">
															<div>
																<span class="stitle">습도(%)</span> <input type="text"
																	value="${vo4.fd_humid}" name="fd_humid" id="reh" class="form-control"
																	onkeyup="numberChk('reh');">
															</div>
														</li>
													</ul>

													<!-- <p><span>*강수량 및 습도는 전날 평균량 기준으로 조회됩니다.</span></p> -->

											</div>
										</td>
										<td></td>
										<td></td>
                              </tr>
                              <tr>
                              <th scope="row">사진첨부</th>
                              <td colspan="2">
								<div class="mb-3">
										<input class="form-control" type="file"
											id="formFileMultiple" name="uploadFile" multiple="multiple" onchange="previewImage2(this)">
								</div>
							  </td>
								<td><img id="preview2" style="width: 10rem;"></td>
                              </tr>
                              <tr>
                                <th scope="row">영농일지 공개 여부</th>
                                <td colspan="3">
                                <c:choose>
									<c:when test="${vo4.fd_open==1}">
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
                          <div class="d-flex justify-content-end">
                            <button type="submit" class="btn btn-secondary btn-sm mb">수정</button>
                            <button class='btn btn-outline-secondary' onclick="goDel(${vo4.fd_num})">삭제</button>
                          </div>
        				</form>
                        </td>
                        </tr>
                        </c:forEach>  
                    </tbody>  
            
                </table>  
            </div>
            </main>
        </div>
        <script type="text/javascript">
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
        
        
        var message = "${message}";
		console.log(message);
		if (message != "") {
			alert(message);
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
		
		function previewImage2(input) {
		    var file = input.files[0];
		    var img = document.getElementById("preview2");
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
		
		function goDel(fd_num){

			var real = confirm("정말 삭제하시겠습니까???");
			
			if(real){
				
				$.ajax({
					 url : "${cpath}/farmdiarylistdelete/" + fd_num,// PathVariable로 넘기기
			         type : "delete",
			         success : location.href="${cpath}/FarmDiaryList.do",
			         error : function(){
			        	 alert("글삭제 실패!!")
			         }
			         
			    });// ajax
			
			}// if문
			
		}// goDel 함수 끝!!
        </script>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="${cpath}/resources/js/farm_management.js"></script>
    </body>
</html>