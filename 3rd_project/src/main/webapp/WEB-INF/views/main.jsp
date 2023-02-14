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
    
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/jumbotron/">
    
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${cpath}/resources/css/res_index.css">
    <link rel="stylesheet" href="${cpath}/resources/css/lineicons.css">
    <link rel="stylesheet" href="${cpath}/resources/css/header.css">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.eot">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.svg">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.ttf">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.woff">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.woff2">

        <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#712cf9">
    <style>
    	@font-face {
		  font-family: 'lineicons';
		  src: url("${cpath}/resources/header/LineIcons.eot");
		  src: url('${cpath}/resources/header/LineIcons.eot') format('embedded-opentype'),
		       url('${cpath}/resources/header/LineIcons.woff2') format('woff2'),
		       url('${cpath}/resources/header/LineIcons.woff') format('woff'),
		       url('${cpath}/resources/header/LineIcons.ttf') format('truetype'),
		       url('${cpath}/resources/header/LineIcons.svg') format('svg');
		}
    </style>
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
    <header class="pb-3 mb-4 border-bottom">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">Navbar</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="#">Home</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      영농일지
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="<c:url value='/calendar2.do/${loginMember.getMb_num()}'/>">영농일지</a></li>
                      <li><a class="dropdown-item" href="<c:url value='/FarmDiaryManage.do'/>">일지 목록</a></li>
                      <li><a class="dropdown-item" href="<c:url value='/test.do'/>">일지 관리</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">병해충정보</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/analysis.do'/>">농작물분석</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">직거래</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#" onclick="boardList()">Q&A</a>
                  </li>
                  
                </ul>
	                <c:choose>
	                
			    		<c:when test="${empty loginMember}">
							<button class="btn" type="button" onclick="signin()">LOGIN</button>  
						</c:when>
						
						<c:otherwise>
							 <div class="nav-item dropdown">
			                  <button class="dropdown-toggle bg-transparent border-0 bu" type="button" id="profile" data-bs-toggle="dropdown" aria-expanded="false">
			                      <div class="info">
			                        <div class="image">
			                          <img src="fruits.png" alt=""/>
			                        </div>
			                      </div>
			                  </button>
			                  
			                  <c:if test="${loginMember.mb_id=='admin'}">
			                    <button id="MemberList" class="btn btn-outline-secondary" >회원목록</button>
			                   </c:if>
			                    
			                  <ul class="dropdown-menu dm2" aria-labelledby="static">
			                    <li class="dropdown-item">
			                      <a href="#0"><i class="lni lni-user"></i> View Profile</a>
			                    </li>
			                    <li class="dropdown-item">
			                      <a href="${cpath }/notice.do"><i class="lni lni-alarm"></i> Notifications</a>
			                    </li>
			                    <li class="dropdown-item"><a href="#0"> <i class="lni lni-inbox"></i> Messages </a>
			                    </li>
			                    <li class="dropdown-item"><a href="#0"> <i class="lni lni-cog"></i> Settings </a>
			                    </li>
			                    <li class="dropdown-item"><a href="${cpath}/Logout.do"> <i class="lni lni-exit"></i> LOGOUT </a>
			                    </li>
			                    <li class="dropdown-item"><a href="${cpath}/updateMember.do"> <i class="lni lni-exit"></i> Edit profile  </a>
			                    </li>
			                  </ul>
			                </div>
						</c:otherwise>
						
			         </c:choose>
              </div>
            </div>
          </nav>
    </header>

    <div class="p-5 mb-4 bg-light rounded-3">
    <div id="MemberListdiv" style="display:none;"></div>
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">Custom jumbotron</h1>
        <p class="col-md-8 fs-4">베프는 어려운 과채작물 재배를 쉽고 편리하게 도와드립니다.<br>
            <strong>생산</strong>부터 <strong>판매</strong> 서비스까지 제공하는 데이터 농업 플랫폼 
            베프를 통해 <br> 신선하고 저렴한 과채 농사를 경험하실 수 있습니다.</p>
        <button class="btn btn-primary btn-lg" type="button">Example button</button>
      </div>
    </div>

    <div class="row align-items-md-stretch">
      <div class="col-md-6">
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
      <div class="col-md-6">
        <div class="h-100 p-5 bg-light border rounded-3">
          <h2>Add borders</h2>
          <p>Or, keep it light and add a border for some added definition to the boundaries of your content. Be sure to look under the hood at the source HTML here as we've adjusted the alignment and sizing of both column's content for equal-height.</p>
          <button class="btn btn-outline-secondary" type="button">Example button</button>
        </div>
      </div>
    </div>

    <div class="container-fluid py-5">
        <h3><a href="${cpath}/notice.do"> 공지사항</a></h3>
        <table class="table table-sm text-center align-middle">
	    	<thead>
		    	 <tr>
		    	 	<td width="10%" scope="col">번호</td>
		    	 	<td width="60%" scope="col">제목</td>
		    	 	<td width="40%" scope="col">작성일</td>
		    	 	<!-- <th scope="col">조회수</th> -->
		    	 </tr>
	    	</thead>
	    	<tbody class="table-group-divider">
	    	<c:forEach var="vo" items="${list}" varStatus="status">
		    	<c:if test="${vo.bd_type == '1' }">
		    			<tr class="table-group-divider">
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
