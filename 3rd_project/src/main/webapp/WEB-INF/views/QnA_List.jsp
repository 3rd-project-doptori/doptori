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

	

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel="stylesheet" href="./notice_qa.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- CSS only -->
 
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
	 	   location="QnA_List.do?pcnt="+my.value;
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
    <jsp:include page="/WEB-INF/views/header.jsp"/>
    <!-- <div class="tabs">
      <button class="content__inner current" data-tab="tab-1">
        <div><span>공지사항</span></div>
      </button>
      <button class="content__inner"  data-tab="tab-2">
        <div><span>Q&A</span></div>
      </button>
    </div> -->
    <div class="content">
    
	<h2 class="display-7 fw-bold">Q&A</h2>
      <div class="content__inner" id="tab-2">
        <div class="table-responsive">
          <table class="table">
	    	<caption> <h3 align="right"> <font size="2">
	    	<div id="left" style="float:left;"> <!-- select 검색 창  -->
		        <form method="post" action="${cpath}/QnA_List.do" onsubmit="return check(this)">
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
	    	<thead align="center" >
		    	 <tr style=" font-weight: bold;">
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
						<td align="center"  scope="row">${vo.bd_num}</td>						
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
						<td align="center" >${memberNames[status.index]}</td>     			
						<td align="center" >${vo.bd_date}</td>  			
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
			        	<a href="QnA_List.do?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> << </a>
			       </c:if>
			       <c:if test="${pstart == 1}"> <!-- 첫번째 그룹일때(1~10)는 이전 10페이지 이동 X -->
			       《<!-- 넘어가는 꺽세 -->
			       </c:if>
			       
			        <!-- 1페이지 단위로 이전으로 가기 => 현재페이지에서 1을 뺀 페이지로 이동 --> 
			       <c:if test="${page != 1}"> <!-- 현재 페이지가 1이 아닌경우 -->
			        	<a href="QnA_List.do?page=${page-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> ◀  </a>
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
			            <a href="QnA_List.do?page=${i}&pcnt=${pcnt}&sel=${sel}&sword=${sword}" ${st}> ${i} </a>
			         </c:forEach>
			         
			       <!-- 1페이지 단위로 다음 이동하기 -->
			       <c:if test="${page != chong}"> <!-- 현재 페이지가 마지막 페이지가 아니라면 -->
			        	<a href="QnA_List.do?page=${page+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> ▶  </a>
			       </c:if>
			       <c:if test="${page == chong}"> <!-- 현재 페이지가 마지막 페이지라면 -->
			                     ▶
			       </c:if>
			        
			       <!-- 10페이지 단위로 다음 이동하기 -->
			       <c:if test="${chong != pend}"> <!-- 현재 출력되는 페이지 그룹이 마지막이 아닐겨우 -->
			         	<a href="QnA_List.do?page=${pend+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"> >> </a>
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
  <script  src="${cpath}/resources/js/notice_qa.js"></script>

</body>
</html>
