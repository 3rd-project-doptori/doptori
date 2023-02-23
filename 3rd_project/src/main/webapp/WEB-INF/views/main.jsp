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

    <div class="bg-light rounded-3">
    <div id="MemberListdiv" style="display:none;"></div>
 <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 text-center">
              <h1>VEF_과채가채고</h1>
              <p class="p">
                  어려운 과채작물 재배를 쉽고 편리하게 도와드립니다.<br>
                  <strong>생산</strong>부터 <strong>판매</strong> 서비스까지<br>
                  제공하는 데이터 농업 플랫폼 베프를 통해<br> 
                  신선하고 저렴한 과채 농사를 경험하실 수 있습니다.
              </p>
            </div>
            <div class="d-flex col-md-5 justify-content-center">
              <img src="${cpath}/resources/images/index_logo.png" width="60%" >
            </div>
        </div>

        <hr class="featurette-divider">

    </div>

<div class="row align-items-md-stretch mat">
        <div class="col-md-5">
          <div class="h-70 p-5 text-bg-dark rounded-3">
              <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                  <div class="carousel-inner">
                  <c:if test="${loginMember == null}">
                		<div class="carousel-item active">
	                      <a  href="#" onClick="alert('로그인을 해주세요.')"><img src="${cpath}/resources/images/fruit1.jpg" class="d-block w-70" alt="..."></a>
	                    </div>
	                    <div class="carousel-item">
	                       <a  href="#" onClick="alert('로그인을 해주세요.')"><img src="${cpath}/resources/images/fruit5.jpg" class="d-block w-70" alt="..."></a>
	                    </div>
	                    <div class="carousel-item">
	                       <a  href="#" onClick="alert('로그인을 해주세요.')"><img src="${cpath}/resources/images/fruit3.jpg" class="d-block w-70" alt="..."></a>
	                    </div>
					</c:if>
					<c:if test="${loginMember != null}">
						<div class="carousel-item active">
	                      <a  href="<c:url value='/market_detail.do'/>"><img src="${cpath}/resources/images/fruit1.jpg" class="d-block w-70" alt="..."></a>
	                    </div>
	                    <div class="carousel-item">
	                       <a  href="<c:url value='/market_detail.do'/>"><img src="${cpath}/resources/images/fruit5.jpg" class="d-block w-70" alt="..."></a>
	                    </div>
	                    <div class="carousel-item">
	                       <a  href="<c:url value='/market_detail.do'/>"><img src="${cpath}/resources/images/fruit3.jpg" class="d-block w-70" alt="..."></a>
	                    </div>
					</c:if>
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
                <c:if test="${loginMember == null}">
						<a href="#" onClick="alert('로그인을 해주세요.')">
                			<image href="${cpath}/resources/images/plant.png" width="90%" height="90%"></image>
                		</a>
					</c:if>
					<c:if test="${loginMember != null}">
						<a href="<c:url value='/analysis.do'/>">
	                		<image href="${cpath}/resources/images/plant.png" width="90%" height="90%"></image>
	                	</a>
					</c:if>
                <p>생육과정관리</p>
              </svg>
            </div>
            <div class="col-auto d-block d-lg-block">
              <svg class="bd-placeholder-img" width="125" height="175" xmlns="http://www.w3.org/2000/svg" href="planner.png" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                <c:if test="${loginMember == null}">
						<a href="#" onClick="alert('로그인을 해주세요.')">
                			<image href="${cpath}/resources/images/pests.png" width="90%" height="90%"></image>
                		</a>
					</c:if>
					<c:if test="${loginMember != null}">
						<a href="<c:url value='/analysis2.do'/>">
	                		<image href="${cpath}/resources/images/pests.png" width="90%" height="90%"></image>
	                	</a>
					</c:if>
                <p>병해충관리</p>
              </svg>
            </div>
            <div class="col-auto d-block d-lg-block">
              <svg class="bd-placeholder-img" width="125" height="175" xmlns="http://www.w3.org/2000/svg" href="planner.png" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                <c:if test="${loginMember == null}">
						<a href="#" onClick="alert('로그인을 해주세요.')">
                			<image href="${cpath}/resources/images/planner.png" width="90%" height="90%"></image>
                		</a>
					</c:if>
					<c:if test="${loginMember != null}">
						<a href="<c:url value='/FarmDiaryManageList2.do'/>">
	                		<image href="${cpath}/resources/images/planner.png" width="90%" height="90%"></image>
	                	</a>
					</c:if>
                <p>영농일지</p>
              </svg>
            </div>
          </div>
        </div>
      </div>

     <div class="tb">
     				<c:if test="${loginMember == null}">
                		<h3><a href="#" onClick="alert('로그인을 해주세요.')"> 공지사항</a></h3>
					</c:if>
					<c:if test="${loginMember != null}">
						<h3><a href="${cpath}/QnA_List2.do"> 공지사항</a></h3>
					</c:if>
        <table class="table table-sm text-start align-middle">
	    	<thead align="center">
		    	 <tr>
		    	 	<th width="10%" scope="col">번호</th>
		    	 	<th width="60%" scope="col">제목</th>
		    	 	<th width="40%" scope="col">작성일</th>
		    	 	<!-- <th scope="col">조회수</th> -->
		    	 </tr>
	    	</thead>
	    	<tbody class="table-group-divider">
	    	<c:forEach var="vo" items="${list}" varStatus="status">
		    	<c:if test="${vo.bd_type == '1' }">
		    			<tr>
		    				<td align="center" scope="row">${vo.bd_num}</th>
		    				<%-- <c:if test="${vo.bd_level > 0}">
								<c:forEach begin="1" end="${vo.bd_level }">
									<span style="padding-left: 10px"></span>
								</c:forEach>
							</c:if> --%>
							<td align="left">
							<%-- c:if test="${vo.bd_level > 0}">
								<c:forEach begin="1" end="${vo.bd_level }">
									<span style="padding-left: 10px"></span>
								</c:forEach>
							</c:if> --%>
							<c:url var="contentlink" value="/boardContent.do/${vo.bd_num}" />		
							<a href="${contentlink}">${vo.bd_title}</a>
							</td>  			
							<td align="center">${vo.bd_date}</td>  			
							<%-- <td>${vo.bd_cnt}</td>  --%>    			
		    			</tr>
		    	</c:if>
	    	</c:forEach> 
	    	</tbody>
	    </table>
    </div>

    <footer class="pt-3 mt-5 text-muted border-top">
      &copy; 2023
    </footer>
  </div>
</main>
  <!-- JavaScript Bundle with Popper -->
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
  
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
	      html += '<td style="font-weight: 600;" class="id'+index+'">' + obj.mb_id + '</td>'; // mb_id -> mb_num으로 수정
	      html += '<td>' + obj.mb_pw + '</td>';
	      html += '<td>' + obj.mb_nick + '</td>';
	      html += '<td>' + obj.mb_type + '</td>';
	      html += '<td><button onclick="confirmDelete('+obj.mb_num+')" class="btn btn-primary btn-sm">삭제</button></td>'; // index -> obj.mb_num으로 수정
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

	function confirmDelete(mb_num) {
	    var r = confirm("정말로 삭제하시겠습니까?");
	    if (r == true) {
	        removeMember(mb_num);
	    }
	}

	function removeMember(mb_num){
	    $.ajax({
	        url: '${cpath}/MemberDelete.do',
	        type: 'POST',
	        data: {'mb_num': mb_num},
	        dataType: 'text', // 반환값이 문자열이므로 dataType을 text로 설정합니다.
	        cache: false,
	        success: function(data) {
	            if(data.trim() === 'success') { // 반환값이 "success"인지 확인합니다.
	                $.ajax({
	                    url : '${cpath}/MemberList.do',
	                    type : 'GET',
	                    dataType : 'JSON',
	                    success : resultJSON,
	                    error : function(){
	                        alert('error');
	                    }
	                });
	            } else {
	                alert('회원 삭제에 실패했습니다.');
	            }
	        },
	        error: function() {
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
	});
  </script>

  </body>
</html>
