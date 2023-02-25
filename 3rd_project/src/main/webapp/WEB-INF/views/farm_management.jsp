<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영농일지_관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="${cpath}/resources/css/farm_management.css">
</head>

<body>
	<div class="container py-4">
		<jsp:include page="/WEB-INF/views/header.jsp" />
		<main>
			<ul class="row nav nav-pills justify-content-center top"
				id="pills-tab" role="tablist">
				<li class="nav-item col-auto" role="presentation">
					<button class="nav-link active" id="pills-home-tab"
						data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
						role="tab" aria-controls="pills-home" aria-selected="true">필지관리</button>
				</li>
				<li class="nav-item col-auto" role="presentation">
					<button class="nav-link" id="pills-profile-tab"
						data-bs-toggle="pill" data-bs-target="#pills-profile"
						type="button" role="tab" aria-controls="pills-profile"
						aria-selected="false">품목관리</button>
				</li>
				<li class="nav-item col-auto" role="presentation">
					<button class="nav-link" id="pills-contact-tab"
						data-bs-toggle="pill" data-bs-target="#pills-contact"
						type="button" role="tab" aria-controls="pills-contact"
						aria-selected="false">교육관리</button>
				</li>
				<li class="nav-item col-auto" role="presentation">
					<button class="nav-link" id="pills-people-tab"
						data-bs-toggle="pill" data-bs-target="#pills-people" type="button"
						role="tab" aria-controls="pills-people" aria-selected="false">인력관리</button>
				</li>
				<li class="nav-item col-auto" role="presentation">
					<button class="nav-link" id="pills-one-tab" data-bs-toggle="pill"
						data-bs-target="#pills-one" type="button" role="tab"
						aria-controls="pills-one" aria-selected="false">비료관리</button>
				</li>
				<li class="nav-item col-auto" role="presentation">
					<button class="nav-link" id="pills-two-tab" data-bs-toggle="pill"
						data-bs-target="#pills-two" type="button" role="tab"
						aria-controls="pills-two" aria-selected="false">거래처관리</button>
				</li>
				<li class="nav-item col-auto" role="presentation">
					<button class="nav-link" id="pills-three-tab" data-bs-toggle="pill"
						data-bs-target="#pills-three" type="button" role="tab"
						aria-controls="pills-three" aria-selected="false">분석관리</button>
				</li>
			</ul>
			<div class="tab-content text-center container top"
				id="pills-tabContent">
				<!-- 필지관리 -->
				<div class="tab-pane fade show active" id="pills-home"
					role="tabpanel" aria-labelledby="pills-home-tab">
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
									id="autoSizingInput" placeholder="검색어를 입력하세요"  style="width: 523.277778px; margin:0;">
							</div>
							<div class="col-auto">
								<button type="submit" class="btn btn-secondary">검색</button>
							</div>
						</form>
					</div>

					<!-- 모달 -->
					<div class="d-grid gap-2 d-md-flex justify-content-md-center mar">
						<button class="btn btn-outline-secondary" data-bs-toggle="modal"
							data-bs-target="#필지관리" data-bs-whatever="@management">등록</button>
					</div>
					<div class="modal fade modal-lg" id="필지관리" tabindex="-1"
						aria-labelledby="필지관리" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5">필지관리</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<form class="form-horizontal"
									action="${cpath}/FarmDiaryManage.do" method="post">
									<input type="hidden" class="form-control" name="fdm_mb_num"
										id="fdm_mb_num" value="${loginMember.mb_num}">
										<input type="hidden" class="form-control" name="fdm_type" id="fdm_type" value="1">
									<div class="modal-body">
										<table class="table table-bordered">
											<colgroup>
												<col width="18%">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">필지주소</th>
													<td><select
														id="selectbox" class="area" placeholder="지역"
														onchange="changeSelect()" required></select> <select
														id="selectNextbox" name="fdm1_ad_num" class="area2"
														placeholder="지역" required></select></td>
												</tr>
												<tr class="color">
													<th scope="row">세부주소</th>
													<td>
														<div class="form-floating">
															<input type="text" class="form-control"
																name="fdm1_detail_address" id="fdm1_detail_address"
																placeholder="세부주소">
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">필지면적</th>
													<td><input type="text" class="form-control"
														name="fdm1_lot_area" id="fdm1_lot_area" placeholder="필지면적"
														required></td>
												</tr>
												<tr>
													<th scope="row">실재배면적</th>
													<td><input type="text" class="form-control"
														name="fdm1_actual_area" id="fdm1_actual_area"
														placeholder="실재배면적"></td>
												</tr>
												<tr>
													<th scope="row">유휴면적</th>
													<td><input type="text" class="form-control"
														name="fdm1_idle_area" id="fdm1_idle_area"
														placeholder="유휴면적"></td>
												</tr>
												<tr>
													<th scope="row">토양점검 여부</th>
													<td><input type="radio" class="form"
														name="fdm1_soil_check" id="fdm1_soil_check" value="1"
														checked> 예 &emsp;&emsp; <input type="radio"
														class="form" name="fdm1_soil_check" id="fdm1_soil_check"
														value="0"> 아니오</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-outline-secondary btn-sm">등록하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- 확인하기 -->
					<br>
					<br>
					<div class="title mb-30">
						<h2 align="left">필지 목록</h2>
					</div>
					<table class="table recruit">

						<colgroup>
							<col width="10%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>필지 주소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="vo">
								<c:set var="cnt" value="${cnt+1}" />
								<tr class="item">
									<td>${cnt}</td>
									<td>${vo.ad_sido}${vo.ad_gugun} ${vo.ad_dong} ${vo.ad_ri}
										${vo.fdm1_detail_address}</td>
								</tr>

								<tr class="hide">
									<td></td>
									<td colspan="2">
										<form action="${cpath}/FarmDiaryManageUpdate.do" method="post">
											<input type="hidden" class="form-control" name="fdm_num"
												id="fdm_num" value="${vo.fdm_num}">
											<table class="table">
												<colgroup>
													<col width="18%">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row" rowspan="2"><P>필지 주소 :</P></th>
														<td><span> <select id="selectbox" class="area"
																placeholder="지역">
																	<c:forEach items="${gugunmodelList}" var="vo3">
																		<option value="${vo3.ad_gugun}"
																			<c:if test ="${vo3.ad_gugun eq vo.ad_gugun}">selected="selected"</c:if>>${vo3.ad_gugun}</option>
																	</c:forEach>
															</select></span> <span><select id="selectNextbox"
																name="fdm1_ad_num" class="area2">
																	<c:forEach items="${dongmodelList}" var="vo4">
																		<option value="${vo4.ad_num}"
																			<c:if test ="${vo4.ad_dong eq vo.ad_dong}">selected="selected"</c:if>>${vo4.ad_dong}</option>
																	</c:forEach>
															</select></span></td>
														<td></td>
													</tr>
													<tr>
														<td><p>
																<input type="text" class="form-control"
																	name="fdm1_detail_address" id="fdm1_detail_address"
																	placeholder="세부 주소" value="${vo.fdm1_detail_address}">
															</P></td>
														<td></td>
													</tr>
													<tr>
														<th scope="row"><P>필지 면적 :</P></th>
														<td><P>
																<input type="text" class="form-control"
																	name="fdm1_lot_area" id="fdm1_lot_area"
																	placeholder="필지 면적" value="${vo.fdm1_lot_area}">
															</P></td>
														<td><P>
																m<sup>2</sup>
															</P></td>
													</tr>
													<tr>
														<th scope="row"><P>실재배 면적 :</P></th>
														<td><P>
																<input type="text" class="form-control"
																	name="fdm1_actual_area" id="fdm1_actual_area"
																	placeholder="실재배 면적" value="${vo.fdm1_actual_area}">
															</P></td>
														<td><P>
																m<sup>2</sup>
															</P></td>
													</tr>
													<tr>
														<th scope="row">유휴 면적 </th>
														<td><P>
																<input type="text" class="form-control"
																	name="fdm1_idle_area" id="fdm1_idle_area"
																	placeholder="유휴 면적" value="${vo.fdm1_idle_area}">
															</P></td>
														<td><P>
																m<sup>2</sup>
															</P></td>
													</tr>
													<tr>
														<th scope="row">토양점검 여부 </th>
														<c:choose>
															<c:when test="${vo.fdm1_soil_check==1}">
																<td colspan="2" align="center"><p>
																		<input type="radio" class="form"
																			name="fdm1_soil_check" id="fdm1_soil_check" value="1"
																			checked> 예 &emsp;&emsp; <input type="radio"
																			class="form" name="fdm1_soil_check"
																			id="fdm1_soil_check" value="0"> 아니오
																	</p></td>
															</c:when>
															<c:otherwise>
																<td colspan="2" align="center"><p>
																		<input type="radio" class="form"
																			name="fdm1_soil_check" id="fdm1_soil_check" value="1">
																		예 &emsp;&emsp; <input type="radio" class="form"
																			name="fdm1_soil_check" id="fdm1_soil_check" value="0"
																			checked> 아니오
																	</p></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</tbody>
											</table>
											<div class="d-flex justify-content-end">
												<button class='btn btn-secondary btn-sm' type="submit">수정</button>
												<button class='btn btn-outline-secondary'
													onclick="goDel(${vo.fdm_num})">삭제</button>
											</div>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

				</div>

				<!-- 품목관리 -->
				<div class="tab-pane fade" id="pills-profile" role="tabpanel"
					aria-labelledby="pills-profile-tab">
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

					<!-- 모달 -->
					<div class="d-grid gap-2 d-md-flex justify-content-md-center mar">
						<button class="btn btn-outline-secondary" data-bs-toggle="modal"
							data-bs-target="#품목관리" data-bs-whatever="@management">등록</button>
					</div>
					<div class="modal fade modal-lg" id="품목관리" tabindex="-1"
						aria-labelledby="품목관리" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5">픔목관리</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<form class="form-horizontal"
									action="${cpath}/FarmDiaryManage2.do" method="post">
									<input type="hidden" class="form-control" name="fdm_mb_num"
										id="fdm_mb_num" value="${loginMember.mb_num}">
									<div class="modal-body">
										<table class="table table-bordered">
											<colgroup>
												<col width="18%">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">필지주소</th>
													<td><input type="hidden" class="form-control"
														name="fdm_type" id="fdm_type" value="2"> <select
														id="selectbox" class="form-control" name="fdm1_ad_num"
														id="fdm1_ad_num" required>
															<c:forEach items="${list}" var="vo">
																<c:set var="cnt2" value="${cnt2+1}" />
																<option value="${vo.fdm1_ad_num}">${cnt2}.
																	${vo.ad_sido} ${vo.ad_gugun} ${vo.ad_dong} ${vo.ad_ri}
																	${vo.fdm1_detail_address}</option>
															</c:forEach>
													</select></td>
												</tr>
												<tr class="color">
													<th scope="row">품목</th>
													<td><select id="selectbox3" class="form-control"
														name="fdm2_item" id="fdm2_item" onchange="changeSelect()"
														required>
															<option value="">품목을 선택하세요.</option>
															<option value="딸기">딸기</option>
															<option value="토마토">토마토</option>
															<option value="수박">수박</option>
															<option value="참외">참외</option>
															<option value="멜론">멜론</option>
															<option value="파인애플">파인애플</option>
													</select></td>
												</tr>
												<tr>
													<th scope="row">품종</th>
													<td><select id="selectbox3" class="form-control"
														name="fdm2_kind" id="fdm2_kind" required>
															<option value="">품종을 선택하세요.</option>
															<option value="기타">기타</option>
															<option value="금실">금실</option>
															<option value="설향">설향</option>
															<option value="매향">매향</option>
															<option value="죽향">죽향</option>
															<option value="킹스베리">킹스베리</option>
													</select></td>
												</tr>
												<tr>
													<th scope="row">재배면적</th>
													<td><input type="text" class="form-control"
														name="fdm2_culture_area" id="fdm2_culture_area"
														placeholder="재배면적(㎡)" required></td>
												</tr>
												<tr>
													<th scope="row">계약 재배 여부</th>
													<td><input type="radio" class="form"
														name="fdm2_contract" id="fdm2_contract" value="1">
														예 <input type="radio" class="form" name="fdm2_contract"
														id="fdm2_contract" value="0" checked> 아니오</td>
												</tr>
												<tr>
													<th scope="row">목표생산량</th>
													<td>
														<div>
															<input type="text" class="form-control"
																name="fdm2_target" id="fdm2_target"
																placeholder="목표생산량(kg)">
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-outline-secondary btn-sm">등록하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- 확인하기 -->
					<br>
					<br>
					<div class="title mb-30">
						<h2 align="left">품목 목록</h2>
					</div>
					<table class="table recruit">

						<colgroup>
							<col width="10%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>필지</th>
								<th>품목</th>
								<th>품종</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list2}" var="vo2">
								<c:set var="cnt3" value="${cnt3+1}" />
								<tr class="item">
									<td>${cnt3}</td>
									<td>${vo2.ad_sido}${vo2.ad_gugun} ${vo2.ad_dong}
										${vo2.ad_ri} ${vo2.fdm1_detail_address}</td>
									<td>${vo2.fdm2_item}</td>
									<td>${vo2.fdm2_kind}</td>
								</tr>

								<tr class="hide">
									<td></td>
									<td colspan="2">
										<form action="${cpath}/FarmDiaryManageUpdate2.do"
											method="post">
											<input type="hidden" class="form-control" name="fdm_num"
												id="fdm_num" value="${vo2.fdm_num}">
											<table class="table">
												<colgroup>
													<col width="18%">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><P>필지 주소 :</P></th>
														<td><p>
																<select id="selectbox2" class="form-control"
																	name="fdm1_ad_num" id="fdm1_ad_num">
																	<c:forEach items="${list}" var="vo">
																		<c:set var="cnt4" value="${cnt4+1}" />
																		<option value="${vo.fdm1_ad_num}"
																			<c:if test ="${vo2.fdm1_ad_num eq vo.fdm1_ad_num}">selected="selected"</c:if>>
																			${cnt4}. ${vo.ad_sido} ${vo.ad_gugun} ${vo.ad_dong}
																			${vo.ad_ri} ${vo.fdm1_detail_address}</option>
																	</c:forEach>
																</select>
															</P></td>
														<td></td>
													</tr>
													<tr>
														<th scope="row"><P>품목 :</P></th>
														<td><P>
																<select id="selectbox3" class="form-control"
																	name="fdm2_item" id="fdm2_item"
																	onchange="changeSelect()">
																	<option value="">품목을 선택하세요.</option>
																	<option value="딸기"
																		<c:if test ="${vo2.fdm2_item == '딸기'}">selected="selected"</c:if>>딸기</option>
																	<option value="토마토"
																		<c:if test ="${vo2.fdm2_item == '토마토'}">selected="selected"</c:if>>토마토</option>
																	<option value="수박"
																		<c:if test ="${vo2.fdm2_item == '수박'}">selected="selected"</c:if>>수박</option>
																	<option value="참외"
																		<c:if test ="${vo2.fdm2_item == '참외'}">selected="selected"</c:if>>참외</option>
																	<option value="멜론"
																		<c:if test ="${vo2.fdm2_item == '멜론'}">selected="selected"</c:if>>멜론</option>
																	<option value="파인애플"
																		<c:if test ="${vo2.fdm2_item == '파인애플'}">selected="selected"</c:if>>파인애플</option>
																</select>
															</P></td>
														<td></td>
													</tr>
													<tr>
														<th scope="row"><P>품종 :</P></th>
														<td><P>
																<select id="selectbox3" class="form-control"
																	name="fdm2_kind" id="fdm2_kind">
																	<option value="">품종을 선택하세요.</option>
																	<option value="기타"
																		<c:if test ="${vo2.fdm2_item eq '기타'}">selected="selected"</c:if>>기타</option>
																	<option value="금실"
																		<c:if test ="${vo2.fdm2_item eq '금실'}">selected="selected"</c:if>>금실</option>
																	<option value="설향"
																		<c:if test ="${vo2.fdm2_item eq '설향'}">selected="selected"</c:if>>설향</option>
																	<option value="매향"
																		<c:if test ="${vo2.fdm2_item eq '매향'}">selected="selected"</c:if>>매향</option>
																	<option value="죽향"
																		<c:if test ="${vo2.fdm2_item eq '죽향'}">selected="selected"</c:if>>죽향</option>
																	<option value="킹스베리"
																		<c:if test ="${vo2.fdm2_item eq '킹스베리'}">selected="selected"</c:if>>킹스베리</option>
																</select>
															</P></td>
														<td></td>
													</tr>
													<tr>
														<th scope="row"><P>재배 면적 :</P></th>
														<td><P>
																<input type="text" class="form-control"
																	name="fdm2_culture_area" id="fdm2_culture_area"
																	placeholder="재배면적" value="${vo2.fdm2_culture_area}">
															</P></td>
														<td><P>
																m<sup>2</sup>
															</P></td>
													</tr>
													<tr>
														<th scope="row"><P>계약재배 여부 :</P></th>
														<c:choose>
															<c:when test="${vo2.fdm2_contract==1}">
																<td align="center"><P>
																		<input type="radio" class="form" name="fdm2_contract"
																			id="fdm2_contract" value="1" checked> 예
																		&emsp;&emsp; <input type="radio" class="form"
																			name="fdm2_contract" id="fdm2_contract" value="0">
																		아니오
																	</P></td>
																<td></td>
															</c:when>
															<c:otherwise>
																<td align="center"><P>
																		<input type="radio" class="form" name="fdm2_contract"
																			id="fdm2_contract" value="1"> 예 &emsp;&emsp;
																		<input type="radio" class="form" name="fdm2_contract"
																			id="fdm2_contract" value="0" checked> 아니오
																	</P></td>
																<td></td>
															</c:otherwise>
														</c:choose>
													</tr>
													<tr>
														<th scope="row"><P>목표 생산량 :</P></th>
														<td><P>
																<input type="text" class="form-control"
																	name="fdm2_target" id="fdm2_target" placeholder="목표생산량"
																	value="${vo2.fdm2_target}">
															</P></td>
														<td><P>kg</P></td>
													</tr>
												</tbody>
											</table>
											<div class="d-flex justify-content-end">
												<button class='btn btn-secondary btn-sm' type="submit">수정</button>
												<button class='btn btn-outline-secondary'
													onclick="goDel(${vo2.fdm_num})">삭제</button>
											</div>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>



				<!-- 교육관리 -->
				<div class="tab-pane fade show" id="pills-contact" role="tabpanel"
					aria-labelledby="pills-contact-tab">
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

					<!-- 모달 -->
					<div class="d-grid gap-2 d-md-flex justify-content-md-center mar">
						<button class="btn btn-outline-secondary" data-bs-toggle="modal"
							data-bs-target="#교육관리" data-bs-whatever="@management">등록</button>
					</div>
					<div class="modal fade modal-lg" id="교육관리" tabindex="-1"
						aria-labelledby="교육관리" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5">교육관리</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<form class="form-horizontal"
									action="${cpath}/FarmDiaryManage4.do" method="post"
									enctype="multipart/form-data">
									<input type="hidden" class="form-control" name="fdm_mb_num"
										id="fdm_mb_num" value="${loginMember.mb_num}"> <input
										type="hidden" class="form-control" name="fdm_type"	
										id="fdm_type" value="4">
									<div class="modal-body">
										<table class="table table-bordered">
											<colgroup>
												<col width="18%">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">교육 일정</th>
													<td colspan="2">시작일 : <input type="date" class="form"
														name="fdm4_edu_start" id="fdm4_edu_start" required>
														&emsp; 종료일 : <input type="date" class="form"
														name="fdm4_edu_end" id="fdm4_edu_end">
													</td>
												</tr>
												<tr class="color">
													<th scope="row">교육명</th>
													<td colspan="2"><input type="text"
														class="form-control" name="fdm4_edu_name"
														id="fdm4_edu_name" placeholder="교육명을 입력해주세요." required />
													</td>
												</tr>
												<tr>
													<th scope="row">교육장소</th>
													<td colspan="2"><input type="text"
														class="form-control" name="fdm4_edu_place"
														id="fdm4_edu_place" placeholder="교육장소를 입력해주세요." /></td>
												</tr>
												<tr>
													<th scope="row">교육내용</th>
													<td colspan="2"><textarea rows="2" cols="80"
															name="fdm4_edu_cont" id="fdm4_edu_cont"
															placeholder="교육내용을 입력해주세요." required></textarea></td>
												</tr>
												<tr>
													<th scope="row">교육사진 첨부</th>
													<td><input type="file" name="uploadFile"
														multiple="multiple" onchange="previewImage(this)" /></td>
													<td><img id="preview" style="width: 10rem;"></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-outline-secondary btn-sm">등록하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- 확인하기 -->
					<br>
					<br>
					<div class="title mb-30">
						<h2 align="left">교육 목록</h2>
					</div>
					<table class="table recruit">

						<colgroup>
							<col width="10%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>교육명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list4}" var="vo4">
								<c:set var="cnt5" value="${cnt5+1}" />
								<tr class="item">
									<td>${cnt5}</td>
									<td>${vo4.fdm4_edu_name}</td>
								</tr>

								<tr class="hide">
									<td></td>
									<td colspan="2">
										<form action="${cpath}/FarmDiaryManageUpdate4.do"
											method="post" enctype="multipart/form-data">
											<input type="hidden" class="form-control" name="fdm_num"
												id="fdm_num" value="${vo4.fdm_num}">
											<table class="table">
												<colgroup>
													<col width="18%">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><P>교육 일정 :</P></th>
														<td align="center"><p>
																시작일 : <input type="date" class="form"
																	name="fdm4_edu_start" id="fdm4_edu_start"
																	value="${vo4.fdm4_edu_start}"> &emsp; 종료일 : <input
																	type="date" class="form" name="fdm4_edu_end"
																	id="fdm4_edu_end" value="${vo4.fdm4_edu_end}">
															</p></td>
													</tr>
													<tr>
														<th scope="row"><P>교육명 :</P></th>
														<td><P>
																<input type="text" class="form-control"
																	name="fdm4_edu_name" id="fdm4_edu_name"
																	placeholder="교육명" value="${vo4.fdm4_edu_name}">
															</P></td>
													</tr>
													<tr>
														<th scope="row"><P>교육 장소 :</P></th>
														<td><P>
																<input type="text" class="form-control"
																	name="fdm4_edu_place" id="fdm4_edu_place"
																	placeholder="교육 장소" value="${vo4.fdm4_edu_place}">
															</P></td>
													</tr>
													<tr>
														<th scope="row"><P>교육 내용 :</P></th>
														<td><P>
																<textarea name="fdm4_edu_cont"
																	id="fdm4_edu_cont" placeholder="교육내용을 입력해주세요.">${vo4.fdm4_edu_cont}</textarea>
															</P></td>
													</tr>
													<tr>
														<th scope="row" rowspan="2"><P>교육 사진 :</P></th>
														<td align="center">
															<P>
																<img src="${cpath}/resources/images/${vo4.fdm4_edu_pic}"
																	alt="" style="width: 7.5rem;" />
															</P>
														</td>
													</tr>
													<tr>
														<td align="center"><P>
																<input type="file" name="uploadFile" multiple="multiple" />
															</P></td>
													</tr>
												</tbody>
											</table>
											<div class="d-flex justify-content-end">
												<button class='btn btn-secondary btn-sm' type="submit">수정</button>
												<button class='btn btn-outline-secondary'
													onclick="goDel(${vo4.fdm_num})">삭제</button>
											</div>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

				</div>



				<!-- 인력관리 -->
				<div class="tab-pane fade" id="pills-people" role="tabpanel"
					aria-labelledby="pills-people-tab">
					<div class="row bg-light">
						<form class="row p-3 gx-3 justify-content-center">
							<div class="col-5">
								<input type="text" class="form-control input-group"
									id="autoSizingInput" placeholder="인력명을 입력하세요" style="width: 523.277778px; margin:0;">
							</div>
							<div class="col-auto">
								<button type="submit" class="btn btn-secondary">검색</button>
							</div>
						</form>
					</div>

					<!-- 모달 -->
					<div class="d-grid gap-2 d-md-flex justify-content-md-center mar">
						<button class="btn btn-outline-secondary" data-bs-toggle="modal"
							data-bs-target="#인력관리" data-bs-whatever="@management">등록</button>
					</div>
					<div class="modal fade modal-lg" id="인력관리" tabindex="-1"
						aria-labelledby="인력관리" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5">인력관리</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<form class="form-horizontal"
									action="${cpath}/FarmDiaryManage3.do" method="post">
									<input type="hidden" class="form-control" name="fdm_mb_num"
										id="fdm_mb_num" value="${loginMember.mb_num}"> <input
										type="hidden" class="form-control" name="fdm_type"
										id="fdm_type" value="3">
									<div class="modal-body">
										<table class="table table-bordered">
											<colgroup>
												<col width="18%">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">인력명</th>
													<td><input type="text" class="form-control"
														name="fdm5_man_name" id="fdm5_man_name"
														placeholder="인력명을 입력해주세요." required></td>
													<td></td>
												</tr>
												<tr class="color">
													<th scope="row">연락처</th>
													<td><input type="text" class="form-control"
														name="fdm5_man_phone" id="fdm5_man_phone"
														placeholder="연락처를 입력해주세요."></td>
													<td></td>
												</tr>
												<tr>
													<th scope="row">작업능력</th>
													<td><input type="radio" class="form"
														name="fdm5_man_ability" id="fdm5_man_ability" value="1">초급
														&emsp;&emsp;&emsp;&emsp; <input type="radio" class="form"
														name="fdm5_man_ability" id="fdm5_man_ability" value="2">중급
														&emsp;&emsp;&emsp;&emsp; <input type="radio" class="form"
														name="fdm5_man_ability" id="fdm5_man_ability" value="3">고급
													</td>
												</tr>
												<tr>
													<th scope="row">시간당 인건비</th>
													<td><input type='number' min='1000' max='1000000'
														step='1000' class="form-control" name="fdm5_man_cost"
														id="fdm5_man_cost" placeholder="시간당 인건비 (원)" required></td>
												</tr>
												<tr>
													<th scope="row">메모</th>
													<td><textarea rows="4" cols="80" name="fdm5_man_memo"
															id="fdm5_man_memo"></textarea></td>
												</tr>

											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-outline-secondary btn-sm">등록하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- 확인하기 -->
					<br>
					<br>
					<div class="title mb-30">
						<h2 align="left">인력 목록</h2>
					</div>
					<table class="table recruit">

						<colgroup>
							<col width="10%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>인력명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list3}" var="vo3">
								<c:set var="cnt6" value="${cnt6+1}" />
								<tr class="item">
									<td>${cnt6}</td>
									<td>${vo3.fdm5_man_name}</td>
								</tr>

								<tr class="hide">
									<td></td>
									<td colspan="2">
										<form action="${cpath}/FarmDiaryManageUpdate3.do"
											method="post">
											<input type="hidden" class="form-control" name="fdm_num"
												id="fdm_num" value="${vo3.fdm_num}">
											<table class="table">
												<colgroup>
													<col width="18%">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><P>인력명 :</P></th>
														<td><P>
																<input type="text" class="form-control"
																	name="fdm5_man_name" id="fdm5_man_name"
																	placeholder="인력명을 입력하세요." value="${vo3.fdm5_man_name}">
															</P></td>
													</tr>
													<tr>
														<th scope="row"><P>연락처 :</P></th>
														<td><P>
																<input type="text" class="form-control"
																	name="fdm5_man_phone" id="fdm5_man_phone"
																	placeholder="연락처를 입력하세요." value="${vo3.fdm5_man_phone}">
															</P></td>
													</tr>
													<tr>
														<th scope="row"><P>작업 능력 :</P></th>
														<td align="center"><P>
																<input type="radio" class="form" name="fdm5_man_ability"
																	id="fdm5_man_ability" value="1"
																	<c:if test ="${vo3.fdm5_man_ability == '1'}">checked="checked"</c:if>>초급
																&emsp;&emsp;&emsp;&emsp; <input type="radio"
																	class="form" name="fdm5_man_ability"
																	id="fdm5_man_ability" value="2"
																	<c:if test ="${vo3.fdm5_man_ability == '2'}">checked="checked"</c:if>>중급
																&emsp;&emsp;&emsp;&emsp; <input type="radio"
																	class="form" name="fdm5_man_ability"
																	id="fdm5_man_ability" value="3"
																	<c:if test ="${vo3.fdm5_man_ability == '3'}">checked="checked"</c:if>>고급
															</P></td>
													</tr>
													<tr>
														<th scope="row"><P>시간당 인건비 :</P></th>
														<td><P>
																<input type='number' min='1000' max='1000000'
																	step='1000' class="form-control" name="fdm5_man_cost"
																	id="fdm5_man_cost" placeholder="시간당 인건비(원)를 입력해 주세요."
																	value="${vo3.fdm5_man_cost}">
															<P></td>
													</tr>
													<tr>
														<th scope="row"><P>메모 :</P></th>
														<td><textarea 
																name="fdm5_man_memo" id="fdm5_man_memo">${vo3.fdm5_man_memo}</textarea>
														</td>
													</tr>
												</tbody>
											</table>
											<div class="d-flex justify-content-end">
												<button class='btn btn-secondary btn-sm' type="submit">수정</button>
												<button class='btn btn-outline-secondary'
													onclick="goDel(${vo3.fdm_num})">삭제</button>
											</div>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>

				<!-- 비료관리 -->
				<div class="tab-pane fade" id="pills-one" role="tabpanel"
					aria-labelledby="pills-one-tab">
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

					<!-- 모달 -->
					<div class="d-grid gap-2 d-md-flex justify-content-md-center mar">
						<button class="btn btn-outline-secondary" data-bs-toggle="modal"
							data-bs-target="#비료관리" data-bs-whatever="@management">등록</button>
					</div>
					<div class="modal fade modal-lg" id="비료관리" tabindex="-1"
						aria-labelledby="비료관리" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5">비료관리</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<form class="form-horizontal"
									action="${cpath}/FarmDiaryManage5.do" method="post">
									<input type="hidden" class="form-control" name="fdm_mb_num"
										id="fdm_mb_num" value="${loginMember.mb_num}"> <input
										type="hidden" class="form-control" name="fdm_type"
										id="fdm_type" value="5">
									<div class="modal-body">
										<table class="table table-bordered">
											<colgroup>
												<col width="18%">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><P>비료명</P></th>
													<td>
														<P>
															<input type="text" class="form-control"
																name="fdm3_fertilizer" id="fdm3_fertilizer"
																placeholder="비료명을 입력하세요.">
														</P>
													</td>
												</tr>
												<tr class="color">
													<th scope="row"><P>비료 종류</P></th>
													<td>
														<P>
															<input type="text" class="form-control"
																name="fdm3_fertilizer_kind" id="fdm3_fertilizer_kind"
																placeholder="비료종류를 입력하세요.">
														</P>
													</td>
												</tr>
												<tr>
													<th scope="row"><P>농약명</P></th>
													<td>
														<P>
															<input type="text" class="form-control"
																name="fdm3_pesticide" id="fdm3_pesticide"
																placeholder="농약명을 입력하세요.">
														</P>
													</td>
												</tr>
												<tr>
													<th scope="row"><P>농약 종류</P></th>
													<td>
														<P>
															<input type="text" class="form-control"
																name="fdm3_pesticide_kind" id="fdm3_pesticide_kind"
																placeholder="농약종류를 입력하세요.">
														</P>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-outline-secondary btn-sm">등록하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- 확인하기 -->
					<br> <br>
					<div class="title mb-30">
						<h2 align="left">비료/농약 목록</h2>
					</div>
					<table class="table recruit">

						<colgroup>
							<col width="10%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>비료</th>
								<th>농약</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list5}" var="vo5">
								<c:set var="cnt7" value="${cnt7+1}" />
								<tr class="item">
									<c:choose>
										<c:when test="${empty vo5.fdm3_fertilizer}">
											<td>${cnt7}</td>
											<td></td>
											<td>${vo5.fdm3_pesticide}</td>
										</c:when>
										<c:when test="${empty vo5.fdm3_pesticide}">
											<td>${cnt7}</td>
											<td>${vo5.fdm3_fertilizer}</td>
											<td></td>
										</c:when>
										<c:otherwise>
											<td>${cnt7}</td>
											<td>${vo5.fdm3_fertilizer}</td>
											<td>${vo5.fdm3_pesticide}</td>
										</c:otherwise>
									</c:choose>
								</tr>

								<tr class="hide">
									<td></td>
									<td colspan="2">
										<form action="${cpath}/FarmDiaryManageUpdate5.do"
											method="post">
											<input type="hidden" class="form-control" name="fdm_num"
												id="fdm_num" value="${vo5.fdm_num}">
											<table class="table">
												<colgroup>
													<col width="18%">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><P>비료명 :</P></th>
														<td>
															<P>
																<input type="text" class="form-control"
																	name="fdm3_fertilizer" id="fdm3_fertilizer"
																	placeholder="비료명을 입력하세요."
																	value="${vo5.fdm3_fertilizer}">
															</P>
														</td>
													</tr>
													<tr>
														<th scope="row"><P>비료 종류 :</P></th>
														<td>
															<P>
																<input type="text" class="form-control"
																	name="fdm3_fertilizer_kind" id="fdm3_fertilizer_kind"
																	placeholder="비료 종류를 입력하세요."
																	value="${vo5.fdm3_fertilizer_kind}">
															</P>
														</td>
													</tr>
													<tr>
														<th scope="row"><P>농약명 :</P></th>
														<td>
															<P>
																<input type="text" class="form-control"
																	name="fdm3_pesticide" id="fdm3_pesticide"
																	placeholder="농약명을 입력하세요." value="${vo5.fdm3_pesticide}">
															</P>
														</td>
													</tr>
													<tr>
														<th scope="row"><P>농약 종류 :</P></th>
														<td>
															<P>
																<input type="text" class="form-control"
																	name="fdm3_pesticide_kind" id="fdm3_pesticide_kind"
																	placeholder="농약 종류를 입력하세요."
																	value="${vo5.fdm3_pesticide_kind}">
															</P>
														</td>
													</tr>
												</tbody>
											</table>
											<div class="d-flex justify-content-end">
												<button class='btn btn-secondary btn-sm' type="submit">수정</button>
												<button class='btn btn-outline-secondary'
													onclick="goDel(${vo5.fdm_num})">삭제</button>
											</div>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

				</div>

				<!-- 거래처관리 -->
				<div class="tab-pane fade" id="pills-two" role="tabpanel"
					aria-labelledby="pills-two-tab">
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

					<!-- 모달 -->
					<div class="d-grid gap-2 d-md-flex justify-content-md-center mar">
						<button class="btn btn-outline-secondary" data-bs-toggle="modal"
							data-bs-target="#거래처관리" data-bs-whatever="@management">등록</button>
					</div>
					<div class="modal fade modal-lg" id="거래처관리" tabindex="-1"
						aria-labelledby="거래처관리" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5">거래처관리</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<form class="form-horizontal"
									action="${cpath}/FarmDiaryManage6.do" method="post">
									<input type="hidden" class="form-control" name="fdm_mb_num"
										id="fdm_mb_num" value="${loginMember.mb_num}"> <input
										type="hidden" class="form-control" name="fdm_type"
										id="fdm_type" value="6">
									<div class="modal-body">
										<table class="table table-bordered">
											<colgroup>
												<col width="18%">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">거래처명</th>
													<td>
														<P>
															<input type="text" class="form-control"
																name="fdm6_account" id="fdm6_account"
																placeholder="거래처명을 입력하세요." required>
														</P>
													</td>
												</tr>
												<tr class="color">
													<th scope="row">대표자명</th>
													<td>
														<P>
															<input type="text" class="form-control"
																name="fdm6_represent" id="fdm6_represent"
																placeholder="대표자명을 입력하세요.">
														</P>
													</td>
												</tr>
												<tr>
													<th scope="row">사업자등록번호</th>
													<td>
														<P>
															<input type="text" class="form-control"
																name="fdm6_regi_num" id="fdm6_regi_num"
																placeholder="사업자등록번호를 입력하세요.">
														</P>
													</td>
												</tr>
												<tr>
													<th scope="row">전화번호</th>
													<td>
														<P>
															<input type="text" class="form-control" name="fdm6_phone"
																id="fdm6_phone" placeholder="전화번호를 입력하세요.">
														</P>
													</td>
												</tr>
												<tr>
													<th scope="row">주소</th>
													<td>
														<P>
															<input type="text" class="form-control"
																name="fdm6_address" id="fdm6_address"
																placeholder="주소를 입력하세요.">
														</P>
													</td>
												</tr>
												<tr>
													<th scope="row">업종</th>
													<td>
														<P>
															<input type="text" class="form-control"
																name="fdm6_sectors" id="fdm6_sectors"
																placeholder="업무종류를 입력하세요.">
														</P>
													</td>
												</tr>
												<tr>
													<th scope="row">업태</th>
													<td>
														<P>
															<input type="text" class="form-control"
																name="fdm6_business" id="fdm6_business"
																placeholder="업무형태를 입력하세요.">
														</P>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-outline-secondary btn-sm">등록하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- 확인하기 -->
					<br> <br>
					<div class="title mb-30">
						<h2 align="left">거래처 목록</h2>
					</div>
					<table class="table recruit">

						<colgroup>
							<col width="10%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>거래처</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list6}" var="vo6">
								<c:set var="cnt8" value="${cnt8+1}" />
								<tr class="item">
									<td>${cnt8}</td>
									<td>${vo6.fdm6_account}</td>
								</tr>

								<tr class="hide">
									<td></td>
									<td colspan="2">
										<form action="${cpath}/FarmDiaryManageUpdate6.do"
											method="post">
											<input type="hidden" class="form-control" name="fdm_num"
												id="fdm_num" value="${vo6.fdm_num}">
											<table class="table">
												<colgroup>
													<col width="18%">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><P>거래처명 :</P></th>
														<td>
															<P>
																<input type="text" class="form-control"
																	name="fdm6_account" id="fdm6_account"
																	placeholder="거래처명을 입력하세요." value="${vo6.fdm6_account}">
															</P>
														</td>
													</tr>
													<tr>
														<th scope="row"><P>대표자명 :</P></th>
														<td>
															<P>
																<input type="text" class="form-control"
																	name="fdm6_represent" id="fdm6_represent"
																	placeholder="대표자명을 입력하세요."
																	value="${vo6.fdm6_represent}">
															</P>
														</td>
													</tr>
													<tr>
														<th scope="row"><P>사업자등록번호 :</P></th>
														<td>
															<P>
																<input type="text" class="form-control"
																	name="fdm6_regi_num" id="fdm6_regi_num"
																	placeholder="사업자등록번호를 입력하세요."
																	value="${vo6.fdm6_regi_num}">
															</P>
														</td>
													</tr>
													<tr>
														<th scope="row"><P>전화번호 :</P></th>
														<td>
															<P>
																<input type="text" class="form-control"
																	name="fdm6_phone" id="fdm6_phone"
																	placeholder="전화번호를 입력하세요." value="${vo6.fdm6_phone}">
															</P>
														</td>
													</tr>
													<tr>
														<th scope="row"><P>주소 :</P></th>
														<td>
															<P>
																<input type="text" class="form-control"
																	name="fdm6_address" id="fdm6_address"
																	placeholder="주소를 입력하세요." value="${vo6.fdm6_address}">
															</P>
														</td>
													</tr>
													<tr>
														<th scope="row"><P>업종 :</P></th>
														<td>
															<P>
																<input type="text" class="form-control"
																	name="fdm6_sectors" id="fdm6_sectors"
																	placeholder="업무종류를 입력하세요." value="${vo6.fdm6_sectors}">
															</P>
														</td>
													</tr>
													<tr>
														<th scope="row"><P>업태 :</P></th>
														<td>
															<P>
																<input type="text" class="form-control"
																	name="fdm6_business" id="fdm6_business"
																	placeholder="업무형태를 입력하세요." value="${vo6.fdm6_business}">
															</P>
														</td>
													</tr>
												</tbody>
											</table>
											<div class="d-flex justify-content-end">
												<button class='btn btn-secondary btn-sm' type="submit">수정</button>
												<button class='btn btn-outline-secondary'
													onclick="goDel(${vo6.fdm_num})">삭제</button>
											</div>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

				</div>

				<!-- 분석관리 -->
				<div class="tab-pane fade" id="pills-three" role="tabpanel"
					aria-labelledby="pills-three-tab">
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

					<div class="d-grid gap-2 d-md-flex justify-content-md-center mar">
						<button class="btn btn-outline-secondary">병해충 분석</button>
						<button class="btn btn-outline-secondary">생육과정 분석</button>
					</div>
					<!-- 확인하기 -->
					<!-- 확인하기 -->
					<br> <br>
					<div class="title mb-30">
						<h2 align="left">거래처 목록</h2>
					</div>
					<table class="table recruit">

						<colgroup>
							<col width="10%">
							<col width="30%">
							<col width="10%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>분석 날짜</th>
								<th>품목</th>
								<th>분석명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list7}" var="vo7" varStatus="a">
								<c:set var="cnt9" value="${cnt9+1}" />
								<c:set var="crop" value="${CropList}" />
								<tr class="item">
									<td>${cnt9}</td>
									<td>${vo7.an_date}</td>
									<c:choose>
									<c:when test="${empty vo7.an_pic_grow}">
									<td>${fn:split(vo7.an_pic_pest, '/')[2]}</td>
									<td>병해충 분석</td>
									</c:when>
									<c:otherwise>
									<td>${fn:split(vo7.an_pic_grow, '/')[2]}</td>
									<td>생육과정 분석</td>
									</c:otherwise>
									</c:choose>
								</tr>

								<tr class="hide">
									
									<td colspan="4">
										<form action="${cpath}/FarmDiaryManageUpdate6.do"
											method="post">
											<input type="hidden" class="form-control" name="fdm_num"
												id="fdm_num" value="${vo6.fdm_num}">
											<table class="table">
												<tbody>
													<tr>
														<th scope="row">분석날짜 </th>
														<td>
														
																<input type="text" class="form-control"
																	name="fdm6_account" id="fdm6_account"
																	placeholder="거래처명을 입력하세요." value="${vo7.an_date}">
															
														</td>
													</tr>
													<tr>
														<th scope="row">품명 </th>
														<td>
														
															<c:choose>
									<c:when test="${empty vo7.an_pic_grow}">
									<td><input type="text" class="form-control"
																	name="fdm6_represent" id="fdm6_represent"
																	placeholder="대표자명을 입력하세요."
																	value="${fn:split(vo7.an_pic_pest, '/')[2]}"></td>
									</c:when>
									<c:otherwise>
									<td><input type="text" class="form-control"
																	name="fdm6_represent" id="fdm6_represent"
																	placeholder="대표자명을 입력하세요."
																	value="${fn:split(vo7.an_pic_grow, '/')[2]}"></td>
									</c:otherwise>
									</c:choose>
															
														</td>
													</tr>
													<tr>
														<th scope="row">분석명 </th>
														<td>
															
																<c:choose>
									<c:when test="${empty vo7.an_pic_grow}">
									<td>병해충 분석</td>
									</c:when>
									<c:otherwise>
									<td>생육과정 분석</td>
									</c:otherwise>
									</c:choose>
															
														</td>
													</tr>
													<tr>
														<th scope="row">내용 </th>
														<td>
															
																<c:choose>
									<c:when test="${empty vo7.an_pic_grow}">
									<td><h5>발생환경</h5><p>병원균은 병든 부위에서 균핵 혹은 분생포자의 형태로 월동하여 전염원이 된다. 시설재배시 기온이 20℃내외이고 습도가 높을 때 많이 발생하며, 노지재배시는 여름철 장마기때 주로 발생한다. 과실의 감염은 주로 꽃이 달린 부위에서부터 시작되므로 과실이 커지면서 꽃이 쉽사리 떨어지지 않는 품종에서 발생이 심하다.</p><h5>증상설명</h5><p>주로 과실에 발생하나 잎, 꽃잎, 잎자루, 과병 등에도 발생한다. 과실에는 작은 수침상의 담갈색 병반으로 나타타고 점차 진전되면 과실이 부패한다. 부패된 과실에는 잿빛의 분생포자로 뒤덮힌다. 잎에는 꽃잎이 떨어져 묻어 있는 부분에서부터 감염이 시작된다. 과병과 잎자루에는 암갈색 병반이 형성되고, 진전되면 줄기가 말라죽으며, 잿빛의 곰팡이가 밀생한다. </p><h5>방제방법</h5><p> - 병든식물체는 비닐봉지 등에 모아 매몰하거나 소각하고, 수확후에 포장관리를 철저히 한다.<br>- 시설내의 온도와 습도관리를 잘 조절해 준다.<br>- 꽃잎이나 병든 잔사물이 과실이나 잎에 붙지 않도록 한다. <br>- 식물체가 웃자라지 않도록 투광에 유의한다.<br>- 병원균은 포자형성량이 매우 높아 한번 번지면 방제하기 어려우므로, 발생초기의 집중방제가 중요하다.<br>- 약제살포는 수화제나 유제보다 분제, 훈연제, 연무제 등이 습도를 높여 주지 않는 점에서 유리 하다.<br>- 본 병원균은 약제내성이 잘 생기므로 계통이 다른 등록약제를 교호살포하는 것이 좋다.</p></td>
									</c:when>
									<c:otherwise>
									<td>'개화기', '고온이나 저온에 오랫동안 놓이게 되면 꽃으로의 양분 공급이 원활하지 못하여 꽃가루 발육이나 자방비대가 심하게 억제된다. 따라서 온도는 가능한 생육에 알맞은 범위에서 관리해 주는 것이 좋다. 땅 온도(지온)도 기온 못지않게 중요한데 특히 겨울철재배 시는 지온중심의 온도관리를 해주어야 한다. 가장 알맞은 지온은 20°C 전후이지만 15∼16°C 정도만 유지시켜도 실제 재배 시에는 큰 문제가 없으므로 햇빛이 잘 들도록 하고 멀칭을 철저히 해준다. 찬물을 일시에 다량관수하면 지온이 심하게 떨어지므로 하우스 내에 저수조 등을 설치하여 수온을 높여주는 것이 좋다.'</td>
									</c:otherwise>
									</c:choose>
															
														</td>
													</tr>
													
												</tbody>
											</table>
											<div class="d-flex justify-content-end">
												<button class='btn btn-secondary btn-sm' type="submit">수정</button>
												<button class='btn btn-outline-secondary'
													onclick="goDel(${vo6.fdm_num})">삭제</button>
											</div>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

				</div>

			</div>
		</main>
	</div>
	<script type="text/javascript">
$(document).ready(function(){
	
	var temp;
	
	$.ajax({
		url : "${cpath}/ad_gugun.do",
		type : "get",
		dataType : "json",
		success : function(res){
			//console.log(res);
			$("#selectbox").html("");
			$.each(res, (index, obj)=>{
				$("#selectbox").append("<option value="+obj.ad_gugun+">"+obj.ad_gugun+"</option>");
			});
			$("#selectbox2").html("");
			$.each(res, (index, obj)=>{
				$("#selectbox2").append("<option value="+obj.ad_gugun+">"+obj.ad_gugun+"</option>");
			});
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});
	
	$.ajax({
		url : "${cpath}/ad_dong.do",
		type : "get",
		dataType : "json",
		success : function(res){
			//console.log(res);
			$("#selectNextbox").html("");
			$.each(res, (index, obj)=>{
				$("#selectNextbox").append("<option value="+obj.ad_dong+">"+obj.ad_dong+"</option>");
			});
			$("#selectNextbox2").html("");
			$.each(res, (index, obj)=>{
				$("#selectNextbox2").append("<option value="+obj.ad_dong+">"+obj.ad_dong+"</option>");
			});
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});	
	
	
}); // ready 끝

		

function changeSelect(){
	var select = $("#selectbox option:selected").text();
	var select2 = $("#selectbox2 option:selected").text();
	$.ajax({
		url : "${cpath}/ad_dong.do",
		type : "get",
		dataType : "json",
		success : function(res){
			//console.log(res);
			$("#selectNextbox").html("");
			$.each(res, (index, obj)=>{
				if (obj.ad_gugun==select) {
				$("#selectNextbox").append("<option value="+obj.ad_num+">"+obj.ad_dong+"</option>");
				}
			});
			$("#selectNextbox2").html("");
			$.each(res, (index, obj)=>{
				if (obj.ad_gugun==select2) {
				$("#selectNextbox2").append("<option value="+obj.ad_num+">"+obj.ad_dong+"</option>");
				}
			});
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});	
}


function goDel(fdm_num){

	var real = confirm("정말 삭제하시겠습니까???");
	
	if(real){
		
		$.ajax({
			 url : "${cpath}/farmdiarydelete/" + fdm_num,// PathVariable로 넘기기
	         type : "delete",
	         success : location.href="${cpath}/FarmDiaryManageList2.do",
	         error : function(){
	        	 alert("글삭제 실패!!")
	         }
	         
	    });// ajax
	
	}// if문
	
}// goDel 함수 끝!!
	
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
	
	
</script>
	<!-- ========= All Javascript files linkup ======== -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${cpath}/resources/js/farm_management.js"></script>
</body>
</html>