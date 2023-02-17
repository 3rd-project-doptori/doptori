<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
      <!-- CSS only -->
   <!--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="${cpath}/resources/css/lineicons.css">
    <link rel="stylesheet" href="${cpath}/resources/css/header.css">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.eot">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.svg">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.ttf">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.woff">
    <link rel="stylesheet" href="${cpath}/resources/header/LineIcons.woff2">

        <!-- Favicons -->
<!--     <link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#712cf9"> -->
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
      <header class="pb-3 mb-4 border-bottom">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
              <a class="navbar-brand im" href="${cpath}/Main.do">
              	<img src="${cpath}/resources/images/header_logo.png" class="im">
              </a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="${cpath }/Main.do">Home</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      영농일지
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="<c:url value='/calendar2.do/${loginMember.getMb_num()}'/>">영농일지</a></li>
                      <li><a class="dropdown-item" href="<c:url value='/FarmDiaryList.do'/>">일지 목록</a></li>
                      <li><a class="dropdown-item" href="<c:url value='/FarmDiaryManageList2.do'/>">일지 관리</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/analysis2.do'/>">병해충정보</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/analysis.do'/>">농작물분석</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/market.do'/>">직거래</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/QnA_List.do'/>" onclick="boardList()">Q&A</a>
                  </li>
                  
                </ul>
	                <c:choose>
	                
			    		<c:when test="${empty loginMember}">
							<button class="btn login" type="button" onclick="signin()">LOGIN</button>  
						</c:when>
						
						<c:otherwise>
							 <div class="nav-item dropdown">
			                  <button class="dropdown-toggle bg-transparent border-0 bu" type="button" id="profile" data-bs-toggle="dropdown" aria-expanded="false">
			                      <div class="info">
			                        <div class="image">
			                          <img src="${cpath}/resources/images/default2.png" alt="" style="width: 2.5rem;"/>
			                        </div>
			                      </div>
			                  </button>
			                  
			                  <!-- 비동기식 관리자 회원목록 보기 -->
			                  <c:if test="${loginMember.mb_id=='admin'}">
			                    <button id="MemberList" class="btn btn-outline-secondary" >회원목록</button>
			                   </c:if>
			                    
			                    
			                  <ul class="dropdown-menu dm2" aria-labelledby="static">
			                    <%-- <li class="dropdown-item">
			                      <a href="${cpath}/mypage.do"><i class="lni lni-user"></i> View Profile</a>
			                    </li>
			                    <li class="dropdown-item">
			                      <a href="${cpath }/notice.do"><i class="lni lni-alarm"></i> Notifications</a>
			                    </li>
			                    <li class="dropdown-item">
			                      <a href="#0"> <i class="lni lni-inbox"></i> Messages </a>
			                    </li>
			                    <li class="dropdown-item">
			                      <a href="#0"> <i class="lni lni-cog"></i> Settings </a>
			                    </li> --%>
			                    <li class="dropdown-item">
			                      <a href="${cpath}/mypage.do"> <i class="lni lni-user"></i> 회원정보수정 </a>
			                    </li>
			                    <li class="dropdown-item">
			                      <a href="${cpath}/Logout.do"> <i class="lni lni-exit"></i> 로그아웃 </a>
			                    </li>
			                  </ul>
			                </div>
						</c:otherwise>
						
			         </c:choose>
              </div>
            </div>
          </nav>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </header>