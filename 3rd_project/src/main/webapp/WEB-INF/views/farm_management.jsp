<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영농일지_관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${cpath}/resources/css/farm_management.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>    
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
});

function changeSelect(){
	var select = $("#selectbox option:selected").text();
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
  		bList += "<h4>등록 확인</h4>"
  		bList += "<table class='table recruit'>";
  		bList += "<colgroup><col width='10%'><col></colgroup>";
  		bList += "<tbody>";
  		$.each(data, (index, obj)=>{
		bList += "<tr class='item' id='list2'>";
  			
  				$.ajax({
  					url : "${cpath}/fulladdress.do/" + obj.fdm1_ad_num,
  					type : "get",
  					dataType : "json",
  					success : function(res){
  							var bList2 = "<td>" + cnt + "</td>";
  						$.each(res, (index, obj2)=>{
  							bList2 += "<td>" + obj2.ad_sido + obj2.ad_gugun + obj2.ad_dong + obj2.ad_ri + "</td></tr>";
  							bList2 += "<tr class='hide'>";
  				  			bList2 += "<td></td>";
  				  			bList2 += "<td>";
  				  			bList2 += "<table class='table'>";
  				  			bList2 += "<colgroup>";
  				  			bList2 += "<col width='18%'>";
  				  			bList2 += "<col>";
  				  			bList2 += "</colgroup>";
  				  			bList2 += "<thead>";
  				  			bList2 += "<tr>";
  				  			bList2 += "<th scope='col'>필지주소</th>";
  				  			bList2 += "<th>";	
  							bList2 += obj2.ad_sido + obj2.ad_gugun + obj2.ad_dong + obj2.ad_ri;
  							console.log(obj2.ad_sido);
  						});
  						$("#list2").html(bList2);
  					},
  					error : function(){
  						alert("Ajax 통신 실패!!");	
  					}
  				});
  			
  			bList += " " + obj.fdm1_detail_address; 			
  			bList += "</th>";
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
  			bList += "</tr>";
  			cnt++;
  		});// each 끝!!
  			bList += "</tbody>";
  			bList += "</table>";			

  		$("#list").html(bList);
  		
  	}// callBack 함수 끝!!
	
	
	
	
</script>
</head>

  <body>
    <div class="container py-4">

      <main>
        <ul class="row nav nav-pills justify-content-center" id="pills-tab" role="tablist">
            <li class="nav-item col-auto" role="presentation">
              <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">필지관리</button>
            </li>
            <li class="nav-item col-auto" role="presentation">
              <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">품목관리</button>
            </li>
            <li class="nav-item col-auto" role="presentation">
              <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">교육관리</button>
            </li>
            <li class="nav-item col-auto" role="presentation">
              <button class="nav-link" id="pills-people-tab" data-bs-toggle="pill" data-bs-target="#pills-people" type="button" role="tab" aria-controls="pills-people" aria-selected="false">인력관리</button>
            </li>
        </ul>
        <div class="tab-content text-center container top" id="pills-tabContent">
          <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
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
                  <input type="text" class="form-control input-group" id="autoSizingInput" placeholder="검색어를 입력하세요">
                </div>
                <div class="col-auto">
                  <button type="submit" class="btn btn-primary">검색</button>
                </div>
              </form>
            </div>

            <!-- 모달 -->
            <div class="d-grid gap-2 d-md-flex justify-content-md-center mar">
              <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#필지관리" data-bs-whatever="@management">등록</button>
            </div>
            <div class="modal fade modal-lg" id="필지관리" tabindex="-1" aria-labelledby="필지관리" aria-hidden="true">
              <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="modal-header">
                          <h1 class="modal-title fs-5">필지관리</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                 	 <form class="form-horizontal" action="${cpath}/FarmDiaryManage.do" method="post">
                 	 <input type="hidden" class="form-control" name="fdm_mb_num" id="fdm_mb_num" value="${loginMember.mb_num}">
                      <div class="modal-body">
                          <table class="table table-bordered">
                              <colgroup>
                                  <col width="18%">
                                  <col>
                              </colgroup>
                              <thead>
                              <tr>
                                  <th scope="col">관리 유형</th>
                                  <th>
                                     <select name="fdm_type" id="fdm_type">
					                    <option value="">선택하기</option>
					                    <option value=1>필지관리</option>
						                <option value=2>품목관리</option>
						                <option value=3>비료관리</option>
						                <option value=4>교육관리</option>
						                <option value=5>인력관리</option>
						                <option value=6>거래관리</option>
						                <option value=7>분석관리</option>
						             </select>
                                  </th>
                              </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <th scope="row">필지주소</th>
                                      <td>
                                          <select id="selectbox"   class="area" placeholder="지역" onchange="changeSelect()"></select>
	        							  <select id="selectNextbox" name="fdm1_ad_num" class="area2" placeholder="지역"></select>
	        							  
                                      </td>
                                  </tr>
                                  <tr class="color">
                                  <th scope="row">세부주소</th>
                                  <td>
                                      <div class="form-floating">
                                      	<input type="text" class="form-control" name="fdm1_detail_address" id="fdm1_detail_address" placeholder="세부주소">
                                      </div>
                                  </td>
                                  </tr>
                                  <tr>
                                      <th scope="row">필지면적</th>
                                      <td>
                                      	<input type="text" class="form-control" name="fdm1_lot_area" id="fdm1_lot_area" placeholder="필지면적">	
                                      </td>
                                  </tr>
                                  <tr>
                                      <th scope="row">실재배면적</th>
                                      <td>
										<input type="text" class="form-control" name="fdm1_actual_area" id="fdm1_actual_area" placeholder="실재배면적">	
                                      </td>
                                  </tr>
                                  <tr>
                                      <th scope="row">유휴면적</th>
                                      <td>
                                      	<input type="text" class="form-control" name="fdm1_idle_area" id="fdm1_idle_area" placeholder="유휴면적">	
                                      </td>
                                  </tr>
                                  <tr>
                                      <th scope="row">토양점검 여부</th>
                                      <td>
                                      	<div>
                                       	<input type="checkbox" class="form-control" name="fdm1_soil_check" id="fdm1_soil_check" value="1" checked>
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
              </div>
            </div>        
          
          <!-- 확인하기 -->
          <div class="table-responsive" id="list" style="display:block">content</div>
        </div>

          <!--  -->
          <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
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
                  <input type="text" class="form-control input-group" id="autoSizingInput" placeholder="검색어를 입력하세요">
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
          <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
            <div class="row bg-light">
              <form class="row p-3 gx-3 justify-content-center">
                <div class="col-5">
                  <input type="text" class="form-control input-group" id="autoSizingInput" placeholder="인력명을 입력하세요">
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
          <div class="tab-pane fade" id="pills-people" role="tabpanel" aria-labelledby="pills-people-tab">
            <div class="row bg-light">
              <form class="row p-3 gx-3 justify-content-center">
                <div class="col-5">
                  <input type="text" class="form-control input-group" id="autoSizingInput" placeholder="인력명을 입력하세요">
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


        </div>
      </main>
    </div>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${cpath}/resources/js/farm_management.js"></script>
  </body>
</html>