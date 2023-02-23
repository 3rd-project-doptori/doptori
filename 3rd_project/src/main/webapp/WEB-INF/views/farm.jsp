<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>마이페이지_농장관리</title>

    <!-- ========== All CSS files linkup ========= -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${cpath}/resources/css/lineicons.css" />
    <link rel="stylesheet" href="${cpath}/resources/css/main.css" />
  </head>
  <body>
     <!-- ======== sidebar-nav start =========== -->
       <aside class="sidebar-nav-wrapper">
      <div class="navbar-logo">
        <a href="${cpath }/Main.do">
          <img src="${cpath}/resources/images/header_logo.png" class="im">
        </a>
      </div>
      <nav class="sidebar-nav">
        <ul>
          <li class="nav-item">
            <a href="${cpath}/mypage.do">
              <span class="icon">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M9.16667 19.25H12.8333C12.8333 20.2584 12.0083 21.0834 11 21.0834C9.99167 21.0834 9.16667 20.2584 9.16667 19.25ZM19.25 17.4167V18.3334H2.75V17.4167L4.58333 15.5834V10.0834C4.58333 7.24171 6.41667 4.76671 9.16667 3.94171V3.66671C9.16667 2.65837 9.99167 1.83337 11 1.83337C12.0083 1.83337 12.8333 2.65837 12.8333 3.66671V3.94171C15.5833 4.76671 17.4167 7.24171 17.4167 10.0834V15.5834L19.25 17.4167ZM15.5833 10.0834C15.5833 7.51671 13.5667 5.50004 11 5.50004C8.43333 5.50004 6.41667 7.51671 6.41667 10.0834V16.5H15.5833V10.0834Z"
                  />
                </svg>
              </span>
              <span class="text">정보수정</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="${cpath}/reservation.do">
              <span class="icon">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg" >
                  <path
                    d="M17.4166 7.33333C18.9383 7.33333 20.1666 8.56167 20.1666 10.0833V15.5833H16.4999V19.25H5.49992V15.5833H1.83325V10.0833C1.83325 8.56167 3.06159 7.33333 4.58325 7.33333H5.49992V2.75H16.4999V7.33333H17.4166ZM7.33325 4.58333V7.33333H14.6666V4.58333H7.33325ZM14.6666 17.4167V13.75H7.33325V17.4167H14.6666ZM16.4999 13.75H18.3333V10.0833C18.3333 9.57917 17.9208 9.16667 17.4166 9.16667H4.58325C4.07909 9.16667 3.66659 9.57917 3.66659 10.0833V13.75H5.49992V11.9167H16.4999V13.75ZM17.4166 10.5417C17.4166 11.0458 17.0041 11.4583 16.4999 11.4583C15.9958 11.4583 15.5833 11.0458 15.5833 10.5417C15.5833 10.0375 15.9958 9.625 16.4999 9.625C17.0041 9.625 17.4166 10.0375 17.4166 10.5417Z"
                  />
                </svg>
              </span>
              <span class="text">예약내역</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="${cpath}/farm.do">
              <span class="icon">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M4.58333 3.66675H17.4167C17.9029 3.66675 18.3692 3.8599 18.713 4.20372C19.0568 4.54754 19.25 5.01385 19.25 5.50008V16.5001C19.25 16.9863 19.0568 17.4526 18.713 17.7964C18.3692 18.1403 17.9029 18.3334 17.4167 18.3334H4.58333C4.0971 18.3334 3.63079 18.1403 3.28697 17.7964C2.94315 17.4526 2.75 16.9863 2.75 16.5001V5.50008C2.75 5.01385 2.94315 4.54754 3.28697 4.20372C3.63079 3.8599 4.0971 3.66675 4.58333 3.66675ZM4.58333 7.33341V11.0001H10.0833V7.33341H4.58333ZM11.9167 7.33341V11.0001H17.4167V7.33341H11.9167ZM4.58333 12.8334V16.5001H10.0833V12.8334H4.58333ZM11.9167 12.8334V16.5001H17.4167V12.8334H11.9167Z"
                  />
                </svg>
              </span>
              <span class="text">일지관리</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="${cpath}/MyboardList.do">
              <span class="icon">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M9.16667 19.25H12.8333C12.8333 20.2584 12.0083 21.0834 11 21.0834C9.99167 21.0834 9.16667 20.2584 9.16667 19.25ZM19.25 17.4167V18.3334H2.75V17.4167L4.58333 15.5834V10.0834C4.58333 7.24171 6.41667 4.76671 9.16667 3.94171V3.66671C9.16667 2.65837 9.99167 1.83337 11 1.83337C12.0083 1.83337 12.8333 2.65837 12.8333 3.66671V3.94171C15.5833 4.76671 17.4167 7.24171 17.4167 10.0834V15.5834L19.25 17.4167ZM15.5833 10.0834C15.5833 7.51671 13.5667 5.50004 11 5.50004C8.43333 5.50004 6.41667 7.51671 6.41667 10.0834V16.5H15.5833V10.0834Z"
                  />
                </svg>
              </span>
              <span class="text">내가 쓴 글</span>
            </a>
          </li>

          <li class="nav-item">
            <a href="${cpath}/chatting_list.do">
              <span class="icon">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M9.16667 19.25H12.8333C12.8333 20.2584 12.0083 21.0834 11 21.0834C9.99167 21.0834 9.16667 20.2584 9.16667 19.25ZM19.25 17.4167V18.3334H2.75V17.4167L4.58333 15.5834V10.0834C4.58333 7.24171 6.41667 4.76671 9.16667 3.94171V3.66671C9.16667 2.65837 9.99167 1.83337 11 1.83337C12.0083 1.83337 12.8333 2.65837 12.8333 3.66671V3.94171C15.5833 4.76671 17.4167 7.24171 17.4167 10.0834V15.5834L19.25 17.4167ZM15.5833 10.0834C15.5833 7.51671 13.5667 5.50004 11 5.50004C8.43333 5.50004 6.41667 7.51671 6.41667 10.0834V16.5H15.5833V10.0834Z"
                  />
                </svg>
              </span>
              <span class="text">채팅내역</span>
            </a>
          </li>
        </ul>
      </nav>
     
    </aside>
    <div class="overlay"></div>
    <!-- ======== sidebar-nav end =========== -->

    <!-- ======== main-wrapper start =========== -->
    <main class="main-wrapper container py-4">
    

      <!-- ========== section start ========== -->
      <section class="section">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-lg-7">
              <div class="title-wrapper pt-30">
                <div class="row text-start">
                  <div class="col-md-3">
                    <div class="title mb-30">
                      <h2>일지관리</h2>
                    </div>
                  </div>
                </div>
                <!-- end row -->
              </div>
              <div class="card-style settings-card-1 mb-30">
                <div class="profile-info">
                  <div id="Accordion_wrap">
                    <c:forEach items="${list4}" var="vo4">
											<c:set var="cnt" value="${cnt+1}" />
												<div class="que" align="left">
													<span>영농일지 ${cnt} : </span>
													<span>${vo4.fd_start}</span>
													<span>${vo4.fd_step}</span>
												</div>
												<div class="anw" align="center">
													<form action="${cpath}/FarmDiaryManageUpdate3.do" method="post" enctype="multipart/form-data">
														<input type="hidden" class="form-control" name="fd_num" id="fd_num"  value="${vo4.fd_num}">
														<table>
															<tr>
                              <th scope="row">시작일</th>
                              <td>
                                  <input type="date" id="fd_start" name="fd_start" value="${vo4.fd_start}">
                              </td>
                              <th scope="row">종료일</th>
                              <td>
                                  <input type="date" id="fd_end" name="fd_end" value="${vo4.fd_end}">
                              </td>
                            </tr>
                              <tr>
                                <th scope="row">필지 주소</th>
                                <td colspan="3">
                                	<select class="form-control" name="fd_address" id="fd_address">
                                			<option value="${vo4.fd_address}" selected disabled>${vo4.fd_address}</option>
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
                                <th scope="row">작업 단계</th>
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
                                	<input type="text" class="form-control" id="inlineCheckbox1" name="fd_cont" placeholder="작업내용" value="${vo4.fd_cont}">
                                </td>
                                <th scope="row">인력명<br><br><br>투입시간</th>
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
                                <th scope="row">농약명<br><br><br>살포량</th>
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
                                <th scope="row">비료명<br><br><br>사용량</th>
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
												<div>
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
														</table>
														<table>
														<tr>
														<td colspan="3">
														<button type="submit" class="btn btn-secondary btn-sm">수정</button>
                            <button class='btn btn-outline-secondary' onclick="goDel(${vo4.fd_num})">삭제</button>
														</td>
														</tr>
														</table>
													</form>
												</div>
											</c:forEach>
												
											</div>

										</div>
									</div>
									<!-- end card -->
								</div>
								<!-- end col -->


								<!-- end col -->
							</div>
							<!-- end row -->
						</div>
						<!-- end container -->
					</section>
					<!-- ========== section end ========== -->


    </main>
    <!-- ========= All Javascript files linkup ======== -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${cpath}/resources/js/main1.js"></script>
  </body>
</html>
