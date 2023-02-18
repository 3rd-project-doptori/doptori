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
											<thead>
												<tr>
													<th scope="col">관리 유형</th>
													<th><select name="fdm_type" id="fdm_type">
															<option value="">선택하기</option>
															<option value=1>필지관리</option>
															<option value=2>품목관리</option>
															<option value=3>비료관리</option>
															<option value=4>교육관리</option>
															<option value=5>인력관리</option>
															<option value=6>거래관리</option>
															<option value=7>분석관리</option>
													</select></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">필지주소</th>
													<td><select id="selectbox" class="area"
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
										<button type="submit" class="btn btn-primary">Send
											message</button>
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
													<form action="">
														<table>
															<tr>
																<td><P>필지 주소 : </P></td>
																<td><p><select id="selectbox2" class="area" placeholder="지역" onchange="changeSelect()"></select>
																<select id="selectNextbox2" name="fdm1_ad_num" class="area2" placeholder="지역"></select>
																<input type="text" class="form-control" name="fdm1_detail_address" id="fdm1_detail_address" placeholder="세부주소" value="${vo.fdm1_detail_address}">
																${vo.ad_sido} ${vo.ad_gugun} ${vo.ad_dong} ${vo.ad_ri}</P></td>
															</tr>
															<tr>
																<td><P>필지 면적 : </P></td>
																<td><input type="text" class="form-control"
														name="fdm1_lot_area" id="fdm1_lot_area" placeholder="필지 면적" value="${vo.fdm1_lot_area}">m<sup>2</sup></td>
															</tr>
															<tr>
																<td><P>실재배 면적 : </P></td>
																<td><input type="text" class="form-control"
														name="fdm1_actual_area" id="fdm1_actual_area" placeholder="실재배 면적" value="${vo.fdm1_actual_area}">m<sup>2</sup></td>
															</tr>
															<tr>
																<td><P>유휴 면적 : </P></td>
																<td><input type="text" class="form-control"
														name="fdm1_idle_area" id="fdm1_idle_area" placeholder="유휴 면적" value="${vo.fdm1_idle_area}">m<sup>2</sup></td>
															</tr>
															<tr>
																<td><P>토양점검 여부 : </P></td>															
																<c:choose>
																	<c:when test="${vo.fdm1_soil_check==1}">
																		<td>
																			<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="1" checked> 예
																			<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="0" > 아니오
																		</td>
																	</c:when>
																	<c:otherwise>
																		<td>
																			<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="1" > 예
																			<input type="radio" class="form" name="fdm1_soil_check" id="fdm1_soil_check" value="0" checked> 아니오
																		</td>
																	</c:otherwise>
																</c:choose>
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
											<thead>
												<tr>
													<th scope="col">관리 유형</th>
													<th><select name="fdm_type" id="fdm_type">
															<option value="">선택하기</option>
															<option value=1>필지관리</option>
															<option value=2>품목관리</option>
															<option value=3>비료관리</option>
															<option value=4>교육관리</option>
															<option value=5>인력관리</option>
															<option value=6>거래관리</option>
															<option value=7>분석관리</option>
													</select></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">필지주소</th>
													<td><select id="selectbox2" class="form-control"
														name="fdm1_actual_area" id="fdm1_actual_area"></select></td>
												</tr>
												<tr class="color">
													<th scope="row">품목</th>
													<td><select id="selectbox3" class="form-control"
														name="fdm2_item" id="fdm2_item" onchange="changeSelect()">
															<option value="">품목을 선택하세요.</option>
															<option value=1>딸기</option>
															<option value=2>토마토</option>
															<option value=3>수박</option>
															<option value=4>참외</option>
															<option value=5>멜론</option>
															<option value=6>파인애플</option>
													</select></td>
												</tr>
												<tr>
													<th scope="row">품종</th>
													<td><select id="selectbox3" class="form-control"
														name="fdm2_kind" id="fdm2_kind">
															<option value="">품목을 선택하세요.</option>
															<option value=1>딸기</option>
															<option value=2>토마토</option>
															<option value=3>수박</option>
															<option value=4>참외</option>
															<option value=5>멜론</option>
															<option value=6>파인애플</option>
													</select></td>
												</tr>
												<tr>
													<th scope="row">재배면적</th>
													<td><input type="text" class="form-control"
														name="fdm2_culture_area" id="fdm2_culture_area"
														placeholder="재배면적"></td>
												</tr>
												<tr>
													<th scope="row">계약 재배 여부</th>
													<td><input type="radio" class="form-control"
														name="fdm2_contract" id="fdm2_contract" value="1">
														예 <input type="radio" class="form-control"
														name="fdm2_contract" id="fdm2_contract" value="0" checked>
														아니오</td>
												</tr>
												<tr>
													<th scope="row">목표생산량</th>
													<td>
														<div>
															<input type="text" class="form-control"
																name="fdm2_target" id="fdm2_target" placeholder="목표생산량">
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">Send
											message</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- 확인하기 -->
					<div class="table-responsive" id="list2" style="display: block">content</div>
				</div>



				<div class="tab-pane fade" id="pills-contact" role="tabpanel"
					aria-labelledby="pills-contact-tab">
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
						<button class="btn btn-primary" type="button">등록</button>
					</div>
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
	
	FarmDiaryManageList();
	
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

function FarmDiaryManageList(){
		$.ajax({
			url: "${cpath}/FarmDiaryManageList.do",
			type: "get",
			dataType: "json",
			success: callBack,
			error: function(){
				alert("error");
			}
			
		});// ajax 끝!!
		
	}// FarmDiaryManageList 함수 끝!!

	
function callBack(data){
		console.log(data);
		var cnt = 1;
  		var bList = "";
  		$.each(data, (index, obj)=>{
  		bList += "<div class='que'>";
  		bList += "<span>" + cnt + "</span>";
  		bList += "<span>" + obj.ad_sido +" " + obj.ad_gugun + " " + obj.ad_dong + " " + obj.ad_ri + "</span>";
  		bList += "</div>";
  		bList += "<div class='anw'>";
  		bList += "<div>";
		bList += "<span>필지주소 : </span>";
		bList += "<span>" + obj.ad_sido +" " + obj.ad_gugun + " " + obj.ad_dong + " " + obj.ad_ri + " " + obj.fdm1_detail_address + "</span>";
		bList += "</div>";
		bList += "</div>";	
		/* bList += "<tr class='hide'>";
		bList += "<td></td>";
		bList += "<td>";
		bList += "<table class='table'>";
		bList += "<colgroup>";
		bList += "<col width='18%'>";
		bList += "<col>";
		bList += "</colgroup>";
		bList += "<thead>";
		bList += "<tr>";
		bList += "<th scope='col'>필지주소</th>";
		bList += "<th>" + obj.ad_sido +" " + obj.ad_gugun + " " + obj.ad_dong + " " + obj.ad_ri + " " + obj.fdm1_detail_address + "</th>";;	
		bList += "</tr>";
		bList += "</thead>";
		bList += "<tbody>";
		bList += "<tr>";
		bList += "<th scope='row'>필지면적</th>";
		bList += "<td>" + obj.fdm1_lot_area + "</td>";
		bList += "</tr>";
		bList += "<tr>";
		bList += "<th scope='row'>실재배면적</th>";
		bList += "<td>" + obj.fdm1_actual_area + "</td>";
		bList += "</tr>";
		bList += "<tr>";
		bList += "<th scope='row'>유휴면적</th>";
		bList += "<td>" + obj.fdm1_idle_area + "</td>";
		bList += "</tr>";
		bList += "<tr>";
		bList += "<th scope='row'>토양점검 여부</th>";
		bList += "<td>" + obj.fdm1_soil_check + "</td>";
		bList += "</tr>";
		bList += "</tbody>";
		bList += "</table>";
		bList += "<div class='d-flex justify-content-end'>";
		if("${loginMember.mb_num}" == obj.fdm_mb_num){
			bList += "<button class='btn btn-secondary btn-sm' onclick='goUpdate(" + obj.fdm_num + ")'>수정</button>";
			bList += "<button class='btn btn-outline-secondary onclick='goDel(" + obj.fdm_num + ")'>삭제</button>";
		}else{
			bList += "<button disabled class='btn btn-secondary btn-sm' onclick='goUpdate(" + obj.fdm_num + ")'>수정</button>";
  			bList += "<button disabled class='btn btn-outline-secondary btn-sm' onclick='goDel(" + obj.fdm_num + ")'>삭제</button>";
		}
		bList += "</div>";
		bList += "</td>";
		bList += "</tr>"; */
		cnt++;
  		});// each 끝!!

  		$("#Accordion_wrap2").html(bList);
  	}// callBack 함수 끝!!
	
	
	
	
</script>
	<!-- ========= All Javascript files linkup ======== -->
	
	<script src="${cpath}/resources/js/main1.js"></script>
</body>
</html>