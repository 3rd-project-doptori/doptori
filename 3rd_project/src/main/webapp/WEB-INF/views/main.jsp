<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


        <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#712cf9">


   
  </head>
  <body>
    <script type="text/javascript">
    
	    function signin(){
			location.href = "${cpath}/signin.do"
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
                      <li><a class="dropdown-item" href="#">일정관리</a></li>
                      <li><a class="dropdown-item" href="#">일지쓰기</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">병해충정보</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">농작물분석</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">직거래</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Q&A</a>
                  </li>
                  
                </ul>
	                <c:choose>
	                
			    		<c:when test="${empty loginMember}">
							<button class="btn" type="button" onclick="signin()">LOGIN</button>  
						</c:when>
						
						<c:otherwise>
							<div class="form-group">
							
								<c:choose>
								
									<c:when test="${empty loginMember.mb_pic}">
										<style>
										img{
					            		border-radius: 100%;
					        			}
										</style>
										<a href="${cpath}/Mypage.do"><span><img src="resources/images/default3.png"></span></a>
									</c:when>
									
									<c:otherwise>
										<a href="${cpath}/Mypage.do"><span>${loginMember.mb_pic}</span></a>
									</c:otherwise>
									
								</c:choose>
								
									<span>${loginMember.mb_nick}님 환영합니다 </span>
									<a class="btn btn-sm btn-default" href="${cpath}/Logout.do">LogOut</a>
									
								<c:if test="${loginMember.mb_id=='admin'}">
									<button id="MemberList" class="btn btn-sm btn-default" >회원목록</button>
									<div id="MemberListdiv" style="display:none;"></div>
								</c:if>
								
							</div>
						</c:otherwise>
						
			         </c:choose>
              </div>
            </div>
          </nav>
    </header>

    <div class="p-5 mb-4 bg-light rounded-3">
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
        <h3>공지사항</h3>
        <table class="table table-sm text-center align-middle">
            <colgroup>
                <col width=10%>
                <col>
    
            </colgroup>
            <tr class="table-light">
                <th>번호</th>
                <th>제목</th>
    
            </tr>
            <tr class="table-group-divider">
                <th>1</th>
                <td>제목제목제목제목제목제목</td>
    
            </tr>
            <tr>
                <th>2</th>
                <td>제목제목제목제목제목제목</td>
            </tr>
        </table>
    </div>

    <footer class="pt-3 mt-4 text-muted border-top">
      &copy; 2023
    </footer>
  </div>
</main>
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>
