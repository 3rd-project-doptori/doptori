<%@ page import="java.util.List"%>
<%@ page import="com.doptori.entity.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="${cpath}/resources/css/index.css"> 

</head>
<body>

  <script type="text/javascript">
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

  </script>
<div class="container">
  <h2>게시판 목록보기</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
    	<table class="table table-bordered table-hover">
	    	<caption> <h3 align="right"> <font size="2">
	    	<div id="left" style="float:left;"> <!-- select 검색 창  -->
		        <form method="post" action="${cpath}/boardList.do" onsubmit="return check(this)">
		         <select name="sel" id="sel">
		           <option value="0"> 선 택 </option>
		           <option value="bd_title"> 제 목 </option>
		           <option value="bd_cont"> 내 용 </option>
		           <option value="bd_mb_num"> 작성자 </option>
		         </select>
		         <input type="text" name="sword" size="10" value="${sword}">
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
		    	 	<td>번호</td>
		    	 	<td>제목</td>
		    	 	<td>작성자</td>
		    	 	<td>작성일</td>
		    	 	<td>조회수</td>
		    	 </tr>
	    	</thead>
	    	<tbody>
	    		<c:forEach var="vo" items="${list}" varStatus="status">
	    			<tr>
						<td>${vo.bd_num}</td>						
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
						<td>${vo.bd_cnt}</td>     			
	    			</tr>
	    		</c:forEach>
	    		
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
	    			<td colspan="5"><button class="btn btn-sm btn-success" onclick="goForm()">글쓰기</button></td>
	    		</tr>
	    	</tbody>
    	</table>
    </div>
    <div class="panel-footer"></div>
  </div>
</div>

</body>
</html>