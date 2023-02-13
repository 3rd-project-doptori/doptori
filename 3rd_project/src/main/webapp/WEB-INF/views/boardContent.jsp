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
			<input type="hidden" id="bd_num" name="bd_num" value="${vo.bd_num}">
			<input type="hidden" name="co_mb_num" value="${vo.bd_mb_num}">
	    	<table style="margin-left: 30px; margin-bottom: 30px;">
	    		<tr>
	    			<td width="200px">
	    				<span size="2">베프</span>
	    				<!-- <input class="form-control" type="hidden" name="co_mb_num" readonly="readonly"> -->
	    			</td>
	    			<td width="800px">
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
					<td width="30%"><span style="margin-left:5px;">${cvo.co_date}</span></td>
					<td>
						<form action="${cpath}/commentDelete.do" method="post">
						<c:if test="${vo.bd_mb_num == cvo.co_mb_num}">
							<button type="button" class="btn btn-info btn-sm">삭제</button>
							<input  type="hidden" id="bd_num" name="bd_num" value="${vo.bd_num }">
							<input  type="hidden" id="co_num" name="co_num" value="${cvo.co_num }">
						</c:if>
						</form>
						<!-- <span style="margin-left:20px">
							<a href="commentDelete.do?co_num=${cvo.co_num}&co_bd_num=${cvo.co_bd_num}">
							<button type="button" class="btn btn-info btn-sm">삭제</button>
							</a>
						</span> -->
					</td>
				 </tr>
			</table>
		</c:forEach>
    <div class="panel-footer"></div>
  </div>
</div>

</body>
</html>