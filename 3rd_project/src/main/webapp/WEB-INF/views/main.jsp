<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.doptori.entity.Board"%>
<%@ page import="java.util.List"%>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.104.2">
    <title>MAIN</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${cpath}/resources/css/res_index.css" />
    
    
  </head>
  <body>
    <script type="text/javascript">
    
	    function boardList(){
	    	location.href = "${cpath}/QnA_List.do"
	    }
	    
	    function signin(){
			location.href = "${cpath}/signin.do"
		}
    
	  //회원정보 수정
		function updateMember(){
			location.href = "${cpath}/updateMember.do"
		}
    </script>
<main>
  <div class="container py-4">
    <jsp:include page="/WEB-INF/views/header.jsp"/>

    <div class="p-3 mb-4 bg-light rounded-3">
    <div id="MemberListdiv" style="display:none;"></div>
      <div class="row container-fluid py-5 d-flex">
          <div class="col-8 fon">
            <h1>VEF_과채가채고</h1>
            <p class="p">
                어려운 과채작물 재배를 쉽고 편리하게 도와드립니다.<br>
                <strong>생산</strong>부터 <strong>판매</strong> 서비스까지<br>
                제공하는 데이터 농업 플랫폼 베프를 통해<br> 
                신선하고 저렴한 과채 농사를 경험하실 수 있습니다.
            </p>
            <button class="btn btn-primary btn-lg" type="button">Example button</button>
          </div>
          <div class="col-4 d-flex justify-content-center">
            <img src="${cpath}/resources/images/index_logo.png" class="he">
          </div>
        </div>
    </div>

<div class="row align-items-md-stretch">
        <div class="col-md-5">
          <div class="h-100 p-5 text-bg-dark rounded-3">
              <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                      <img src="" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                      <img src="" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                      <img src="" class="d-block w-100" alt="...">
                    </div>
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>
          </div>
        </div>

        <div class="col-md-7">
          <div class="h-100 p-2 rounded-3 row g-0 border flex-md-row mb-4 shadow-sm h-md-250 position-relative justify-content-center text-center">
            <div class="col-auto d-block d-lg-block">
              <svg class="bd-placeholder-img" width="125" height="175" xmlns="http://www.w3.org/2000/svg" href="planner.png" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                <a href="${cpath}/생육과정관리">
                	<image href="${cpath}/resources/images/plant.png" width="100%" height="100%"></image>
                </a>
                <p>생육과정관리</p>
              </svg>
            </div>
            <div class="col-auto d-block d-lg-block">
              <svg class="bd-placeholder-img" width="125" height="175" xmlns="http://www.w3.org/2000/svg" href="planner.png" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                <a href="${cpath}/병해충분석">
                	<image href="${cpath}/resources/images/pests.png" width="100%" height="100%"></image>
                </a>
                <p>병해충관리</p>
              </svg>
            </div>
            <div class="col-auto d-block d-lg-block">
              <svg class="bd-placeholder-img" width="125" height="175" xmlns="http://www.w3.org/2000/svg" href="planner.png" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                <a href="${cpath}/영농일지">
                	<image href="${cpath}/resources/images/planner.png" width="100%" height="100%"></image>
                </a>
                <p>영농일지</p>
              </svg>
            </div>
          </div>
        </div>
      </div>

     <div class="tb">
        <h3><a href="${cpath}/notice.do"> 공지사항</a></h3>
        <table class="table table-sm text-start align-middle">
	    	<thead>
		    	 <tr>
		    	 	<td width="10%" scope="col">번호</td>
		    	 	<td width="60%" scope="col">제목</td>
		    	 	<td width="40%" scope="col">작성일</td>
		    	 	<!-- <th scope="col">조회수</th> -->
		    	 </tr>
	    	</thead>
	    	<tbody>
	    	<c:forEach var="vo" items="${list}" varStatus="status">
		    	<c:if test="${vo.bd_type == '1' }">
		    			<tr>
		    				<td scope="row">${vo.bd_num}</th>
		    				<%-- <c:if test="${vo.bd_level > 0}">
								<c:forEach begin="1" end="${vo.bd_level }">
									<span style="padding-left: 10px"></span>
								</c:forEach>
							</c:if> --%>
							<td align="left">
							<<%-- c:if test="${vo.bd_level > 0}">
								<c:forEach begin="1" end="${vo.bd_level }">
									<span style="padding-left: 10px"></span>
								</c:forEach>
							</c:if> --%>
							<c:url var="contentlink" value="/boardContent.do/${vo.bd_num}" />		
							<a href="${contentlink}">${vo.bd_title}</a>
							</td>  			
							<td>${vo.bd_date}</td>  			
							<%-- <td>${vo.bd_cnt}</td>  --%>    			
		    			</tr>
		    	</c:if>
	    	</c:forEach> 
	    	</tbody>
	    </table>
    </div>

    <footer class="pt-3 mt-4 text-muted border-top">
      &copy; 2023
    </footer>
  </div>
</main>
  <!-- JavaScript Bundle with Popper -->
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
  
  function removeMember(index){
	 // alert('클릭 감지');
		var mb_num = $('.id'+index).text();
		$.ajax({
			url : '${cpath}/MemberDelete.do',
			type : 'POST',
			data : {'mb_num' : mb_num},
			dataType : 'JSON',
			success : resultJSON,
			error : function(){
				alert('error');
			}
		});
	}
	
	$(function(){
		$('#MemberList').click(
		function(){
			$.ajax({
				url : '${cpath}/MemberList.do',
				type : 'GET',
				dataType : 'JSON',
				success : resultJSON,
				error : function(){
					alert('error');
				}
			});
		});
		
		function resultJSON(data){
			var html = '<table class="table table-hover table-bordered" align="center">';
			html += '<tr align="center" style="font-weight: 800;">';
			html += '<td>아이디</td>';
			html += '<td>비밀번호</td>';
			html += '<td>닉네임</td>';
			html += '<td>회원유형</td>';
			html += '<td>삭제</td>';
			html += '</tr>';
			$.each(data, function(index, obj){
				html += '<tr align="center" style="font-weight: 500;">';
				html += '<td style="font-weight: 600;" class="id'+index+'">' + obj.mb_id + '</td>';
				html += '<td>' + obj.mb_pw + '</td>';
				html += '<td>' + obj.mb_nick + '</td>';
				html += '<td>' + obj.mb_type + '</td>';
				html += '<td><button onclick="removeMember('+index+')" class="btn btn-primary btn-sm">삭제</button></td>';
				html += '</tr>';
			});
			html += '</table>';
			$('#MemberListdiv').html(html);
			
			if($('#MemberListdiv').css('display') == 'block'){ //눈에 보이는 것
				$('#MemberListdiv').slideUp();
			}else{
				$('#MemberListdiv').slideDown();
			}
		}
	});
  </script>
  </body>
</html>
