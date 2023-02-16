<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.doptori.entity.Board"%>
<%@ page import="com.doptori.entity.Comment"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.104.2">
  	
  <title>notice_qa</title>

	<link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/jumbotron/">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel="stylesheet" href="notice_qa.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
	<meta name="theme-color" content="#712cf9">
  <style>
      .login{
      background-color: #FF809F;
      border: none;
      color: white;
      margin-left: 1rem;
      }

      .login:hover{
          background-color: #FF4D79;
          color: white;
      }
      
      
      @font-face {
		  font-family: 'lineicons';
		  src: url("${cpath}/resources/header/LineIcons.eot");
		  src: url('${cpath}/resources/header/LineIcons.eot') format('embedded-opentype'),
		       url('${cpath}/resources/header/LineIcons.woff2') format('woff2'),
		       url('${cpath}/resources/header/LineIcons.woff') format('woff'),
		       url('${cpath}/resources/header/LineIcons.ttf') format('truetype'),
		       url('${cpath}/resources/header/LineIcons.svg') format('svg');
		}
      
      
      th {
        text-align: center;
      }
 
  </style>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
   
</head>
<body>
 <script type="text/javascript">
 	function goUpdate() {
		location.href="${cpath}/boardUpdateForm.do?bd_num=${vo.bd_num}";
	}
 	
 	function goReply() {
		location.href="${cpath}/boardReplyForm.do";
	}
 	
 </script>
<div class="container py-4 folder">
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
                  <a class="nav-link" aria-current="page" href="<c:url value='/Main.do' />">Home</a>
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
                  <a class="nav-link" href="<c:url value='/analysis.do'/>">농작물분석</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="<c:url value='/TradeList.do'/>">직거래</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="<c:url value='/QnA_List.do'/>">Q&A</a>
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
			                  
			                  <ul class="dropdown-menu dm2" aria-labelledby="static">
			                    <li class="dropdown-item">
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
			                    </li>
			                    <li class="dropdown-item">
			                      <a href="${cpath}/updateMember.do"> <i class="lni lni-exit"></i> Edit Profile  </a>
			                    </li>
			                    <li class="dropdown-item">
			                      <a href="${cpath}/Logout.do"> <i class="lni lni-exit"></i> Logout </a>
			                    </li>
			                  </ul>
			                </div>
						</c:otherwise>
						
			         </c:choose>
			     
			     
            </div>
          </div>
        </nav>
    </header>
  <h2>게시판 상세보기</h2>
  <div class="content__inner" id="tab-2">
        <div class="table-responsive">
		<table class="table table-bordered table-hover"> 
			<tr> 
			 	<th>제목</th>
			 	<td>${vo.bd_title}</td>
			 </tr>	
			 <tr>
			 	<th>내용</th>
			 	<% pageContext.setAttribute("newline", "\n"); %>
			 	<td>${fn:replace(vo.bd_cont, newline, "<br>")}</td>
			 </tr>
			 <tr>
			 	<th>작성자</th>
			 	<td><span>${vo.bd_mb_num}</span></td>
			 </tr>
			 <tr>
			 	<th>작성일자</th>
			 	<td>${fn:split(vo.bd_date, " ")[0]}</td>
			 </tr>
			 <tr>	
			 	<th>작성일시</th>
			 	<td>${fn:split(vo.bd_date, " ")[1]}</td>
			 </tr>
			 <tr>
			 	<th>조회수</th>
			 	<td>${vo.bd_cnt}</td>
			 </tr>
			 <tr>
			 	<th>첨부파일</th>
			 	<c:if test="${vo.bd_pic ne null}">
					<td align="left"><a href="${cpath}/fileDownload.do?bd_pic=${vo.bd_pic}">${vo.bd_pic}</a></td>
			 	</c:if>
			 </tr>
			 <tr>
			 	<td colspan="2">
			 		<c:if test="${vo.bd_mb_num eq loginMember.mb_num}">	
			 		<button class="btn btn-sm btn-success" onclick="goUpdate()">수정</button>
			 		</c:if>
			 		<c:if test="${vo.bd_mb_num eq loginMember.mb_num || loginMember.mb_id=='admin'}">	
			 		<a class="btn btn-sm btn-warning" href="<c:url value='/boardDelete.do/${vo.bd_num}' />">삭제</a>
			 		</c:if>
			 		<a class="btn btn-sm btn-default" href="javascript:history.go(-1)">뒤로가기</a>
			 		<%-- <a class="btn btn-sm btn-info" href="<c:url value='/QnA_List.do' />">목록으로 돌아가기</a> --%>
			 		<c:if test="${loginMember.mb_id=='admin'}">	
			 		<button class="btn btn-sm btn-danger" onclick="goReply()">답글달기</button>	        
			 	    </c:if>
			 	</td>
			 </tr>
		</table>
		
		<!-- 댓글 작성 -->
		<form action="${cpath}/commentInsert.do" method="post">
			<%-- <input type="hidden" id="bd_num" name="bd_num" value="${vo.bd_num}">
			<input type="hidden" name="co_mb_num" value="${vo.bd_mb_num}"> --%>
	    	<table style="margin-left: 30px; margin-bottom: 30px;">
	    		<tr>
	    			<td width="10%">
	    				<span size="2">베프</span>
	    				<input type="hidden" name="co_bd_num" value="${cvo.co_bd_num}">
	    				<input class="form-control" type="hidden" name="co_mb_num" readonly="readonly">
	    			</td>
	    			<td width="90%">
	    				<input class="form-control" type="text" name="co_cont" placeholder="내용을 입력하세용~" required>
	    			</td>
	    			<td>
	    				<input class="btn btn-warning btn-sm" type="submit" value="작성">
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	    
	</div>
	
		<!-- 댓글 뿌리기(CommentList) -->
		<c:forEach var="cvo" items="${list}">
			<table style="margin-left: 30px; margin-bottom: 30px;"  class="table table-bordered table-hover">
				<tr>
					<td width="10%">${cvo.co_mb_num}</td>
					<td width="60%"><span style="margin-left:10px;">${cvo.co_cont}</span></td>
					<td width="20%"><span style="margin-left:5px;">${cvo.co_date}</span></td>
					<td width="10%">
						<%-- <form action="${cpath}/commentDelete.do" method="post">
						<c:if test="${vo.bd_mb_num == cvo.co_mb_num}">
							<button type="button" class="btn btn-info btn-sm">삭제</button>
							<input  type="hidden" id="bd_num" name="bd_num" value="${vo.bd_num }">
							<input  type="hidden" id="co_num" name="co_num" value="${cvo.co_num }">
						</c:if>
						</form> --%>
						<span style="margin-left:20px">
							<a href="/${cpath } }commentDelete.do?co_num=${cvo.co_num}&co_bd_num=${cvo.co_num}">
							<button type="button" class="btn btn-info btn-sm">삭제</button>
							</a>
						</span>
					</td>
				 </tr>
			</table>
		</c:forEach>
  </div>
</div>

  <!-- partial -->
  <script  src="notice_qa.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
</body>
</html>