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
  <title>notice_qa</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel="stylesheet" href="notice_qa.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
  </style>
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
	  		location.href="${cpath}/boardInsertForm.do"
	  	}
	  	
	  	
	 	function move(my)
	    {
	 	   location="boardList.do?pcnt="+my.value;
	    }
	    window.onload=function()
	    {
	 	   document.getElementById("pcnt").value="${pcnt}"; 
	 	     // $pcnt: 페이지 늘린 상태로 고정 (50개 페이지 고정)
	 	
	 	   // 검색필드를 보여주기
	 	  <c:if test="${sel!='bd_num'}"> /* 에러(빨간줄)가 나와도 상관없음. */
	 	   	document.getElementById("sel").value="${sel}";
	 	  </c:if>
	    }

	    function check(my)
	    { // select태그에서 첫번째 option태그는 X , sword입력칸은 값이 비어있으면 안된다..
	 	  if(my.sel.selectedIndex==0) //if(my.sel.value=="0")
	 	  {
	 		  alert("검색주제를 선택하세요");
	 		  return false;
	 	  }
	 	  else if(my.sword.value.trim()=="")
	 		   {
	 		      alert("검색단어를 입력하세요");
	 		      return false;
	 		   }
	 	       else
	 	    	  return true;
	 		  
	    }
	    
	    $(document).ready(function(){
	    	
	    	$('div.tabs button').click(function(){
	    		var tab_id = $(this).attr('data-tab');

	    		$('div.tabs button').removeClass('current');
	    		$('.content__inner').removeClass('current');

	    		$(this).addClass('current');
	    		$("#"+tab_id).addClass('current');
	    	})

	    })
	    
	    
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
							<button class="btn login" type="button" onclick="signin()">LOGIN</button>  
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
									<a class="btn login" href="${cpath}/Logout.do">LogOut</a>							
							</div>
						</c:otherwise>
			     </c:choose>
			     
			     
            </div>
          </div>
        </nav>
    </header>
    <div class="tabs">
      <button class="content__inner current" data-tab="tab-1">
        <div><span>공지사항</span></div>
      </button>
      <button class="content__inner"  data-tab="tab-2">
        <div><span>Q&A</span></div>
      </button>
    </div>
    <div class="content">
      <div class="content__inner current" id="tab-1">
        <div class="table-responsive">
          <table class="table">
          
	    	<caption> <h3 align="right"> <font size="2">
	    	<div id="left" style="float:left;"> <!-- select 검색 창  -->
		        <form method="post" action="${cpath}/boardList.do" onsubmit="return check(this)">
		         <select name="searchType" id="searchType">
		           <option value="0">선 택</option>
		           <option value="bd_title">제 목</option>
		           <option value="bd_cont">내 용</option>
		           <option value="bd_mb_num">작성자</option>
		         </select>
		         <input type="text" id="searchText" placeholder="검색어를 입력하세요." autocomplete="off" name="sword" size="20" value="${sword}">
		         <input type="submit" value="검색">
		        </form>
		     </div>
		<div id="right" style="float:right;"><font size="2">	       
         <select onchange="move(this)" id="pcnt">
	         <option value="10"> 10개 </option>
	         <option value="20"> 20개 </option>
	         <option value="30"> 30개 </option>
	         <option value="50"> 50개 </option>
	       </select>
	       </font>
	     </div>
	       </h3></caption>
	    	<thead>
		    	 <tr>
		    	 	<th width="10%" scope="col">번호</th>
		    	 	<th width="60%" scope="col">제목</th>
		    	 	<th width="10%" scope="col">작성자</th>
		    	 	<th width="20%" scope="col">작성일</th>
		    	 	<!-- <th scope="col">조회수</th> -->
		    	 </tr>
	    	</thead>
	    	<tbody class="table-group-divider">
	    		<c:forEach var="vo" items="${list}" varStatus="status">
	    	<c:if test="${vo.bd_type == '1' }">
	    			<tr>
						<th scope="row">${vo.bd_num}</th>						
						<c:if test="${vo.bd_level > 0}">
							<c:forEach begin="1" end="${vo.bd_level }">
								<span style="padding-left: 10px"></span>
							</c:forEach>
						</c:if>
						<c:url var="contentlink" value="/boardContent.do/${vo.bd_num}" />		
						<td>
						<c:if test="${vo.bd_level > 0}">
							<c:forEach begin="1" end="${vo.bd_level }">
								<span style="padding-left: 10px"></span>
							</c:forEach>
						</c:if>
						<a href="${contentlink}">${vo.bd_title}</a>
						</td>
						<td>${memberNames[status.index]}</td>     			
						<td>${vo.bd_date}</td>  			
						<%-- <td>${vo.bd_cnt}</td>  --%>    			
	    			</tr>
	    		</c:if>
	    		</c:forEach>
	    	</tbody>
	    	
	    	<tfoot>
	    		<!-- 페이징 -->
	    		<tr>
			       <td colspan="5" align="center">
			        <!-- 10페이지 단위로 이전 이동하기  :  -->
			       <c:if test="${pstart != 1}"> <!-- 첫번재 그룹이 아닐때는  -->
			        	<a href="boardList.do?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> << </a>
			       </c:if>
			       <c:if test="${pstart == 1}"> <!-- 첫번째 그룹일때(1~10)는 이전 10페이지 이동 X -->
			       《<!-- 넘어가는 꺽세 -->
			       </c:if>
			       
			        <!-- 1페이지 단위로 이전으로 가기 => 현재페이지에서 1을 뺀 페이지로 이동 --> 
			       <c:if test="${page != 1}"> <!-- 현재 페이지가 1이 아닌경우 -->
			        	<a href="boardList.do?page=${page-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> ◀  </a>
			       </c:if>
			       <c:if test="${page == 1}"> <!-- 현재페이지가 1인경우 -->
			                     ◀
			       </c:if>
			       
			         <c:forEach begin="${pstart}" end="${pend}" var="i">  <!-- 페이지 출력하기 -->
			           <!-- 현재 페이지의 색을 빨강 -->
			            <c:if test="${page == i}"> <!-- 출력되는 페이지가 현재페이지와 같다면 -->
			               <c:set var="st" value="style='color:darkblue;'"/>
			            </c:if>
			            <c:if test="${page != i}"> <!-- 출력되는 페이지가 현재페이지와 다르다면 -->
			               <c:set var="st" value=""/>
			            </c:if>
			            <a href="boardList.do?page=${i}&pcnt=${pcnt}&sel=${sel}&sword=${sword}" ${st}> ${i} </a>
			         </c:forEach>
			         
			       <!-- 1페이지 단위로 다음 이동하기 -->
			       <c:if test="${page != chong}"> <!-- 현재 페이지가 마지막 페이지가 아니라면 -->
			        	<a href="boardList.do?page=${page+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> ▶  </a>
			       </c:if>
			       <c:if test="${page == chong}"> <!-- 현재 페이지가 마지막 페이지라면 -->
			                     ▶
			       </c:if>
			        
			       <!-- 10페이지 단위로 다음 이동하기 -->
			       <c:if test="${chong != pend}"> <!-- 현재 출력되는 페이지 그룹이 마지막이 아닐겨우 -->
			         	<a href="boardList.do?page=${pend+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> >> </a>
			       </c:if>
			       <c:if test="${chong == pend}"> <!-- 현재 출력되는 페이지 그룹이 마지막일 경우 -->
			    	   》 <!-- 넘어가는 꺽세 -->
			       </c:if>
			       </td>
			     </tr>
			     
			     
	    		<tr>
	    			<td colspan="5"><button onclick="goForm()">글쓰기</button></td>
	    		</tr>
	    	</tfoot>
    	</table>
        </div>
      </div>


      <div class="content__inner" id="tab-2">
        <div class="table-responsive">
          <table class="table">
	    	<caption> <h3 align="right"> <font size="2">
	    	<div id="left" style="float:left;"> <!-- select 검색 창  -->
		        <form method="post" action="${cpath}/boardList.do" onsubmit="return check(this)">
		         <select name="searchType" id="searchType">
		           <option value="0">선 택</option>
		           <option value="bd_title">제 목</option>
		           <option value="bd_cont">내 용</option>
		           <option value="bd_mb_num">작성자</option>
		         </select>
		         <input type="text" id="searchText" placeholder="검색어를 입력하세요." autocomplete="off" name="sword" size="20" value="${sword}">
		         <input type="submit" value="검색">
		        </form>
		    </div>
		<div id="right" style="float:right;"><font size="2">	       
         <select onchange="move(this)" id="pcnt">
	         <option value="10"> 10개 </option>
	         <option value="20"> 20개 </option>
	         <option value="30"> 30개 </option>
	         <option value="50"> 50개 </option>
	       </select>
	       </font>
	     </div>
	       </h3></caption>
	    	<thead>
		    	 <tr>
		    	 	<th width="10%" scope="col">번호</th>
		    	 	<th width="60%" scope="col">제목</th>
		    	 	<th width="10%" scope="col">작성자</th>
		    	 	<th width="20%" scope="col">작성일</th>
		    	 	<!-- <th scope="col">조회수</th> -->
		    	 </tr>
	    	</thead>
	    	<tbody class="table-group-divider">
	    		<c:forEach var="vo" items="${list}" varStatus="status">
	    			<c:if test="${vo.bd_type == '2' }">
	    			<tr>
						<th scope="row">${vo.bd_num}</th>						
						<c:if test="${vo.bd_level > 0}">
							<c:forEach begin="1" end="${vo.bd_level }">
								<span style="padding-left: 10px"></span>
							</c:forEach>
						</c:if>
						<c:url var="contentlink" value="/boardContent.do/${vo.bd_num}" />		
						<td>
						<c:if test="${vo.bd_level > 0}">
							<c:forEach begin="1" end="${vo.bd_level }">
								<span style="padding-left: 10px"></span>
							</c:forEach>
						</c:if>
						<a href="${contentlink}">${vo.bd_title}</a>
						</td>
						<td>${memberNames[status.index]}</td>     			
						<td>${vo.bd_date}</td>  			
						<%-- <td>${vo.bd_cnt}</td>    --%>  			
	    			</tr>
	    			</c:if>
	    		</c:forEach>
	    	</tbody>	
	    		
	    	<tfoot>
	    		<!-- 페이징 -->
	    		<tr>
			       <td colspan="5" align="center">
			        <!-- 10페이지 단위로 이전 이동하기  :  -->
			       <c:if test="${pstart != 1}"> <!-- 첫번재 그룹이 아닐때는  -->
			        	<a href="boardList.do?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> << </a>
			       </c:if>
			       <c:if test="${pstart == 1}"> <!-- 첫번째 그룹일때(1~10)는 이전 10페이지 이동 X -->
			       《<!-- 넘어가는 꺽세 -->
			       </c:if>
			       
			        <!-- 1페이지 단위로 이전으로 가기 => 현재페이지에서 1을 뺀 페이지로 이동 --> 
			       <c:if test="${page != 1}"> <!-- 현재 페이지가 1이 아닌경우 -->
			        	<a href="boardList.do?page=${page-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> ◀  </a>
			       </c:if>
			       <c:if test="${page == 1}"> <!-- 현재페이지가 1인경우 -->
			                     ◀
			       </c:if>
			       
			         <c:forEach begin="${pstart}" end="${pend}" var="i">  <!-- 페이지 출력하기 -->
			           <!-- 현재 페이지의 색을 빨강 -->
			            <c:if test="${page == i}"> <!-- 출력되는 페이지가 현재페이지와 같다면 -->
			               <c:set var="st" value="style='color:darkblue;'"/>
			            </c:if>
			            <c:if test="${page != i}"> <!-- 출력되는 페이지가 현재페이지와 다르다면 -->
			               <c:set var="st" value=""/>
			            </c:if>
			            <a href="boardList.do?page=${i}&pcnt=${pcnt}&sel=${sel}&sword=${sword}" ${st}> ${i} </a>
			         </c:forEach>
			         
			       <!-- 1페이지 단위로 다음 이동하기 -->
			       <c:if test="${page != chong}"> <!-- 현재 페이지가 마지막 페이지가 아니라면 -->
			        	<a href="boardList.do?page=${page+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> ▶  </a>
			       </c:if>
			       <c:if test="${page == chong}"> <!-- 현재 페이지가 마지막 페이지라면 -->
			                     ▶
			       </c:if>
			        
			       <!-- 10페이지 단위로 다음 이동하기 -->
			       <c:if test="${chong != pend}"> <!-- 현재 출력되는 페이지 그룹이 마지막이 아닐겨우 -->
			         	<a href="boardList.do?page=${pend+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> >> </a>
			       </c:if>
			       <c:if test="${chong == pend}"> <!-- 현재 출력되는 페이지 그룹이 마지막일 경우 -->
			    	   》 <!-- 넘어가는 꺽세 -->
			       </c:if>
			       </td>
			     </tr>

	    		<tr>
	    			<td colspan="5"><button onclick="goForm()">글쓰기</button></td>
	    		</tr>
	    	</tfoot>
    	</table>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- partial -->
  <script  src="notice_qa.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
</body>
</html>