<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${cpath}/resources/css/index.css"> 
</head>
<body>
<div class="container">
  <h2>게시판 글쓰기</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
    	<form action="${cpath}/test.do" method="post">
						<%-- <input type="hidden" name="year" value="${today_info.search_year}" />
						<input type="hidden" name="month" value="${today_info.search_month-1}" /> --%>
						<input type="hidden" name="fd_mb_num" value="${loginMember.mb_num}" />
                    <div class="modal-body">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width=13%>
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">시작일</th>
                                <th>
                                    <input type="date" id="fd_start" name="fd_start">
                                </th>
                                <th class="color">종료일</th>
                                <th>
                                    <input type="date" id="fd_end" name="fd_end">
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">품목</th>
                                <td colspan="3">
                                    <select class="form" id="fd_item" name="fd_item">
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
                                        <input class="form-check-input" type="checkbox" id="fd_address" name="fd_address" value="option1">
                                        <label class="form-check-label" for="inlineCheckbox1">전라남도 순천시 OOO 111</label>
                                    </div>
                                </td>
                                </tr>
                                <tr>
                                    <th scope="row">품종</th>
                                    <td>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="fd_kind" name="fd_kind" value="option1">
                                            <label class="form-check-label" for="inlineCheckbox1">딸기 토마토</label>
                                        </div>
                                    </td>
                                    <th class="color">작업단계</th>
                                    <td>
                                    	<div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="fd_step" name="fd_step" value="option1">
                                            <label class="form-check-label" for="inlineCheckbox1">작업단계</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="color">
                                <th scope="row">작업내용</th>
                                <td colspan="3">
                                    <div class="form-floating">
                                        <textarea class="form-control" placeholder="Leave a comment here" id="fd_cont" name="fd_cont" style="height: 100px"></textarea>
                                        <label for="floatingTextarea2">Comments</label>
                                    </div>
                                </td>
                                </tr>
                                <tr>
                                    <th scope="row">활동유형</th>
                                    <td>
                                    	<div>
                                            <input type="text" id="fd_pesticide" name="fd_pesticide" value="option1" placeholder="농약명">
                                            <input type="text" id="fd_pesticide_amount" name="fd_pesticide_amount" value="1.2" placeholder="살포량">
                                        </div>
                                    </td>
                                    <td>
                                    	<div>
                                            <input type="text" id="fd_fertilizer" name="fd_fertilizer" value="option2" placeholder="비료명">
                                            <input type="text" id="fd_fertilizer_amount" name="fd_fertilizer_amount" value="1.4" placeholder="사용량">
                                        </div>
                                    </td>
                                    <td>
                                    	<div>
                                            <input type="text" id="fd_man_name" name="fd_man_name" value="option3" placeholder="인력명">
                                            <input type="text" id="fd_worktime" name="fd_worktime" value="1.5" placeholder="투입시간">
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
                                                        <select id="fd_weather" name="fd_weather" title="날씨 선택">
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
                                                            <input type="text" value="" name="fd_low_temp" id="fd_low_temp" class="alR" onkeyup="numberChk('low_temp');"> ℃
                                                        </div>
                                                    </li>
                                                    <li class="li">
                                                        <div>
                                                            <span class="stitle">최고기온</span>
                                                            <input type="text" name="fd_high_temp" id="fd_high_temp" class="alR" onkeyup="numberChk('high_temp');"> ℃
                                                        </div>
                                                    </li>
                                                    <li class="li">
                                                        <div>
                                                            <span class="stitle">강수량</span>
                                                            <input type="text" name="fd_precipitation" id="fd_precipitation" class="alR" onkeyup="numberChk('r12');"> mm
                                                        </div>
                                                    </li>
                                                    <li class="li">
                                                        <div>
                                                            <span class="stitle">습도</span>
                                                            <input type="text"value="" name="fd_humid" id="fd_humid" class="alR" onkeyup="numberChk('reh');"> %
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
                                            <input class="form-control" type="file" id="fd_picture1" name="fd_picture1" multiple>
                                            <input class="form-control" type="file" id="fd_picture2" name="fd_picture2" multiple>
                                            <input class="form-control" type="file" id="fd_picture3" name="fd_picture3" multiple>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">영농일지 공개 여부</th>
                                    <td colspan="3">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="fd_open" name="fd_open" value="1">
                                            <label class="form-check-label" for="inlineCheckbox1">공개</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2" name="fd_open" value="0">
                                            <label class="form-check-label" for="inlineCheckbox2">비공개</label>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Send message</button>
                    </div>
                    </form>
    </div>
    <div class="panel-footer"></div>
  </div>
</div>

</body>
</html>