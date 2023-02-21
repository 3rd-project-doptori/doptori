<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.doptori.entity.Board"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.104.2">
    <title>직거래</title>
    
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/album/">
    <link rel="stylesheet" href="market.css">
    
    
   	
   	
     <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${cpath}/resources/css/market.css">
    
	<!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#712cf9">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript">
    
    function signin(){
		location.href = "${cpath}/signin.do"
	}
	
	
	$(document).ready(function(){
		// boardList라고 하는 함수 실행!
		// 자바스크립트의 호이스팅
		boardList();
	});

	
	  	function goForm() {
	  		location.href="${cpath}/market_detail.do"
	  	}
	  	
	  	
    </script>
</head>
<body>
   <div class="container py-4">
       <jsp:include page="/WEB-INF/views/header.jsp"/>
      <main>
      	<!-- <h2 class="display-7 fw-bold">직거래</h2> -->
          <div class="album">
              <div class="container">
                  <div class="res">
                      <form class="d-flex col-sm-3 " role="search">
                          <div class="input-group">
                              <input type="text" class="form-control" id="autoSizingInputGroup" placeholder="검색어를 입력하세요">
                              <button class="input-group-text btn btn-sm btn-outline-secondary">🔍</button>
                          </div>
                          <button class="btn btn-sm btn-outline-secondary sub" type="submit">등록</button>
                      </form>
                  </div>
                  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                      <div class="col">
                          <div class="card shadow-sm">
                              <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                              <div class="card-body">
                              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                              </div>
                          </div>
                      </div>
                      <div class="col">
                          <div class="card shadow-sm">
                              <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                              <div class="card-body">
                              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                              </div>
                          </div>
                      </div>
                      <div class="col">
                          <div class="card shadow-sm">
                              <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                              <div class="card-body">
                              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>

                              </div>
                          </div>
                      </div>

                      <div class="col">
                      <div class="card shadow-sm">
                          <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                          <div class="card-body">
                          <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                          <div class="d-flex justify-content-end align-items-center">
                              <div class="btn-group">
                              <button type="button" class="btn btn-sm btn-outline-secondary" onclick="goForm()">View</button>
                              </div>
                          </div>
                          </div>
                      </div>
                      </div>
                      <div class="col">
                      <div class="card shadow-sm">
                          <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                          <div class="card-body">
                          <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                          <div class="d-flex justify-content-end align-items-center">
                              <div class="btn-group">
                              <button type="button" class="btn btn-sm btn-outline-secondary" onclick="goForm()">View</button>
                              </div>
                          </div>
                          </div>
                      </div>
                      </div>
                      <div class="col">
                      <div class="card shadow-sm">
                          <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                          <div class="card-body">
                          <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                          <div class="d-flex justify-content-end align-items-center">
                              <div class="btn-group">
                              <button type="button" class="btn btn-sm btn-outline-secondary" onclick="goForm()">View</button>
                              </div>
                          </div>
                          </div>
                      </div>
                      </div>

                      <!-- <div class="col">
                      <div class="card shadow-sm">
                          <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                          <div class="card-body">
                          <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                          <div class="d-flex justify-content-between align-items-center">
                              <div class="btn-group">
                              <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                              <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                              </div>
                              <small class="text-muted">9 mins</small>
                          </div>
                          </div>
                      </div>
                      </div>
                      <div class="col">
                      <div class="card shadow-sm">
                          <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                          <div class="card-body">
                          <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                          <div class="d-flex justify-content-between align-items-center">
                              <div class="btn-group">
                              <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                              <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                              </div>
                              <small class="text-muted">9 mins</small>
                          </div>
                          </div>
                      </div>
                      </div>
                      <div class="col">
                      <div class="card shadow-sm">
                          <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                          <div class="card-body">
                              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                              <div class="d-flex justify-content-between align-items-center">
                                  <div class="btn-group">
                                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                  </div>
                                  <small class="text-muted">9 mins</small>
                              </div>
                          </div>
                      </div>
                      </div> -->
                  </div>
              </div>
          </div>

      </main>

      <footer class="pt-3 mt-4 text-muted border-top">
        &copy; 2023
      </footer>
    </div>

    <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="${cpath}/resources/js/market.js"></script>  
  </body>
</html>
