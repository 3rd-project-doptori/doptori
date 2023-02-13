<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="${cpath}/resources/css/index.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
$(document).ready(function(){
	var temp;
	
	$.ajax({
		url : "SetBclsArea",
		type : "get",
		dataType : "json",
		success : function(res){
			//console.log(res);
			$("#selectbox").html("");
			for(var i=0 ; i<res.length ; i++){
				if(i==0){
					temp=res[i]
				}
				else if(res[i]=='전국'){
					continue
				}
				$("#selectbox").append("<option value="+res[i]+">"+res[i]+"</option>");
			}			
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});
	
	$.ajax({
		url : "SetArea",
		type : "get",
		dataType : "json",
		success : function(res){
			//console.log(res);
			$("#selectNextbox").html("");
			for(var i=0 ; i<res.length ; i++){
				if(res[i].b_cls==temp){
				$("#selectNextbox").append("<option value="+res[i].s_cls+">"+res[i].s_cls+"</option>");
				}
			}			
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});	
});

function changeSelect(){
	var select = $("#selectbox option:selected").text();
	$.ajax({
		url : "SetArea",
		type : "get",
		dataType : "json",
		success : function(res){
			//console.log(res);
			$("#selectNextbox").html("");
			for(var i=0 ; i<res.length ; i++){
				if(res[i].b_cls==select){
				$("#selectNextbox").append("<option value="+res[i].s_cls+">"+res[i].s_cls+"</option>");
				}
			}			
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});	
}

</script>
</head>
<body>
 
<div class="container">
  <h2>영농일지 관리</h2>
  <div class="panel panel-default">
    <div class="panel-heading">영농일지 관리 등록</div>
    <div class="panel-body">
		<form class="form-horizontal" action="${cpath}/FarmDiaryManage.do" method="post">
			<input type="hidden" class="form-control" name="fdm_mb_num" id="fdm_mb_num" value="${loginMember.mb_num}">
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="fdm_type">관리 유형:</label>
		    <div class="col-sm-10">
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
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="fdm1_ad_num">필지번호:</label>
		    <div class="col-sm-10">
		    	<select id="selectbox" name="b_cls"  class="area" placeholder="지역" onchange="changeSelect()"></select>
	        	<select id="selectNextbox" name="s_cls" class="area2" placeholder="지역"></select>
		      <input type="text" class="form-control" name="fdm1_ad_num" id="fdm1_ad_num" placeholder="필지번호">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="fdm1_detail_address">세부주소:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="fdm1_detail_address" id="fdm1_detail_address" placeholder="세부주소">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="fdm1_lot_area">필지면적:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="fdm1_lot_area" id="fdm1_lot_area" placeholder="필지면적">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="fdm1_actual_area">실재배면적:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="fdm1_actual_area" id="fdm1_actual_area" placeholder="실재배면적">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="fdm1_idle_area">유휴면적:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="fdm1_idle_area" id="fdm1_idle_area" placeholder="유휴면적">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="fdm1_soil_check">토양점검여부:</label>
		    <div class="col-sm-10">
		      <input type="checkbox" class="form-control" name="fdm1_soil_check" id="fdm1_soil_check" value="1" checked>
		    </div>
		  </div>
		  <div class="form-group">
		  <!-- 부트스트랩은 한줄이 12 col-sm-2 col-sm-10 -->
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-success">등록</button>
		      <button type="reset" class="btn btn-danger">취소</button>
		    </div>
		  </div>
		</form>
	</div>
    <div class="panel-footer">농장을 등록해 주세요😊</div>
  </div>
</div>

</body>
</html>
