<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
 	function goUpdate() {
		location.href="${cpath}/boardUpdateForm.do?bd_num=${vo.bd_num}";
	}
 	
 	function goReply() {
		location.href="${cpath}/boardReplyForm.do";
	}
 	
 	
 </script>
<div class="container">
  <h2>게시판 상세보기</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
		<table class="table table-bordered table-hover"> <tr> 
			 	<td>제목</td>
			 	<td>${vo.bd_title}</td>
			 </tr>	
			 <tr>
			 	<td>내용</td>
			 	<% pageContext.setAttribute("newline", "\n"); %>
			 	<td>${fn:replace(vo.bd_cont, newline, "<br>")}</td>
			 </tr>
			 <tr>
			 	<td>작성자</td>
			 	<td><span>${vo.bd_mb_num}</span></td>
			 </tr>
			 <tr>
			 	<td>작성일자</td>
			 	<td>${fn:split(vo.bd_date, " ")[0]}</td>
			 </tr>
			 <tr>	
			 	<td>작성일시</td>
			 	<td>${fn:split(vo.bd_date, " ")[1]}</td>
			 </tr>
			 <tr>
			 	<td>조회수</td>
			 	<td>${vo.bd_cnt}</td>
			 </tr>
			 <tr>
			 	<td colspan="2">
			 		<button class="btn btn-sm btn-success" onclick="goUpdate()">수정</button>
			 		<a class="btn btn-sm btn-warning" href="<c:url value='/boardDelete.do/${vo.bd_num}' />">삭제</a>
			 		<a class="btn btn-sm btn-info" href="<c:url value='/boardList.do' />">목록으로 돌아가기</a>
			 		<c:if test="${loginMember.mb_id=='admin'}">	
			 		<button class="btn btn-sm btn-danger" onclick="goReply()">답글달기></button>	        
			 	    </c:if>
			 	</td>
			 </tr>
		</table>
		
		<!-- 댓글 작성 -->
		<form action="${cpath}/commentInsert.do" method="post">
			<input type="hidden" name="bd_num" value="${comment.co_num}">
	    	<table style="margin-left: 30px; margin-bottom: 30px;">
	    		<tr>
	    			<td width="200px">
	    				<span size="2">작석장는 나야 나</span>
	    				<input class="form-control" type="hidden" name="co_mb_num" readonly="readonly">
	    			</td>
	    			<td width="700px">
	    				<input class="form-control" type="text" name="co_cont" placeholder="내용을 입력하세용~" required>
	    			</td>
	    			<td>
	    				<input class="btn btn-warning btn-sm" type="submit" value="작성">
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	    
	</div>
		<!-- 댓글 뿌리기 -->
		<c:forEach var="comment"  items="${list}">
			<table style="margin-left: 30px; margin-bottom: 30px;"  class="table table-bordered table-hover">
				<tr>
					<td width="200px">${comment.co_mb_num}</td>
					<td width="700px"><span style="margin-left:10px;">${comment.co_cont}</span></td>
					<td><span style="margin-left:20px">
						<a href="commentDelete.do?co_num=${comment.co_num}&bd_num=${comment.bd_num}">
						<button type="button" class="btn btn-info btn-sm">삭제</button>
						</a>
					</span></td>
				 </tr>
			</table>
		</c:forEach>
    <div class="panel-footer"></div>
  </div>
</div>

</body>
</html>