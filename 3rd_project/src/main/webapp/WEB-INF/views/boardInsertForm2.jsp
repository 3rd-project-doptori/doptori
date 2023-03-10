<%@ page import="java.util.List"%>
<%@ page import="com.doptori.entity.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
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
      
  </style>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <script type="text/javascript">
 
 function signin(){
		location.href = "${cpath}/signin.do"
	}

 
 if($("#bd_type").val() == ""){
		alert("카테고리를 선택하세요");
		return false;
	}
 
  </script>
</head>
<body>
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

	<h3>글쓰기</h3>
      <div class="content__inner" id="tab-2">
        <div class="table-responsive">
          <form class="form-horizontal" action="${cpath}/boardInsert.do" method="post" enctype="multipart/form-data">
		  
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_type">카테고리:</label>
		    <div class="col-sm-10">
		      <select name="bd_type" id="bd_type">
                    <!-- <option value="">선택하기</option> -->
                    <c:if test="${loginMember.mb_id=='admin'}">
                    	<option value=1>공지사항</option>
                    </c:if>
	                	<option value=2>Q&A</option>
	                	<option value=3>직거래</option>
                </select>
		    </div>
		</div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_mb_num">작성자</label>
		    <div class="col-sm-10">
			       ${loginMember.mb_nick}
		      <input type="hidden" class="form-control" name="bd_mb_num" id="bd_mb_num" value="${loginMember.mb_num}" readonly="readonly"> 
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_title">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="bd_title" id="bd_title" placeholder="제목을 입력하세요." required>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_cont">내용</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" rows="10" name="bd_cont" id="bd_cont" placeholder="내용을 입력하세요." required></textarea>
			</div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="bd_pic">첨부파일</label>
		    <div class="col-sm-10">
		       <input type="file" name="uploadFile"/>
		     <!--  <input type="file" name="bd_pic"/> -->
			</div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">등록</button>
		      <button type="reset" class="btn btn-default">초기화</button>
		      <a class="btn btn-default" href="javascript:history.go(-1)">취소</a>
		      <%-- <a class="btn btn-sm btn-info" href="<c:url value='/boardList.do' />">목록으로 돌아가기</a> --%>
		    </div>
		  </div>
		</form>
        </div>
      </div>
      
    </div>
  
  <!-- partial -->
  <script  src="notice_qa.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
</body>
</html>