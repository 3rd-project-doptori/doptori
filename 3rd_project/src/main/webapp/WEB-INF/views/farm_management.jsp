<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영농일지_관리</title>
<!-- ========== All CSS files linkup ========= -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="${cpath}/resources/css/lineicons.css" />
<link rel="stylesheet" href="${cpath}/resources/css/farm_management_table.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>
	<div class="container py-4">
	<jsp:include page="/WEB-INF/views/header.jsp"/>
		<main>
			<ul class="row nav nav-pills justify-content-center top" id="pills-tab"
				role="tablist">
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
			</ul>
			<div class="tab-content text-center container top"
				id="pills-tabContent">
				<!-- 필지관리 -->
				<div class="tab-pane fade show active" id="pills-home"
					role="tabpanel" aria-labelledby="pills-home-tab">
					<div class="row bg-light">
						<form class="row p-3 gx-3 justify-content-center">
							<div class="col-auto">
								<select class="form-select" id="autoSizingSelect">
									<option selected>주소</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
							</div>
							<div class="col-5">
								<input type="text" class="form-control input-group"
									id="autoSizingInput" placeholder="검색어를 입력하세요">
							</div>
							<div class="col-auto">
								<button type="submit" class="btn btn-primary">검색</button>
							</div>
						</form>
					</div>

					<!-- 모달 -->
					<div class="d-grid gap-2 d-md-flex justify-content-md-center mar">
						<button class="btn btn-primary" data-bs-toggle="modal"
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
									<div class="modal-body">
										<table class="table table-bordered">
											<colgroup>
												<col width="18%">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">필지주소</th>
													<td><input type="hidden" class="form-control" name="fdm_type" id="fdm_type" value="3">
													<select id="selectbox" class="area"
														placeholder="지역" onchange="changeSelect()"></select> <select
														id="selectNextbox" name="fdm1_ad_num" class="area2"
														placeholder="지역"></select></td>
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
														name="fdm1_lot_area" id="fdm1_lot_area" placeholder="필지면적">
													</td>
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
													<td>
														<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="1" checked> 예
														<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="0" > 아니오
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">등록하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- 확인하기 -->
					<!-- ========== section start ========== -->
					<section class="section">
						<div class="container-fluid">
							<div class="row ">
								<div class="col-lg-7 top">
									<div class="title-wrapper pt-30">
										<div class="row text-start">
											<div class="col-md-3">
												<div class="title mb-30">
													<h2>필지 목록</h2>
												</div>
											</div>
										</div>
										<!-- end row -->
									</div>
									<div class="card-style settings-card-1 mb-30">
										<div class="profile-info">
											<div id="Accordion_wrap">
											<c:forEach items="${list}" var="vo">
											<c:set var="cnt" value="${cnt+1}" />
												<div class="que" align="left">
													<span>필지 ${cnt} : </span>
													<span>${vo.ad_sido}</span>
													<span>${vo.ad_gugun}</span>
													<span>${vo.ad_dong}</span>
													<span>${vo.ad_ri}</span>
													<span>${vo.fdm1_detail_address}</span>
												</div>
												<div class="anw" align="center">
													<form action="${cpath}/FarmDiaryManageUpdate.do" method="post">
														<table>
															<tr>
																<td rowspan="2"><P>필지 주소 : <input type="hidden" class="form-control" name="fdm_num" id="fdm_num"  value="${vo.fdm_num}"></P></td>
																<td><span>
																<select id="selectbox" class="area" placeholder="지역">
																<c:forEach items="${gugunmodelList}" var="vo3">
																	<option value="${vo3.ad_gugun}" <c:if test ="${vo3.ad_gugun eq vo.ad_gugun}">selected="selected"</c:if>>${vo3.ad_gugun}</option>
																</c:forEach>
																</select></span>
																<span><select id="selectNextbox" name="fdm1_ad_num" class="area2">
																<c:forEach items="${dongmodelList}" var="vo4">
																	<option value="${vo4.ad_num}" <c:if test ="${vo4.ad_dong eq vo.ad_dong}">selected="selected"</c:if>>${vo4.ad_dong}</option>
																</c:forEach>
																</select></span>
																</td>
																<td></td>
															</tr>
															<tr>
																<td><p><input type="text" class="form-control" name="fdm1_detail_address" id="fdm1_detail_address" placeholder="세부 주소" value="${vo.fdm1_detail_address}">
																</P></td>
																<td></td>
															</tr>
															<tr>
																<td><P>필지 면적 : </P></td>
																<td><P><input type="text" class="form-control"
														name="fdm1_lot_area" id="fdm1_lot_area" placeholder="필지 면적" value="${vo.fdm1_lot_area}"></P></td>
																<td><P>m<sup>2</sup></P></td>
															</tr>
															<tr>
																<td><P>실재배 면적 : </P></td>
																<td><P><input type="text" class="form-control"
														name="fdm1_actual_area" id="fdm1_actual_area" placeholder="실재배 면적" value="${vo.fdm1_actual_area}"></P></td>
																<td><P>m<sup>2</sup></P></td>
															</tr>
															<tr>
																<td><P>유휴 면적 : </P></td>
																<td><P><input type="text" class="form-control"
														name="fdm1_idle_area" id="fdm1_idle_area" placeholder="유휴 면적" value="${vo.fdm1_idle_area}"></P></td>
																<td><P>m<sup>2</sup></P></td>
															</tr>
															<tr>
																<td><P>토양점검 여부 : </P></td>															
																<c:choose>
																	<c:when test="${vo.fdm1_soil_check==1}">
																		<td colspan="2">
																			<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="1" checked> 예
																			<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="0" > 아니오
																		</td>
																	</c:when>
																	<c:otherwise>
																		<td colspan="2">
																			<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="1" > 예
																			<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="0" checked> 아니오
																		</td>
																	</c:otherwise>
																</c:choose>
															</tr>				
														</table>
														<table>
														<tr>
														<td colspan="3">
														<button class='btn btn-secondary btn-sm' type="submit">수정</button>
														<button class='btn btn-outline-secondary' onclick="goDel(${vo.fdm_num})">삭제</button>
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

				</div>

				<!-- 품목관리 -->
				<div class="tab-pane fade" id="pills-profile" role="tabpanel"
					aria-labelledby="pills-profile-tab">
					<div class="row bg-light">
						<form class="row p-3 gx-3 justify-content-center">
							<div class="col-auto">
								<select class="form-select" id="autoSizingSelect">
									<option selected>주소</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
							</div>
							<div class="col-5">
								<input type="text" class="form-control input-group"
									id="autoSizingInput" placeholder="검색어를 입력하세요">
							</div>
							<div class="col-auto">
								<button type="submit" class="btn btn-primary">검색</button>
							</div>
						</form>
					</div>

					<!-- 모달 -->
					<div class="d-grid gap-2 d-md-flex justify-content-md-center mar">
						<button class="btn btn-primary" data-bs-toggle="modal"
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
													<td><input type="hidden" class="form-control" name="fdm_type" id="fdm_type" value="2">
													<select id="selectbox2" class="form-control"
														name="fdm1_ad_num" id="fdm1_ad_num">
														<c:forEach items="${list}" var="vo">
														<c:set var="cnt2" value="${cnt2+1}" />
															<option value="${vo.fdm1_ad_num}">${cnt2}. ${vo.ad_sido} ${vo.ad_gugun} ${vo.ad_dong} ${vo.ad_ri} ${vo.fdm1_detail_address}</option>												
														</c:forEach>
														</select></td>
												</tr>
												<tr class="color">
													<th scope="row">품목</th>
													<td><select id="selectbox3" class="form-control"
														name="fdm2_item" id="fdm2_item" onchange="changeSelect()">
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
														name="fdm2_kind" id="fdm2_kind">
															<option value="">품종을 선택하세요.</option>
															<option value="딸기">딸기</option>
															<option value="토마토">토마토</option>
															<option value="수박">수박</option>
															<option value="참외">참외</option>
															<option value="멜론">멜론</option>
															<option value="파인애플">파인애플</option>
													</select></td>
												</tr>
												<tr>
													<th scope="row">재배면적</th>
													<td><input type="text" class="form-control"
														name="fdm2_culture_area" id="fdm2_culture_area"
														placeholder="재배면적(㎡)"></td>
												</tr>
												<tr>
													<th scope="row">계약 재배 여부</th>
													<td><input type="radio" class="form"
														name="fdm2_contract" id="fdm2_contract" value="1">
														예 <input type="radio" class="form"
														name="fdm2_contract" id="fdm2_contract" value="0" checked>
														아니오</td>
												</tr>
												<tr>
													<th scope="row">목표생산량</th>
													<td>
														<div>
															<input type="text" class="form-control"
																name="fdm2_target" id="fdm2_target" placeholder="목표생산량(kg)">
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">등록하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- 확인하기 -->
					<!-- ========== section start ========== -->
					<section class="section">
						<div class="container-fluid">
							<div class="row ">
								<div class="col-lg-7 top">
									<div class="title-wrapper pt-30">
										<div class="row text-start">
											<div class="col-md-3">
												<div class="title mb-30">
													<h2>품목 목록</h2>
												</div>
											</div>
										</div>
										<!-- end row -->
									</div>
									<div class="card-style settings-card-1 mb-30">
										<div class="profile-info">
											<div id="Accordion_wrap">
											<c:forEach items="${list2}" var="vo2">
											<c:set var="cnt3" value="${cnt3+1}" />
												<div class="que" align="left">
													<span>필지 ${cnt3} : </span>
													<span>${vo2.ad_sido}</span>
													<span>${vo2.ad_gugun}</span>
													<span>${vo2.ad_dong}</span>
													<span>${vo2.ad_ri}</span>
													<span>${vo2.fdm1_detail_address}</span>
													<span>품목 : </span>
													<span>${vo2.fdm2_item}</span>
													<span>${vo2.fdm2_kind}</span>		
												</div>
												<div class="anw" align="center">
													<form action="${cpath}/FarmDiaryManageUpdate2.do" method="post">
														<input type="hidden" class="form-control" name="fdm_num" id="fdm_num"  value="${vo2.fdm_num}">
														<table>
															<tr>
																<td><P>필지 주소 : </P></td>
																<td><p><select id="selectbox2" class="form-control"
														name="fdm1_ad_num" id="fdm1_ad_num">
														<c:forEach items="${list}" var="vo">
														<c:set var="cnt4" value="${cnt4+1}" />
															<option value="${vo.fdm1_ad_num}" <c:if test ="${vo2.fdm1_ad_num eq vo.fdm1_ad_num}">selected="selected"</c:if>>
															${cnt4}. ${vo.ad_sido} ${vo.ad_gugun} ${vo.ad_dong} ${vo.ad_ri} ${vo.fdm1_detail_address}</option>												
														</c:forEach>
														</select></P></td>
														<td></td>
															</tr>
															<tr>
																<td><P>품목: </P></td>
																<td><P><select id="selectbox3" class="form-control"
														name="fdm2_item" id="fdm2_item" onchange="changeSelect()">
															<option value="">품목을 선택하세요.</option>
															<option value="딸기" <c:if test ="${vo2.fdm1_ad_num eq vo.fdm1_ad_num}">selected="selected"</c:if>>딸기</option>
															<option value="토마토" <c:if test ="${vo2.fdm1_ad_num eq vo.fdm1_ad_num}">selected="selected"</c:if>>토마토</option>
															<option value="수박" <c:if test ="${vo2.fdm1_ad_num eq vo.fdm1_ad_num}">selected="selected"</c:if>>수박</option>
															<option value="참외" <c:if test ="${vo2.fdm1_ad_num eq vo.fdm1_ad_num}">selected="selected"</c:if>>참외</option>
															<option value="멜론" <c:if test ="${vo2.fdm1_ad_num eq vo.fdm1_ad_num}">selected="selected"</c:if>>멜론</option>
															<option value="파인애플" <c:if test ="${vo2.fdm1_ad_num eq vo.fdm1_ad_num}">selected="selected"</c:if>>파인애플</option>
													</select></P></td>
													<td></td>
															</tr>
															<tr>
																<td><P>품종 : </P></td>
																<td><P><select id="selectbox3" class="form-control"
														name="fdm2_kind" id="fdm2_kind">
															<option value="">품종을 선택하세요.</option>
															<option value="딸기">딸기</option>
															<option value="토마토">토마토</option>
															<option value="수박">수박</option>
															<option value="참외">참외</option>
															<option value="멜론">멜론</option>
															<option value="파인애플">파인애플</option>
													</select></P></td>
													<td></td>
															</tr>
															<tr>
																<td><P>재배 면적 : </P></td>
																<td><P><input type="text" class="form-control" name="fdm2_culture_area" id="fdm2_culture_area" placeholder="재배면적" value="${vo.fdm2_culture_area}"></P>
																${vo.fdm2_culture_area}
																</td>
																<td><P>m<sup>2</sup></P></td>
															</tr>
															<tr>
																<td><P>계약 재배 여부 : </P></td>													
																<c:choose>
																	<c:when test="${vo.fdm2_contract==1}">
																		<td><P><input type="radio" class="form" name="fdm2_contract" id="fdm2_contract" value="1" checked> 예
																		<input type="radio" class="form" name="fdm2_contract" id="fdm2_contract" value="0" > 아니오</P></td>
																		<td></td>
																	</c:when>
																	<c:otherwise>
																		<td><P><input type="radio" class="form" name="fdm2_contract" id="fdm2_contract" value="1"> 예
																		<input type="radio" class="form" name="fdm2_contract" id="fdm2_contract" value="0" checked> 아니오</P></td>
																		<td></td>
																	</c:otherwise>
																</c:choose>
															</tr>
															<tr>
																<td><P>목표 생산량 : </P></td>
																<td><P><input type="text" class="form-control" name="fdm2_target" id="fdm2_target" placeholder="목표생산량" value="${vo.fdm2_target}">${vo.fdm2_target}</P></td>
																<td><P>kg</P></td>
															</tr>

														</table>
														<table>
														<tr>
														<td colspan="3">
														<button class='btn btn-secondary btn-sm' type="submit">수정</button>
														<button class='btn btn-outline-secondary' onclick="goDel(${vo.fdm_num})">삭제</button>
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
				</div>



				<!-- 교육관리 -->
				<div class="tab-pane fade show" id="pills-contact"
					role="tabpanel" aria-labelledby="pills-contact-tab">
					<div class="row bg-light">
						<form class="row p-3 gx-3 justify-content-center">
							<div class="col-auto">
								<select class="form-select" id="autoSizingSelect">
									<option selected>주소</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
							</div>
							<div class="col-5">
								<input type="text" class="form-control input-group"
									id="autoSizingInput" placeholder="검색어를 입력하세요">
							</div>
							<div class="col-auto">
								<button type="submit" class="btn btn-primary">검색</button>
							</div>
						</form>
					</div>

					<!-- 모달 -->
					<div class="d-grid gap-2 d-md-flex justify-content-md-center mar">
						<button class="btn btn-primary" data-bs-toggle="modal"
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
									action="${cpath}/FarmDiaryManage4.do" method="post" enctype="multipart/form-data">
									<input type="hidden" class="form-control" name="fdm_mb_num" id="fdm_mb_num" value="${loginMember.mb_num}">
									<input type="hidden" class="form-control" name="fdm_type" id="fdm_type" value="4">
									<div class="modal-body">
										<table class="table table-bordered">
											<colgroup>
												<col width="18%">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">교육 일정</th>
													<td >
														시작일 : <input type="date" class="form" name="fdm4_edu_start" id="fdm4_edu_start">
													</td>
													<td>
														종료일 : <input type="date" class="form" name="fdm4_edu_end" id="fdm4_edu_end">
													</td>
												</tr>
												<tr class="color">
													<th scope="row">교육명</th>
													<td colspan="2">
															<input type="text" class="form-control" name="fdm4_edu_name" id="fdm4_edu_name" placeholder="교육명을 입력해주세요."/>
													</td>
												</tr>
												<tr>
													<th scope="row">교육장소</th>
													<td colspan="2">
														<input type="text" class="form-control" name="fdm4_edu_place" id="fdm4_edu_place" placeholder="교육장소를 입력해주세요."/>
													</td>
												</tr>
												<tr>
													<th scope="row">교육내용</th>
													<td colspan="2">
													<textarea rows="2" cols="70" name="fdm4_edu_cont" id="fdm4_edu_cont" placeholder="교육내용을 입력해주세요." required></textarea>
													</td>
												</tr>
												<tr>
													<th scope="row">교육사진 첨부</th>
													<td><input type="file" name="uploadFile"  multiple="multiple" onchange="previewImage(this)"/></td>
													<td><img id="preview" style="width: 10rem;"></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">등록하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- 확인하기 -->
					<!-- ========== section start ========== -->
					<section class="section">
						<div class="container-fluid">
							<div class="row ">
								<div class="col-lg-7 top">
									<div class="title-wrapper pt-30">
										<div class="row text-start">
											<div class="col-md-3">
												<div class="title mb-30">
													<h2>교육 목록</h2>
												</div>
											</div>
										</div>
										<!-- end row -->
									</div>
									<div class="card-style settings-card-1 mb-30">
										<div class="profile-info">
											<div id="Accordion_wrap">
											<c:forEach items="${list4}" var="vo4">
											<c:set var="cnt5" value="${cnt5+1}" />
												<div class="que" align="left">
													<span>교육명 ${cnt5} : </span>
													<span>${vo4.fdm4_edu_name}</span>	
												</div>
												<div class="anw" align="center">
													<form action="${cpath}/FarmDiaryManageUpdate.do" method="post">
														<table>
															<tr>
																<td><P>필지 주소 : <input type="hidden" class="form-control" name="fdm_num" id="fdm_num" value="${vo.fdm_num}"></P></td>
																<td colspan="2"><p>
																<select id="selectbox" class="area" placeholder="지역">
																<c:forEach items="${gugunmodelList}" var="vo3">
																	<option value="${vo3.ad_gugun}" <c:if test ="${vo3.ad_gugun eq vo.ad_gugun}">selected="selected"</c:if>>${vo3.ad_gugun}</option>
																</c:forEach>
																</select>
																<select id="selectNextbox" name="fdm1_ad_num" class="area2">
																<c:forEach items="${dongmodelList}" var="vo4">
																	<option value="${vo4.ad_num}" <c:if test ="${vo4.ad_dong eq vo.ad_dong}">selected="selected"</c:if>>${vo4.ad_dong}</option>
																</c:forEach>
																</select>
																<input type="text" class="form-control" name="fdm1_detail_address" id="fdm1_detail_address" placeholder="세부 주소" value="${vo.fdm1_detail_address}">
																</P></td>
															</tr>
															<tr>
																<td><P>필지 면적 : </P></td>
																<td><P><input type="text" class="form-control"
														name="fdm1_lot_area" id="fdm1_lot_area" placeholder="필지 면적" value="${vo.fdm1_lot_area}"></P></td>
																<td><P>m<sup>2</sup></P></td>
															</tr>
															<tr>
																<td><P>실재배 면적 : </P></td>
																<td><P><input type="text" class="form-control"
														name="fdm1_actual_area" id="fdm1_actual_area" placeholder="실재배 면적" value="${vo.fdm1_actual_area}"></P></td>
																<td><P>m<sup>2</sup></P></td>
															</tr>
															<tr>
																<td><P>유휴 면적 : </P></td>
																<td><P><input type="text" class="form-control"
														name="fdm1_idle_area" id="fdm1_idle_area" placeholder="유휴 면적" value="${vo.fdm1_idle_area}"></P></td>
																<td><P>m<sup>2</sup></P></td>
															</tr>
															<tr>
																<td><P>토양점검 여부 : </P></td>															
																<c:choose>
																	<c:when test="${vo.fdm1_soil_check==1}">
																		<td colspan="2" align="center">
																			<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="1" checked> 예
																			<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="0" > 아니오
																		</td>
																	</c:when>
																	<c:otherwise>
																		<td colspan="2" align="center">
																			<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="1" > 예
																			<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="0" checked> 아니오
																		</td>
																	</c:otherwise>
																</c:choose>
															</tr>				
														</table>
														<table>
														<tr>
														<td colspan="3">
														<button class='btn btn-secondary btn-sm' type="submit">수정</button>
														<button class='btn btn-outline-secondary' onclick="goDel(${vo.fdm_num})">삭제</button>
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

				</div>




				<div class="tab-pane fade" id="pills-people" role="tabpanel"
					aria-labelledby="pills-people-tab">
					<div class="row bg-light">
						<form class="row p-3 gx-3 justify-content-center">
							<div class="col-5">
								<input type="text" class="form-control input-group"
									id="autoSizingInput" placeholder="인력명을 입력하세요">
							</div>
							<div class="col-auto">
								<button type="submit" class="btn btn-primary">검색</button>
							</div>
						</form>
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-center mar">
						<button class="btn login" type="button">등록</button>
					</div>
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
	         success : location.href="${cpath}/farm_management.do",
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
	
	
</script>
	<!-- ========= All Javascript files linkup ======== -->
	
	<script src="${cpath}/resources/js/main1.js"></script>
</body>
</html>